import { LightningElement } from 'lwc';
export default class ParentComponentC2P extends LightningElement {

     count = 0;

    handleAdd() {
        this.count++;
    }

    handleSubtract() {
        this.count--;
    }
}