import { LightningElement,track, api } from 'lwc';

export default class ParseCSVLWC extends LightningElement {
    @api recordId
    @track data;
    @track heading
    @track columns = []
    readFiles() {
        [...this.template
            .querySelector('.csv')
            .files].forEach(async file => {
                try {
                    const result = await this.load(file);
                    // Process the CSV here
                    console.log(':::',result);
                    
                    this.data=JSON.parse(this.csvParse(result));
                    // this.data=JSON.parse(this.csvJSON(result));
                    console.log('data..',this.data);
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
        // var contents = csv.replaceAll(',"""',',"DBLQT').replaceAll('""",','DBLQT",');
        // console.log('1parse::', contents)
        // contents = contents.replaceAll('""','DBLQT');
        var allFields = []
        var result = [];
        var contents = csv.replaceAll('\n', ';');
        console.log('contents parse::',contents);

        const lines = contents.split(/\r\n|\n|\r/)
        console.log('lines.size parse::',lines.length ,'::',lines);

        const headervalues = lines[0].split(',');
        console.log('headervalues parse::',headervalues);
       
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

        this.columns = headervalues.map(function(currentItem) {
            return {
                "label": currentItem,
                "fieldName": currentItem,
                "hideDefaultActions": true
            }
        }) 

        for(var i=1;i<allFields.length-1;i++){
            var obj = {};
            var currentline = allFields[i]
            console.log('currentline::',currentline)
            for(var j=0;j<headervalues.length;j++){
                console.log('object;;',headervalues[j].replaceAll(/[^a-zA-Z0-9, ]/g, "").replace(/ /g, ""),'::',currentline[j].replaceAll(/[^a-zA-Z0-9, ]/g, "").replace(/ /g, ""))
                var key = headervalues[j].replaceAll(/[^a-zA-Z0-9, ]/g, "").replace(/ /g, "")
                var value = currentline[j].replaceAll(';',' ')
                obj[String(key)] = String(value)
            }
            
            result.push(obj);
        }
        console.log('res::', result)
        console.log('result..',JSON.stringify(result));
        return JSON.stringify(result); 
    }

    // csvJSON(csv){

    //     // var lines=csv.split(/\r\n|\n/);
    //     // console.log('lines::',lines);
    //     var result = [];

    //     var contents = csv.replaceAll('\n', ';');
    //     console.log('contents parse::',contents);

    //     const lines = contents.split(/\r\n|\n|\r/)
    //     console.log('lines.size parse::',lines.length ,'::',lines);
      
    //     var headers=lines[0].split(",");
    //     this.columns = headers.map(function(currentItem) {
    //         return {
    //             "label": currentItem,
    //             "fieldName": currentItem,
    //             "hideDefaultActions": true
    //         }
    //     })   
    //     console.log(this.columns)
    //     //console.log('headers..'+JSON.stringify(headers));
    //     for(var i=1;i<lines.length-1;i++){
    //         var obj = {};
    //         console.log('::',lines[i].replace(/[^a-zA-Z0-9 ]/g, ""));
    //         var currentline=lines[i].split(",");
    //         var c = JSON.stringify(currentline)
    //         console.log('currentline..', c)
    //         var t = c.replaceAll(/[^a-zA-Z0-9 ]/g, "")
    //         console.log('t::', t)
    //         for(var j=0;j<headers.length;j++){
    //             console.log('object;;',headers[j],'::',currentline[j])
    //             //console.log('obj[headers[j]][j];;',headers[j])
    //             obj[headers[j]] = currentline[j];
    //         }
            
    //         result.push(obj);
    //     }
    //     console.log('result::',result);
    //     //console.log('result..'+JSON.stringify(result));
    //     //return result; //JavaScript object
    //     return JSON.stringify(result); //JSON
    //   }
}