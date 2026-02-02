/*Maintain summary object Asset_Service_Summary__c per Asset with fields Total_Cases__c, Total_Cost__c, Average_Time_To_Resolve__c.
For each Asset, keep ONE summary record that always shows:

Total number of Cases

Total service cost

Average time taken to resolve Cases

This summary should auto-update when data changes*/

trigger CaseTrigger_sixteen on Case (
    after insert, after update, after delete, after undelete
) {

}