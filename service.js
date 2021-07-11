var serv1=document.getElementById('bloodbank');
var serv2=document.getElementById('health');
var serv3=document.getElementById('ambulance');
var serv4=document.getElementById('operation');



serv1.addEventListener('mouseover',function(){
    document.getElementById('text_show').innerHTML="Blood Bank Service";
})
serv1.addEventListener('mouseout',function(){
    document.getElementById('text_show').innerHTML="";
})


serv2.addEventListener('mouseover',function(){
    document.getElementById('text_show').innerHTML="Health Check Up";
})
serv2.addEventListener('mouseout',function(){
    document.getElementById('text_show').innerHTML="";
})


serv3.addEventListener('mouseover',function(){
    document.getElementById('text_show').innerHTML="24 X 7 Ambulance Service";
})
serv3.addEventListener('mouseout',function(){
    document.getElementById('text_show').innerHTML="";
})


serv4.addEventListener('mouseover',function(){
    document.getElementById('text_show').innerHTML="Modern Operation Theaters";
})
serv4.addEventListener('mouseout',function(){
    document.getElementById('text_show').innerHTML="";
})
