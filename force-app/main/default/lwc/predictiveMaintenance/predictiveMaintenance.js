import { LightningElement, api, wire, track } from 'lwc';
import getHighRiskAssets from '@salesforce/apex/PredictiveMaintenanceController.getHighRiskAssets';
import runIoTRiskJob from '@salesforce/apex/PredictiveMaintenanceController.runIoTRiskJob';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

export default class PredictiveMaintenance extends LightningElement {

    @api recordId;   // Account Id

    @track assets = [];
    wiredResult;

    columns = [
        { label: 'Asset Name', fieldName: 'Name' },
        { label: 'Failure Risk (%)', fieldName: 'Failure_Risk__c' }
    ];

    // Load assets
    @wire(getHighRiskAssets, { accountId: '$recordId' })
    wiredAssets(result) {
        this.wiredResult = result;
        if (result.data) {
            this.assets = result.data;
        }
    }

    // Button click
    handleClick() {
        runIoTRiskJob({ accountId: this.recordId })
            .then(() => {
                this.showToast('Success', 'IoT Risk Update Started', 'success');
                return refreshApex(this.wiredResult);
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({ title, message, variant })
        );
    }
}