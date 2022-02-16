public with sharing class New_ps {
    
    @AuraEnabled(cacheable=true)
    public static List<Endorsement_Library__c> getElList() {
        system.debug('>>');
        return [SELECT id,Name,Endorsement_Title__c,Type__c,Text__c,RecordType.Name FROM Endorsement_Library__c where Type__c =:'Sub-limits'AND RecordType.Name =: 'VFP' ORDER By Name ASC];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Endorsement_Library__c> getEndorsList() {
        system.debug('>>');
        return [SELECT id,Name,Endorsement_Title__c,Type__c,Text__c,RecordType.Name FROM Endorsement_Library__c where Type__c =:'Endorsements'AND RecordType.Name =: 'VFP' ORDER By Name ASC];
    }
    
    @AuraEnabled
    public static Decimal calcFeeAmount(List<VG_Policy_Schedule_Asset__c> rrPIList,Decimal feeAmountValue){
       //system.debug('>>'+rrPIList.size());
        system.debug('>>'+rrPIList);
        feeAmountValue = 0;
        for(VG_Policy_Schedule_Asset__c rrp: rrPIList){
            feeAmountValue = feeAmountValue + rrp.VG_Fee_Amounts__c;
            system.debug('rrp:::'+feeAmountValue);
        }
        system.debug('>>'+feeAmountValue);
       return feeAmountValue;
    }
    
    @AuraEnabled
    public static Decimal calcBasePremium(List<VG_Policy_Schedule_Asset__c> rrPIList,Decimal basePremium){
        system.debug('>>'+rrPIList.size());
        system.debug('>>'+rrPIList);
        basePremium = 0;
        for(VG_Policy_Schedule_Asset__c rrp: rrPIList){
            rrp.VG_Base_Premium__c=(rrp.VG_Base_Premium_Rate__c/100)*rrp.VG_Fee_Amounts__c; 
            system.debug('value check>>'+rrp.VG_Base_Premium_Rate__c+':::::'+rrp.VG_Fee_Amounts__c);
            system.debug('value check>>'+' rrp.VG_Base_Premium__c==='+rrp.VG_Base_Premium__c);
            basePremium = rrp.VG_Base_Premium__c;
            system.debug('rrp:::'+basePremium);
        }
        system.debug('>>'+basePremium);
       return basePremium;
    }
    
    @AuraEnabled
    public static Decimal calcBasePremiumTotal(List<VG_Policy_Schedule_Asset__c> rrPIList,Decimal basePremium){
        system.debug('>>'+rrPIList.size());
        system.debug('>>'+rrPIList);
        basePremium = 0;
        for(VG_Policy_Schedule_Asset__c rrp: rrPIList){
            basePremium = basePremium + rrp.VG_Base_Premium__c;
            system.debug('rrp:::'+basePremium);
        }
        system.debug('>>'+basePremium);
       return basePremium;
    }
    
    @AuraEnabled
    public static Decimal calcBasePremiumRate(Decimal totalbasepremium, Decimal totalFeeAmount, Decimal basePremiumRate){
        system.debug('>>'+totalbasepremium);
        system.debug('>>'+totalFeeAmount);
        basePremiumRate = 0;
        basePremiumRate=(totalbasepremium/totalFeeAmount).SetScale(2); 
        system.debug('>>'+basePremiumRate);
       return basePremiumRate;
    }
    
    @AuraEnabled
    public static Decimal calcRetension(Decimal retensionAmt,Decimal enterpriseValue,Decimal retension){
        system.debug('>>'+retensionAmt);
        system.debug('>>'+enterpriseValue);
        retension = retensionAmt/(enterpriseValue/100);
        system.debug('>>'+retension);
        return retension;
    }
    
    @AuraEnabled
    public static Decimal calcDeminimis(Decimal deminimisAmt,Decimal enterpriseValue,Decimal deminimis){
        system.debug('>>'+deminimisAmt);
        system.debug('>>'+enterpriseValue);
        deminimis = deminimisAmt/(enterpriseValue/100);
        system.debug('>>'+deminimis);
       return deminimis;
    }
    
     @AuraEnabled
    public static List<Integer> NOIList (Decimal generateReinstatement){
        system.debug('>>'+generateReinstatement);
        List<Integer> createLoop =new List<Integer>();
        List<Integer> NOIList = new List<Integer>();
        
         createLoop.clear();
         NOIList.clear();
        //if( generateReinstatement){
                for(integer i = 0 ; i < Integer.valueOf(generateReinstatement) ; i++){
                    NOIList.add(0);
                    system.debug('NOILIST::'+NOIList);
                    createLoop.add(i);
                }
           // }
       return NOIList;
    }
    
    @AuraEnabled
    public static Decimal calcProRata(Id polId, Decimal prorata){
        Policy__c pol=[select id,Name,VG_Inception_Date__c,VG_Expiry_Date__c,VG_Is_Renewal__c from Policy__c where Id=:polId limit 1];   
        if(Math.mod(pol.VG_Inception_Date__c.year(), 4) != 0){
                if(Math.mod(pol.VG_Expiry_Date__c.year(), 4) == 0){
                    if(pol.VG_Expiry_Date__c <= date.newInstance(pol.VG_Expiry_Date__c.year(), 02, 28)){
                        proRata = Decimal.valueOf(pol.VG_Inception_Date__c.daysBetween(pol.VG_Expiry_Date__c)+1)/365;
                    }else{
                        proRata = Decimal.valueOf(pol.VG_Inception_Date__c.daysBetween(pol.VG_Expiry_Date__c))/365;
                    }
                }else{
                    proRata = Decimal.valueOf(pol.VG_Inception_Date__c.daysBetween(pol.VG_Expiry_Date__c)+1)/365;
                }
            }else{
                if(pol.VG_Inception_Date__c < date.newInstance(pol.VG_Inception_Date__c.year(),03,01)){
                    proRata = Decimal.valueOf(pol.VG_Inception_Date__c.daysBetween(pol.VG_Expiry_Date__c))/365;
                }else{
                    proRata = Decimal.valueOf(pol.VG_Inception_Date__c.daysBetween(pol.VG_Expiry_Date__c)+1)/365;
                }
            }
        
        system.debug('prorataCalc::'+prorata);
        return prorata;
    }
    
    @AuraEnabled
    public static Decimal calcEndorementPremium(List<VG_Policy_Schedule_Endorsement__c> pseList,Decimal proRata,Decimal endorsementPremium,String psProduct) {
        system.debug('>>'+pseList);
        system.debug('>>'+psProduct);
        system.debug(':::'+ endorsementPremium+'::'+proRata);
        Decimal endorsementPremiumPro = 0;
        endorsementPremium = 0;
        for(VG_Policy_Schedule_Endorsement__c en: pseList){
            endorsementPremium = endorsementPremium + en.VG_Premium__c;
        }
        String product = psProduct;
        system.debug(':::'+ product);
        if(product != 'Warranty & Indemnity'){
            endorsementPremiumPro = endorsementPremium*proRata;
            system.debug('totalPro::'+endorsementPremiumPro);
        }
         return endorsementPremiumPro;
    }
    
    @AuraEnabled
    public static Decimal calcRiskPremium(List<VG_Policy_Schedule_Asset__c> rrList,List<VG_Policy_Schedule_Asset__c> rrPIList,String psProduct,Decimal proRata,Decimal riskPremium) {
        system.debug('>>'+psProduct);
        system.debug('>>'+rrList.size());
        system.debug('>>'+rrList);
        system.debug('>>'+rrPIList.size());
        system.debug('>>'+rrPIList);
        system.debug(':::'+ riskPremium + '::'+proRata);
        riskPremium =0;
        Decimal riskPremiumPro = 0;
        String product = psProduct;
        system.debug(':::'+ product);
        if(product == 'Professional Indemnity'){
            for(VG_Policy_Schedule_Asset__c rrp: rrPIList){
                riskPremium = riskPremium + rrp.VG_Base_Premium__c;
                system.debug('rrp:::'+ riskPremium);
            }
        }else{
            for(VG_Policy_Schedule_Asset__c rr: rrList){
                riskPremium = riskPremium + rr.VG_Premium__c;
                 system.debug('rr:::'+ riskPremium);
            } 
        }
        
        if(product != 'Warranty & Indemnity'){
            riskPremiumPro = riskPremium*proRata;
            system.debug('totalPro::'+riskPremiumPro);
        }
        return riskPremiumPro;
        
    }
    
    @AuraEnabled
    public static Decimal calcNetModelPremium(Decimal endmentValue,Decimal riskPreValue, Decimal netModelPremium) {
        system.debug('>>'+endmentValue);
        system.debug('>>'+riskPreValue);
        decimal endorsementPremium = endmentValue;
        decimal riskPremium = riskPreValue;
        system.debug('endorsementPremium::'+endorsementPremium+'::'+'riskPremium::'+riskPremium);
        
        netModelPremium = endmentValue+riskPreValue;
        system.debug('NetModelPremium::'+netModelPremium);
        
        return netModelPremium;
    }
    @AuraEnabled
    public static Decimal calcTechnicalUWPremium(Decimal netModelPremiumValue,Decimal premiumAdjustmentValue, Decimal technicalUWPremium) {
        system.debug('netModelPremiumValue>>'+netModelPremiumValue);
        system.debug('premiumAdjustmentValue>>'+premiumAdjustmentValue);
        decimal netModelPremium = netModelPremiumValue;
        decimal premiumAdjustment = premiumAdjustmentValue;
        system.debug('netModelPremium::'+netModelPremium+'::'+'premiumAdjustment::'+premiumAdjustment);

        technicalUWPremium = netModelPremium+premiumAdjustment;
        system.debug('technicalUWPremium::'+technicalUWPremium);
        
        return technicalUWPremium;
    }
    
    @AuraEnabled
    public static Decimal calcgrossWrittenPremium100(Decimal commercialAdjustmentValue,Decimal technicalUWPremiumValue, Decimal grossWrittenPremium100) {
        system.debug('commercialAdjustmentValue>>'+commercialAdjustmentValue);
        system.debug('technicalUWPremiumValue>>'+technicalUWPremiumValue);
        decimal commercialAdjustment = commercialAdjustmentValue;
        decimal technicalUWPremium = technicalUWPremiumValue;
        system.debug('commercialAdjustment::'+commercialAdjustment+'::'+'technicalUWPremium::'+technicalUWPremium);
        
        grossWrittenPremium100 = commercialAdjustment+technicalUWPremium;
        system.debug('grossWrittenPremium100::'+grossWrittenPremium100);
        
        return grossWrittenPremium100;
    }
    
    @AuraEnabled
    public static Decimal calcSumInsured(Decimal limitValue, Decimal signedShareValue, Decimal sumInsured) {
        system.debug('limitValue>>'+limitValue);
        system.debug('signedShareValue>>'+signedShareValue);
        decimal limt = limitValue;
        decimal signedShare = signedShareValue;
        system.debug('limitValue::'+limt+'::'+'signedShareValue::'+signedShare);
        
        sumInsured = limt*(signedShare/100);
        system.debug('sumInsured::'+sumInsured);
        
        return sumInsured;
    }
    
    @AuraEnabled
    public static Decimal calcGWP(Decimal gwp100Value, Decimal signedShareVal, Decimal grossWrittenPremium,String psProduct,Decimal riskPreWI,Decimal endorsementPreWI,Decimal uwPreWI,Decimal adjustment) {
        system.debug('gwp100Value>>'+gwp100Value);
        system.debug('signedShareVal>>'+signedShareVal);
        system.debug('>>'+psProduct);
        system.debug('W&I Product Values::'+'::'+'riskPreWI::'+riskPreWI+'::'+'endorsementPreWI::'+endorsementPreWI+'::'+'uwPreWI::'+uwPreWI+'::'+'adjustment::'+adjustment);
        decimal gwp = gwp100Value;
        decimal signedShare = signedShareVal;
        String product = psProduct;
        system.debug('gwp100::'+gwp+'::'+'signedShareVal::'+signedShare);
        if(product != 'Warranty & Indemnity'){
            grossWrittenPremium = gwp*(signedShare/100);
            system.debug('grossWrittenPremium::'+grossWrittenPremium);
        }else{
            grossWrittenPremium = riskPreWI+endorsementPreWI+uwPreWI+adjustment;
            system.debug('grossWrittenPremium::'+grossWrittenPremium);
        }
        
        
        return grossWrittenPremium;
    }
    
    @AuraEnabled
    public static Decimal calcBrokerAmount(Decimal gwpValue, Decimal brokeragepercentVal, Decimal brokerageAmt) {
        system.debug('gwpValue>>'+gwpValue);
        system.debug('brokeragepercentVal>>'+brokeragepercentVal);
        decimal gwp = gwpValue;
        decimal brokerpercent = brokeragepercentVal;
        system.debug('gwp::'+gwp+'::'+'brokeragepercentVal::'+brokerpercent);
        
        brokerageAmt = gwp*(brokerpercent/100);
        system.debug('brokerageAmt::'+brokerageAmt);
        
        return brokerageAmt;
    }
    
    @AuraEnabled
    public static Decimal calcactualPremium(Decimal gwpValue, Decimal brokerageAmtVal, Decimal actualPremium) {
        system.debug('gwpValue>>'+gwpValue);
        system.debug('brokerageAmtVal>>'+brokerageAmtVal);
        decimal gwp = gwpValue;
        decimal brokerAmt = brokerageAmtVal;
        system.debug('gwp::'+gwp+'::'+'brokerageAmtVal::'+brokerAmt);
        
        actualPremium = gwp-brokerAmt;
        system.debug('actualPremium::'+actualPremium);
        
        return actualPremium;
    }
    
    @AuraEnabled
    public static Policy_Schedule__c psFinish(Id polId, Policy_Schedule__c psRec, String psProduct,String psLayer, String psLloydsProduct, String psDOProduct, Risk_Capture__c rCRec, List<VG_Policy_Schedule_Asset__c> rrList , List<VG_Policy_Schedule_Asset__c> rrPIList , List<VG_Policy_Schedule_Endorsement__c> slList , List<VG_Policy_Schedule_Endorsement__c> endorsList,
    Decimal actualPremium,Decimal brokerageAmt,Decimal grossWrittenPremium,Decimal sumInsured,Decimal grossWrittenPremium100,Decimal technicalUWPremium,Decimal netModelPremium,Decimal riskPremium,Decimal endorsementPremium){
        system.debug('id::'+polId+'::'+'product::'+psProduct+'::'+'lloydsProduct::'+psLloydsProduct+'::'+'psDOProduct::'+psDOProduct);
        system.debug('risk details records::'+rCRec);
        system.debug('rrList::'+rrList);
        system.debug('rrPIList::'+rrPIList);
        system.debug('slList::'+slList);
        system.debug('endorsList::'+endorsList);
        system.debug('PS records::'+psRec);
        system.debug('psLayer::'+psLayer);
        system.debug('actualPremium::'+actualPremium+'::'+'brokerageAmt::'+brokerageAmt+'::'+'grossWrittenPremium::'+grossWrittenPremium+'::'+'sumInsured::'+sumInsured+'::'+'grossWrittenPremium100::'+grossWrittenPremium100+'::'+'technicalUWPremium::'+technicalUWPremium+'::'+'netModelPremium::'+netModelPremium+'::'+'riskPremium::'+riskPremium+'::'+'endorsementPremium::'+endorsementPremium);
        //Policy_Schedule__c ps = new Policy_Schedule__c();
        psRec.Policy__c = polId;
        psRec.Product__c = psProduct;
        psRec.VG_Lloyds_Product__c = psLloydsProduct;
        psRec.VG_D_O_Product__c = psDOProduct;
        psRec.Actual_GWP__c = actualPremium;
        psRec.Gross_Written_Premium__c = grossWrittenPremium;
        psRec.VG_Gross_Written_Premium_100__c = grossWrittenPremium100;
        if(psProduct != 'Warranty & Indemnity'){
            psRec.Risk_Premium_Pro__c = riskPremium;
            psRec.Endorsement_Premium_Pro__c = endorsementPremium;
        }
        psRec.Sum_Insured__c = sumInsured;
        psRec.Net_Premium__c = netModelPremium;
        psRec.VG_Brokerage_Amount__c=brokerageAmt;
        psRec.Technical_UW_Premium__c = technicalUWPremium;
        psRec.ILF_Layer__c = psLayer;
            
        //ps.Limit__c=psRec.Limit__c;
        //ps.VG_Capacity_Paper__c = psRec.VG_Capacity_Paper__c;
        //ps.Attachment__c=psRec.Attachment__c;
        
        //ps.Written_share__c = psRec.Written_share__c;
        //ps.Share__c=psRec.Share__c;
        //ps.VG_Brokerage_Percent__c = psRec.VG_Brokerage_Percent__c;
        Policy__c pol=[select id,Name,VG_Inception_Date__c,VG_Expiry_Date__c,VG_Is_Renewal__c from Policy__c where Id=:polId limit 1];   
        List<Policy_Schedule__c> psList=new List<Policy_Schedule__c>([SELECT Id,Name,Policy__c FROM Policy_Schedule__c WHERE Policy__c=:polId ORDER BY CreatedDate DESC]);  
        List<Integer> psNumList=new List<Integer>();
        if(psList.size() > 0){
            String bsname;
            for(Policy_Schedule__c ps: psList){
                if(ps.Name.contains('/EEA'))
                    bsname = ps.Name.remove('/EEA');
                if(ps.Name.contains('/NonEEA'))
                    bsname = ps.Name.remove('/NonEEA');
                if(!ps.Name.contains('/NonEEA') && !ps.Name.contains('/EEA')){
                    bsname = ps.Name;
                    System.debug('bsname2::'+bsname );
                }
                if(bsname.contains('/PS/'))
                    psNumList.add(Integer.valueOf(bsname.split('/PS/')[1]));
                else if(bsname.contains('/MTA/'))
                    psNumList.add(Integer.valueOf(bsname.split('/MTA/')[1]));
            }
            psNumList.sort();
            psRec.Name  =  pol.Name+'/PS/'+((psNumList[psNumList.size()-1])+1);        
        }else{
            psRec.Name  =  pol.Name+'/PS/0';    
        }
        if(psRec.Split_Type__c == 'EEA'){
            psRec.Name += '/EEA';
        }else if(psRec.Split_Type__c == 'Non EEA'){
            psRec.Name += '/NonEEA';
        }
        
        
        insert psRec;
        
        rCRec.Policy_Schedule__c=psRec.id;
        rCRec.Name=psRec.Name+'/RD/1';
        insert rCRec;
        
        Integer psecount=1;
        Integer sbpsecount=1;
        for(VG_Policy_Schedule_Endorsement__c pse : endorsList){
            pse.VG_Policy_Schedule__c = psRec.Id;
            pse.Name= psRec.Name + '/PE/' + psecount;
            //endToBeInserted.add(pse);
            psecount++;
        }
        for(VG_Policy_Schedule_Endorsement__c pse : slList){
            pse.VG_Policy_Schedule__c = psRec.Id;
            pse.Name= psRec.Name + '/PESb/' + sbpsecount;
            //endToBeInserted.add(pse);
            sbpsecount++;
        }
        insert endorsList;
        insert slList;
        
        Integer psacount=1;
        if(psProduct == 'Professional Indemnity'){
            for(VG_Policy_Schedule_Asset__c psa : rrPIList){
                psa.Name = psRec.Name + '/RR/' + psacount;
                psa.RecordTypeId=Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('VFP').getRecordTypeId();      
                psa.VG_Policy_Schedule__c=psRec.Id;
                psacount++;
            }
            insert rrPIList;
        }else{
            for(VG_Policy_Schedule_Asset__c psa : rrList){
                psa.Name = psRec.Name + '/RR/' + psacount;
                psa.RecordTypeId=Schema.SObjectType.VG_Policy_Schedule_Asset__c.getRecordTypeInfosByName().get('VFP').getRecordTypeId();      
                psa.VG_Policy_Schedule__c=psRec.Id;
                psacount++;
            }
            insert rrList;
        }
        return psRec;
    }
}