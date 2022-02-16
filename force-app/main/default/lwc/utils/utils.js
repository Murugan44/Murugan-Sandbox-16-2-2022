export function exportCSVFile(headers, totalPolData, fileTitle){
    console.log('headers'+headers)
    console.log('totalPolData'+totalPolData)
    console.log('fileTitle'+fileTitle)
    if(!totalPolData || !totalPolData.length){
        console.log('check if Null totalPolData')
        return null
    }
   // convert data to proper string using JSON.stringify(variable);
   const jsonObj = JSON.stringify(totalPolData)
   const resultVal = convertToCSV(jsonObj,headers)
    console.log('jsonObj'+jsonObj)
   console.log('resultVal'+resultVal)

   if(!resultVal){
       console.log('check if resultVal null')
       return null
   }
   //otherwise create a blob object
   const blob = new Blob([resultVal])
   const exportedFileName = fileTitle? fileTitle+'.csv': 'export.csv' // checking fileTitle if there or not

   if(navigator.msSaveBlob){
        navigator.msSaveBlob(blob, exportedFileName)
   }else{
        const link = window.document.createElement('a')
        if(link.download !== undefined){
            const url = URL.createObjectURL(blob) // ===> JS functionality for
            link.setAttribute("href",url)
            link.setAttribute("download",exportedFileName)
            link.style.visibility = 'hidden'
            document.body.appendChild(link)
            link.click()
            document.body.removeChild(link)

            // <body>
            //     <a href ="url" download="fileName" style="visibility:hidden"></a> // it is form in this vision of element
            // </body>
        }
   }

}

function convertToCSV(objArray,headers){
    const columnDelimiter = ',' // seperate column using delimiter , seperator
    const lineDelimiter = '\r\n' // append \r - carriage return & \n - next line
    const actualHeaderKey = Object.keys(headers) // it will get keys in this property
    const headerToShow = Object.values(headers) // this property get value of keys

    let str = ''
    str+=headerToShow.join(columnDelimiter) // now converting into string // ["Pol Name","Pol Id"] - its is like this converting into string
    str+=lineDelimiter
    console.log('str::'+str)

    //const data = typeof objArray !== 'object'? JSON.parse(objArray):objArray
    const data = typeof objArray !=='object' ? JSON.parse(objArray):objArray
    console.log('data::'+data)
    data.forEach(obj=>{
        let line = ''
        console.log('inside data forEach')
        actualHeaderKey.forEach(key=>{
            console.log('inside actualHeaderKey forEach')
            if(line != ''){
                line += columnDelimiter
                //console.log('line: '+line)
            }

            let strItem = obj[key]? obj[key]+'': '' // append it based on obj of key
            console.log('strItem::'+strItem)
            line += strItem? strItem.replace(/,/g,''): strItem // check ["acc,"] extra comma, and replace it empty string
            console.log('line::'+line)
        })
        str+=line+lineDelimiter // append it 
        console.log('str:::'+str)
    })
    //console.log('str outside:::'+str)
    return str
}