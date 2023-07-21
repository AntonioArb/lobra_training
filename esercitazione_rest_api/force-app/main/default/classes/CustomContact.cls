/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-20-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
global with sharing class CustomContact {

    public Id salesforce_id;
    public String nome_e_cognome;

    public CustomContact(Id salesforce_id, String nome_e_cognome) {
        this.salesforce_id = salesforce_id;
        this.nome_e_cognome = nome_e_cognome;
    }


}


/*

CustomContact mario = new CustomContact("mario", "rossi");
CustomContact paolo = new CustomContact("paolo", "verdi");
*/