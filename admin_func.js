
  var btn1=document.getElementById('doc_btn_1')
  btn1.addEventListener('click',function(){
    if(document.getElementById('add_doc').style.display!='none')
    {
      document.getElementById('add_doc').style.display='none'
      document.getElementById('admin_tool').style.display='block'
    }
    else{
      document.getElementById('add_doc').style.display='block'
      document.getElementById('admin_tool').style.display='none'
    }
  });
 
var btn2=document.getElementById('dep_btn_1')
btn2.addEventListener('click',function(){
  if(document.getElementById('add_dept').style.display!='none')
  {
    document.getElementById('add_dept').style.display='none'
    document.getElementById('admin_tool').style.display='block'
  }
  else{
    document.getElementById('add_dept').style.display='block'
    document.getElementById('admin_tool').style.display='none'
  }
});

var btn3=document.getElementById('doc_btn_2')
btn3.addEventListener('click',function(){
  document.getElementById('admin_tool').style.display="none";
  document.getElementById('Doctor_details_del').style.display="block";
});

var btn_back=document.getElementById('back')
btn_back.addEventListener('click',function(){
  document.getElementById('admin_tool').style.display="block";
  document.getElementById('Doctor_details_del').style.display="none";
});

var btn4=document.getElementById('dep_btn_2')
btn4.addEventListener('click',function(){
  document.getElementById('admin_tool').style.display="none";
  document.getElementById('Department_details_del').style.display="block";
});


var btn_back2=document.getElementById('back2')
btn_back2.addEventListener('click',function(){
  document.getElementById('admin_tool').style.display="block";
  document.getElementById('Department_details_del').style.display="none";
});

var btn5=document.getElementById('doc_btn_3')
btn5.addEventListener('click',function(){
  document.getElementById('doctor_tool').style.display="none";
  document.getElementById('dept_tool').style.display="none";
  document.getElementById('doctor').style.display="none";
  document.getElementById('dept').style.display="none";
  document.getElementById('update_doctor_sub').style.display="block";
});


var back_btn3=document.getElementById('back_btn')
back_btn.addEventListener('click',function(){
  document.getElementById('doctor_tool').style.display="block";
  document.getElementById('dept_tool').style.display="block";
  document.getElementById('doctor').style.display="block";
  document.getElementById('dept').style.display="block";
  document.getElementById('update_doctor_sub').style.display="none";
});

var btn6=document.getElementById('updatecap')
btn6.addEventListener('click',function(){
  document.getElementById('update_doctor_sub').style.display="none";
  document.getElementById('admin_tool').style.display="none";
  document.getElementById('update_capacity').style.display="block";
});

var btn7=document.getElementById('updatetime')
btn7.addEventListener('click',function(){
  document.getElementById('update_doctor_sub').style.display="none";
  document.getElementById('admin_tool').style.display="none";
  document.getElementById('update_time').style.display="block";
});

var btn8=document.getElementById('updatedate')
btn8.addEventListener('click',function(){
  document.getElementById('update_doctor_sub').style.display="none";
  document.getElementById('admin_tool').style.display="none";
  document.getElementById('update_date').style.display="block";
});

var btn9=document.getElementById('updateback1')
btn9.addEventListener('click',function(){
  document.getElementById('admin_tool').style.display="block";
  document.getElementById('update_doctor_sub').style.display="block";
  document.getElementById('update_capacity').style.display="none";
});

var btn10=document.getElementById('updateback2')
btn10.addEventListener('click',function(){
  document.getElementById('admin_tool').style.display="block";
  document.getElementById('update_doctor_sub').style.display="block";
  document.getElementById('update_time').style.display="none";
});

var btn11=document.getElementById('updateback3')
btn11.addEventListener('click',function(){
  document.getElementById('admin_tool').style.display="block";
  document.getElementById('update_doctor_sub').style.display="block";
  document.getElementById('update_date').style.display="none";
});

var btn12=document.getElementById('spb1')
var btn13=document.getElementById('spb2')
btn12.addEventListener('click',function(){
  document.getElementById('admin_docdetails').style.display="none";
  document.getElementById('Dept_details').style.display="block";
 btn12.style.backgroundColor="blue";
 btn13.style.backgroundColor="red";
});

btn13.addEventListener('click',function(){
  document.getElementById('admin_docdetails').style.display="block";
  document.getElementById('Dept_details').style.display="none";
  btn12.style.backgroundColor="red";
 btn13.style.backgroundColor="blue";
});