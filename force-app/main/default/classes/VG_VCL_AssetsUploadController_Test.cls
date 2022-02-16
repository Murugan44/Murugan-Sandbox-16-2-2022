@IsTest(SeeAllData=False)
public class VG_VCL_AssetsUploadController_Test {
    public Static Testmethod Void Testmethod1(){
        VG_TU.policyCustomSetting();
        Account acc = VG_TU.createAccount('Customer');
        Policy__c pol = VG_TU.createPolicy('VCL', acc.id);
        Policy_Schedule__c ps = VG_TU.createPolicySchedule(pol.id);
        Document doc = new Document();
        doc.Name = 'VCL Assets upload';
        doc.FolderId = '00l0O000002n3zY';
        insert doc;
        ApexPages.currentPage().getParameters().put('Id', acc.id);
        ApexPages.currentPage().getParameters().put('sObjectType', 'Account');
        ApexPages.currentPage().getParameters().put('attType', 'Assets File');
        VG_VCL_AssetsUploadController VCLA = new VG_VCL_AssetsUploadController();
        VCLA.AttName = 'Unit Test Attachmentttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
        VCLA.fileName='Unit Test Attachment';
        VCLA.fileBody = Blob.valueOf('Location,Site Name,Combined Address,Street Number,Street Name,City,Province/State,Country,Postal Code / Zip Code,Latitude,Longitude,Flood Zone,EQ Hazard,Cresta Zone,Currency,Building SI,Contents SI,Annual Business Interruption SI,BI Indemnity Period (months),Total TIV,Occupancy,Construction type,Storeys above grade,Storeys below grade,Automatic sprinklers,FUS Zone,PD MFL,PD MFL %,BI MFL,BI MFL %,Lloyds Constuction Code,Lloyds Occupancy Code,Year Built,Occupancy By Insured,Occupancy By Others,Construction Type,Fire Protection,Has Sprinkler System,Current Year Rate,Expiring Rate,Is Flood Covered?,Last Year Structurally Updated,,Population\n1,test site,test,562,AK street,CHennai,TN,India,627811,2.344,4.321,50yr,test,crazy,USD,4500,5000,3221,12 Months,3423,occupancy,Fire Resistive,45,75,yes,fus,4500,50,4502,45,123,34,2021,test,new,s,yes,No,345,4,No,yes,,20, \n');
        VCLA.saveCustomAttachment();
        VCLA.saveStandardAttachment(acc.id);
        VCLA.processUpload();
        VCLA.back();
    }
    
    public Static Testmethod Void Testmethod2(){
        VG_TU.policyCustomSetting();
        Account acc = VG_TU.createAccount('Customer');
        Asset__c asse = new Asset__c();
        asse.Name ='Test';
        asse.VG_Account__c = acc.id;
        insert asse;
        Policy__c pol = VG_TU.createPolicy('VCL', acc.id);
        Policy_Schedule__c ps = VG_TU.createPolicySchedule(pol.id);
        Document doc = new Document();
        doc.Name = 'VCL Assets upload';
        doc.FolderId = '00l0O000002n3zY';
        insert doc;
        ApexPages.currentPage().getParameters().put('Id', acc.id);
        ApexPages.currentPage().getParameters().put('sObjectType', 'Account');
        ApexPages.currentPage().getParameters().put('attType', 'Assets File');
        VG_VCL_AssetsUploadController VCLA = new VG_VCL_AssetsUploadController();
        Asset__c ass=[select id,Name from Asset__c where VG_Account__c=:acc.id limit 1];
        VCLA.fileName='Unit Test Attachmentttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';
        VCLA.fileBody = Blob.valueOf('SFDC Record Id,Location,Site Name,Combined Address,Street Number,Street Name,City,Province/State,Country,Postal Code / Zip Code,Latitude,Longitude,Flood Zone,EQ Hazard,Cresta Zone,Currency,Building SI,Contents SI,Annual Business Interruption SI,BI Indemnity Period (months),Total TIV,Occupancy,Construction type,Storeys above grade,Storeys below grade,Automatic sprinklers,FUS Zone,PD MFL,PD MFL %,BI MFL,BI MFL %,Lloyds Constuction Code,Lloyds Occupancy Code,Year Built,Occupancy By Insured,Occupancy By Others,Construction Type,Fire Protection,Has Sprinkler System,Current Year Rate,Expiring Rate,Is Flood Covered?,Last Year Structurally Updated,,Population\n'+ass.id+',1,test site,test,562,AK street,CHennai,TN,India,627811,2.344,4.321,50yr,test,crazy,USD,4500,5000,3221,12 Months,3423,occupancy,Fire Resistive,45,75,yes,fus,4500,50,4502,45,123,34,2021,test,new,s,yes,No,345,4,No,yes,,20, \n');
        VCLA.saveCustomAttachment();
        VCLA.saveStandardAttachment(acc.id);
        VCLA.processUpload();
        VCLA.back();
    }
    
}