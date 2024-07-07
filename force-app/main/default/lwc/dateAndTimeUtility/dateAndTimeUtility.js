function getDatetimeInIso(localDateTime){
    const localDate = new Date(localDateTime);
    return localDate.toISOString();
}

function getCurrentDateTimeInIsoString(){
    return new Date().toISOString();
}

function getDateTimeFromIsoString(isoString){
    let b = isoString.split(/\D+/);
    return new Date(Date.UTC(b[0], --b[1], b[2], b[3], b[4], b[5], b[6]));
}

function getDateTimeFromIsoAddingMinutes(isoString, mins){
    let dt = new Date(Date.parse(isoString) + (mins * 60000));
    return dt.toISOString();
}

function getDateTimeFromIsoAddingDays(isoString, days){
    let dt = new Date(Date.parse(isoString) + (days * 144 * 600000));
    return dt.toISOString();
}

function convertUTCToLocal(utcDateTimeString) {
    const utcDate = new Date(utcDateTimeString);
    const localDate = new Date(utcDate.getTime() + utcDate.getTimezoneOffset() * 6000);
    return localDate.toISOString().slice(0, 16);
}

export {
    getDatetimeInIso,
    getCurrentDateTimeInIsoString,
    getDateTimeFromIsoString,
    getDateTimeFromIsoAddingMinutes,
    getDateTimeFromIsoAddingDays,
    convertUTCToLocal
};