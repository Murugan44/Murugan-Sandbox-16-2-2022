import { LightningElement,wire } from 'lwc';
import getAcc from '@salesforce/apex/csvController.getAccounts';
export default class LwcFilteringAndSorting extends LightningElement {
    headings = ["Id","Name","Industry","ShippingCountry","Comply_Advantage_Match_Status__c"]
    fullTableData=[]
    filteredData=[]
    filterBy="Name"
    timer
    isFilter = false
    text

    sortedBy = 'Name'
    sortDirection='asc'
    openFliter(){
        this.isFilter = true
        if(this.text==='Close'){
            this.closeFliter()
        }else{
            var btn = this.template.querySelector('.btn').classList.remove('slds-button_success')
            var btn2 = this.template.querySelector('.btn').classList.add('slds-button_destructive')
            this.text = this.template.querySelector('.btn').innerText = 'Close'
        }
        
    }
    closeFliter(){
        var btn = this.template.querySelector('.btn').classList.remove('slds-button_destructive')
        var btn2 = this.template.querySelector('.btn').classList.add('slds-button_success')
        this.text = this.template.querySelector('.btn').innerText = 'Open'
        this.isFilter = false
        //this.filteredData = []
        //this.fullTableData=[]
        //this.filterBy="Name"
    }

    get FilterByOptions(){
        return [
            {label:"All", value:'All'},
            {label:"Id", value:'Id'},
            {label:'Name', value:'Name'},
            {label:'Industry', value:'Industry'},
            {label:'ShippingCountry', value:'ShippingCountry'},
            {label:'Comply_Advantage_Match_Status__c', value:'Comply_Advantage_Match_Status__c'}
        ]
    }

    get sortByOptions(){
        return [
            {label:"Id", value:'Id'},
            {label:'Name', value:'Name'},
            {label:'Industry', value:'Industry'},
            {label:'ShippingCountry', value:'ShippingCountry'},
            {label:'Comply_Advantage_Match_Status__c', value:'Comply_Advantage_Match_Status__c'}
        ]
    }

    @wire(getAcc)
    acc({data,error}){
        if(data){
            console.log('F&S ::',data)
            this.fullTableData = data
            this.filteredData = [...this.sortBy(data)]  // directly run sort by name from server
        }
        if(error){
            console.error('F&S ::',error)
        }
    }

    filterbyHandler(event){
        this.filterBy = event.target.value
        console.log('filterBy::'+this.filterBy)
    }
    
    loader = false
    filterHandler(event){
        const {value} = event.target

        this.loader = true
        var timev = setTimeout(()=>{
            this.loader = false
        },2000)

        window.clearTimeout(this.timer)
        if(value){
            this.timer = window.setTimeout(()=>{
                console.log('CHECK-IN:::',value)
                this.filteredData = this.fullTableData.filter(eachObj=>{
                    if(this.filterBy === 'All'){
                        console.log('CHECK-IN-2:::',value)
                        /**Below logic will filter each and every property of object */
                        console.log('object::'+Object.keys(eachObj))
                        
                        return Object.keys(eachObj).some(key=>{
                            // return eachObj[key].toLocaleLowerCase().includes(value)
                            console.log('object-1::'+eachObj[key])
                            console.log('object-2::'+eachObj[key].toLowerCase().includes(value))
                            return eachObj[key].toLowerCase().includes(value)
                        })
                    } else {
                         /**Below logic will filter only selected fields */
                         console.log('filterBy:::'+this.filterBy)
                        const val = eachObj[this.filterBy] ? eachObj[this.filterBy]:''
                        console.log('Val::::::',val)
                        return val.toLowerCase().includes(value)
                    }
                })
            }, 500)
            
        } else {
            console.log('this.fullTableData:::',this.fullTableData)
            this.filteredData = [...this.fullTableData]
            console.log('this.filteredData:::',this.filteredData)
        }
        
    }

    sortHandler(event){
        this.sortedBy = event.target.value
        console.log('this.sortedBy:::',this.sortedBy)
        this.filteredData = [...this.sortBy(this.filteredData)]
    }

    sortBy(data){
        const cloneData = [...data]
        cloneData.sort((a,b)=>{
            if(a[this.sortedBy] === b[this.sortedBy]){
                return 0
            }
            return this.sortDirection === 'desc' ? 
            a[this.sortedBy] > b[this.sortedBy] ? -1:1 :
            a[this.sortedBy] < b[this.sortedBy] ? -1:1
        })
        return cloneData
    }
}