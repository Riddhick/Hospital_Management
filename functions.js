var btn1=document.getElementById('nav_p_btn')
btn1.addEventListener('click',function(){
    if(document.getElementById('p-list').style.display=='block')
    {
        document.getElementById('p-list').style.display='none'
    }
    else
    document.getElementById('p-list').style.display='block'
  });
 var btn2=document.getElementById('mng_prf')
btn2.addEventListener('click',function(){
  if(document.getElementById('doclist').style.display!='none')
  {
    document.getElementById('doclist').style.display='none'
    document.getElementById('btn_list').style.display='block'
  }
  else{
    document.getElementById('doclist').style.display='block'
    document.getElementById('btn_list').style.display='none'
  }
});



  //const pname=document.getElementById("username").value;
 function  check(){
    var uname = document.forms["form2"]["username"].value;
    var pname = document.forms["form2"]["name"].value;
    var mail = document.forms["form2"]["email"].value;
    var pasw = document.forms["form2"]["password"].value;
    const conf_pas = document.forms["form2"]["con_paswd"].value;
     if(uname=="")
     {
       document.getElementById('u_name_alert').innerHTML="User name can't be empty";
         return false;
     }
     else  if(pname=="")
     {
       document.getElementById('name_alert').innerHTML="Name can't be empty";
         return false;
     }
     else  if(mail=="")
     {
       document.getElementById('email_alert').innerHTML="Email can't be empty";
         return false;
     }
     else  if(pasw=="")
     {
       document.getElementById('pass_match_alert').innerHTML="Password can't be empty";
         return false;
     }
     
  else if(pasw!=conf_pas)
     {
        document.getElementById('pass_match_alert').innerHTML="Passwords Not Matched";
        return false;
     }
     else
     return true;
 }