import { LightningElement, track } from 'lwc';

export default class ParentComponent extends LightningElement {

    @track name = 'Niraj';   // Default text inside input

    handleChange(event) {
        this.name = event.target.value;
    }
}