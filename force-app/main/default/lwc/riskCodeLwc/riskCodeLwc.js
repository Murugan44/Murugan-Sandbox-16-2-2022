import {
    LightningElement,
    track,
    wire,
    api
} from 'lwc';

import getRiskCode from '@salesforce/apex/RiskCodeController.getRiskCodeList'
import Finish from '@salesforce/apex/RiskCodeController.finish'
import DeleteRiskCode from '@salesforce/apex/RiskCodeController.deleteRiskCode'
import {
    refreshApex
} from '@salesforce/apex';
import {
    ShowToastEvent
} from 'lightning/platformShowToastEvent';
export default class PsRiskCodeLWC extends LightningElement {
    @api isBridge
    @api isEdison
    @api isAlpha
    @api isAesir
    @api isVFP
    @api isHorizon
    @api isLS
    @api isGentium

    @track vfpList = []
    @track alphaList = []
    @track bridgeList = []
    @track horizonList = []

    @track refreshTable = [];

    isRc = false
    showLoadingSpinner = false
    isFacultativeTreaty = false

    team = ''
    selectedProduct = ''
    textarea = ''
    reinsurance = ''
    bridgeProduct = ['D&O', 'PI', 'FIPI', 'Crime', 'GLPL', 'Life Sciences', 'Clinical Trials', 'Commercial Combined']
    horizonProduct = ['Property Per Event', 'Property Per Risk', 'AGG XL', 'AGG Stop Loss']
    alphaProduct = ['Property', 'Motor', 'Engineering', 'Marine', 'Liability', 'Property Risk', 'Property CAT', 'Credit', 'Agriculture', 'PVT']
    optionsProduct


    @wire(getRiskCode)
    bridge(result) {
        this.refreshTable = result;
        console.log('refreshTableB::', this.refreshTable)
        if (result.data) {
            for (let key in result.data) {
                if (result.data.hasOwnProperty(key)) {
                    for (let key2 in result.data[key]) {
                        var recordType = result.data[key][key2].Team                        
                    }
                    if(recordType == 'Bridge') {
                        this.bridgeList.push({
                            key: key,
                            value: result.data[key]
                        });
                    }else if(recordType == 'Alpha'){
                        this.alphaList.push({
                            key: key,
                            value: result.data[key]
                        });
                    }else if(recordType == 'Horizon'){
                        this.horizonList.push({
                            key: key,
                            value: result.data[key]
                        });
                    }
                }
            }
            if (this.bridgeList.length > 0) {
                this.isBridge = true
            } else {
                this.isBridge = false
            }

            if (this.horizonList.length > 0) {
                this.isHorizon = true
            } else {
                this.isHorizon = false
            }

            if (this.alphaList.length > 0) {
                this.isAlpha = true
            } else {
                this.isAlpha = false
            }
        } else if (result.error) {
            this.error = result.error;
            this.bridgeList = undefined;
        }
    }
    

    instertRC() {
        this.isRc = true
    }
    closeModal() {
        this.isRc = false
        this.isFacultativeTreaty = false
        this.team = ''
        this.selectedProduct = ''
        this.textarea = ''
        this.reinsurance = ''
    }

    handleTeamChange(e) {
        console.log(e.target.value)
        this.team = e.target.value
        if (this.team == 'Bridge') {
            this.optionsProduct = this.bridgeProduct.map(function(currentItem) {
                return {
                    "label": currentItem,
                    "value": currentItem
                }
            })
            this.isFacultativeTreaty = false
        }
        if (this.team == 'Horizon') {
            this.optionsProduct = this.horizonProduct.map(function(currentItem) {
                return {
                    "label": currentItem,
                    "value": currentItem
                }
            })
            this.isFacultativeTreaty = false
        }
        if (this.team == 'Alpha') {
            this.optionsProduct = this.alphaProduct.map(function(currentItem) {
                return {
                    "label": currentItem,
                    "value": currentItem
                }
            })
            this.isFacultativeTreaty = true
        }
    }
    handleproductChange(e) {
        this.selectedProduct = e.target.value;
    }
    handleTextareaChnage(e) {
        this.textarea = e.target.value
        console.log(this.textarea)
    }
    handleFTChange(e) {
        this.reinsurance = e.target.value;
    }

    value = '--None--';
    get optionsTeam() {
        return [{
                label: '--None--',
                value: '--None--'
            },
            {
                label: 'Alpha',
                value: 'Alpha'
            },
            {
                label: 'Bridge',
                value: 'Bridge'
            },
            {
                label: 'Horizon',
                value: 'Horizon'
            },
        ];
    }

    get optionsFT() {
        return [{
                label: 'Non-Proportional',
                value: 'Non-Proportional'
            },
            {
                label: 'Proportional',
                value: 'Proportional'
            },
        ];
    }

    Finish() {
        this.showLoadingSpinner = true;
        Finish({
                team: this.team,
                product: this.selectedProduct,
                riskcode: this.textarea,
                reinsurance: this.reinsurance
            }).then(result => {
                console.log(result);
                console.log(this.team)
                //this.rcList = []
                this.bridgeList = []
                this.horizonList = []
                this.alphaList = []
                this.vfpList = []
                refreshApex(this.refreshTable)
            }).then(result => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success!',
                        message: 'Risk Code is created',
                        variant: 'success'
                    }),
                );
            })
            .catch(error => {
                window.console.log(error);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Please refresh and create it again or Please contact admin',
                        message: error.message,
                        variant: 'error',
                    }),
                );
                
            }).finally(() => {
                this.showLoadingSpinner = false;
            })

        this.isRc = false
    }

    del(e){
        console.log(e.target.value)
        console.log(e.currentTarget.dataset.recordid)
        console.log(e.currentTarget.dataset.name)
        this.showLoadingSpinner = true;
        this.deleteTeam = e.currentTarget.dataset.name
        
        DeleteRiskCode({
            rcId: e.target.value
        }).then(result => {
            console.log(result);
            console.log(this.deleteTeam)
            this.bridgeList = []
            this.horizonList = []
            this.alphaList = []
            this.vfpList = []
            refreshApex(this.refreshTable)
        }).then(result=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success!',
                    message: 'Risk Code is Deleted',
                    variant: 'success'
                }),
            );
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Please refresh and delete it again or Please contact admin',
                    message: error.message,
                    variant: 'error',
                }),
            );
        }).finally(() => {
            this.showLoadingSpinner = false;
        })
    }
}