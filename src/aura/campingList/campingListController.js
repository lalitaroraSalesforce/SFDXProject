({
    clickCreateItem : function(component, event, helper) {
        var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
        if(validCamping){
            var newCampingItem = component.get("v.newItem");
            helper.createItem(component,newCampingItem);
            var campings = component.get("v.items"); // Array attribute defined
            var item = JSON.parse(JSON.stringify(newCampingItem));
            
            campings.push(item);//Setting new item in the Array
            
            component.set("v.items",campings);
            component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': 'yes i got it','Quantity__c': 0,
                                       'Price__c': 0,'Packed__c': false });
        }
    },
    	
    doInit  : function(component, event, helper) {
		var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
           
            if (component.isValid() && state === "SUCCESS") {
           
               
                component.set("v.items", response.getReturnValue());
                 
            }
        });
        
        $A.enqueueAction(action);
	},
    
    createItem : function(component, event, helper){
        
        helper.validateFields (component,component.find("name"));
        helper.validateFields (component,component.find("Price"));
        helper.validateFields (component,component.find("Quantity"));
        if(component.get("v.er") === false)
        {     
            var Item = component.get("v.newItem");            
            helper.createItem (component,Item);             
                       
        }
	},
    
       
    handleAddItem: function(component, event, helper) {
    //   var newItem = event.getParam("item");
    //helper.addItem(component, newItem);
    var action = component.get("c.saveItem");
    		action.setParams({"item": newItem});
    		action.setCallback(this, function(response){
        		var state = response.getState();
        		if (component.isValid() && state === "SUCCESS") {
            		// all good, nothing to do.
            var items = component.get("v.items");
            items.push(response.getReturnValue());
            component.set("v.items", items);
        		}
    		});
    		$A.enqueueAction(action);
        		}
                      
          
})