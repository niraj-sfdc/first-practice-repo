import { LightningElement } from 'lwc';
import Contact_OBJECT from '@salesforce/schema/Contact';
import Contact_ID_FIELD from '@salesforce/schema/Contact.Id';
import Contact_NAME_FIELD from '@salesforce/schema/Contact.Name';
import Contact_EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import Contact_PHONE_FIELD from '@salesforce/schema/Contact.Phone';
export default class RecordEditFormLWC extends LightningElement {

    objectApiName = Contact_OBJECT;
    recordId = '0035g00000XXXXXXAAO'; // Sample Contact Record Id
    IDfield = Contact_ID_FIELD;
    NameField = Contact_NAME_FIELD
    emailField = Contact_EMAIL_FIELD;
    phoneField = Contact_PHONE_FIELD;
}