import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
 
export default class RealTimeAccountCard extends LightningElement {
 
    @api recordId;
    @track editMode = false;
 
    handleEdit() {
        this.editMode = true;
    }
 
    handleCancel() {
        this.editMode = false;
    }
 
    handleSuccess() {
        this.editMode = false;
 
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Account updated successfully',
                variant: 'success'
            })
        );
    }
 
    handleError(event) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: event.detail.message,
                variant: 'error'
            })
        );
    }
}