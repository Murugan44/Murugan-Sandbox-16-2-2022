import { LightningElement } from 'lwc';
import {loadStyle} from 'lightning/platformResourceLoader'
import fontawesome from '@salesforce/resourceUrl/fontawesomeCSS'
export default class LwcMemoryGame extends LightningElement {
    openedCards =[]
    matchCards = []
    moves=0
    totaltimes = '0:00'
    timeRef
    isloading = false
    showCongratulations = false
    isOpenG = false
    loader = false
    openG(){
        this.isOpenG = true
        this.loader = true
        var timev = setTimeout(()=>{
            this.loader = false
        },10000)
    }
    closeG(){
        this.isOpenG = false
    }
    cards= [
        {id:1, listClass:"card", type:'stack-overflow', icon:'fa fa-stack-overflow'},
        {id:2, listClass:"card", type:'windows', icon:'fa fa-windows'},
        {id:3, listClass:"card", type:'apple', icon:'fa fa-apple'},
        {id:4, listClass:"card", type:'css3', icon:'fa fa-css3'},
        {id:5, listClass:"card", type:'dropbox', icon:'fa fa-dropbox'},
        {id:6, listClass:"card", type:'github', icon:'fa fa-github'},
        {id:7, listClass:"card", type:'google', icon:'fa fa-google'},
        {id:8, listClass:"card", type:'youtube', icon:'fa fa-youtube'},
        {id:9, listClass:"card", type:'html5', icon:'fa fa-html5'},
        {id:10, listClass:"card", type:'instagram', icon:'fa fa-instagram'},
        {id:11, listClass:"card", type:'stack-overflow', icon:'fa fa-stack-overflow'},
        {id:12, listClass:"card", type:'windows', icon:'fa fa-windows'},
        {id:13, listClass:"card", type:'apple', icon:'fa fa-apple'},
        {id:14, listClass:"card", type:'css3', icon:'fa fa-css3'},
        {id:15, listClass:"card", type:'dropbox', icon:'fa fa-dropbox'},
        {id:16, listClass:"card", type:'github', icon:'fa fa-github'},
        {id:17, listClass:"card", type:'google', icon:'fa fa-google'},
        {id:18, listClass:"card", type:'youtube', icon:'fa fa-youtube'},
        {id:19, listClass:"card", type:'html5', icon:'fa fa-html5'},
        {id:20, listClass:"card", type:'instagram', icon:'fa fa-instagram'}
      ]

    

    renderedCallback(){  // for use of every thrid party lib we will use renderedCallBack 
        if(this.isloading){
            return
        } else {
            loadStyle(this,fontawesome+'/fontawesome/css/font-awesome.min.css').then(()=>{
                console.log("loaded successfully")
            }).catch(error=>{
                console.error(error)
            })
            this.isLibLoaded = true
        }
    }
    
    displayCard(event) {
        let currentCard = event.target
        currentCard.classList.add("open","show","disabled")
        this.openedCards = this.openedCards.concat(event.target)
        const len = this.openedCards.length
        console.log("len::"+len)
        if(len ===2){
            this.moves = this.moves+1
            if(this.moves === 1){
                this.timer()
            }
            if(this.openedCards[0].type === this.openedCards[1].type){
                this.matchCards = this.matchCards.concat(this.openedCards[0],this.openedCards[1])
                this.matched()
            }else{
                this.unmatched()
            }
        }

    }

    matched(){
        this.openedCards[0].classList.add("match","disabled")
        this.openedCards[1].classList.add("match","disabled")

        this.openedCards[0].classList.remove("show","open")
        this.openedCards[1].classList.remove("show","open")

        this.openedCards =[]
        if(this.matchCards.length === 20){
            window.clearInterval(this.timeRef)
            this.showCongratulations = true
        }

    }

    unmatched(){
        this.openedCards[0].classList.add("unmatched")
        this.openedCards[1].classList.add("unmatched")
        this.action('DISABLE')
        setTimeout(() => {
            this.openedCards[0].classList.remove("show", "open", "unmatched")
            this.openedCards[1].classList.remove("show", "open", "unmatched")
            this.action('ENABLE')
            this.openedCards = []
        }, 1100);
    }
    action(action){
        let cards = this.template.querySelectorAll('.card');
        Array.from(cards).forEach(item=>{
            if(action === 'ENABLE'){
                let isMatch = item.classList.contains('match')
                if(!isMatch){
                    item.classList.remove('disabled')
                }
            }
            if(action === 'DISABLE'){
                item.classList.add('disabled')
            }
        })
    }

    timer() {
        let startTime = new Date()
        console.log('startTime::::'+startTime)
        this.timeRef = setInterval(()=>{
            let diff = new Date().getTime() - startTime.getTime()
            console.log('diff::'+diff)
            let d = Math.floor(diff/1000)
            console.log("d::"+d)
            const m = Math.floor(d % 3600 / 60);
            const s = Math.floor(d % 3600 % 60);
            console.log('s::'+s)
            const mDis = m>0 ? m+(m===1? "minute, ": "minutes, " ):""
            const sDis = s>0 ? s+(s===1? "second, ": "seconds, "): ""
            this.totaltimes = mDis+sDis
        },1000)
    }

    shuffle(){
        this.openedCards = []
        this.matchCards = []
        this.totaltimes = '0:00'
        this.moves = 0
        window.clearInterval(this.timeRef)
        this.showCongratulations = false
        let element = this.template.querySelectorAll('.card')
        Array.from(element).forEach(item =>{
            item.classList.remove("show", "open", "match", "disabled")
        })

        let array =[...this.cards]
        console.log('array'+array)
        let count = array.length
        while(count>0){
            let index = Math.floor(Math.random()*count)
            count--

            let temp = array[count]
            console.log('temp::'+temp)
            array[count] = array[index]
            array[index] = temp
        }
        this.cards = [...array]
    }

    get gameRating(){
      let stars =  this.moves<14 ? [1,2,3]:this.moves>=16 ? [1,2]:[1]
      return this.matchCards.length ===20 ? stars :[]
    }
}