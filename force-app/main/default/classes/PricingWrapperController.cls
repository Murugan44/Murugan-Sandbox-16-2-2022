public with sharing class PricingWrapperController {

    @AuraEnabled
    public static Map<String, List<VG_Pricing__c>> getPricingList(String product){
        Map<String, List<VG_Pricing__c>> pricingMap = new Map<String, List<VG_Pricing__c>>();
        List<VG_Pricing__c> priceList = new List<VG_Pricing__c>([select id, Name, VG_Product__c, VG_Category__c, VG_Rating_Factor__c, VG_Rate__c from VG_Pricing__c where VG_Product__c=:product]);
        for(VG_Pricing__c p: priceList){
            if(pricingMap.containsKey(p.VG_Category__c)){
                List<VG_Pricing__c> tempList = pricingMap.get(p.VG_Category__c);
                tempList.add(p);
                pricingMap.put(p.VG_Category__c,tempList);
            }else{
                pricingMap.put(p.VG_Category__c,new List<VG_Pricing__c>{p});
            }
        }
        system.debug('pricingMap::'+pricingMap);
        return pricingMap;
    }

    // @AuraEnabled
    // public static Decimal getNetBasePremium(Decimal Turnover_Converted, List<String> TOPRateList , String Product){
    //     System.debug('Turnover_Converted::'+Turnover_Converted+'::'+TOPRateList );
    //     Decimal TurnoverValue = Turnover_Converted;        
    //     Decimal tmp = 0; 
    //     Decimal netExposurePremium = 0; 
    //     for(String s: TOPRateList){
    //           If(Product == 'Crime'){        
    //             if(TurnoverValue > 5000000000L){
    //                 Decimal baserate = (66672*(1/(Math.exp(0.68*Math.log(5000000000L+1L)))));
    //                 Decimal originalBaseRate = (66672*(1/(Math.exp(0.68*Math.log(TurnoverValue))))); 
    //                 Decimal premBelow500m = (Math.max(baserate,66672*(1/(Math.exp(0.68*Math.log(5000000000L)))))/1000)*(Math.min(TurnoverValue,5000000000L));
    //                 Decimal turnoverLimit = 5000000000L+1L;
    //                 Decimal step1 = (66672*(1/(Math.exp(0.68*Math.log(5000000000L+1L)))));
    //                 Decimal step2 = 5000000000L*(66672*(1/(Math.exp(0.68*Math.log(5000000000L)))));
    //                 Decimal marginalrate = ((turnoverLimit)*step1)-(step2);
    //                 Decimal diff = TurnoverValue-5000000000L;
    //                 Decimal premAbove500m = (marginalrate/1000)*(Math.max(0,diff));
    //                 Decimal AC38 = (premBelow500m + premAbove500m);
    //                 Decimal originalTemp = (TurnoverValue/1000) * originalBaseRate;
    //                 Decimal sizeFactor = (((((AC38 + originalTemp)/2)*1000)/TurnoverValue)/baserate)-1;
    //                 System.debug(diff + ',' + premBelow500m +','+premAbove500m+','+sizeFactor+','+baserate );
    //                 tmp = (TurnoverValue/1000) * baserate * (sizeFactor + 1) * Decimal.valueOf(s);
    //             }else{
    //                 tmp  =  (((66672*(1/(Math.exp(0.68*Math.log(TurnoverValue )))))/1000)*(TurnoverValue))*Decimal.valueOf(s); //getFLRates(TurnoverValue,  price.VG_Product__c)*TOPRate;
    //             }
    //             tmp = tmp * 1.3;
    //             Decimal NBP =  tmp.setScale(2);
    //             // Decimal totalPremiumMovement=0;
    //             netExposurePremium =+  NBP.setScale(2);
    //         }
    //     }
    //     System.debug('netExposurePremium::'+netExposurePremium);
    //     // Decimal TurnoverValue = Turnover_Converted;        
    //     // Decimal tmp = 0; 
    //     // Decimal netExposurePremium = 0;  
    //     // If(Product == 'Crime'){        
    //     //     if(TurnoverValue > 5000000000L){
    //     //         Decimal baserate = (66672*(1/(Math.exp(0.68*Math.log(5000000000L+1L)))));
    //     //         Decimal originalBaseRate = (66672*(1/(Math.exp(0.68*Math.log(TurnoverValue))))); 
    //     //         Decimal premBelow500m = (Math.max(baserate,66672*(1/(Math.exp(0.68*Math.log(5000000000L)))))/1000)*(Math.min(TurnoverValue,5000000000L));
    //     //         Decimal turnoverLimit = 5000000000L+1L;
    //     //         Decimal step1 = (66672*(1/(Math.exp(0.68*Math.log(5000000000L+1L)))));
    //     //         Decimal step2 = 5000000000L*(66672*(1/(Math.exp(0.68*Math.log(5000000000L)))));
    //     //         Decimal marginalrate = ((turnoverLimit)*step1)-(step2);
    //     //         Decimal diff = TurnoverValue-5000000000L;
    //     //         Decimal premAbove500m = (marginalrate/1000)*(Math.max(0,diff));
    //     //         Decimal AC38 = (premBelow500m + premAbove500m);
    //     //         Decimal originalTemp = (TurnoverValue/1000) * originalBaseRate;
    //     //         Decimal sizeFactor = (((((AC38 + originalTemp)/2)*1000)/TurnoverValue)/baserate)-1;
    //     //         System.debug(diff + ',' + premBelow500m +','+premAbove500m+','+sizeFactor+','+baserate );
    //     //         tmp = (TurnoverValue/1000) * baserate * (sizeFactor + 1) * TOPRate;
    //     //     }else{
    //     //         tmp  =  (((66672*(1/(Math.exp(0.68*Math.log(TurnoverValue )))))/1000)*(TurnoverValue))*TOPRate; //getFLRates(TurnoverValue,  price.VG_Product__c)*TOPRate;
    //     //     }
    //     //     tmp = tmp * 1.3;
    //     //     Decimal NBP =  tmp.setScale(2);
    //     //     // Decimal totalPremiumMovement=0;
    //     //     netExposurePremium =  NBP.setScale(2);
    //     // }
    //     // return netExposurePremium;
    //     return null;
    // }    

     @AuraEnabled
    public static Decimal getNetBasePremium(String Turnover_Converted, String TOPRate , String Product){
            System.debug('Turnover_Converted::'+Turnover_Converted+'::'+TOPRate );
        Decimal TurnoverValue = Decimal.valueOf(Turnover_Converted);        
        Decimal tmp = 0; 
        Decimal NBP = 0;
        Decimal netExposurePremium = 0; 
        // for(String s: TOPRateList){
              If(Product == 'Crime'){        
                  if(TurnoverValue > 5000000000L){
                        Decimal baserate = (66672*(1/(Math.exp(0.68*Math.log(5000000000L+1L)))));
                        Decimal originalBaseRate = (66672*(1/(Math.exp(0.68*Math.log(TurnoverValue))))); 
                        Decimal premBelow500m = (Math.max(baserate,66672*(1/(Math.exp(0.68*Math.log(5000000000L)))))/1000)*(Math.min(TurnoverValue,5000000000L));
                        Decimal turnoverLimit = 5000000000L+1L;
                        Decimal step1 = (66672*(1/(Math.exp(0.68*Math.log(5000000000L+1L)))));
                        Decimal step2 = 5000000000L*(66672*(1/(Math.exp(0.68*Math.log(5000000000L)))));
                        Decimal marginalrate = ((turnoverLimit)*step1)-(step2);
                        Decimal diff = TurnoverValue-5000000000L;
                        Decimal premAbove500m = (marginalrate/1000)*(Math.max(0,diff));
                        Decimal AC38 = (premBelow500m + premAbove500m);
                        Decimal originalTemp = (TurnoverValue/1000) * originalBaseRate;
                        Decimal sizeFactor = (((((AC38 + originalTemp)/2)*1000)/TurnoverValue)/baserate)-1;
                        System.debug(diff + ',' + premBelow500m +','+premAbove500m+','+sizeFactor+','+baserate );
                        tmp = (TurnoverValue/1000) * baserate * (sizeFactor + 1) * Decimal.valueOf(TOPRate);
                    }else{
                        tmp  =  (((66672*(1/(Math.exp(0.68*Math.log(TurnoverValue )))))/1000)*(TurnoverValue))*Decimal.valueOf(TOPRate); //getFLRates(TurnoverValue,  price.VG_Product__c)*TOPRate;
                    }
                tmp = tmp * 1.3;
                NBP =  tmp.setScale(2);
                netExposurePremium =+  NBP.setScale(2);
            }else if(Product == 'D&O'){
                 if(TurnoverValue > 5000000000L){
                        tmp = 0;
                        Decimal baserate = (27962*(1/(Math.exp(0.735*Math.log(5000000000L+1L)))));
                        Decimal originalBaseRate = (27962 * (1/(Math.exp(0.735*Math.log(TurnoverValue)))));  
                        Decimal premBelow500m = (Math.max(baserate,27962*(1/(Math.exp(0.735*Math.log(5000000000L)))))/1000)*(Math.min(TurnoverValue,5000000000L));
                        Decimal turnoverLimit = 5000000000L+1L;
                        Decimal step1 = (27962*(1/(Math.exp(0.735*Math.log(5000000000L+1L)))));
                        Decimal step2 = 5000000000L*(27962*(1/(Math.exp(0.735*Math.log(5000000000L)))));
                        Decimal marginalrate = ((turnoverLimit)*step1)-(step2 );
                        Decimal diff = TurnoverValue-5000000000L;
                        Decimal premAbove500m = (marginalrate/1000)*(Math.max(0,diff));
                        Decimal AC38 = (premBelow500m + premAbove500m);
                        Decimal originalTemp = (TurnoverValue/1000) * originalBaseRate;
                        Decimal sizeFactor = (((((AC38 + originalTemp)/2)*1000)/TurnoverValue)/baserate)-1;
                        tmp = (TurnoverValue/1000) * baserate * (sizeFactor + 1) * Decimal.valueOf(TOPRate);
                        
                }else{
                    tmp  =  (((27962*(1/(Math.exp(0.735*Math.log(TurnoverValue )))))/1000)*(TurnoverValue))*Decimal.valueOf(TOPRate);
                }
                tmp = tmp * (1.3);
                
                NBP =  tmp.setScale(2);
                netExposurePremium =+  NBP.setScale(2);
            }else If(Product == 'PI'){
                if(TurnoverValue > 5000000000L){
                    tmp = 0;
                    Decimal baserate = (465975*(1/(Math.exp(0.8*Math.log(5000000000L+1L)))));
                    Decimal originalBaseRate = (465975*(1/(Math.exp(0.8*Math.log(TurnoverValue))))); 
                    Decimal premBelow500m = (Math.max(baserate,465975*(1/(Math.exp(0.8*Math.log(5000000000L)))))/1000)*(Math.min(TurnoverValue,5000000000L));
                    Decimal turnoverLimit = 5000000000L+1L;
                    Decimal step1 = (465975*(1/(Math.exp(0.8*Math.log(5000000000L+1L)))));
                    Decimal step2 = 5000000000L*(465975*(1/(Math.exp(0.8*Math.log(5000000000L)))));
                    Decimal marginalrate = ((turnoverLimit)*step1)-(step2 );
                    Decimal diff = TurnoverValue-5000000000L;
                    Decimal premAbove500m = (marginalrate/1000)*(Math.max(0,diff));
                    Decimal AC38 = (premBelow500m + premAbove500m);
                    Decimal originalTemp = (TurnoverValue/1000) * originalBaseRate;
                    Decimal sizeFactor = (((((AC38 + originalTemp)/2)*1000)/TurnoverValue)/baserate)-1;
                    System.debug(diff + ',' + premBelow500m +','+premAbove500m+','+sizeFactor+','+baserate );
                    tmp = (TurnoverValue/1000) * baserate * (sizeFactor + 1) * Decimal.valueOf(TOPRate);
                }else{
                    tmp  =  ((465975*(1/(Math.exp(0.8*Math.log(TurnoverValue)))))/1000)*TurnoverValue*Decimal.valueOf(TOPRate); // Net Base Premium  =    465975  X (Revenue)^-.08/1000 X Revenue * Type of Operation Lookup 
                }
                tmp = tmp * 1.3;
                NBP =  tmp.setScale(2);
                netExposurePremium =  NBP.setScale(2);               
            }else If(Product == 'Clinical Trials'){
                if(TurnoverValue > 5000000000L){
                    tmp = 0;
                    Decimal baserate = (66672*(1/(Math.exp(0.68*Math.log(5000000000L+1L)))));
                    Decimal originalBaseRate = (66672*(1/(Math.exp(0.68*Math.log(TurnoverValue))))); 
                    Decimal premBelow500m = (Math.max(baserate,66672*(1/(Math.exp(0.68*Math.log(5000000000L)))))/1000)*(Math.min(TurnoverValue,5000000000L));
                    Decimal turnoverLimit = 5000000000L+1L;
                    Decimal step1 = (66672*(1/(Math.exp(0.68*Math.log(5000000000L+1L)))));
                    Decimal step2 = 5000000000L*(66672*(1/(Math.exp(0.68*Math.log(5000000000L)))));
                    Decimal marginalrate = ((turnoverLimit)*step1)-(step2);
                    Decimal diff = TurnoverValue-5000000000L;
                    Decimal premAbove500m = (marginalrate/1000)*(Math.max(0,diff));
                    Decimal AC38 = (premBelow500m + premAbove500m);
                    Decimal originalTemp = (TurnoverValue/1000) * originalBaseRate;
                    Decimal sizeFactor = (((((AC38 + originalTemp)/2)*1000)/TurnoverValue)/baserate)-1;
                    System.debug(diff + ',' + premBelow500m +','+premAbove500m+','+sizeFactor+','+baserate );
                    tmp = (TurnoverValue/1000) * baserate * (sizeFactor + 1) * Decimal.valueOf(TOPRate);
                }else{
                    tmp  =  (((66672*(1/(Math.exp(0.68*Math.log(TurnoverValue )))))/1000)*(TurnoverValue))*Decimal.valueOf(TOPRate); //getFLRates(TurnoverValue,  price.VG_Product__c)*TOPRate;
                }
                tmp = tmp * 1.3;
                NBP =  tmp.setScale(2);
                netExposurePremium =  NBP.setScale(2);    
            }
        // }
        return netExposurePremium;
    }
}