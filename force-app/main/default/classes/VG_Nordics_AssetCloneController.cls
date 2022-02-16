public with sharing class VG_Nordics_AssetCloneController {
    @AuraEnabled
    public static Asset__c getAssetRecord(Id assId){
        Asset__c ass = ([SELECT VG_Asset__c,CurrencyIsoCode,Id,LS_AccName_with_Ass_Name__c,MID_Notification_Complete__c,Name,RecordTypeId,Total_EML__c,Total_Material_Damage__c,Vehcicle_CC__c,Vehcile_GVW__c,Vehicle_Make__c,Vehicle_Model__c,Vehicle_Number_of_Seats__c,Vehicle_Registration_No__c,VG_Account__c,VG_Acc_Name_with_St_City__c,VG_Aliases__c,VG_Asset_Type__c,VG_Automatic_Fire_alarm__c,VG_BI_Indemnity_Period__c,VG_Block_ID__c,VG_Building_No__c,VG_Building_SI__c,VG_City__c,VG_Comment__c,VG_Company_Division__c,VG_Component_Details__c,VG_Contents_SI__c,VG_Country__c,VG_Coverage__c,VG_Customer_Property_SI__c,VG_Date_Added__c,VG_Date_Removed__c,VG_Description__c,VG_Design_Life__c,VG_Dry_Mass__c,VG_EML_BI__c,VG_EML_PD__c,VG_EOL_Power_Margin__c,VG_Equipments__c,VG_Foam_supression_system__c,VG_Full_time_public_Fire_Brigade_staff__c,VG_Full_Value_Building_P__c,VG_Full_Value_Building__c,VG_Goods_SI__c,VG_Heritage__c,VG_Int_ID__c,VG_Launcher_family__c,VG_Launcher__c,VG_LaunchID__c,VG_Launch_Date__c,VG_Launch_Operator__c,VG_Machinery_SI__c,VG_Manufacturer__c,VG_MB_BI_Indemnity_Period__c,VG_MB_PD_Deductible__c,VG_MB_Waiting_Period__c,VG_Missions__c,VG_Mission__c,VG_OML__c,VG_Operator__c,VG_Orbital_Position__c,VG_Orbit__c,VG_Other_SI__c,VG_Payload_Manufacturer__c,VG_Payload_Power__c,VG_Payload__c,VG_PD_Deductible__c,VG_Platform_AOCS__c,VG_Platform_C_and_C__c,VG_Platform_Manufacturer__c,VG_Platform_Power__c,VG_Platform_Propulsion__c,VG_Platform_Thermal__c,VG_Policy_Number__c,VG_Postal_Code__c,VG_Prime_Manufacturer__c,VG_Rate_Adjustment__c,VG_Rate_Loading__c,VG_RDSFamily__c,VG_REG_NO_Account_Name__c,VG_Satellite_EOL_Power__c,VG_Satellite_Family_Base_rate__c,VG_Satellite_Family__c,VG_Satellite_Status__c,VG_Satellite__c,VG_Smoke_and_heat_venting_system__c,VG_Status__c,VG_Street_Number__c,VG_Street__c,VG_Technical_Summary__c,VG_Total_BISI_for_the_indemnity_period__c,VG_Total_Business_Interruption_SI__c,VG_Total_MBBISI_for_the_indemnity_period__c,VG_Total_Property_Damage_SI__c,VG_Total_Sum_Insured_SI__c,VG_True_TSI__c,VG_Use__c,VG_Waiting_Period__c,VG_Water_sprinklers__c,VG_Wet_Mass__c FROM Asset__c where Id = :assId]);               
        Asset__c cloneAsset = ass.clone(false,true,false,false);
        cloneAsset.id = null;
        cloneAsset.VG_Asset__c = ass.Id;
        cloneAsset.VG_Status__c = 'Active';
        insert cloneAsset; 
        return cloneAsset;
    }
    
    @AuraEnabled
    public static String updateOldAssetStatus(Id assId){
        Asset__c ass = ([SELECT VG_Asset__c,CurrencyIsoCode,Id,LS_AccName_with_Ass_Name__c,MID_Notification_Complete__c,Name,RecordTypeId,Total_EML__c,Total_Material_Damage__c,Vehcicle_CC__c,Vehcile_GVW__c,Vehicle_Make__c,Vehicle_Model__c,Vehicle_Number_of_Seats__c,Vehicle_Registration_No__c,VG_Account__c,VG_Acc_Name_with_St_City__c,VG_Aliases__c,VG_Asset_Type__c,VG_Automatic_Fire_alarm__c,VG_BI_Indemnity_Period__c,VG_Block_ID__c,VG_Building_No__c,VG_Building_SI__c,VG_City__c,VG_Comment__c,VG_Company_Division__c,VG_Component_Details__c,VG_Contents_SI__c,VG_Country__c,VG_Coverage__c,VG_Customer_Property_SI__c,VG_Date_Added__c,VG_Date_Removed__c,VG_Description__c,VG_Design_Life__c,VG_Dry_Mass__c,VG_EML_BI__c,VG_EML_PD__c,VG_EOL_Power_Margin__c,VG_Equipments__c,VG_Foam_supression_system__c,VG_Full_time_public_Fire_Brigade_staff__c,VG_Full_Value_Building_P__c,VG_Full_Value_Building__c,VG_Goods_SI__c,VG_Heritage__c,VG_Int_ID__c,VG_Launcher_family__c,VG_Launcher__c,VG_LaunchID__c,VG_Launch_Date__c,VG_Launch_Operator__c,VG_Machinery_SI__c,VG_Manufacturer__c,VG_MB_BI_Indemnity_Period__c,VG_MB_PD_Deductible__c,VG_MB_Waiting_Period__c,VG_Missions__c,VG_Mission__c,VG_OML__c,VG_Operator__c,VG_Orbital_Position__c,VG_Orbit__c,VG_Other_SI__c,VG_Payload_Manufacturer__c,VG_Payload_Power__c,VG_Payload__c,VG_PD_Deductible__c,VG_Platform_AOCS__c,VG_Platform_C_and_C__c,VG_Platform_Manufacturer__c,VG_Platform_Power__c,VG_Platform_Propulsion__c,VG_Platform_Thermal__c,VG_Policy_Number__c,VG_Postal_Code__c,VG_Prime_Manufacturer__c,VG_Rate_Adjustment__c,VG_Rate_Loading__c,VG_RDSFamily__c,VG_REG_NO_Account_Name__c,VG_Satellite_EOL_Power__c,VG_Satellite_Family_Base_rate__c,VG_Satellite_Family__c,VG_Satellite_Status__c,VG_Satellite__c,VG_Smoke_and_heat_venting_system__c,VG_Status__c,VG_Street_Number__c,VG_Street__c,VG_Technical_Summary__c,VG_Total_BISI_for_the_indemnity_period__c,VG_Total_Business_Interruption_SI__c,VG_Total_MBBISI_for_the_indemnity_period__c,VG_Total_Property_Damage_SI__c,VG_Total_Sum_Insured_SI__c,VG_True_TSI__c,VG_Use__c,VG_Waiting_Period__c,VG_Water_sprinklers__c,VG_Wet_Mass__c FROM Asset__c where Id = :assId]);        
        ass.VG_Status__c = 'InActive';
        update ass;
        System.debug('temp::'+ass);
        return ass.VG_Status__c;
    }
    
    @AuraEnabled
    public static String deleteAssetRecord(Id assId){
        Asset__c ass = ([select id from Asset__c where Id = :assId]);        
        Delete ass;
        return 'Success';         
    }
}