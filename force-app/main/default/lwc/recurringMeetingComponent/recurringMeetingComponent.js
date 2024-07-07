import { LightningElement, track, api } from 'lwc';
import { getCurrentDateTimeInIsoString, 
        getDateTimeFromIsoString,
        getDateTimeFromIsoAddingDays } from 'c/dateAndTimeUtility';

const RECURRENCE_OPTIONS = [
    {label: '---SELECT TYPE---', value : '---SELECT---'},
    {label: 'Daily', value : '1'},
    {label: 'Weekly', value : '2'},
    {label: 'Monthly', value : '3'}
];

const REPEAT_EVERY_DAY_OPTIONS = [
    {label:'---SELECT DAY---', value:'---SELECT---'},
    {label:'1', value:'1'},
    {label:'2', value:'2'},
    {label:'3', value:'3'},
    {label:'4', value:'4'},
    {label:'5', value:'5'},
    {label:'6', value:'6'},
    {label:'7', value:'7'},
    {label:'8', value:'8'},
    {label:'9', value:'9'},
    {label:'10', value:'10'},
    {label:'11', value:'11'},
    {label:'12', value:'12'},
    {label:'13', value:'13'},
    {label:'14', value:'14'},
    {label:'15', value:'15'}
];

const REPEAT_EVERY_WEEK_OPTIONS = [
    {label:'---SELECT WEEK---', value:'---SELECT---'},
    {label:'1', value:'1'},
    {label:'2', value:'2'},
    {label:'3', value:'3'},
    {label:'4', value:'4'},
    {label:'5', value:'5'},
    {label:'6', value:'6'},
    {label:'7', value:'7'},
    {label:'8', value:'8'},
    {label:'9', value:'9'},
    {label:'10', value:'10'},
    {label:'11', value:'11'},
    {label:'12', value:'12'}
];

const REPEAT_EVERY_MONTH_OPTIONS = [
    {label:'---SELECT MONTH---', value:'---SELECT---'},
    {label:'1', value:'1'},
    {label:'2', value:'2'},
    {label:'3', value:'3'}
];

const OCCURS_ON_WEEK_OPTIONS = [
    {label:'Sunday', value:'1'},
    {label:'Monday', value:'2'},
    {label:'Tuesday', value:'3'},
    {label:'Wednesday', value:'4'},
    {label:'Thursday', value:'5'},
    {label:'Friday', value:'6'},
    {label:'Saturday', value:'7'}
];

const OCCURS_DATE_CHOICE_OPTIONS = [
    {label: 'First', value: '1'},
    {label: 'Second', value: '2'},
    {label: 'Third', value: '3'},
    {label: 'Fourth', value: '4'},
    {label: 'Last', value: '-1'},
];

export default class RecurringMeetingComponent extends LightningElement {
    @track recurrenceOptions = RECURRENCE_OPTIONS;
    @track repeatEveryDayOptions = REPEAT_EVERY_DAY_OPTIONS;
    @track repeatEveryWeekOptions = REPEAT_EVERY_WEEK_OPTIONS;
    @track repeatEveryMonthOptions = REPEAT_EVERY_MONTH_OPTIONS;
    @track occursOnWeekOptions = [];
    @track afterOccPicklistOptions;
    @track occursDateToggleOptions;
    @track occursDateChoiceOptions = OCCURS_DATE_CHOICE_OPTIONS;
    @track occursWeekChoiceOptions = OCCURS_ON_WEEK_OPTIONS;

    @api startDateTime;

    recurringCheckboxValue = false;
    recurringMessage;
    recurrenceValue = '1';
    repeatEveryDayValue = '1';
    repeatEveryWeekValue = '1';
    repeatEveryMonthValue = '1';
    occursOnWeekValue;
    occursOnMonthOptions;
    occursOnMonthValue;
    endDateToggleChecked = true;
    occurrenceToggleChecked = false;
    endDateToggleValue;
    afterOccPicklistValue;
    occursDateToggleChecked;
    occursDateToggleValue;
    occursDayToggleChecked;
    occursDateChoiceValue = '1';
    occursWeekChoiceValue = '1';
    occursDateToggleChecked = true;
    occursDayToggleChecked = false;

    get isDailySelected(){
        return this.recurrenceValue === '1';
    }

    get isWeeklySelected(){
        return this.recurrenceValue === '2';
    }

    get isMonthlySelected(){
        return this.recurrenceValue === '3';
    }

    handleRecurringMeetingChange(event){
        this.recurringCheckboxValue = event.detail.checked;
        if(this.recurringCheckboxValue == true){
            this.occursOnWeekOptions = [];
            let day = getDateTimeFromIsoString(this.startDateTime).getDay()+1;
            for(let temp of OCCURS_ON_WEEK_OPTIONS){
                let checked = day === parseInt(temp.value);
                this.occursOnWeekOptions.push({id:temp.value, name:temp.label, isDefault:checked});
            }
            this.occursOnWeekValue.push(''+day);

            this.afterOccPicklistOptions = [];
            for(let num=1; num<=20; num++){
                this.afterOccPicklistOptions.push({label:''+num, value:''+num});
            }
            this.afterOccPicklistValue = '7';

            this.endDateToggleValue = getDateTimeFromIsoAddingDays(this.startDateTime, 30);

            this.occursDateToggleOptions = [];
            for(let num=1; num<=31; num++){
                this.occursDateToggleOptions.push({label:''+num, value:''+num});
            }
            this.occursDateToggleValue = '1';
        }
    }

    handleRecurrenceChange(event){
        this.recurrenceValue = event.detail.value;
        /*
        const edComp = this.template.querySelector('[data-id="repeatEveryInDays"]');
        const ewComp = this.template.querySelector('[data-id="repeatEveryInWeeks"]');
        const emComp = this.template.querySelector('[data-id="repeatEveryInMonths"]');
        console.log(this.recurrenceValue);
        console.log(edComp);
        console.log(ewComp);
        console.log(emComp);
        if(this.recurrenceValue == '1'){
            console.log(edComp.value);
            this.template.querySelector('[data-id="repeatEveryInDays"]').value = '1';
        }
        else if(this.recurrenceValue == '2'){
            console.log(ewComp.value);
            this.template.querySelector('[data-id="repeatEveryInWeeks"]').value = '1';
        }
        else if(this.recurrenceValue == '3'){
            console.log(emComp.value);
            this.template.querySelector('[data-id="repeatEveryInMonths"]').value = '1';
        }
        else{
            this.template.querySelector('[data-id="repeatEveryInDays"]').value = '---SELECT---';
            this.template.querySelector('[data-id="repeatEveryInWeeks"]').value = '---SELECT---';
            this.template.querySelector('[data-id="repeatEveryInMonths"]').value = '---SELECT---'; 
        }
            */
    }

    handleRepeatEveryDayChange(event){
        this.repeatEveryDayValue = event.detail.value;
    }

    handleRepeatEveryWeekChange(event){
        this.repeatEveryWeekValue = event.detail.value;
    }

    handleRepeatEveryMonthChange(){
        this.repeatEveryMonthValue = event.detail.value;
    }

    // handleOccursOnWeekChange(event){
    //     console.log(JSON.stringify(event));
    // }

    handleEndDateToggle(event){
        this.endDateToggleChecked = event.detail.checked;
        this.occurrenceToggleChecked = !this.endDateToggleChecked;
    }

    handleOccurrenceToggle(event){
        this.occurrenceToggleChecked = event.detail.checked;
        this.endDateToggleChecked = !this.occurrenceToggleChecked;
    }

    handleEndDateToggleChange(event){
        this.endDateToggleValue = event.detail.value;
    }

    handleAfterOccPicklistChange(event){
        this.afterOccPicklistValue = event.detail.value;
    }

    handleOccursDateToggle(event){
        this.occursDateToggleChecked = event.detail.checked;
        this.occursDayToggleChecked = !this.occursDateToggleChecked;
    }

    handleOccursDateToggleChange(){
        
    }

    handleOccursDayToggle(event){
        this.occursDayToggleChecked = event.detail.checked;
        this.occursDateToggleChecked = !this.occursDayToggleChecked;
    }

    handleDateChoiceOptionsChange(){

    }

    handleWeekChoiceOptionsChange(){

    }

    handleWeekOptionsChecked(event){
        console.log(event);
        console.log(event.currentTarget);
        console.log(event.target);
        // const val = event.detail.value;
        // console.log(val);
    }

    @api resetRecurring(){
        this.recurringCheckboxValue = false;
    }

    @api getInfo(){
        let result = {};
        result.isRecurring = this.recurringCheckboxValue;
        return result;
    }
}