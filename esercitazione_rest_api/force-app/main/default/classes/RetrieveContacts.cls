/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-21-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

@RestResource(urlMapping='/v1/retrievecontacts/*')
global with sharing class RetrieveContacts {
    
    @HttpGet
    global static CustomContactsCounter getContacts() {
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
        

        // String customName = myContacts.get(1).Name;
        // Id customReqId = myContacts.get(1).Id;
        
        // CustomContact cContact = new CustomContact(customReqId, customName);



        CustomContactsCounter customList = new CustomContactsCounter();
        List<CustomContact> tempContactsList = new List<CustomContact>();
        

        for (Contact contact : myContacts) {

            String customName = contact.Name;
            Id customReqId = contact.Id;
            
            CustomContact cContact = new CustomContact(customReqId, customName);
            tempContactsList.add(cContact);
            
            // customList.numero_contact += 1;
        } 
    
        customList.i_miei_custom_contact = tempContactsList;
        customList.numero_contact = customList.i_miei_custom_contact.size();


        return customList;
        
    }
}