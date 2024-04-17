const express = require('express');
const body_parser = require('body-parser');
const userRouter = require('./routers/user.router');
const ComplaintRouter = require('./routers/complaint.router');
const cors = require("cors");

const app = express();
app.use(cors())

app.use(body_parser.json());

app.use('/',userRouter);
app.use('/',ComplaintRouter);

module.exports = app;