import { LightningElement, api } from 'lwc';

export default class ChildComponent extends LightningElement {
    @api userName;   // Name coming from Parent
}