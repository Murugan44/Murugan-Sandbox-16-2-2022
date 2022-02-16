@IsTest(seeAllData =False)
public class VG_Logo_Extension_Test {
    public static testMethod void TestMethod1() {
        VG_TU.policyCustomSetting();
        Document d1=new Document();
        d1.Name='Volante_Global_logo';
        d1.Body=blob.valueOf('Hai');
        d1.FolderId='0050O0000078Mug';
        insert d1;
        Document d2=new Document();
        d2.Name='Motor Felt';
        d2.Body=blob.valueOf('Hai');
        d2.FolderId='0050O0000078Mug';
        insert d2;
        Document d3=new Document();
        d3.Name='VG_Edison_Quote';
        d3.Body=blob.valueOf('Hai');
        d3.FolderId='0050O0000078Mug';
        insert d3;
        Document d4=new Document();
        d4.Name='VG_Edison_Quote2';
        d4.Body=blob.valueOf('Hai');
        d4.FolderId='0050O0000078Mug';
        insert d4;
        Document d5=new Document();
        d5.Name='certificate signature';
        d5.Body=blob.valueOf('Hai');
        d5.FolderId='0050O0000078Mug';
        insert d5;
        Document d6=new Document();
        d6.Name='VG_AdviceNote_Footer';
        d6.Body=blob.valueOf('Hai');
        d6.FolderId='0050O0000078Mug';
        insert d6;
        Account acc=VG_TU.createAccount('Customer');        
        Policy__c pol=VG_TU.createPolicy('Edison Motor', acc.id);
        Policy_Schedule__c ps=new Policy_Schedule__c(Name='Test');
        ps.Policy__c=pol.id;
        ps.Gross_Written_Premium__c=5663;
        ps.IPT__c=450;
        ps.VG_Brokerage_Amount__c=500;
        ps.VG_MTA_Start_Date__c=Date.newInstance(2017, 11, 12);
        Insert ps;
        List<VG_Policy_Schedule_Endorsement__c> pseDelList=new List<VG_Policy_Schedule_Endorsement__c>();
        List<VG_Policy_Schedule_Endorsement__c> pseInsList=new List<VG_Policy_Schedule_Endorsement__c>();
        VG_Policy_Schedule_Asset__c psa=VG_TU.createPolicyScheduleAsset(ps.id);          
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.Id);                
        VG_Policy_Schedule_Endorsement__c pse1=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse2=pse.clone(false,true,false,false);                
        VG_Policy_Schedule_Endorsement__c pse3=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse4=pse.clone(false,true,false,false);            
        VG_Policy_Schedule_Endorsement__c pse5=pse.clone(false,true,false,false);         
        VG_Policy_Schedule_Endorsement__c pse6=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse7=pse.clone(false,true,false,false);              
        VG_Policy_Schedule_Endorsement__c pse8=pse.clone(false,true,false,false);            
        VG_Policy_Schedule_Endorsement__c pse9=pse.clone(false,true,false,false); 
        VG_Policy_Schedule_Endorsement__c pse10=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse11=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse12=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse13=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse14=pse.clone(false,true,false,false);
        pseInsList.add(pse1);pseInsList.add(pse2);pseInsList.add(pse3);pseInsList.add(pse4);
        pseInsList.add(pse5);pseInsList.add(pse6);pseInsList.add(pse7);pseInsList.add(pse8);
        pseInsList.add(pse9);pseInsList.add(pse10);pseInsList.add(pse11);pseInsList.add(pse12);
        pseInsList.add(pse13);pseInsList.add(pse14);
        Insert pseInsList;
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        VG_Logo_Extension Logo=new VG_Logo_Extension();
        delete pse14;
        
    }
    
    
    //Below cover this-else if(!assList.IsEmpty() && assList.size()>0 && assList.size()<10)
    public static testMethod void TestMethod2() {       
        VG_TU.policyCustomSetting();
        Document d1=new Document();
        d1.Name='Volante_Global_logo';
        d1.Body=blob.valueOf('Hai');
        d1.FolderId='0050O0000078Mug';
        insert d1;
        Document d2=new Document();
        d2.Name='Motor Felt';
        d2.Body=blob.valueOf('Hai');
        d2.FolderId='0050O0000078Mug';
        insert d2;
        Document d3=new Document();
        d3.Name='VG_Edison_Quote';
        d3.Body=blob.valueOf('Hai');
        d3.FolderId='0050O0000078Mug';
        insert d3;
        Document d4=new Document();
        d4.Name='VG_Edison_Quote2';
        d4.Body=blob.valueOf('Hai');
        d4.FolderId='0050O0000078Mug';
        insert d4;
        Document d5=new Document();
        d5.Name='certificate signature';
        d5.Body=blob.valueOf('Hai');
        d5.FolderId='0050O0000078Mug';
        insert d5;
        Document d6=new Document();
        d6.Name='VG_AdviceNote_Footer';
        d6.Body=blob.valueOf('Hai');
        d6.FolderId='0050O0000078Mug';
        insert d6;
        Account acc=VG_TU.createAccount('Customer');        
        Policy__c pol=VG_TU.createPolicy('Edison Motor', acc.id);       
        Policy_Schedule__c ps=new Policy_Schedule__c(Name='Test');
        ps.Policy__c=pol.id;
        ps.Gross_Written_Premium__c=5663;
        ps.IPT__c=450;
        ps.VG_Brokerage_Amount__c=500;
        ps.VG_MTA_Start_Date__c=Date.newInstance(2017, 11, 12);
        Insert ps;
        Asset__c ass=VG_TU.createAsset(acc.Id);        
        Asset__c ass1=VG_TU.createAsset(acc.Id);  
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        VG_Logo_Extension Logo=new VG_Logo_Extension();
    //Below code covers mentioned if(!assList.IsEmpty() && assList.size()>=10) final else
        delete ass1;
        delete ass;
        VG_Logo_Extension Logo1=new VG_Logo_Extension();
    }
    
    //Below cover this-if(!assList.IsEmpty() && assList.size()>10)    
    public static testMethod void TestMethod3() {        
        VG_TU.policyCustomSetting();
        Document d1=new Document();
        d1.Name='Volante_Global_logo';
        d1.Body=blob.valueOf('Hai');
        d1.FolderId='0050O0000078Mug';
        insert d1;
        Document d2=new Document();
        d2.Name='Motor Felt';
        d2.Body=blob.valueOf('Hai');
        d2.FolderId='0050O0000078Mug';
        insert d2;
        Document d3=new Document();
        d3.Name='VG_Edison_Quote';
        d3.Body=blob.valueOf('Hai');
        d3.FolderId='0050O0000078Mug';
        insert d3;
        Document d4=new Document();
        d4.Name='VG_Edison_Quote2';
        d4.Body=blob.valueOf('Hai');
        d4.FolderId='0050O0000078Mug';
        insert d4;
        Document d5=new Document();
        d5.Name='certificate signature';
        d5.Body=blob.valueOf('Hai');
        d5.FolderId='0050O0000078Mug';
        insert d5;
        Document d6=new Document();
        d6.Name='VG_AdviceNote_Footer';
        d6.Body=blob.valueOf('Hai');
        d6.FolderId='0050O0000078Mug';
        insert d6;
        Account acc=VG_TU.createAccount('Customer');        
        Policy__c pol=VG_TU.createPolicy('Edison Motor', acc.id);      
        Policy_Schedule__c ps=new Policy_Schedule__c(Name='Test');
        ps.Policy__c=pol.id;
        ps.Gross_Written_Premium__c=5663;
        ps.IPT__c=450;
        ps.VG_Brokerage_Amount__c=500;       
        ps.VG_MTA_Start_Date__c=Date.newInstance(2017, 11, 12);
        Insert ps;
        Asset__c ass=VG_TU.createAsset(acc.Id);        
        Asset__c ass1=ass.clone(false,true,false,false);        
        Asset__c ass2=ass.clone(false,true,false,false);         
        Asset__c ass3=ass.clone(false,true,false,false);         
        Asset__c ass4=ass.clone(false,true,false,false);         
        Asset__c ass5=ass.clone(false,true,false,false);        
        Asset__c ass6=ass.clone(false,true,false,false);         
        Asset__c ass7=ass.clone(false,true,false,false);         
        Asset__c ass8=ass.clone(false,true,false,false);        
        Asset__c ass9=ass.clone(false,true,false,false);    
        List<Asset__c> assList=new List<Asset__c>();
		assList.add(ass1);
		assList.add(ass2);
		assList.add(ass3);
		assList.add(ass4);
		assList.add(ass5);
		assList.add(ass6);
		assList.add(ass7);
		assList.add(ass8);
		assList.add(ass9);
        Insert assList;
        //Asset__c ass10=VG_TU.createAsset(acc.Id);  
        VG_Policy_Schedule_Asset__c psa1=VG_TU.createPolicyScheduleAsset(ps.id); 
        VG_Policy_Schedule_Asset__c psa2=psa1.clone(false,true,false,false); 
        VG_Policy_Schedule_Asset__c psa3=psa1.clone(false,true,false,false); 
        VG_Policy_Schedule_Asset__c psa4=psa1.clone(false,true,false,false); 
        VG_Policy_Schedule_Asset__c psa5=psa1.clone(false,true,false,false); 
        VG_Policy_Schedule_Asset__c psa6=psa1.clone(false,true,false,false); 
        VG_Policy_Schedule_Asset__c psa7=psa1.clone(false,true,false,false); 
        VG_Policy_Schedule_Asset__c psa8=psa1.clone(false,true,false,false); 
        VG_Policy_Schedule_Asset__c psa9=psa1.clone(false,true,false,false); 
        VG_Policy_Schedule_Asset__c psa10=psa1.clone(false,true,false,false);
		List<VG_Policy_Schedule_Asset__c> psaList=new List<VG_Policy_Schedule_Asset__c>();
		psaList.add(psa2);
		psaList.add(psa3);
		psaList.add(psa4);
		psaList.add(psa5);
		psaList.add(psa6);
		psaList.add(psa7);
		psaList.add(psa8);
		psaList.add(psa9);
		psaList.add(psa10);
        Insert psaList;
        //VG_Policy_Schedule_Asset__c psa11=VG_TU.createPolicyScheduleAsset(ps.id);
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.Id);                
        VG_Policy_Schedule_Endorsement__c pse1=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse2=pse.clone(false,true,false,false);                
        VG_Policy_Schedule_Endorsement__c pse3=pse.clone(false,true,false,false); 
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        VG_Logo_Extension Logo=new VG_Logo_Extension();
        
    }   
    // Below code joint cover with method1
    public static testMethod void TestMethod4() {
        VG_TU.policyCustomSetting();
        Document d1=new Document();
        d1.Name='Volante_Global_logo';
        d1.Body=blob.valueOf('Hai');
        d1.FolderId='0050O0000078Mug';
        insert d1;
        Document d2=new Document();
        d2.Name='Motor Felt';
        d2.Body=blob.valueOf('Hai');
        d2.FolderId='0050O0000078Mug';
        insert d2;
        Document d3=new Document();
        d3.Name='VG_Edison_Quote';
        d3.Body=blob.valueOf('Hai');
        d3.FolderId='0050O0000078Mug';
        insert d3;
        Document d4=new Document();
        d4.Name='VG_Edison_Quote2';
        d4.Body=blob.valueOf('Hai');
        d4.FolderId='0050O0000078Mug';
        insert d4;
        Document d5=new Document();
        d5.Name='certificate signature';
        d5.Body=blob.valueOf('Hai');
        d5.FolderId='0050O0000078Mug';
        insert d5;
        Document d6=new Document();
        d6.Name='VG_AdviceNote_Footer';
        d6.Body=blob.valueOf('Hai');
        d6.FolderId='0050O0000078Mug';
        insert d6;
        Account acc=VG_TU.createAccount('Customer');        
        Policy__c pol=VG_TU.createPolicy('Edison Motor', acc.id);
        Policy_Schedule__c ps=new Policy_Schedule__c(Name='Test');
        ps.Policy__c=pol.id;
        ps.Gross_Written_Premium__c=5663;
        ps.IPT__c=450;
        ps.VG_Brokerage_Amount__c=500;        
        ps.VG_MTA_Start_Date__c=Date.newInstance(2017, 11, 12);
        Insert ps;
        List<VG_Policy_Schedule_Endorsement__c> pseDelList=new List<VG_Policy_Schedule_Endorsement__c>();
        List<VG_Policy_Schedule_Endorsement__c> pseInsList=new List<VG_Policy_Schedule_Endorsement__c>();
        VG_Policy_Schedule_Asset__c psa=VG_TU.createPolicyScheduleAsset(ps.id);          
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.Id); 
        VG_Policy_Schedule_Endorsement__c pse1=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse2=pse.clone(false,true,false,false);                
        VG_Policy_Schedule_Endorsement__c pse3=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse4=pse.clone(false,true,false,false);            
        VG_Policy_Schedule_Endorsement__c pse5=pse.clone(false,true,false,false);         
        VG_Policy_Schedule_Endorsement__c pse6=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse7=pse.clone(false,true,false,false);              
        VG_Policy_Schedule_Endorsement__c pse8=pse.clone(false,true,false,false);            
        VG_Policy_Schedule_Endorsement__c pse9=pse.clone(false,true,false,false); 
        VG_Policy_Schedule_Endorsement__c pse10=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse11=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse12=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse13=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse14=pse.clone(false,true,false,false);
        
        pseInsList.add(pse1);
        pseInsList.add(pse2);
        pseInsList.add(pse3);
        pseInsList.add(pse4);
        pseInsList.add(pse5);
        pseInsList.add(pse6);
        pseInsList.add(pse7);
        pseInsList.add(pse8);
        pseInsList.add(pse9);
        pseInsList.add(pse10);
        pseInsList.add(pse11);
        pseInsList.add(pse12);
        pseInsList.add(pse13);
        pseInsList.add(pse14);
        Insert pseInsList;
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        Test.startTest();
        VG_Logo_Extension Logo=new VG_Logo_Extension();
        delete pse14;
        VG_Logo_Extension Logo1=new VG_Logo_Extension();
        delete pse13;
        VG_Logo_Extension Logo2=new VG_Logo_Extension();
        delete pse12;
        VG_Logo_Extension Logo3=new VG_Logo_Extension();
        delete pse11;
        Test.stopTest();
        /*VG_Logo_Extension Logo4=new VG_Logo_Extension();
        pseDelList.add(pse10);
        pseDelList.add(pse9);
        pseDelList.add(pse8);
        pseDelList.add(pse7);
        pseDelList.add(pse6);
        pseDelList.add(pse5);
        pseDelList.add(pse4);
        pseDelList.add(pse3);
        delete pseDelList;
		delete pse2;
        VG_Logo_Extension Logo6=new VG_Logo_Extension();
        delete pse1;
        VG_Logo_Extension Logo7=new VG_Logo_Extension();*/
    }
    public static testMethod void TestMethod5() {
        VG_TU.policyCustomSetting();
        Document d1=new Document();
        d1.Name='Volante_Global_logo';
        d1.Body=blob.valueOf('Hai');
        d1.FolderId='0050O0000078Mug';
        insert d1;
        Document d2=new Document();
        d2.Name='Motor Felt';
        d2.Body=blob.valueOf('Hai');
        d2.FolderId='0050O0000078Mug';
        insert d2;
        Document d3=new Document();
        d3.Name='VG_Edison_Quote';
        d3.Body=blob.valueOf('Hai');
        d3.FolderId='0050O0000078Mug';
        insert d3;
        Document d4=new Document();
        d4.Name='VG_Edison_Quote2';
        d4.Body=blob.valueOf('Hai');
        d4.FolderId='0050O0000078Mug';
        insert d4;
        Document d5=new Document();
        d5.Name='certificate signature';
        d5.Body=blob.valueOf('Hai');
        d5.FolderId='0050O0000078Mug';
        insert d5;
        Document d6=new Document();
        d6.Name='VG_AdviceNote_Footer';
        d6.Body=blob.valueOf('Hai');
        d6.FolderId='0050O0000078Mug';
        insert d6;
        Account acc=VG_TU.createAccount('Customer');        
        Policy__c pol=VG_TU.createPolicy('Edison Motor', acc.id);
        Policy_Schedule__c ps=new Policy_Schedule__c(Name='Test');
        ps.Policy__c=pol.id;
        ps.Gross_Written_Premium__c=5663;
        ps.IPT__c=450;
        ps.VG_Brokerage_Amount__c=500;        
        ps.VG_MTA_Start_Date__c=Date.newInstance(2017, 11, 12);
        Insert ps;
        List<VG_Policy_Schedule_Endorsement__c> pseDelList=new List<VG_Policy_Schedule_Endorsement__c>();
        List<VG_Policy_Schedule_Endorsement__c> pseInsList=new List<VG_Policy_Schedule_Endorsement__c>();
        VG_Policy_Schedule_Asset__c psa=VG_TU.createPolicyScheduleAsset(ps.id);          
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.Id);                
        VG_Policy_Schedule_Endorsement__c pse1=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse2=pse.clone(false,true,false,false);                
        VG_Policy_Schedule_Endorsement__c pse3=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse4=pse.clone(false,true,false,false);            
        VG_Policy_Schedule_Endorsement__c pse5=pse.clone(false,true,false,false);         
        VG_Policy_Schedule_Endorsement__c pse6=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse7=pse.clone(false,true,false,false);              
        VG_Policy_Schedule_Endorsement__c pse8=pse.clone(false,true,false,false);            
        VG_Policy_Schedule_Endorsement__c pse9=pse.clone(false,true,false,false); 
        VG_Policy_Schedule_Endorsement__c pse10=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse11=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse12=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse13=pse.clone(false,true,false,false);
        VG_Policy_Schedule_Endorsement__c pse14=pse.clone(false,true,false,false);
        pseInsList.add(pse1);pseInsList.add(pse2);pseInsList.add(pse3);pseInsList.add(pse4);
        pseInsList.add(pse5);pseInsList.add(pse6);pseInsList.add(pse7);pseInsList.add(pse8);
        pseInsList.add(pse9);pseInsList.add(pse10);pseInsList.add(pse11);pseInsList.add(pse12);
        pseInsList.add(pse13);pseInsList.add(pse14);
        Insert pseInsList;
        Test.startTest();
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        VG_Logo_Extension Logo=new VG_Logo_Extension();        
        pseDelList.add(pse14);
        pseDelList.add(pse13);
        pseDelList.add(pse12);
        pseDelList.add(pse11);
        pseDelList.add(pse10);
        pseDelList.add(pse9);
        pseDelList.add(pse8);
        pseDelList.add(pse7);
        pseDelList.add(pse6);
        pseDelList.add(pse5);
        pseDelList.add(pse4);
        pseDelList.add(pse3);
        delete pseDelList;
        VG_Logo_Extension Logo5=new VG_Logo_Extension();
        delete pse2;
        VG_Logo_Extension Logo6=new VG_Logo_Extension();
        delete pse1;
        VG_Logo_Extension Logo7=new VG_Logo_Extension();
        Test.stopTest();
    }
    public static testMethod void TestMethod6() {
        VG_TU.policyCustomSetting();
        Document d1=new Document();
        d1.Name='Volante_Global_logo';
        d1.Body=blob.valueOf('Hai');
        d1.FolderId='0050O0000078Mug';
        insert d1;
        Document d2=new Document();
        d2.Name='Motor Felt';
        d2.Body=blob.valueOf('Hai');
        d2.FolderId='0050O0000078Mug';
        insert d2;
        Document d3=new Document();
        d3.Name='VG_Edison_Quote';
        d3.Body=blob.valueOf('Hai');
        d3.FolderId='0050O0000078Mug';
        insert d3;
        Document d4=new Document();
        d4.Name='VG_Edison_Quote2';
        d4.Body=blob.valueOf('Hai');
        d4.FolderId='0050O0000078Mug';
        insert d4;
        Document d5=new Document();
        d5.Name='certificate signature';
        d5.Body=blob.valueOf('Hai');
        d5.FolderId='0050O0000078Mug';
        insert d5;
        Document d6=new Document();
        d6.Name='VG_AdviceNote_Footer';
        d6.Body=blob.valueOf('Hai');
        d6.FolderId='0050O0000078Mug';
        insert d6;
        Account acc=VG_TU.createAccount('Customer');        
        Policy__c pol=VG_TU.createPolicy('Edison Motor', acc.id);
        Policy_Schedule__c ps=new Policy_Schedule__c(Name='Test');
        ps.Policy__c=pol.id;
        ps.Gross_Written_Premium__c=5663;
        ps.IPT__c=450;
        ps.VG_Brokerage_Amount__c=500;        
        ps.VG_MTA_Start_Date__c=Date.newInstance(2017, 11, 12);
        Insert ps;
        List<VG_Policy_Schedule_Endorsement__c> pseDelList=new List<VG_Policy_Schedule_Endorsement__c>();
        List<VG_Policy_Schedule_Endorsement__c> pseInsList=new List<VG_Policy_Schedule_Endorsement__c>();
        VG_Policy_Schedule_Asset__c psa=VG_TU.createPolicyScheduleAsset(ps.id);          
        VG_Policy_Schedule_Endorsement__c pse=VG_TU.createPolicyScheduleEndorsement(ps.Id);                
        VG_Policy_Schedule_Endorsement__c pse1=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse2=pse.clone(false,true,false,false);                
        VG_Policy_Schedule_Endorsement__c pse3=pse.clone(false,true,false,false);               
        VG_Policy_Schedule_Endorsement__c pse4=pse.clone(false,true,false,false);           
        pseInsList.add(pse1);pseInsList.add(pse2);pseInsList.add(pse3);pseInsList.add(pse4);
        Insert pseInsList;
        Test.startTest();
        ApexPages.currentPage().getParameters().put('Id', ps.id);
        VG_Logo_Extension Logo5=new VG_Logo_Extension();
        delete pse4;
        VG_Logo_Extension Logo6=new VG_Logo_Extension();
        delete pse3;
        VG_Logo_Extension Logo7=new VG_Logo_Extension();
        Test.stopTest();
    }
}