const router = require('express').Router();

const ComplaintController = require("../controller/complaint.controller");

router.post('/complaintDetails',ComplaintController.raiseComplaint);

router.get('/getComplaintDetail',ComplaintController.getComplaintDetails);

module.exports = router;