/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-20-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

@RestResource(urlMapping='/v1/retrievecontacts/*')
global with sharing class RetrieveContacts {
    
    @HttpGet
    global static CustomContact getContacts() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String name = RestContext.request.params.get('name');
        String contactId = RestContext.request.params.get('contactid');
        String limit20 = 'LIMIT 20';
        String contIdCondition = 'WHERE id =: contactId';
        
        List<Contact> myContacts = new List<Contact>();

        String query = 'SELECT id, name FROM Contact ';
        query += String.isBlank(contactId) ? limit20 : contIdCondition;
        myContacts = Database.query(query);
        
        List<CustomContact> myCustomContacts = new List<CustomContact>();

        String customName = myContacts.get(0).Name;
        Id customReqId = myContacts.get(0).Id;
        
        CustomContact cContact = new CustomContact(customReqId, customName);
        // cContact.nome_e_cognome = customName;
        // cContact.salesforce_id = customReqId;
        List<CustomContact> customContacts = new List<CustomContact>();
         for (CustomContact contact : customContacts) {
            
         } 


        return cContact;
        
    }
}