const express = require('express')
const cors = require('cors')
const multer = require('multer')
const path = require('path')

const personController = require('./controllers/person.controller')
const accountController = require('./controllers/account.controller')

const jobController = require('./controllers/job.controller')

const projectController = require('./controllers/project.controller')
const projectAssignedController = require('./controllers/projectassigned.controller')
const projectReportController = require('./controllers/projectreport.controller')
const projectCommentController = require('./controllers/projectcomment.controller')

const taskController = require('./controllers/task.controller')
const taskAssignedController = require('./controllers/taskassigned.controller')
const taskReportController = require('./controllers/taskreport.controller')
const taskCommentController = require('./controllers/taskcomment.controller')

const ApiError = require('./api-error')

const app = express()

const upload = multer({
    dest: './public/'
})

app.use(cors())
app.use('/public', express.static(path.join(__dirname + '/../public')))
app.use(express.json())

app.get('/', (req, res) => {
    res.json({ messsage: 'Welcome to howwork-backend' })
})

app.route('/api/account/login').post(accountController.login)
app.route('/api/account/forgot-password').post(accountController.forgotPassword)

app.route('/api/user/projects/:username').get(projectAssignedController.all)
app.route('/api/user/project/:project_id').get(projectController.detail)

app.route('/api/user/tasks/:username').get(taskAssignedController.all)
app.route('/api/user/task/:task_id').get(taskController.detail)

app.route('/api/user/summary/:content').get(personController.summary)

app.route('/api/user/information/:username')
    .get(personController.information)
    .put(personController.changeInformation)
app.route('/api/user/password/:username').put(accountController.changePassword)
app.route('/api/user/key/:username').put(accountController.changeKey)

// app.route('/api/user/notifications/:username').get(personController.notifications)

app.route('/api/admin/job')
    .post(jobController.create)
app.route('/api/admin/jobs')
    .get(jobController.all)
app.route('/api/admin/job/:job_id')
    .get(jobController.detail)
    .put(jobController.update)
    .delete(jobController.delete)

app.route('/api/admin/project')
    .post(projectController.create)
app.route('/api/admin/projects')
    .get(projectController.all)
app.route('/api/admin/project/:project_id')
    .get(projectController.detail)
    .put(projectController.update)
    .delete(projectController.delete)

app.route('/api/admin/task')
    .post(taskController.create)
app.route('/api/admin/tasks')
    .get(taskController.all)
app.route('/api/admin/task/:task_id')
    .get(taskController.detail)
    .put(taskController.update)
    .delete(taskController.delete)

app.route('/api/admin/users').post(personController.create)
app.route('/api/admin/user/:username').delete(accountController.delete)
app.route('/api/admin/admin').post(personController.create)

app.route('/api/admin/summary/:content').get(personController.summary)

app.route('/api/admin/information/:username')
    .get(personController.information)
    .put(personController.changeInformation)
app.route('/api/admin/password/:username').put(accountController.changePassword)
app.route('/api/admin/key/:username').put(accountController.changeKey)

// app.route('/api/admin/notifications/:username').get(personController.notifications)

app.route('/api/admin/project/report/:project_id')
    .get(projectReportController.detail)
    .put(projectReportController.update)
    .delete(projectReportController.delete)
    .post(projectReportController.create)

app.route('/api/user/task/report/:task_id')
    .post(taskReportController.create)
    .get(taskReportController.detail)
    .delete(taskReportController.delete)
    .put(taskReportController.update)

app.route('/api/project/comment')
    .post(projectCommentController.create)
app.route('/api/project/comment/:comment_id')
    .delete(projectCommentController.delete)
    .put(projectCommentController.update)
app.route('/api/project/comments/:project_id')
    .get(projectCommentController.all)

app.route('/api/task/comment')
    .post(taskCommentController.create)
app.route('/api/task/comment/:comment_id')
    .delete(taskCommentController.delete)
    .put(taskCommentController.update)
app.route('/api/task/comments/:task_id')
    .get(taskCommentController.all)

app.use((req, res, next) => {
    return next(new ApiError(404, 'Resource not found'))
})

app.use((error, req, res, next) => {
    return res.status(error.statusCode || 500).json({
        message: error.message || 'Internal Server Error',
    })
})

module.exports = app
