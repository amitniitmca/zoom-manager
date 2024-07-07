import { LightningElement, track, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; 
import { getRecord } from 'lightning/uiRecordApi';
import USER_NAME from '@salesforce/schema/User.Name';
import USER_EMAIL from '@salesforce/schema/User.Email';
import USER_TIMEZONE from '@salesforce/schema/User.TimeZoneSidKey';
import userId from '@salesforce/user/Id';
import getMeetingTypePicklist from '@salesforce/apex/ZoomMeetingFormController.getMeetingTypePicklist';
import createScheduleMeeting from '@salesforce/apex/ZoomMeetingFormController.createScheduleMeeting';
import { getCurrentDateTimeInIsoString, getDatetimeInIso,
        getDateTimeFromIsoAddingMinutes } from 'c/dateAndTimeUtility';

export default class ZoomMeetingForm extends NavigationMixin(LightningElement) {
    
    @track meetingTypeOptions;
    @track meetingTypes;

    agendaValue;
    durationValue;
    scheduleForValue;
    endDateTimeValue;
    meetingTypeValue;
    timeZoneValue;
    isLoading = false;
    
    @track startDateTimeValue = getCurrentDateTimeInIsoString();
    @track currentUserRecord = {};

    @wire(getMeetingTypePicklist)
    wiredGetMeetingTypePicklist({data, error}){
        if(data){
            console.log(data);
            this.meetingTypeOptions = [];
            this.meetingTypes = data;
            for(let temp of data){
                if(temp.isActive){
                    this.meetingTypeOptions.push({label: temp.label,value:temp.value});
                }
                if(temp.isDefault){
                    this.meetingTypeValue = temp.value;
                }
            }
        }
        if(error){
            console.log(error);
        }
    }

    @wire(getRecord, { recordId: userId, fields: [USER_NAME, USER_EMAIL, USER_TIMEZONE]}) 
    currentUserInfo({error, data}) {
        if (data) {
            this.currentUserRecord.name = data.fields.Name.value;
            this.currentUserRecord.email = data.fields.Email.value;
            this.scheduleForValue = this.currentUserRecord.name+' ['+this.currentUserRecord.email+']';
            this.timeZoneValue = data.fields.TimeZoneSidKey.value;
        } else if (error) {
            console.log(error);
        }
    }

    handleAgendaChange(event){
        this.agendaValue = event.detail.value;
    }

    handleDurationChange(event){
        let val = event.detail.value;
        if(val != ''){
            this.durationValue = parseInt(val);
        }
        else{
            this.durationValue = undefined;
            this.endDateTimeValue = undefined;    
        }
        this.calculateEndDateTime();
    }

    handleStartDateTimeChange(event){
        this.startDateTimeValue = event.detail.value;
        console.log(this.startDateTimeValue);
        this.template.querySelector('c-recurring-meeting-component').resetRecurring();
        this.calculateEndDateTime();
    }

    handleMeetingTypeChange(event){
        this.meetingTypeValue = event.detail.value;
    }

    calculateEndDateTime(){
        if(this.durationValue != undefined && this.startDateTimeValue != undefined){
            this.endDateTimeValue = getDateTimeFromIsoAddingMinutes(getDatetimeInIso(this.startDateTimeValue), this.durationValue);
            console.log(this.endDateTimeValue);
        }
        else{
            this.endDateTimeValue = undefined;
        }
    }

    handleCreateClick(){
        const reccComp = this.template.querySelector('c-recurring-meeting-component');
        const attComp = this.template.querySelector('c-add-invitees');
        if(this.agendaValue == undefined || this.agendaValue == ''){
            this.showErrorMessage('Please provide agenda to create a meeting!');
        }
        else if(this.durationValue == undefined || this.durationValue == ''){
            this.showErrorMessage('Please provide duration in minutes to create a meeting!');
        }
        else if(reccComp.getInfo().isRecurring == true){

        }
        else if(attComp.getInviteesInfo().length == 0){
            this.showErrorMessage('Please add invitees to create a meeting!');
        }
        else{
            this.isLoading = true;
            let meetingInfo = this.getScheduleMeetingDetails();
            let inviteeInfo = attComp.getInviteesInfo();
            createScheduleMeeting({meetingDetails : meetingInfo,  inviteeDetails : inviteeInfo})
            .then(data => {
                console.log(data);
                this[NavigationMixin.GenerateUrl]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: data.Id,
                        actionName: 'view'
                    },
                }).then((url) => {
                    const event = new ShowToastEvent({
                        title: 'SUCCESS',
                        message: 'Zoom {0} created successfully! Click {1}',
                        variant: 'success',
                        messageData: [
                            'Meeting',
                            {
                                url,
                                label: 'here',
                            },
                        ],
                    });
                    this.dispatchEvent(event);
                    this.isLoading = false;
                    this.handleResetClick();
                });
            })
            .error(error => {
                console.log(error);
                this.isLoading = false;
            });
        }
    }

    handleResetClick(){
        for(let temp of this.meetingTypes){
            if(temp.isDefault){
                this.meetingTypeValue = temp.value;
                break;
            }
        }
        this.agendaValue = undefined;
        this.durationValue = undefined;
        this.endDateTimeValue = undefined;
        this.template.querySelector('c-recurring-meeting-component').resetRecurring();
    }

    showErrorMessage(message){
        this.dispatchEvent(new ShowToastEvent({
            title: 'ERROR',
            message: message,
            variant: 'error'
        }));
    }

    showSuccessMessage(message){
        this.dispatchEvent(new ShowToastEvent({
            title: 'SUCCESS',
            message: message,
            variant: 'success'
        }));
    }

    getScheduleMeetingDetails(){
        let meetingInfo = {};
        meetingInfo.agenda = this.agendaValue;
        meetingInfo.duration = parseInt(this.durationValue);
        meetingInfo.scheduleFor = this.currentUserRecord.email;
        meetingInfo.startTime = getDatetimeInIso(this.startDateTimeValue);
        meetingInfo.timezone = this.timeZoneValue;
        meetingInfo.meetingType = this.meetingTypeValue;
        meetingInfo.isRecurring = false;
        return meetingInfo;
    }
}