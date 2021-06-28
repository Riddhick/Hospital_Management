
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