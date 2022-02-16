import { LightningElement,track } from 'lwc';
import getjson from '@salesforce/apex/VG_VCLController.getJson';
export default class ParsingCSVtoJSON extends LightningElement {
    @track data;

    readFiles() {
        [...this.template
            .querySelector('.csv')
            .files].forEach(async file => {
                try {
                    const result = await this.load(file);
                    // Process the CSV here
                    console.log(':::',result);
                    
                    // this.data=this.csvParse(result);
                    this.data=JSON.parse(this.csvParse(result));
                    console.log('data..',this.data);
                    getjson({
                        jsonList: this.data
                    }).then(()=>{

                    }).catch(e=>{
                        console.error(e)
                    })
                } catch(e) {
                    // handle file load exception
                    console.error(e)
                }
            });
    }

    async load(file) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.onload = function() {
                resolve(reader.result);
                // console.log(JSON.parse(reader.result))
            };
            reader.onerror = function() {
                reject(reader.error);
            };
            reader.readAsText(file);
        });
    }


    csvParse(csv){
        console.log('parse::', csv)
        var allFields = []
        var result = [];
        var contents = csv.replaceAll('\n', ';');
        // console.log('contents parse::',contents);

        const lines = contents.split(/\r\n|\n|\r/)
        // console.log('lines.size parse::',lines.length ,'::',lines);

        const headervalues = lines[0].split(',');
        // console.log('headervalues parse::',headervalues);
       
        for(let i of lines){
            if (i.replaceAll(',','').trim().length == 0) 
                break;
            
            var fields = i.split(',')
            console.log('i::', fields)
            var cleanFields = []
            var compositeField = '' 
            var makeCompositeField = false

            for(let field of fields){
                if(field.startsWith('"') && field.endsWith('"')) { 
                    cleanFields.push(field.replaceAll('DBLQT','"'));
                }else if(field.startsWith('"')){    
                    makeCompositeField = true;  
                    compositeField = field;    
                }else if(field.endsWith('"')){    
                    compositeField += ',' + field;    
                    cleanFields.push(compositeField.replaceAll('DBLQT','"'));    
                    makeCompositeField = false; 
                }else if(makeCompositeField){    
                    compositeField +=  ',' + field;    
                }else{    
                    cleanFields.push(field.replaceAll('DBLQT','"'));
                }
            }
            console.log('cleanFields::', cleanFields)
            allFields.push(cleanFields)
        }
        console.log('allFields::', allFields.length, ':::', allFields[0])

        for(var i=1;i<allFields.length-1;i++){
            var obj = {};
            var currentline = allFields[i]
            // console.log('currentline::',currentline)
            for(var j=0;j<headervalues.length;j++){
                // console.log('object;;',headervalues[j].replaceAll(/[^a-zA-Z0-9, ]/g, "").replace(/ /g, ""),'::',currentline[j].replaceAll(/[^a-zA-Z0-9, ]/g, "").replace(/ /g, ""))
                var key = headervalues[j].replaceAll(/[^a-zA-Z0-9, ]/g, "").replace(/ /g, "")
                var value = currentline[j].replaceAll(';',' ')
                obj[String(key)] = String(value)
            }
            
            result.push(obj);
        }
        let textArea = this.template.querySelector('textarea');
        textArea.innerHTML = JSON.stringify(result);
        // console.log('res::', result)
        console.log('result..',JSON.stringify(result));
        return JSON.stringify(result); 
    }

}