({
    createItem : function (component,Item){         
        var action = component.get("c.saveItem");
        action.setParams({"item":Item});
        action.setCallback(this,function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var campings = component.get("v.items");
                campings.push(response.getReturnValue());
                component.set("v.items", campings);
            }
        });
       $A.enqueueAction(action);        
    }
})