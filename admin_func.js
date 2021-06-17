window.addEventListener( "pageshow", function ( event ) {
    var historyTraversal = event.persisted || ( typeof window.performance != "undefined" && window.performance.navigation.type === 2 );
    if ( historyTraversal ) {
      // Handle page restore.
      //alert('refresh');
      window.location.reload();
    }
  });
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
 