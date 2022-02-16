import { LightningElement } from 'lwc';
const BOOK_URL = 'https://www.googleapis.com/books/v1/volumes?q='
export default class LwcBookAPI extends LightningElement {

    isOpen = false
    searchKey = 'App'
    books
    exit = ''
    open(){
        this.isOpen = true
        if(this.exit === 'Exit'){
            this.close()
        }else{
            let button = this.template.querySelector(".btn").classList.remove("slds-button_success")
            let add = this.template.querySelector(".btn").classList.add('slds-button_destructive')
            this.exit = this.template.querySelector(".btn").innerText = 'Exit'
        }
        
    }
    close(){
        this.isOpen = false
        let button = this.template.querySelector(".btn").classList.remove("slds-button_destructive")
        let add = this.template.querySelector(".btn").classList.add('slds-button_success')
        this.exit = this.template.querySelector(".btn").innerText = 'Enter'
    }
    connectedCallback(){
        this.BookData()
    }

//  Fetch API Provoides an interface for fetching resources

// fetch(URL,{
//   method : 'POST',
//   headers : {},
//   body :''
// }).then(response=> response.json()).then(data=>{
//   console.log(data)
// }).then(Error=>{
//   console.error(error)
// })

    BookData(){
        fetch(BOOK_URL+this.searchKey)
            .then(response=> response.json())
            .then(data=>{
                console.log(data)
                this.books = data
                console.log('Booookss::',this.books)
            }).then(error=>{
                console.error(error)
            })
    }
    timer
    searchHandler(event){
        this.searchKey = event.target.value
        window.clearTimeout(this.timer)
        this.timer = setTimeout(()=>{
            this.BookData()
        },1000)
    }
}