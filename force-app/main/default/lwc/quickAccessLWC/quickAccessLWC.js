import {
	LightningElement,
	track,
    api
} from 'lwc';
import customSearch from '@salesforce/apex/QuickAccessController.apexClasses'
import customPageSearch from '@salesforce/apex/QuickAccessController.apexPages'
import getUserList from '@salesforce/apex/QuickAccessController.getUserList'
import getUserListByFilter from '@salesforce/apex/QuickAccessController.getUserListByFilter'
import getCustomLabel from '@salesforce/apex/QuickAccessController.getCustomLabel'
export default class QuickAccessLWC extends LightningElement {
	@track apexKey = ''
	@track pageKey = ''
    @track usernameKey = ''
	@track searchList = []
	@track searchPageList = []
    @track getUserList = []
    headings = ["Active","Name","Profile","Read/Write Access","UW","UW Access",""]
    RWOptions = []
    spinnerMessage = ''

	isLoading = false
    
    connectedCallback(){
        var teamList = ['Aesir','Bridge','Edison','Gentium','Horizon','Imara','LS','UMR','VFP','VCL']
        teamList.forEach(currentItem => {
			this.RWOptions.push({
				"label": currentItem,
				"value": currentItem
			})
		})
    }

	searchApexHandler(e) {
		console.log('searchApexHandler', e.target.value)
		this.apexKey = e.target.value
		if (this.apexKey !== undefined) {
			this.Search()
		}
	}

	Search() {
		customSearch({
			apexKey: this.apexKey
		}).then(result => {
			console.log('result', result)
			this.searchList = result
		})
	}
	links = ''

	link(e) {
		console.log('linkHandler', e.target.value, '::', e.currentTarget.dataset.recordid)

		this.links = `${location.origin}/${e.currentTarget.dataset.recordid}`
		console.log('links::', this.links)
		return
	}

	clearAll() {
		this.searchList = []
		this.apexKey = ''
		this.links = ''

		this.usernameKey = ''
        this.getUserList = []
        this.userTable = false

        this.isApexPage = false
        this.searchPageList = []
		this.pageKey = ''
		this.pagelinks = ''

		this.userRWAccess = ''
		this.underwriterCheck

		this.isSites = false

		this.isOpenDebugger = false

		this.isOpenCustomLabel = false
		this.customLabelList = []
	}

	searchPageHandler(e) {
		console.log('searchPageHandler', e.target.value)
		this.pageKey = e.target.value
		if (this.pageKey !== undefined) {
			this.SearchPage()
		}
	}

	SearchPage() {
		customPageSearch({
			pageKey: this.pageKey
		}).then(result => {
			console.log('result', result)
			this.searchPageList = result
		})
	}
	pagelinks = ''

	linkPage(e) {
		console.log('linkHandler', e.target.value, '::', e.currentTarget.dataset.recordid)
		this.pagelinks = `${location.origin}/${e.currentTarget.dataset.recordid}`
		console.log('pagelinks::', this.pagelinks)
		return
	}

	clearAllpages() {
		this.searchPageList = []
		this.pageKey = ''
		this.pagelinks = ''

		this.usernameKey = ''
        this.getUserList = []
        this.userTable = false

        this.isApexClass = false
        this.searchList = []
		this.apexKey = ''
		this.links = ''

		this.userRWAccess = ''
		this.underwriterCheck

		this.isSites = false

		this.isOpenDebugger = false

		this.isOpenCustomLabel = false
		this.customLabelList = []
	}

	isApexClass = false
	openLayout = false
	openApex() {
        this.spinnerMessage = 'Apex Class Tab is Loading...☮️'
		this.isLoading = true
		this.openLayout = true
		var timev = setTimeout(() => {
			this.isApexClass = true
			this.isLoading = false
		}, 1300)


		this.isApexPage = false
		this.searchPageList = []
		this.pageKey = ''
		this.pagelinks = ''

        this.usernameKey = ''
        this.getUserList = []
        this.isUser = false
        this.userTable = false

		this.isSites = false

		this.isOpenDebugger = false

		this.isOpenCustomLabel = false
		this.customLabelList = []
	}

	isApexPage = false
	openApexPage() {
        this.spinnerMessage = 'VisualForce Page Tab is Loading...☮️'
		this.isLoading = true
		this.openLayout = true
		var timev = setTimeout(() => {
			this.isApexPage = true
			this.isLoading = false
		}, 1300)

		this.isApexClass = false
		this.searchList = []
		this.apexKey = ''
		this.links = ''

        this.usernameKey = ''
        this.getUserList = []
        this.isUser = false
        this.userTable = false
        
		this.isSites = false

		this.isOpenDebugger = false

		this.isOpenCustomLabel = false
		this.customLabelList = []
	}

    isUser = false
    openUser(){
        this.spinnerMessage = 'User Tab is Loading...☮️'
        this.isLoading = true
		this.openLayout = true
        var timev = setTimeout(() => {
			this.isUser = true
			this.isLoading = false
		}, 1300)
        
        this.isApexClass = false
        this.searchList = []
		this.apexKey = ''
		this.links = ''

        this.isApexPage = false
        this.searchPageList = []
		this.pageKey = ''
		this.pagelinks = ''

		this.userRWAccess = ''
		this.underwriterCheck = ''

		this.isSites = false

		this.isOpenDebugger = false

		this.isOpenCustomLabel = false
		this.customLabelList = []
    }

    searchUserHandler(e){
        this.usernameKey = e.target.value
        var timev = setTimeout(() => {
			if(this.usernameKey != null){
                this.searchUser()
            }
		}, 1300)
        
    }

    userTable = false
    searchUser(){
        getUserList({
			userNameKey: this.usernameKey
		}).then(result => {
			console.log('getUserList result', result)
			this.getUserList = result
            this.userTable = true
        })
    }

    clearAlluser(){
        this.usernameKey = ''
        this.getUserList = []
        this.userTable = false

        this.isApexClass = false
        this.searchList = []
		this.apexKey = ''
		this.links = ''

        this.isApexPage = false
        this.searchPageList = []
		this.pageKey = ''
		this.pagelinks = ''

		this.userRWAccess = ''
		this.underwriterCheck

		this.isSites = false

		this.isOpenDebugger = false

		this.isOpenCustomLabel = false
		this.customLabelList = []
    }

	userHandler(e){
		if(e.target.name == 'ReadWriteAccess'){
			this.userRWAccess = e.target.value
		}
		if(e.target.name == 'UnderwriterCheck'){
			this.underwriterCheck = e.target.checked
		}
	}

	getUserByFilter(){
		getUserListByFilter({
			userRWAccess: this.userRWAccess,
			underwriterCheck: this.underwriterCheck
		}).then(result => {
			console.log('getUserList result', result)
			this.getUserList = result
            this.userTable = true
        })
	}

	userlink(e){
		this.links = `${location.origin}/${e.currentTarget.dataset.recordid}?noredirect=1&isUserEntityOverride=1`
		console.log('links::', this.links)
		return
	}

	isSites = false

	siteList = [
		{Name: 'Aesir Partner Central', Link: `https://full-volante.cs160.force.com/Aesir`},
		{Name: 'Bridge Partner Central', Link: `https://full-volante.cs160.force.com/Bridge`},
		{Name: 'Edison Partner Central', Link: `https://full-volante.cs160.force.com/Edison`},
		{Name: 'Gentium Partner Central', Link: `https://full-volante.cs160.force.com/Gentium`},
		{Name: 'Horizon Partner Central', Link: `https://full-volante.cs160.force.com/Horizon`},
		{Name: 'Imara Partner Central', Link: `https://full-volante.cs160.force.com/Imara`},
		{Name: 'LS Partner Central', Link: `https://full-volante.cs160.force.com/LS`},
		{Name: 'VFP Partner Central', Link: `https://full-volante.cs160.force.com/VFP`},
		{Name: 'VCL Partner Central', Link: `https://full-volante.cs160.force.com/VCL`},
		{Name: 'UMR Partner Central', Link: `https://full-volante.cs160.force.com/umr`},
		{Name: 'SAPI Partner Central', Link: `https://full-volante.cs160.force.com/SAPI`}
	]

	openAllSites(){
		this.spinnerMessage = 'All Sites Tab is Loading...☮️'
		this.openLayout = true
		this.isLoading = true
		
		var timev = setTimeout(() => {
			this.isSites = true
			this.isLoading = false
		}, 1300)


		this.isApexClass = false
        this.searchList = []
		this.apexKey = ''
		this.links = ''

        this.isApexPage = false
        this.searchPageList = []
		this.pageKey = ''
		this.pagelinks = ''
		
		this.usernameKey = ''
        this.getUserList = []
        this.userTable = false
		this.isUser = false

		this.isOpenDebugger = false

		this.isOpenCustomLabel = false
		this.customLabelList = []
	}
	isOpenDebugger = false
	openDebugLog(){
		this.spinnerMessage = 'Debug Log Tab is Loading...☮️'
		this.openLayout = true
		this.isLoading = true

		var timev = setTimeout(() => {
			this.isOpenDebugger = true
			this.isLoading = false
		}, 1300)


		this.isApexClass = false
        this.searchList = []
		this.apexKey = ''
		this.links = ''

        this.isApexPage = false
        this.searchPageList = []
		this.pageKey = ''
		this.pagelinks = ''
		
		this.usernameKey = ''
        this.getUserList = []
        this.userTable = false
		this.isUser = false

		this.userRWAccess = ''
		this.underwriterCheck

		this.isSites = false

		this.isOpenCustomLabel = false
		this.customLabelList = []
	}

	isOpenCustomLabel = false
	customLabelList = []
	openCustomLabels(){
		this.spinnerMessage = 'Custom Label List is Loading...☮️'
		this.openLayout = true
		this.isLoading = true

		var timev = setTimeout(() => {
			this.isOpenCustomLabel = true
			this.isLoading = false
		}, 1300)

		getCustomLabel({})
		.then(result => {
			console.log('custom label::',result)
			this.customLabelList = result
		})

		this.isApexClass = false
        this.searchList = []
		this.apexKey = ''
		this.links = ''

		this.isApexPage = false
        this.searchPageList = []
		this.pageKey = ''
		this.pagelinks = ''

		this.usernameKey = ''
        this.getUserList = []
        this.userTable = false
		this.isUser = false

		this.userRWAccess = ''
		this.underwriterCheck

		this.isSites = false

		this.isOpenDebugger = false
	}
}