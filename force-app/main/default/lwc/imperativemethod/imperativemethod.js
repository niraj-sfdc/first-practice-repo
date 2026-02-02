import { LightningElement } from 'lwc';
import AccountDeatils from '@salesforce/apex/accountsDetails.findAccountByNameExact'
export default class Imperativemethod extends LightningElement {
 
    keywordSearch = '';
    accounts;  
 
    columns = [
        { label: 'Account Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' }
    ];
 
    handleSearch(event) {
        this.keywordSearch = event.target.value;
    }
 
    handleKeywordSearch() {
        searchAcc({ keyword: this.keywordSearch })
            .then(result => {
                this.accounts = result.length ? result : null;
            })
            .catch(error => {
                this.accounts = null;
                console.error(error);
            });
    }
}