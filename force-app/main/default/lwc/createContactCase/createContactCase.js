import { LightningElement, track } from 'lwc';
import createCaseFromContact from '@salesforce/apex/CaseFromContactController.createCaseFromContact';

export default class CreateContactWithCase extends LightningElement {

    fields = ['FirstName', 'LastName', 'AccountId', 'Description'];

    @track caseData;
    caseCreated = false;
    showCase = false;

    handleSuccess(event) {
        const contactId = event.detail.id;

        // Call Apex to create Case
        createCaseFromContact({ contactId })
            .then(result => {
                this.caseData = result;
                this.caseCreated = true;
            })
            .catch(error => {
                console.error(error);
            });
    }

    handleShowCase() {
        this.showCase = true;
    }
}