import { LightningElement } from 'lwc';
const BASE_URL = 'https://warm-fjord-88563.herokuapp.com'
const defaultData = {
    "First Name": '',
    "Last Name": '',
    "Mobile No": '',
    Email:'',
    State:'',
    City:''
}
export default class GoolgeSheetLWC extends LightningElement {
    formData = defaultData
    notifications = false
    loader = false

    get checkinMsg(){
        return  `Welcome, ${this.formData["First Name"]}. You're Information is updated👍🏻`
    }

    get msg(){
        return `${this.formData["First Name"]} ${this.formData["Last Name"]}`
    }
    get msgs() {
        return `${this.formData["Date"]} ${this.formData["Time"]}`
    }
    
    formChanges(event) {
        const {name, value} = event.target
        console.log({name, value})
        this.formData = {...this.formData,[name]:value}
    }

    close() {
        this.notifications = false
    }

    fetchData(event){
        event.preventDefault()
        this.loader = true
        this.formData = {...this.formData,
            "Date": new Date().toLocaleDateString(),
            "Time": new Date().toLocaleTimeString()
        }
        console.log(this.formData)

        fetch(`${BASE_URL}/api/v1/submit`,{
            method:'POST',
            headers:{
                'Content-Type': 'application/json'
            },
            body:JSON.stringify(this.formData)
        })
        .then(response=>response.json())
        .then(result=>{
            if(result.success){
                //this.isSubmitted = true
                
                window.setTimeout(()=>{
                    //this.isSubmitted = false
                    this.notifications = true
                    this.formData =[]
                    console.log(this.formData)
                },3000)
            }
        })
        .catch(error=>console.error(error))
        .finally(()=>{
            this.loader = false
            this.notifications = false
        })
    }
}