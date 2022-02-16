import { LightningElement } from 'lwc';
import { loadScript, loadStyle } from 'lightning/platformResourceLoader';
import FullCalendarJS from '@salesforce/resourceUrl/FullCalendarJS';
export default class FullCalendarJSLWC extends LightningElement {

    renderedCallback() {
        Promise.all([
            loadScript(this, FullCalendarJS + '/FullCalendarJS/jquery.min.js'),
            loadScript(this, FullCalendarJS + '/FullCalendarJS/moment.min.js'),
            loadScript(this, FullCalendarJS + '/FullCalendarJS/fullcalendar.min.js'),
            loadStyle(this, FullCalendarJS + '/FullCalendarJS/fullcalendar.min.css'),
            loadStyle(this, FullCalendarJS + '/FullCalendarJS/animate.css')
            // loadStyle(this, FullCalendarJS + '/fullcalendar.print.min.css')
          ])
          .then(() => {
            // Initialise the calendar configuration
            this.initialiseFullCalendarJs();

          })
          .catch(error => {
            // eslint-disable-next-line no-console
            console.error({
              message: 'Not Loading FullCalendarJS',
              error
            });
          })
    }

    initialiseFullCalendarJs() {
        // var str = window.location.href;
        // var pos = str.indexOf(".com/");
        // var last = pos + 4;
        // var tDomain = str.slice(0,last);
        // for(var i = 0 ; i < this.returnedOppo.length ; i++)
        // {
        //   this.finalOppo.push({
        //     start : this.returnedOppo[i].CloseDate,
        //     title : this.returnedOppo[i].Name,
        //     url : tDomain+'/lightning/r/Opportunity/'+this.returnedOppo[i].Id+'/view'
        // });
        // }
        const ele = this.template.querySelector('div.fullcalendarjs');
        // eslint-disable-next-line no-undef
        $(ele).fullCalendar({
          header: {
              left: 'prev,next today',
              center: 'title',
              right: ''
          },
         // defaultDate: '2020-03-12',
          defaultDate: new Date(), // default day is today
          navLinks: true, // can click day/week names to navigate views
          editable: true,
          eventLimit: true, // allow "more" link when too many events
          events : this.finalOppo
        });
      }
}