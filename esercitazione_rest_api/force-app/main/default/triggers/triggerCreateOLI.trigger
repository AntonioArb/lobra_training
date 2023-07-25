/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-24-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger triggerCreateOLI on Order (before update) {
    //se lo stato è in paid,  creo un "order line item"
    List<Orderitem> oItemsList = new List<Orderitem>();

    if (newOrd.Status = 'ordineApprovato') {
        
    }
}