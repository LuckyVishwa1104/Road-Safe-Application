const ComplaintModel = require("../model/complaint.model");

class ComplaintServices{

    static async raiseComplaint(userId,email,image,location,category,description){
        const raiseComplaint = new ComplaintModel({userId,email,image,location,category,description});
        return await raiseComplaint.save();
    }

    static async getComplaintdetails(email){
        const Complaintdetails = await ComplaintModel.find({email});
        return Complaintdetails;
    }

}

module.exports = ComplaintServices;
