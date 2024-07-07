import { LightningElement, api, track } from 'lwc';
import getRecords from '@salesforce/apex/ProperLookupController.getRecords';

export default class ProperLookup extends LightningElement {
    @api objectName;
    @api fieldNames;
    @api searchFieldName;
    @api searchLabel;
    @api searchVariant;
    @api objectRecords;

    @track fieldsList;
    @track recordList;
    @track searchTerm;
    @track records;
    @track selectedRecordId;

    connectedCallback(){
        if(!this.objectRecords){
            this.fieldsList = this.fieldNames.split(",");
            if(this.fieldsList.includes(this.searchFieldName) == false){
                this.fieldsList.unshift(this.searchFieldName);
            }
            getRecords({objectName : this.objectName, fieldNames : this.fieldsList})
            .then(data => {
                this.recordList = data;
            })
            .catch(error => {
                console.log(error);
            });
        }
        else{
            this.recordList = this.objectRecords;
            this.fieldsList = [];
            for(let key in this.recordList[0]){
                this.fieldsList.push(key);
            }
            this.fieldsList.unshift(this.searchFieldName);
            console.log('this.fieldNames : '+this.fieldsList);
        }
    }

    handleSearchChange(event){
        this.searchTerm = event.target.value;
        console.log(this.searchTerm);
        this.filterRecords();
    }

    filterRecords(){
        console.log('this.recordList : '+this.recordList);
        this.records = [];
        let count = 0;
        for(let temp of this.recordList){
            if(temp[this.searchFieldName].includes(this.searchTerm)){
                let rec = {Name : temp.Name};
                let index = 1;
                for(let fname of this.fieldsList){
                    if(fname != 'Name' && fname != 'Id'){
                        rec['field_'+index] = temp[fname];
                        index++;
                    }
                }
                console.log('rec : '+JSON.stringify(rec));
                this.records.push(rec);
                count++;
                if(count==5){
                    break;
                }
            }
        }
        console.log(JSON.stringify(this.records));
    }

    onSearchTermSelect(event){
        this.searchTerm = event.currentTarget.dataset.name;
        this.records = [];
        console.log('recordList : '+JSON.stringify(this.recordList));
        for(let temp of this.recordList){
            if(temp.Name == this.searchTerm){
                this.selectedRecordId = temp.Id;
                break;
            }
        }
        this.recordList = this.recordList.filter((data) => data.Id != this.selectedRecordId);
        console.log('this.selectedRecordId : '+this.selectedRecordId);
        const cusEvent = new CustomEvent('selected', {detail : {id:this.selectedRecordId}});
        this.dispatchEvent(cusEvent);
    }

    handleSearchClick(){
        this.records = [];
        let count = 0;
        for(let temp of this.recordList){
            let rec = {Name : temp.Name};
            let index = 1;
            for(let fname of this.fieldsList){
                if(fname != 'Name' && fname != 'Id'){
                    rec['field_'+index] = temp[fname];
                    index++;
                }
            }
            console.log('rec : '+JSON.stringify(rec));
            this.records.push(rec);
            count++;
            if(count == 5){
                break;
            }
        }
    }

    handleSearchFocusOut(){
        setTimeout(() => {
            this.records = [];
        }, 500);
    }

    @api value(){
        return this.selectedRecordId;
    }

    @api resetValue(){
        //this.recordList = [];
        //this.records = [];
        this.searchTerm = undefined;
    }

    
}