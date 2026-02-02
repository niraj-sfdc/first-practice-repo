import { LightningElement } from 'lwc';
export default class ChildComponentC2P extends LightningElement {
     

    handleAdd() {
        const addEvent = new CustomEvent('add');
        this.dispatchEvent(addEvent);
    }

    handleSubtract() {
        const subtractEvent = new CustomEvent('subtract');
        this.dispatchEvent(subtractEvent);
    }
}