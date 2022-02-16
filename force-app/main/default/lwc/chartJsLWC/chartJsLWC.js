import { LightningElement,api,track,wire } from 'lwc';
import chartJs from '@salesforce/resourceUrl/chartJs'
import {loadScript} from 'lightning/platformResourceLoader'

import getAllObjects from '@salesforce/apex/GetObjectByRecordsLWCController.getAllObjects'
import getNumberTypeField from '@salesforce/apex/GetObjectByRecordsLWCController.getNumberTypeField'
import getListOfRecords from '@salesforce/apex/GetObjectByRecordsLWCController.getListOfRecords'
export default class ChartJsLWC extends LightningElement {
     isChartJSInit = false
    chart
    type='bar'
    chartData =[]
    chartHeading =''
    chartLabels = []
    fieldName = ''

    @track objectOption=[]
    isLoading = false
    isFieldLoading = false
    isChartLoading = false
    @wire(getAllObjects)
	obj(result) {
        console.log('obj' ,result)
        this.isLoading = true
		if (result.data) {
			for (let key in result.data) {
				if (result.data.hasOwnProperty(key)) {
					this.objectOption.push({
						label: result.data[key],
						value: key
					})
				}
			}
            var timev = setTimeout(() => {
                this.isLoading = false
            }, 1000)
		} else if (result.error) {
            console.error(result.error)
			this.error = result.error;
			this.objectOption = undefined;
            this.isLoading = false
		}
	}

    selectedObject
    selectedField
    optionsOne = []
    handleSelect(e){
        this.chart.data.labels = []
        this.chart.data.datasets.forEach((dataset) => {
            dataset.data = []
        });
        this.chart.update();
        this.selectedObject = e.target.value
        this.fieldName = `${this.selectedObject} Fields`
        this.fetchField()
    }

    fetchField(){
        this.isFieldLoading = true
        getNumberTypeField({
            selectedObject: this.selectedObject
        }).then(result => {
            console.log('::new :: ',result)
            var tempArray = []
            result.forEach(currentItem => {
                tempArray.push({
                    "label": currentItem,
                    "value": currentItem
                })
            })
            this.optionsOne = tempArray
            this.isFieldLoading = false
        })
    }

    handleChange(e){
        this.isChartLoading = true
        this.chart.data.labels = []
        this.chart.data.datasets.forEach((dataset) => {
            dataset.data = []
        });
        this.chart.update();
        this.selectedField = e.target.value
        var query = `SELECT Name, ${this.selectedField} FROM ${this.selectedObject}`
        // console.log('che query::'+ query)
        this.getRecord(query)
    }

    async getRecord(query){
        const data = await getListOfRecords({
            query: query
        });
        console.log(this.chart.data.labels)
        data.forEach(res=>{
            this.chartData.push(Object.values(res)[1])
            this.chart.data.labels.push(res.Name)
            this.chart.data.datasets.forEach((dataset) => {
                dataset.data.push(Object.values(res)[1]);
                var r = Math.floor(Math.random() * 255);
                var g = Math.floor(Math.random() * 255);
                var b = Math.floor(Math.random() * 255);
                dataset.backgroundColor.push("rgb(" + r + "," + g + "," + b + ")")
                dataset.borderColor.push("rgb(" + r + "," + g + "," + b + ")")
            });
        })
        var timev = setTimeout(() => {
            this.isChartLoading = false
        }, 1000)  
        this.chart.update();
        
    }
    
     connectedCallback(){
        loadScript(this, chartJs+'/chartJs/Chart.js').then(()=>{
            console.log('chartJs loaded succesfully')
            this.loadChart()
        }).catch(error=>{
            console.error(error)
        })
    }

    loadChart(){
        window.Chart.platform.disableCSSInjection = true // it is automatically inject css in dom so we disable this
        const canvas = document.createElement('canvas') /// in js we create element like this
        // <canvas> </canvas>
        this.template.querySelector('div.chart').appendChild(canvas)
        const ctx = canvas.getContext('2d')
        this.chart = new window.Chart(ctx, this.config())
        console.log('chart::',this.chart)
    }

    config(){
        // console.log('Data:', this.chartData);
        // console.log('Labels:', this.chartLabels);
        return {
            type: this.type,
            data: {
                labels: this.chartLabels ? this.chartLabels:[],
                datasets: [{
                    label: this.chartHeading,
                    data: this.chartData ? this.chartData:[],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.8)',
                        'rgba(54, 162, 235, 0.8)',
                        'rgba(255, 206, 86, 0.8)',
                        'rgba(75, 192, 192, 0.8)',
                        'rgba(153, 102, 255, 0.8)',
                        'rgba(255, 159, 64, 0.8)',
                        'rgba(30, 204, 148, 0.8)',
                        'rgba(130, 204, 148, 0.8)'
                    ],
                    borderColor: [
                        'rgb(255, 99, 132)',
                        'rgb(255, 159, 64)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(54, 162, 235)',
                        'rgb(153, 102, 255)',
                        'rgb(201, 203, 207)'
                    ],
                    
                    borderWidth: 5
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                responsive: true,
                legend: {
                    position: 'right'
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        }

    }
}