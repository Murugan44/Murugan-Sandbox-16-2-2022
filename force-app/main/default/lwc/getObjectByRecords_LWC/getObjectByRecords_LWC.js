import { LightningElement, wire, track, api } from 'lwc';
import getAllObjects from '@salesforce/apex/GetObjectByRecordsLWCController.getAllObjects'
// import getAllFields from '@salesforce/apex/GetObjectByRecordsLWCController.getAllFields'
import getListOfRecords from '@salesforce/apex/GetObjectByRecordsLWCController.getListOfRecords'
import getNumberTypeField from '@salesforce/apex/GetObjectByRecordsLWCController.getNumberTypeField'
import getFieldSet from '@salesforce/apex/GetObjectByRecordsLWCController.getFieldSet'
export default class GetObjectByRecords_LWC extends LightningElement {
    @track objectOption=[]
    @track fieldOption=[]
    @track listOfRecords=[]
    @track headerField = []
    @track numberTypeField = []
    selectedObject
    isShowTable = false
    
    @api objectName
    @api picklistOneOptions
    @api picklistTwoOptions
    optionsOne = []
    optionsTwo = []

    isLoading = false
    isFieldLoading = false
    isTableLoading = false

    isModalOpen = false

    connectedCallback() {
        this.fetchFieldSet()
    }

    // @wire(getAllObjects)
	// pd(result) {
    //     console.log('obj' ,result)
    //     this.isLoading = true
	// 	if (result.data) {
	// 		for (let key in result.data) {
	// 			if (result.data.hasOwnProperty(key)) {
	// 				this.objectOption.push({
	// 					label: result.data[key],
	// 					value: key
	// 				})
	// 			}
	// 		}
    //         var timev = setTimeout(() => {
    //             this.isLoading = false
    //         }, 1000)
	// 	} else if (result.error) {
    //         console.error(result.error)
	// 		this.error = result.error;
	// 		this.objectOption = undefined;
    //         this.isLoading = false
	// 	}
	// }

    // handleSelect(e){
    //     this.selectedField = []
    //     this.listOfRecords = []
    //     this.headerField = []
    //     this.isShowTable = false
    //     this.isFieldLoading = true
    //     this.selectedObject = e.target.value
    //     this.fetchFieldSet()
    // }

    // fetchFields(){
    //     this.fieldOption = []
    //     this.fieldSetList = []
    //     this.headerField = []
    //     this.listOfRecords = []
    //     this.isFeidlSetValue = false
        // getAllFields({
        //     selectedObject: this.selectedObject
        // }).then(result => {
        //     console.log('re::', result)
        //     result.forEach(field =>{
        //         this.fieldOption.push({
        //             label: field,
        //             value: field
        //         })
        //     })
        //     var timev = setTimeout(() => {
        //         this.isFieldLoading = false
        //     }, 1000)
        // }).catch(error =>{
        //     console.error('re::', error)
        //     this.isFieldLoading = false
        //     this.fieldOption = []
        // })
        // this.fetchFieldSet()
        
    // }

    // @track fieldSetList= []
    @track feildSetMsg = 'Please Select Object for Field Set'
    // fieldSetTitle = 'Field set'
    // isFeidlSetValue = false
     @track query = ''
    //  recordMsg = 'Data Fetch based on Object'
    fetchFieldSet(){
        this.query = ''
        var commaSepratedFields = ''
        this.feildSetMsg = `Loading  - ${this.objectName}`
        this.isTableLoading = true
        getFieldSet({
            selectedObject: this.objectName
        }).then(data => {
            console.log('data>>::', data, data.length)
            if(data.length > 0){
                for(let i=0; i<data.length; i++)  {
                    this.headerField.push({
                        label: data[i][1],
                        fieldName: data[i][0]
                    })
                    if(commaSepratedFields == null || commaSepratedFields == ''){
                        commaSepratedFields = data[i][0].replace(/['"]+/g, '')
                    }else{
                        commaSepratedFields = commaSepratedFields + ', ' + data[i][0].replace(/['"]+/g, '')
                    }
                }
                
                console.log('commaSepratedFields::',commaSepratedFields)
                this.query = `select ${commaSepratedFields} from ${this.objectName}`
                this.isShowTable = true
                this.feildSetMsg = ''
                this.table()
            }else{
                this.isShowTable = false
                this.feildSetMsg = `No Record for this Object - ${this.objectName}`
            }
            console.log(this.query)
            console.log( this.headerField)
        }).catch(error =>{
            console.error('re::', error)
        })
    }

   
    // @track selectedField = []
    // handleChange(e){
    //     this.isTableLoading = true
    //     this.headerField = []
    //     this.query = ''
    //     this.selectedField = e.detail.value
    //     var commaSepratedFields = ''
    //     var field = e.detail.value
    //     field.forEach(field =>{
    //         this.headerField.push({
    //             label: field,
    //             fieldName: field
    //         })
    //         if(commaSepratedFields == null || commaSepratedFields == ''){
    //             commaSepratedFields = field.replace(/['"]+/g, '')
    //         }else{
    //             commaSepratedFields = commaSepratedFields + ', ' + field.replace(/['"]+/g, '')
    //         }
    //     })
    //     console.log('commaSepratedFields::',commaSepratedFields)
    //     this.query = `select ${commaSepratedFields} from ${this.selectedObject}`
    //     this.table()
    // }

    async table() {
        
        const data = await getListOfRecords({
            query: this.query
        });
        this.listOfRecords = data;
        var timev = setTimeout(() => {
            this.isTableLoading = false
        }, 1000)    
        console.log(':::', this.listOfRecords,'::', this.feildSetMsg)
    }
   
    isNumberTypeField = false
    numberTypeFieldMsg = ''
    isModalLoading = false
    @track options = []
   openModal(){
       this.isModalOpen = true
       this.isModalLoading = true
    //    getNumberTypeField({
    //         selectedObject: this.objectName
    //     }).then(result => {
    //         console.log('number type result::', result)
    //         this.numberTypeField = result
    //         if(this.numberTypeField.length > 0){
    //             this.isNumberTypeField = true
    //             var timev = setTimeout(() => {
    //                 this.isModalLoading = false
    //             }, 1000)  
                
    //         }else{
    //             this.isNumberTypeField = false
    //             this.numberTypeFieldMsg = `No Number Field in this ${this.objectName} object`
    //             var timev = setTimeout(() => {
    //                 this.isModalLoading = false
    //             }, 1000)  
    //         }
    //     }).catch(error =>{
    //         console.error('number type error::', error)
    //     })
    //     console.log('this.numberTypeField::', this.numberTypeField)
            this.optionsOne = []
            this.optionsTwo = []
            this.picklistOneOptions.split(';').forEach(currentItem => {
                this.optionsOne.push({
                    "label": currentItem,
                    "value": currentItem
                })
            })
            this.picklistTwoOptions.split(';').forEach(currentItem => {
                this.optionsTwo.push({
                    "label": currentItem,
                    "value": currentItem
                })
            })
            this.options = this.optionsTwo
            var timev = setTimeout(() => {
                this.isModalLoading = false
            }, 1000) 
   }
   closeModal(){
       this.isModalOpen = false
       this.numberTypeField = []
       this.isNumberTypeField = false
       this.numberTypeFieldMsg = ''
   }
value = '';
   handleChangeOne(e){
       this.options = []
        let pickValue =e.target.value
        // this.value = e.target.value
        console.log('pickValue::', pickValue, ':: this.picklistTwoOptions::', this.picklistTwoOptions)

        for(var i=0; i< this.optionsTwo.length; i++){
            if(pickValue == this.optionsTwo[i].value)
                this.optionsTwo.splice(i,1)
        }
        
        this.Opt(this.optionsTwo)
   }

   async Opt(data){
       console.log(':::',data)
       this.options = await data
       console.log(':::', this.options)
       console.log('this.optionsTwo::', this.optionsTwo,' :: this.options ::',this.options)
   }
}