import {
	LightningElement,
	wire,
	track
} from 'lwc';
import {
	loadScript,
	loadStyle
} from 'lightning/platformResourceLoader';
import {
	ShowToastEvent
} from 'lightning/platformShowToastEvent';
import {
	refreshApex
} from '@salesforce/apex';
import FullCalendarJS from '@salesforce/resourceUrl/FullCalendarJS';
// import getAcc from '@salesforce/apex/AuditManagementController.getAcc'
// import getAp from '@salesforce/apex/AuditManagementController.getAp'
import fetchAllEvents from '@salesforce/apex/AuditManagementController.fetchAllEvents';
import createEvent from '@salesforce/apex/AuditManagementController.createEvent';
import deleteEvent from '@salesforce/apex/AuditManagementController.deleteEvent';

export default class Calender extends LightningElement {
	@track accList = []
  @track viewList =[]
	@track inAuditReportURL = []
	@track allEvents = [];

	accoptions = []
  contactOptions = []
	selectClientId = ''

  @track actions = [
        { label: 'View', value: 'view', iconName: 'utility:preview' }
    ];

	//Fields to store the event data -- add all other fields you want to add
	title;
	startDate;
	endDate;
  auditeeId 
  clinetId

  //To store the orignal wire object to use in refreshApex method
  @track eventOriginalData = [];

	openSpinner = false

	// @wire(getAcc)
	// pd(result) {
	// 	console.log('obj', result)
	// 	if (result.data) {
	// 		var tempArray = []
	// 		result.data.forEach(currentItem => {
	// 			tempArray.push({
	// 				label: currentItem.Name,
	// 				value: currentItem.Id
	// 			})
	// 		});
	// 		this.accoptions = tempArray
     
	// 	}
	// 	if (result.error) {
	// 		alert(result.error.message)
	// 	}
	// 	console.log(this.accList)
	// }

	// handleChange(e) {
	// 	this.selectClientId = e.target.value

	// 	var timev = setTimeout(() => {
	// 		this.getClientDate()
	// 	}, 1000)
	// }

	// getClientDate() {
	// 	getAcc({
	// 		clientId: this.selectClientId
	// 	}).then(res => {
	// 		console.log(res)
	// 		this.accList = res
	// 	}).catch(err => {
	// 		alert(err.message)
	// 	})
	// }




	renderedCallback() {
		Promise.all([
				loadScript(this, FullCalendarJS + '/FullCalendarJS/jquery.min.js'),
				loadScript(this, FullCalendarJS + '/FullCalendarJS/moment.min.js'),
				loadScript(this, FullCalendarJS + '/FullCalendarJS/fullcalendar.min.js'),
				loadStyle(this, FullCalendarJS + '/FullCalendarJS/fullcalendar.min.css'),
				loadStyle(this, FullCalendarJS + '/FullCalendarJS/animate.css')
			])
			.then(() => {
				// Initialise the calendar configuration
				// this.initialiseFullCalendarJs();
				this.getAllEvents();
			})
			.catch(error => {
				// eslint-disable-next-line no-console
				console.error({
					message: 'Not Loading FullCalendarJS',
					error
				});
			})


	}

   //Get data from server - in this example, it fetches from the event object
    @wire(fetchAllEvents)
    eventObj(value){
        this.eventOriginalData = value; //To use in refresh cache
        console.log('this.eventOriginalData::',this.eventOriginalData)
        const {data, error} = value;
        if(data){
            this.allEvents = data.map(item => {
              return {
                id: item.Id,
                editable: true,
                title: item.Subject,
                start: item.ActivityDate,
                end: item.EndDateTime,
                description: item.Description,
                allDay: false,
                extendedProps: {
                  whoId: item.WhoId,
                  whatId: item.WhatId
                },
                backgroundColor: "rgb(" + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + ")",
                borderColor: "rgb(" + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + ")"
              };
            })
            //load only on first wire call - 
            // if events are not rendered, try to remove this 'if' condition and add directly 
            // if(! this.eventsRendered){
            //     //Add events to calendar
            //     const ele = this.template.querySelector("div.fullcalendarjs");
            //     $(ele).fullCalendar('renderEvents', this.events, true);
            //     this.eventsRendered = true;
            // }
        }else if(error){
            this.events = [];
            this.error = 'No events are found';
        }
   }

	getAllEvents() {
		fetchAllEvents()
			.then(result => {
        // this.eventOriginalData = result; //To use in refresh cache
				this.allEvents = result.map(item => {
					return {
						id: item.Id,
						editable: true,
						title: item.Subject,
						start: item.ActivityDate,
						end: item.EndDateTime,
						description: item.Description,
						allDay: false,
						extendedProps: {
							whoId: item.WhoId,
							whatId: item.WhatId
						},
						backgroundColor: "rgb(" + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + ")",
						borderColor: "rgb(" + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + ")"
					};
				});
				// Initialise the calendar configuration
				this.initialiseFullCalendarJs();
			})
			.catch(error => {
				window.console.log(' Error Occured ', error)
			})
			.finally(() => {
				//this.initialiseFullCalendarJs();
			})
	}
	initialiseFullCalendarJs() {
		const ele = this.template.querySelector('div.fullcalendarjs');
		// eslint-disable-next-line no-undef
		$(ele).fullCalendar({
			customButtons: {
				myCustomButton: {
					text: 'New Event',
					click: function () {
						this.isEventModel = true
						isBtn = true
						console.log(this.isEventModel)
						console.log(isBtn)
						// alert(this.isEventModel);
					}
				}
			},
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay,listWeek'
			},
			defaultDate: new Date(), // default day is today
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: this.allEvents,
			dragScroll: true,
			droppable: true,
			weekNumbers: true,
			eventDrop: function (event, delta, revertFunc) {
				alert(event.title + " was dropped on " + event.start.format());
				if (!confirm("Are you sure about this change? ")) {
					revertFunc();
				}
			},
			eventClick: function (event, jsEvent, view) {
				alert('Event Clicked ' + event.title)
				this.selectedEvent = event;
				console.log('th::', this.selectedEvent)
			},
			dayClick: function (date, jsEvent, view) {
				jsEvent.preventDefault();

			},
			eventMouseover: function (event, jsEvent, view) {}
		});
	}

	eventOpenModel() {
		this.isEventModel = true
    this.startDate = null;
    this.endDate = null;
    this.title = null;
    // this.auditeeId = null;
    // this.clinetId= null;
}
	handleCancel() {
		this.isEventModel = false
	}
  
	handleKeyup(event) {
    if(event.target.name == 'title')//{
		  this.title = event.target.value;
    // }else if(event.target.name == 'Client'){
    //   this.clinetId = event.target.value
    //   var timev = setTimeout(() => {
    //     this.openSpinner = true;
    //     this.fetctCon()
    //   }, 1000)
      
    // }else if(event.target.name == 'Auditee'){
    //   this.auditeeId = event.target.value
    // }
	} 

//   fetctCon(){
//     var tempArrayCon = []
//     getAcc({
// 			auditeeClientId: this.clinetId
// 		}).then(res => {
// 			console.log(res)
// 			res.forEach(currentItem => {
//         tempArrayCon.push({
//           label: currentItem.Name,
//           value: currentItem.Id
//         })
//       })
//        this.contactOptions = tempArrayCon
//       console.log('contactOptions::', this.contactOptions)
//        this.openSpinner = false;
// 		}).catch(err => {
// 			alert(err.message)
//        this.openSpinner = false;
// 		})
//   }

   //To save the event
    handleSave(event) {
        let events = this.allEvents;
        this.openSpinner = true;

        //get all the field values - as of now they all are mandatory to create a standard event
        //TODO- you need to add your logic here.
        this.template.querySelectorAll('lightning-input').forEach(ele => {
            if(ele.name === 'title'){
               this.title = ele.value;
           }
           if(ele.name === 'start'){
                this.startDate = ele.value.includes('.000Z') ? ele.value : ele.value + '.000Z';
            }
            if(ele.name === 'end'){
                this.endDate = ele.value.includes('.000Z') ? ele.value : ele.value + '.000Z';
            }
        });
       
        //format as per fullcalendar event object to create and render
        let newevent = {title : this.title,
			start : this.startDate, 
			end: this.endDate
			// clientId: this.clinetId, 
			// auditeeId: this.auditeeId
		};
        console.log(this.allEvents);

        //Close the modal
        this.isEventModel = false;
        //Server call to create the event
        createEvent({'event' : JSON.stringify(newevent)})
        .then( result => {
            const ele = this.template.querySelector("div.fullcalendarjs");

            //To populate the event on fullcalendar object
            //Id should be unique and useful to remove the event from UI - calendar
            newevent.id = result;
            
            //renderEvent is a fullcalendar method to add the event to calendar on UI
            //Documentation: https://fullcalendar.io/docs/v3/renderEvent
            $(ele).fullCalendar( 'renderEvent', newevent, true );
            
            //To display on UI with id from server
            this.allEvents.push(newevent);

            //To close spinner and modal
            this.openSpinner = false;

            //show toast message
            this.showNotification('Success!!', 'Your event has been logged', 'success');
            refreshApex(this.eventOriginalData);

        })
        .catch( error => {
            console.log(error);
            this.openSpinner = false;

            //show toast message - TODO 
            this.showNotification('Oops', 'Something went wrong, please review console', 'error');
        })
   }
	


   removeEvent(event) {
        //open the spinner
        this.openSpinner = true;

        //delete the event from server and then remove from UI
        let eventid = event.target.value;
        deleteEvent({'eventid' : eventid})
        .then( result => {
            console.log(result);
            const ele = this.template.querySelector("div.fullcalendarjs");
            console.log(eventid);
            $(ele).fullCalendar( 'removeEvents', [eventid] );

            this.openSpinner = false;
            
            //refresh the grid
            return refreshApex(this.eventOriginalData);

        })
        .catch( error => {
            console.log(error);
            this.openSpinner = false;
        });
   }
    isTileModel = false
    viewHeader =''
   openTileModel(e){
     this.isTileModel = true
      // alert(e.currentTarget.dataset.name)
    //   getAp({
    //     apId: e.currentTarget.dataset.name
    //   }).then(res => {
    //     console.log(res)
    //     this.viewList = res
    //     this.viewHeader = this.viewList[0].Client__r.Name
    //   }).catch(err => {
    //     alert(err.message)
    //   })
   }

   isTileModelClose(){
     this.isTileModel = false
   }

	/**
	 * @description method to show toast events
	 */
	showNotification(title, message, variant) {
		console.log('enter');
		const evt = new ShowToastEvent({
			title: title,
			message: message,
			variant: variant,
		});
		this.dispatchEvent(evt);
	}

// 	// Google api console clientID and apiKey 

// 	 clientId = '252751we734600-se6610ol8twerwern886jj7gc5m2ugaai.apps.googleuserecontent.com';
// 	 apiKey = 'AIzaSyCnk5CDEX3Pvwerwerwe0OpnVf4eW_Lmeere80';

//  // enter the scope of current project (this API must be turned on in the Google console)
//     scopes = 'https://www.googleapis.com/auth/calendar';

	
// // OAuth2 functions
//       handleClientLoad() {
//            gapi.client.setApiKey(apiKey);
//            window.setTimeout(checkAuth, 1);
//         }

// 	authenticate() {
//     return gapi.auth2.getAuthInstance()
//         .signIn({scope: "https://www.googleapis.com/auth/calendar"})
//         .then(function() { console.log("Sign-in successful"); },
//               function(err) { console.error("Error signing in", err); });
//   }
//   connectedCallback() {
// 	  this.authenticate()
//   }
}