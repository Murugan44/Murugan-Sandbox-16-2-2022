public class MercuryDocumentController {
    Public String PrintView{get;set;}
    
    Public String Mercury_Logo {get; set;}
    public String MFLogo{get;set;}
    Public String PSId{get;set;}
    Public String Sign_URL {get; set;}
    Public String Phone_URL {get; set;}
    Public String Email_URL {get; set;}
    Public String Global_URL {get; set;}
    public String today{get;set;}
    public String propsalFormDate{get;set;}
    public String underwriter{get;set;} 
    public Decimal PIsublimit{get;set;} 
    Public Decimal taxes{get;set;}
    Public Decimal premiumincludingtax{get;set;}
    
    public String PI_Sign_Url{get;set;}
    Public Policy_Schedule__c ps{get;set;}
    Public Risk_Capture__c rc{get;set;}
    Public List<VG_Policy_Schedule_Asset__c> psaList{get;set;} 
    Public List<VG_Policy_Schedule_Endorsement__c> pseList{get;set;}
    
    public MercuryDocumentController(){
        taxes = 0;
        PIsublimit = 0;
        premiumincludingtax = 0;
        
        PSId = apexpages.currentpage().getparameters().get('Id');
        ps=[Select Id, Name, Policy__r.Terms_of_Trade_Days__c,Policy__r.Underwriter__r.Name,Policy__r.VG_Retroactive_Date_Applicable__c,Policy__r.Broker_Name__c,Policy__r.Broker_Contact__r.Name,Policy__r.Broker_Contact__r.Email,VG_Capacity_Paper__c, Policy__r.Broker_Name__r.E_mail_address__c, VG_VAT__c, Policy__r.Policy_Basis__c, VG_VAT_Amount__c, VG_Witholding_Tax_Amount__c, VG_Machinery_Breakdown_Cover__c, VG_Machinery_Breakdown_BI_Cover__c, Product__c, Limit__c, Attachment__c, Sum_Insured__c, Policy__r.VG_Territorial_Limits__c, Policy__r.VG_Additional_Insureds__c, Policy__r.VG_Wording__c, Policy__r.VG_Governance_Compliance__r.VG_Conditions_Subjectivites__c, Policy__r.Jurisdiction__c, Policy__r.Gross_Written_Premium__c, Gross_Written_Premium__c, Policy__r.Line_Of_Business__c, VG_Deductible__c, VG_Extended_Reporting_Period__c, Policy__r.VG_Aggregate_Limit__c, Policy__r.Insured__r.BillingStreet, Policy__r.Insured__r.BillingCity, Policy__r.Insured__r.BillingCountry, Policy__r.Insured__r.BillingPostalCode, Policy__r.VG_Expiry_Date__c, Policy__r.Broker_Name__r.Name, Policy__r.Broker_Name__r.Phone, Policy__r.Broker_Name__r.ShippingStreet, Policy__r.Broker_Name__r.ShippingCity, Policy__r.Broker_Name__r.ShippingCountry, Policy__r.Broker_Name__r.ShippingPostalCode, Policy__r.VG_Continuous_Cover_Date__c, Policy__r.Retroactive_Date__c, VG_Brokerage_Percent__c, VG_Brokerage_Amount__c, Base_Creation_Start_Date__c, Policy__r.Insured__r.Name, Policy__r.Insured__r.ShippingStreet, Policy__r.Insured__r.ShippingCity, Policy__r.Insured__r.ShippingPostalCode, Policy__r.Insured__r.ShippingState, Policy__r.Insured__r.ShippingCountry, Policy__r.Insured__r.SicDesc, Policy__r.Name, Policy__r.Inception_Expiry_Time__c, VG_Is_MTA__c, Actual_GWP__c, IPT_Percent__c, IPT__c, VG_MGA_Commission_Amount__c, Transaction_GWP__c,  Policy__r.Insured__r.AccountNumber, VG_MTA_Start_Date__c, Policy__r.VG_Inception_Date__c, Levies__c, VG_Fee_Income__c, Policy__r.Deductible_or_Excess_Amount__c, Policy__r.Deductible_or_Excess_Basis__c from Policy_Schedule__c Where Id=:PSId];
        
        If(ps.IPT__c != null && ps.VG_VAT__c != null && ps.VG_Witholding_Tax_Amount__c != null){
            taxes=(ps.IPT__c+ps.VG_VAT__c)-ps.VG_Witholding_Tax_Amount__c;
        }else{
            taxes = 0.00;
        }
        If(ps.Gross_Written_Premium__c != null && taxes != null){
            premiumincludingtax = ps.Gross_Written_Premium__c+taxes;
        }else{
            premiumincludingtax = 0.00;
        }
        
        rc=[Select Id, Name, Policy_Schedule__c,VG_Proposal_form_date__c,VG_Buyer__c, VG_Seller__c, VG_Target__c, VG_Expense_Agreement_Amount__c, VG_Expense_Agreement_t_Amount_Tax__c, VG_De_Minimis_Amount__c, VG_Retention_Amount__c, VG_Governing_Law_of_Sale_Agreement__c, VG_Enterprise_Value__c From Risk_Capture__c where Policy_Schedule__c =:ps.id];         
        
        
        string strOrgId  =  UserInfo.getOrganizationId();
        psaList = new List<VG_Policy_Schedule_Asset__c>([Select id, Name, VG_Sub_limit__c, VG_Deductible__c, VG_Coverage__c, VG_Territorial_Limits__c from VG_Policy_Schedule_Asset__c where VG_Policy_Schedule__c =:ps.id]);
        pseList = new List<VG_Policy_Schedule_Endorsement__c>([Select id, Name, VG_Endorsement_Number__c, VG_Sub_limit__c, VG_Endorsement_Details__c, VG_Title__c from VG_Policy_Schedule_Endorsement__c where VG_Policy_Schedule__c =:ps.id AND (VG_Type__c=:'Endorsements' OR VG_Type__c=:'' OR VG_Type__c=:null)]);
        List< document > MFList  =  [select Id,  name from document where Name='Mercury_Logo'];
        Mercury_Logo='https://'+ApexPages.currentPage().getHeaders().get('Host')+'/VFP/servlet/servlet.ImageServer?id='+MFList[0].Id+'&oid=' + strOrgId;        
        List< document > documentList1  =  [select Id,  name from document where Name='Mercury_bar'];
        MFLogo  =  'https://'+ApexPages.currentPage().getHeaders().get('Host')+'/VFP/servlet/servlet.ImageServer?id='+documentList1[0].Id+'&oid=' + strOrgId; 
        
        System.debug('image::'+Mercury_Logo+'::'+MFLogo);
        
        today = System.Today().format();
        propsalFormDate = (rc.VG_Proposal_form_date__c!=null?rc.VG_Proposal_form_date__c.format():'');
        PrintView='<!--[if gte mso 9]>' +
            '<xml>' +
            '<w:WordDocument>' +
            '<w:View>Print</w:View>' +
            '<w:Zoom>100</w:Zoom>' +
            '<w:DoNotOptimizeForBrowser/>' +
            '</w:WordDocument>' +
            '</xml>' +
            '<![endif]>';    
    }
}