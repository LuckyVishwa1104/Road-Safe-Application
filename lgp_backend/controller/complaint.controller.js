const ComplaintServices = require("../services/complaint.services");

exports.raiseComplaint = async (req,res,next) =>{
    try{
        const {userId,email,image,location,category,description} = req.body;

        let complaint = await ComplaintServices.raiseComplaint(userId,email,image,location,category,description);

        res.json({status:true, success:complaint});
    }
    catch(error){
        next(error);
    }
}

exports.getComplaintDetails = async (req,res,next) =>{
    try{
        const {email} = req.body;

        let complaint = await ComplaintServices.getComplaintdetails(email);

        res.json({status:true, success:complaint});
    }
    catch(error){
        next(error);
    }
}

exports.deleteComplaint = async (req,res,next) =>{
    try{
        const {id} = req.body;

        let deleted = await ComplaintServices.deleteComplaint(id);

        res.json({status:true, success:deleted});
    }
    catch(error){
        next(error);
    }
}