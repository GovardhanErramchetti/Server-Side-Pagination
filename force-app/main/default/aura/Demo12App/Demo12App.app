<aura:application >
    <aura:attribute name="isBounded" type="Boolean" default="true"/>
    <aura:attribute name="label" type="String" default="Show Unbounded"/>
    <lightning:button variant="brand" label="{!v.label}" onclick="{!c.handleClick}"/>
	<aura:if isTrue="{!v.isBounded}">
        <br/>
        <c:Demo12BoundedParent/>
        <aura:set attribute="else">
            <c:Demo12UnBoundedParent/>
        </aura:set>
    </aura:if>
</aura:application>