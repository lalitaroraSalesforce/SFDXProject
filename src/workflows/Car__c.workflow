<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Intimate_Mechanic_Range_Rover</fullName>
        <description>Intimate Mechanic Range Rover</description>
        <protected>false</protected>
        <recipients>
            <recipient>lalitarora.sf@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Intimate_Range_rover_Record</template>
    </alerts>
    <fieldUpdates>
        <fullName>Rejection_Update</fullName>
        <field>Estimation_Apporved__c</field>
        <literalValue>Rejected</literalValue>
        <name>Rejection Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Apporved_Status</fullName>
        <field>Estimation_Apporved__c</field>
        <literalValue>Approved</literalValue>
        <name>Update Apporved Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Minimum_Service_Charge</fullName>
        <field>Minimum_Service_Charge__c</field>
        <formula>1500</formula>
        <name>Update Minimum Service Charge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>test</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Car__c.Name</field>
            <operation>equals</operation>
            <value>testcar</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Car__c.CreatedDate</offsetFromField>
            <timeLength>365</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
