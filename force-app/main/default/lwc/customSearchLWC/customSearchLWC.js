import { LightningElement, track } from 'lwc';
import customSearch from '@salesforce/apex/CustomSearchController.apexClasses'
import customPageSearch from '@salesforce/apex/CustomSearchController.apexPages'
export default class CustomSearchLWC extends LightningElement {
    @track apexKey = ''
    @track pageKey = ''
    @track searchList = []
    @track searchPageList = []
    headings = [""]

    isLoading = false

    searchApexHandler(e){
        console.log('searchApexHandler',e.target.value)
        this.apexKey = e.target.value
        if(this.apexKey !== undefined){
            this.Search()
        }
    }

    Search(){
        customSearch({
            apexKey: this.apexKey
        }).then(result => {
            console.log('result',result)
            this.searchList = result
            //this.link = `https://volante--murugan.lightning.force.com/lightning/setup/ApexClasses/page?address=%2F${result.Id}`
        })
    }
    links =''

    link(e){
        console.log('linkHandler',e.target.value, '::', e.currentTarget.dataset.recordid)

        this.links = `${location.origin}/${e.currentTarget.dataset.recordid}`
        console.log('links::', this.links)
        return
    }

    clearAll(){
        this.searchList = []
        this.apexKey =''
        this.links = ''
    }

    searchPageHandler(e){
        console.log('searchPageHandler',e.target.value)
        this.pageKey = e.target.value
        if(this.pageKey !== undefined){
            this.SearchPage()
        }
    }

    SearchPage(){
        customPageSearch({
            pageKey: this.pageKey
        }).then(result => {
            console.log('result',result)
            this.searchPageList = result
            //this.link = `https://volante--murugan.lightning.force.com/lightning/setup/ApexClasses/page?address=%2F${result.Id}`
        })
    }
    pagelinks =''

    linkPage(e){
        console.log('linkHandler',e.target.value, '::', e.currentTarget.dataset.recordid)
        this.pagelinks = `${location.origin}/${e.currentTarget.dataset.recordid}`
        console.log('pagelinks::', this.pagelinks)
        return
    }

    clearAllpages(){
        this.searchPageList = []
        this.pageKey =''
        this.pagelinks = ''
    }

    isApexClass = false
    openLayout = false
    openApex(){
        this.isLoading = true
        this.openLayout = true
        var timev = setTimeout(()=>{
			this.isApexClass = true
            this.isLoading = false
		},1300)
        

        this.isApexPage = false
        this.searchPageList = []
        this.pageKey =''
        this.pagelinks = ''
    }

    isApexPage = false
    openApexPage(){
        this.isLoading = true
        this.openLayout = true
        var timev = setTimeout(()=>{
            this.isApexPage = true
            this.isLoading = false
		},1300)

        this.isApexClass = false
        this.searchList = []
        this.apexKey =''
        this.links = ''
    }
}