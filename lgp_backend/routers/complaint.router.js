const router = require('express').Router();

const ComplaintController = require("../controller/complaint.controller");

router.post('/complaintDetails',ComplaintController.raiseComplaint);

router.get('/getComplaintDetail',ComplaintController.getComplaintDetails);

router.get('/getComplaintDetailAll',ComplaintController.getComplaintDetailsAll);

module.exports = router;