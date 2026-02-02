import { LightningElement, api, wire, track } from 'lwc';
import getCases from '@salesforce/apex/AssetCaseController.getCases';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

export default class AssetServiceHistory extends LightningElement {

    @api recordId;

    @track caseData = [];
    isModalOpen = false;

    subject = '';
    priority = '';

    wiredResult;

    columns = [
        { label: 'Status', fieldName: 'Status' },
        { label: 'Type', fieldName: 'Type' },
        { label: 'Priority', fieldName: 'Priority' }
    ];

    priorityOptions = [
        { label: 'High', value: 'High' },
        { label: 'Medium', value: 'Medium' },
        { label: 'Low', value: 'Low' }
    ];

    // Fetch Cases
    @wire(getCases, { assetId: '$recordId' })
    wiredCases(result) {
        this.wiredResult = result;
        if (result.data) {
            this.caseData = result.data;
        }
    }

    openModal() {
        this.isModalOpen = true;
    }

    closeModal() {
        this.isModalOpen = false;
    }

    handleSubject(event) {
        this.subject = event.target.value;
    }

    handlePriority(event) {
        this.priority = event.target.value;
    }

    // Create Case using LDS
    createCase() {

        const fields = {
            Subject: this.subject,
            Priority: this.priority,
            AssetId: this.recordId,
            Status: 'New',
            Origin: 'Web'
        };

        const recordInput = { apiName: 'Case', fields };

        createRecord(recordInput)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Case Created Successfully',
                        variant: 'success'
                    })
                );
                this.closeModal();
                refreshApex(this.wiredResult);
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }
}