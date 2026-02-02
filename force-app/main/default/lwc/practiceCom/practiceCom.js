import { LightningElement, api, track } from 'lwc';

export default class PracticeCom extends LightningElement {
   @api reacordId;
    @track message = 'Hello';

    handlerChange(event){
        this.message = event.target.value;
    }
}