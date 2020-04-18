({
    sendToVF : function(component, helper) {
        //Prepare message in the format required in VF page
        var message = {
			            "loadGoogleMap" : true,
            			"mapData": component.get('v.mapData'), 
         			    "acc" :component.get('v.acc'),
            			"mapOptions": component.get('v.mapOptions'),  
                       	'mapOptionsCenter': component.get('v.mapOptionsCenter') 
        		} ;
        
        //Send message to VF
        helper.sendMessage(component, helper, message);
    },
    sendMessage: function(component, helper, message){
        //Send message to VF
        message.origin = window.location.hostname;
        var vfWindow = component.find("vfFrame").getElement().contentWindow;
        message = JSON.parse(JSON.stringify(message));
        vfWindow.postMessage(message, component.get("v.vfHost"));
    }
    ,
    PopupMarker: function(component, helper){
        //Send message to VF
        message.origin = window.location.hostname;
        var vfWindow = component.find("vfFrame").getElement().contentWindow;
        message = JSON.parse(JSON.stringify(message));
        vfWindow.postMessage(message, component.get("v.vfHost"));
    },
    
    sendMessageNew: function(component, helper, mappedAccount){
        //Send message to VF
        mappedAccount.origin = window.location.hostname;
        var vfWindow = component.find("vfFrame").getElement().contentWindow;
        mappedAccount = JSON.parse(JSON.stringify(mappedAccount));
        vfWindow.postMessage(mappedAccount, component.get("v.vfHost"));
    }
})