import { LightningElement, api } from 'lwc';

export default class IdsLWC extends LightningElement {
    @api recordId
    objectApiName = 'Opportunity'
    fields = ['Name', 'CloseDate', 'Amount']
}