import { LightningElement, wire, track } from 'lwc';
import getAllObjects from '@salesforce/apex/QuickAccessController.getAllObjects'
import getAllFields from '@salesforce/apex/QuickAccessController.getAllFields'
import getListOfRecords from '@salesforce/apex/QuickAccessController.getListOfRecords'
// import { exportCSVFile } from 'c/utils'
export default class DataExportLWC extends LightningElement {
    @track objectOption=[]
    spinnerMessage = ''
    @track query = ''
    isLoading = false
    @track selectedField = []
    @track listOfRecords = []
    @track fieldOption = []
    @track headerField = {}
    @track isFieldLoading = false
    selectedObject
    csvBtnName = ''

    @wire(getAllObjects)
	pd(result) {
        console.log('obj' ,result)
        this.spinnerMessage = 'Fetching All Object......'
        this.isLoading = true
		if (result.data) {
			for (let key in result.data) {
				if (result.data.hasOwnProperty(key)) {
					this.objectOption.push({
						label: result.data[key],
						value: key
					})
				}
			}
            var timev = setTimeout(() => {
                this.isLoading = false
                this.spinnerMessage = ''
            }, 1000)
		} else if (result.error) {
            console.error(result.error)
			this.error = result.error;
			this.objectOption = undefined;
            this.isLoading = false
            this.spinnerMessage = ''
		}
	}

    handleSelect(e){
        this.selectedField = []
        this.headerField = {}
        this.isLoading = true
        this.selectedObject = e.target.value
        this.fetchFields()
        this.csvBtnName = ''
    }

     fetchFields(){
        this.spinnerMessage = `Fetching ${this.selectedObject} fields.....`
        this.fieldOption = []
        this.fieldSetList = []
        this.headerField = {}
        this.listOfRecords = []
        this.isFeidlSetValue = false
        getAllFields({
            selectedObject: this.selectedObject
        }).then(result => {
            console.log('re::', result)
            result.forEach(field =>{
                this.fieldOption.push({
                    label: field,
                    value: field
                })
            })
            var timev = setTimeout(() => {
                this.isLoading = false
                this.spinnerMessage = ''
            }, 1000)
        }).catch(error =>{
            console.error('re::', error)
            this.isLoading = false
            this.fieldOption = []
            this.spinnerMessage = ''
        })        
    }

    @track selectedField = []
    handleChange(e){
        this.isLoading = true
        this.headerField = {}
        this.query = ''
        this.selectedField = e.detail.value
        var commaSepratedFields = ''
        var field = e.detail.value
        field.forEach(field =>{
            if(commaSepratedFields == null || commaSepratedFields == ''){
                commaSepratedFields = field.replace(/['"]+/g, '')
            }else{
                commaSepratedFields = commaSepratedFields + ', ' + field.replace(/['"]+/g, '')
            }
        })
        
        for (const key of this.selectedField) {
            this.headerField[key] = `${key}`;
        }
       
        console.log('commaSepratedFields::',commaSepratedFields)
        this.query = `select ${commaSepratedFields} from ${this.selectedObject}`
        this.table()
        console.log('query::',this.query)

    }

    async table() {
        this.spinnerMessage = `Fetching ${this.selectedObject} Records....`
        const data = await getListOfRecords({
            query: this.query
        });
        this.listOfRecords = data;
        var timev = setTimeout(() => {
            this.isLoading = false
            this.spinnerMessage = ''
            this.csvBtnName = `Export ${this.selectedObject}`
        }, 1000)    
        console.log('headerField::', this.headerField)
        console.log(':::', this.listOfRecords)
    }

    // csvGen(){
    //     console.log('headerField::', this.headerField)
    //     console.log(':::', this.listOfRecords)
    //     var today = new Date();
    //     var dd = String(today.getDate()).padStart(2, '0');
    //     var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    //     var yyyy = today.getFullYear();

    //     today = mm + '/' + dd + '/' + yyyy;
    //     var title = `${this.selectedObject}_${today}`
    //     console.log(title)
    //     exportCSVFile(this.headerField, this.listOfRecords, title)
    // }
}