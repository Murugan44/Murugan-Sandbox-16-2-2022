import {
    LightningElement
} from 'lwc';

export default class QuizApp extends LightningElement {
    isOpen = false
    selected = {}
    correctAnswers = 0
    isSubmitted = false
    myQuestions = [{
            id: "Question1",
            question: "Which one of the following is not a template loop ?",
            answers: {
                a: "for:each",
                b: "iterator",
                c: "map loop"
            },
            correctAnswer: "c"
        },
        {
            id: "Question2",
            question: "Which of the file is invald in LWC component folder ?",
            answers: {
                a: ".svg",
                b: ".apex",
                c: ".js"
            },
            correctAnswer: "b"
        },
        {
            id: "Question3",
            question: "WHich one of the following is not a directive ?",
            answers: {
                a: "for:each",
                b: "if:true",
                c: "@track"
            },
            correctAnswer: "c"
        }
    ]

    text =''
    openQuiz() {
        this.isOpen = true
        if(this.text === 'Reset'){
            this.resetHandler()
        }
       
        let success = this.template.querySelector(".im").classList.remove("slds-button_success")
        console.log('success==>'+success)
        let destructive = this.template.querySelector(".im").classList.add("slds-button_destructive")
        console.log('innnerHTML==>'+destructive)
        this.text = this.template.querySelector(".im").innerText = "Reset"
        console.log('This.text==>'+this.text)
        
    }
    close() {
        this.isOpen = false
        let destr= this.template.querySelector(".im").classList.remove("slds-button_destructive")
        console.log('destr==>'+destr)
        let success = this.template.querySelector(".im").classList.add("slds-button_success")
        console.log('success==>'+success)
        this.text = this.template.querySelector(".im").innerText = "Start"
        console.log('This.text==>'+this.text)
    }

    get allNotSelected() {
        return !(Object.keys(this.selected).length === this.myQuestions.length)
    }
    get isScoredFull() {
        return `slds-text-heading_small ${this.myQuestions.length === this.correctAnswers?
            'slds-text-color_success':'slds-text-color_error'}`
    }
    changeHandler(event) {
        console.log('value:', event.target.value)
        console.log('name:', event.target.name)
        const {
            name,
            value
        } = event.target // object destructuring
        // const name = event.target.name
        // const value = event.target.value
        this.selected = {
            ...this.selected,
            [name]: value
        } // speard operator ==> it takes shallow copy & concatenation new values into object
        //console.log('selected values::'+this.selected)
    }


    submitHandler(event) {
        event.preventDefault()
        let correct = this.myQuestions.filter(item => this.selected[item.id] === item.correctAnswer)
        this.correctAnswers = correct.length
        console.log('correctAnswers::' + this.correctAnswers)
        this.isSubmitted = true
    }
    resetHandler() {
        this.selected = {}
        this.correctAnswers = 0
        this.isSubmitted = false
    }

}