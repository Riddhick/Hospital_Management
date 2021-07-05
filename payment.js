function cardValidate(){
    var cardno=document.forms["form5"]["cardnumber"].value;
    var cvv=document.forms["form5"]["cvv"].value;
    var name=document.forms["form5"]["name"].value;
    var check_str=  /^(?:5[1-5][0-9]{14})$/;
    var check_str2=/^([0-9]{3,4})$/;
    if(cardno.match(check_str)&&cvv.match(check_str2)&&name!=null)
    {
        return true;
    }
    else
    {
    alert("Authentication Error")
    return false;
    }

}