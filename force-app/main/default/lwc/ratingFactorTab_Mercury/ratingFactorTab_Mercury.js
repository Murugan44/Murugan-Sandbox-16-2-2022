import {
    LightningElement,
    track,
    wire,
    api
} from 'lwc';
import {
    ShowToastEvent
} from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import { deleteRecord } from 'lightning/uiRecordApi';
import retriveRatingFactor from '@salesforce/apex/newPS.getRatingFactorList';
import insertRatingFactor from '@salesforce/apex/newPS.insertRatingFactor';
import serachRFs from '@salesforce/apex/newPS.retriveRatingFactor';
import RF_OBJECT from '@salesforce/schema/Rating_Factors__c';
import FACTOR_FIELD from '@salesforce/schema/Rating_Factors__c.Factor__c';
import RS_FIELD from '@salesforce/schema/Rating_Factors__c.Relative_Score__c';

export default class RatingFactorTab extends LightningElement {
    @track rfList = [];
    @track rfRec = RF_OBJECT;
    @track isModalOpen = false;
    @track showLoadingSpinner = false;

    //@track isedit = false;

    refreshTable = [];
    //rafIndex = 0;


    selectedFields = [FACTOR_FIELD, RS_FIELD];
    // wire service to fetch the slesforce data
    /*@wire(retriveRatingFactor)
    wiredAccount({ error, data }) {
        if (data) {
            this.rfList = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.rfList = undefined;
        }
    }*/

    // * Apex Imperative method to fetch the slesforce data 
   
    /*connectedCallback() {
        retriveRatingFactor()
            .then(result => {
                this.rfList = result;
            })
            .catch(error => {
                this.errors = error;
            });
    }*/

    // * Getting Rating Factor *
    
    @wire(retriveRatingFactor)
    retrieveRatingFactor(result) {
        this.refreshTable = result;
        if (result.data) {
            for (let key in result.data) {
                if (result.data.hasOwnProperty(key)) {
                    this.rfList.push({
                        key: key,
                        value: result.data[key]
                    });
                }

            }

        } else if (result.error) {
            this.error = result.error;
            this.rfList = undefined;
        }
    }

    /*@wire(retriveRatingFactor)
    retrieveRatingFactor({
        error,
        data
    }) {
        for (let key in data) {
            //alert('Key::' + key);
            //alert('Data::' + data);
            if (data.hasOwnProperty(key)) {
                this.rfList.push({
                    key: key,
                    value: data[key]
                });
            }
        }
        console.log('options::' + this.rfList);
    }*/


    /*disableFactor() {
        this.isDisabledFactor = false;
    }

    disableRS(event) {
        console.log('Access key2:' + event.target.accessKey);
        console.log('>>' + event.target.id.split('-')[0]);
        this.isDisabledRS = false;

    }*/

      // * Filter & Search Rating Factor *
    
      refreshsearchData = [];
      @track rfSearchList = [];
      @track errorMsg = '';
      @track strSearchRatingFactor = '';
      @track searchRatingFactor = '';
      @track isFilterOpen = false;
      @track isError = false;
  
      handleRatingFactor(e) {
          this.rfSearchList = [];
          this.rfList = [];
          console.log('this.rfSearchList00::'+this.rfSearchList.length);
          
          //refreshApex (this.refreshTable);
          this.strSearchRatingFactor = e.detail.value;
          console.log('RF::'+this.strSearchRatingFactor);
          
          this.OpenFilter();

          //return refreshApex (this.refreshTable);
      }
      OpenFilter(){
        /*if(this.rfSearchList){
            console.log('Inside this.rfSearchList IF');
            this.isFilterOpen = true;
        }*/
        this.isFilterOpen = true;
        this.isError = false;
        this.searchRatingFactor =  this.strSearchRatingFactor;
        console.log('searchRatingFactor::'+this.searchRatingFactor.trim());
        /*if(this.searchRatingFactor.trim()!==''){
              console.log('********************************');
             refreshApex (this.refreshTable);
        }*/
      }
    @wire(serachRFs, {strRFName:'$searchRatingFactor'})
    wiredRF(result){
        this.refreshsearchData = result;
        //if(this.searchRatingFactor) {
            console.log('check');
            /*if(!this.searchRatingFactor) {
                this.isError = true;
                this.errorMsg = 'Please enter Rating Factor Name to search.';
                this.searchRatingFactor = '';
                this.rfSearchList = undefined;
                return;
            }*/
            if (result.data) {
                //alert('result.data::'+result.data);
                for (let key in result.data) {
                    //alert('result.data[key]::'+result.data[key]);
                    if (result.data.hasOwnProperty(key)) {
                    // alert('key::'+key);
                        this.rfSearchList.push({
                            key: key,
                            value: result.data[key]
                        });
                        //alert('this.rfSearchList::'+this.rfSearchList);
                        console.log('this.rfSearchList::'+this.rfSearchList);
                    }

                }
                
                
            // alert('this.rfSearchList::'+this.rfSearchList);
            } else if (result.error) {
                //this.error = result.error;
                this.isError = true;
                this.errorMsg = result.error.body.message;
                this.rfSearchList = undefined;
            }
        //}
    }

      /*OpenFilter(){
          this.isFilterOpen = true;
          this.rfSearchList=[];
          if(!this.strSearchRatingFactor) {
              this.isError = true;
              this.errorMsg = 'Please enter Rating Factor Name to search.';
              this.strSearchRatingFactor = '';
              this.rfSearchList = undefined;
              return;
          }
  
          serachRFs({
              strRFName : this.strSearchRatingFactor
          })
          .then(result => {
              //result.forEach((record) => {
              //    record.Name = '/' + record.Id;
              //});
              console.log('result::'+result);
              this.searchData = result;
              var mapVal = result; 
              //alert('map1::'+map1);
              for (var key1 in mapVal) {
                  var map2 = mapVal[key1]; // get ID from map
                  //alert('map2::'+map2);
                  var newMap = [];
                  for (var key2 in map2) {
                      newMap.push({
                          value: map2[key2],
                          key: key2
                      })
                  }
                  //alert('newMap::'+newMap); 
                  this.rfSearchList.push({
                      value: newMap,
                      key: key1
                  });
              }
              //alert('this.rfSearchList::'+this.rfSearchList);
              this.strSearchRatingFactor = '';
              this.isError = false;
          })
          .catch(error => {
              this.rfSearchList = undefined;
              window.console.log('error =====> '+JSON.stringify(error));
              if(error) {
                  this.isError = true;
                  this.errorMsg = error.body.message;
              }
          }) 
          
      }*/

    // * Delete Rating Factor *
    del(event) {
        //const delIconRatingFactorId = event.currentTarget.dataset.recordid;
        const delIconRatingFactorId = event.target.value;
        console.log('delIconRatingFactorId delete ID::' + delIconRatingFactorId);
        this.showLoadingSpinner = true;
        deleteRecord(delIconRatingFactorId)
            .then(() => {
                this.rfList = [];
                this.rfSearchList=[];
                refreshApex(this.refreshTable);
                refreshApex(this.refreshsearchData);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Record deleted successfully',
                        variant: 'success'
                    })
                );
                this.isFilterOpen = false;
                this.searchRatingFactor = '';
                this.showLoadingSpinner = false;
                
                //return refreshApex(this.refreshTable);

                // To delete the record from UI
                /*for (let opp in this.rfList) {
                    console.log('check');
                    if (this.rfList[opp].Id == delIconRatingFactorId) {
                        //console.log('inside if::');
                        this.rfList.splice(opp, 1);
                        break;
                    }
                }*/
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting record',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });

    }

    // * Insert Rating Factor *
    OpenModal() {
        this.isModalOpen = true;
    }
    closeModal() {
        this.isModalOpen = false;
    }

    handleName(event) {
        this.rfRec.Name = event.target.value;
        console.log('this.rfRec.Name >>' + this.rfRec.Name);
    }

    handleFactor(event) {
        this.rfRec.Factor__c = event.target.value;
        console.log('this.rfRec.Factor__c >>' + this.rfRec.Factor__c);
    }

    handleRelativeScore(event) {
        this.rfRec.Relative_Score__c = event.target.value;
        console.log('this.rfRec.Relative_Score__c >>' + this.rfRec.Relative_Score__c);
    }

    // * Insert Rating Factor *
    @track rfId = '';
    Finish() {
        this.showLoadingSpinner = true;
        insertRatingFactor({
                rfRec: this.rfRec
            })
            .then(result => {

                //this.rfId = result.Id;
                console.log('idss::' + result.Id);
                this.rfList = [];
                this.rfSearchList=[];
                refreshApex(this.refreshTable);
                refreshApex(this.refreshsearchData);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success!',
                        message: 'Rating Factor Record is created',
                        variant: 'success'
                    }),
                );
                this.isFilterOpen = false;
                this.searchRatingFactor = '';
                this.showLoadingSpinner = false;
                
                //console.log('rr::' + this.refreshTable);
                //return refreshApex(this.searchData);
                //console.log('rr::' + this.rfList);
            })
            .catch(error => {
                window.console.log(error);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error while creating. Please contact admin',
                        message: error.message,
                        variant: 'error',
                    }),
                );

            });
        this.isModalOpen = false;
    }

    /*isLoaded = false
    renderedCallback(){
        if(this.isLoaded) return
        const style = document.createElement('style')
        style.innerText = `c-rating-factor-tab .slds_button_icon{
            color: red;
        } `
        this.template.querySelectorAll('lightning-button-icon').appendChild(style)
        this.isLoaded = true
    }*/
  

   
}