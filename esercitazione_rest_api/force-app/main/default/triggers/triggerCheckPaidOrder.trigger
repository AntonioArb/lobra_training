/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-24-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger triggerCheckPaidOrder on Order (before insert, before update) {


    List<Order> newOrderList = new List<Order>();
    for (Order newOrd : trigger.new) {
        
        //controllo se l'importo pagato è uguale al Costo complessivo e setto Status in Paid
        if (newOrd.ImportoPagato__c == newOrd.Costo__c && newOrd.TotalAmount > 0) {
            newOrd.Status = 'Paid';
            newOrderList.add(newOrd);
        }

        
    }

    // Database.update(newOrderList);

}