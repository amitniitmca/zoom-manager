import { LightningElement, wire, track, api } from 'lwc';
import getInviteesDetails from '@salesforce/apex/AddInviteesController.getInviteesDetails';

export default class AddInvitees extends LightningElement {

    @track userRecords;
    @track contactRecords;
    @track leadRecords;

    @track selectedRecords = [];

    @wire(getInviteesDetails)
    wiredGetInviteesDetails(result){
        const {data, error} = result;
        if(data){
            console.log(data);
            this.userRecords = data.User;
            this.contactRecords = data.Contact;
            this.leadRecords = data.Lead;
        }
        if(error){
            console.log(error);
        }
    }

    handleAssignedUser(event){
        let selectedUserId = event.detail.id;
        for(let temp of this.userRecords){
            if(temp.Id == selectedUserId){
                this.selectedRecords.push({
                    objectName : 'User',
                    recordId : temp.Id,
                    recordName : temp.Name,
                    recordEmail : temp.Email,
                    badgeLabel : temp.Name+' ['+temp.Email+']',
                    badgeIcon : 'standard:user'  
                });
                break;
            }
        }
        this.template.querySelector('[data-id="userLookup"]').resetValue();
    }

    handleAssignedContact(event){
        let selectedContactId = event.detail.id;
        for(let temp of this.contactRecords){
            if(temp.Id == selectedContactId){
                this.selectedRecords.push({
                    objectName : 'Contact',
                    recordId : temp.Id,
                    recordName : temp.Name,
                    recordEmail : temp.Email,
                    badgeLabel : temp.Name+' ['+temp.Email+']',
                    badgeIcon : 'standard:contact'  
                });
                break;
            }
        }
        this.template.querySelector('[data-id="contactLookup"]').resetValue();
    }

    handleAssignedLead(event){
        let selectedLeadId = event.detail.id;
        for(let temp of this.leadRecords){
            if(temp.Id == selectedLeadId){
                this.selectedRecords.push({
                    objectName : 'Lead',
                    recordId : temp.Id,
                    recordName : temp.Name,
                    recordEmail : temp.Email,
                    badgeLabel : temp.Name+' ['+temp.Email+']',
                    badgeIcon : 'standard:lead' 
                });
                break;
            }
        }
        this.template.querySelector('[data-id="leadLookup"]').resetValue();
    }

    @api getInviteesInfo(){
        return this.selectedRecords;
    }
}