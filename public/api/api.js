//  @Add Job Work Details 
//    @Method Post 

const workOrderForm = document.querySelector('#AddWorkOrder');
workOrderForm.addEventListener('submit',(e) => {
    e.preventDefault();
    console.log('Work Order Submission Request');


    const OrderBody = {
        r_Date : workOrderForm.elements[0].value,
        party_name : workOrderForm.elements[1].value,
        workOrder_id :  workOrderForm.elements[2].value,
        job_Work : workOrderForm.elements[3].value,
        quantity : workOrderForm.elements[4].value
    }
    console.log(OrderBody);
    


    //Axios Post Request Here 
    axios.post('/storeWorkOrder',{
        workOrder : JSON.stringify(OrderBody)
    })
    .then((res)=>{
        console.log(res.data);
    })
    .catch((err)=>{
        console.log(err);
    })


})