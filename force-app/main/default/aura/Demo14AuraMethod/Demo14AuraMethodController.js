({
	showMessage : function(component, event, helper) {
		component.find("message").show("test");
	},
    showErrorMessage : function(component, event, helper) {
		component.find("message").error("test");
	},
    removeMessage : function(component, event, helper) {
		component.find("message").remove();
	}
})