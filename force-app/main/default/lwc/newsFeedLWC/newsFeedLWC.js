import { LightningElement, track, wire } from 'lwc';
import getNews from '@salesforce/apex/VG_UKNewsExt.getNews';
const CARD_VISIBLE_CLASSES = 'fade slds-show'
const CARD_HIDDEN_CLASSES = 'fade slds-hide'

const DEFAULT_SLIDER_TIMER = 7000
export default class NewsFeedLWC extends LightningElement {
    slideTimer = DEFAULT_SLIDER_TIMER
    newsList = []
    slideIndex = 1
    timer
    enableAutoScroll = false

    @wire(getNews)
    news(result){
        console.log(result)
        if(result.data){
            this.newsList = result.data.map((item, index)=>{
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
            console.log('news',this.newsList)
            //this.enableAutoScroll = true
        }else if (result.error) {
            this.error = result.error;
            this.data = undefined;
        }
    }

    connectedCallback(){
        this.enableAutoScroll = true
        if(this.enableAutoScroll){
            this.timer = window.setInterval(()=>{
                this.slideSelectionHandler(this.slideIndex+1)
            }, Number(this.slideTimer))
        }
       
    }

    slideSelectionHandler(id){
        //console.log('this.newsList::',this.newsList.length,'::',id)
        if(id > this.newsList.length){
            this.slideIndex = 1
        } else if(id < 1){
            this.slideIndex = this.newsList.length
        } else {
            this.slideIndex = id
        }
        this.newsList = this.newsList.map(item=>{
            return this.slideIndex === item.slideIndex ? {
                ...item,
                cardClasses:CARD_VISIBLE_CLASSES
                //dotClases:DOT_VISIBLE_CLASSES
            }:{
                ...item,
                cardClasses:CARD_HIDDEN_CLASSES
                //dotClases:DOT_HIDDEN_CLASSES
            }
        })
    }

    disconnectedCallback(){
        if(this.enableAutoScroll){
            window.clearInterval(this.timer)
        }
    }

    
}