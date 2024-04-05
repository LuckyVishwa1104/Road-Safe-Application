const router = require('express').Router();

const ComplaintController = require("../controller/complaint.controller");

router.post('/complaintDetails',ComplaintController.raiseComplaint);

router.post('/getComplaintDetail',ComplaintController.getComplaintDetails);

router.post('/deleteComplaint',ComplaintController.deleteComplaint);

module.exports = router;