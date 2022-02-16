import { LightningElement,api } from 'lwc';
const CARD_VISIBLE_CLASSES = 'fade slds-show'
const CARD_HIDDEN_CLASSES = 'fade slds-hide'
export default class FinancialModelingPrepLwc extends LightningElement {
    @api code = []
    //codes = ["AAPL"]
    financialmodelingprep
    searchData
    slideIndex = 1
    isShown = false
    isOpenModal = false
    searchKey = 'Apple'
    
    open(){
        this.isShown = true
    }
    openModal() {
        this.isOpenModal = true
    }

    closeModal() {
        this.isOpenModal = false
    }

    connectedCallback(){
        this.api()
    }
    api(){
        console.log('api::',this.code.split(','))
        this.code.split(',')
        console.log('api codes::',this.codes)
        fetch(`https://financialmodelingprep.com/api/v3/profile/'+${this.code}+'?apikey=c680666064ae6e5a46e0773dd7c2561f`)
        .then(response=> response.json())
        .then(data=>{
            console.log('chekkkkk:::',data)
            this.financialmodelingprep = data.map((item, index)=>{
                        return index === 0 ? {
                            ...item,
                            slideIndex: index+1,
                            cardClasses:CARD_VISIBLE_CLASSES
                        }:{
                            ...item,
                            slideIndex: index+1,
                            cardClasses:CARD_HIDDEN_CLASSES
                        }
                    })
           // console.log('financialmodelingprep::',this.financialmodelingprep)
         }).then(error=>{
            console.error('Errroor',error)
            //window.console.log('callout error ===> '+JSON.stringify(error));
        })
    }
    
    timer
    searchHandler(e){
        //console.log('e..',e.target.value)
        this.searchKey = e.target.value
        window.clearTimeout(this.timer)
        this.timer = setTimeout(()=>{
            this.search()
        },1000)
        
        //'https://financialmodelingprep.com/api/v3/search?query='+this.searchKey+'&apikey=c680666064ae6e5a46e0773dd7c2561f'
    }
    search(){
        fetch('https://financialmodelingprep.com/api/v3/search?query='+this.searchKey+'&limit=10&apikey=c680666064ae6e5a46e0773dd7c2561f')
        .then(response=> response.json())
        .then(data=>{
            //console.log('this.searchData:::',data)
            this.searchData = data
            console.log('this.searchData2::',this.searchData)
         }).then(error=>{
            console.error('Errroor',error)
            //window.console.log('callout error ===> '+JSON.stringify(error));
        })
    }

    forwardSlide(){
        let slideIndex  = this.slideIndex+1
        //console.log("forwardSlide", slideIndex)
        this.slideSelectionHandler(slideIndex)
    }

    backSlide(){
        let slideIndex  = this.slideIndex-1
        //console.log("backSlide", slideIndex)
        this.slideSelectionHandler(slideIndex)
    }

    slideSelectionHandler(id){
        //console.log("id",id)
        if(id > this.financialmodelingprep.length){
            this.slideIndex = 1
        } else if(id < 1){
            this.slideIndex = this.financialmodelingprep.length
        } else {
            this.slideIndex = id
        }
        this.financialmodelingprep = this.financialmodelingprep.map(item=>{
            return this.slideIndex === item.slideIndex ? {
                ...item,
                cardClasses:CARD_VISIBLE_CLASSES,
            }:{
                ...item,
                cardClasses:CARD_HIDDEN_CLASSES,
            }
        })
    }
}