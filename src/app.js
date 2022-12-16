const express = require('express')
const cors = require('cors')
const path = require('path')

const personController = require('./controllers/person.controller')
const accountController = require('./controllers/account.controller')

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
app.use(cors())
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

app.route('/api/users/information')
    .get(personController.allInformation)
app.route('/api/user/information/:username')
    .get(personController.information)
    .put(personController.changeInformation)
app.route('/api/user/password/:username').put(accountController.changePassword)
app.route('/api/user/key/:username').put(accountController.changeKey)

app.route('/api/project')
    .post(projectController.create)
app.route('/api/projects')
    .get(projectController.all)
app.route('/api/project/:project_id')
    .get(projectController.detail)
    .put(projectController.update)

app.route('/api/task')
    .post(taskController.create)
app.route('/api/tasks/:project_id')
    .get(taskController.all)
app.route('/api/task/:task_id')
    .get(taskController.detail)
    .put(taskController.update)

app.route('/api/user').post(personController.create)
app.route('/api/admin').post(personController.create)

app.route('/api/admin/summary/:content').get(personController.summary)

app.route('/api/admin/information/:username')
    .get(personController.information)
    .put(personController.changeInformation)
app.route('/api/admin/password/:username').put(accountController.changePassword)
app.route('/api/admin/key/:username').put(accountController.changeKey)

app.route('/api/project/report')
    .post(projectReportController.create)
app.route('/api/project/report/:project_id')
    .get(projectReportController.detail)
    .delete(projectReportController.delete)

app.route('/api/task/report')
    .post(taskReportController.create)
app.route('/api/task/report/:task_id')
    .get(taskReportController.detail)
    .delete(taskReportController.delete)

app.route('/api/project/assigned').post(projectAssignedController.create)
app.route('/api/project/assigned/:project_id').get(projectAssignedController.allMember)
app.route('/api/task/assigned').post(taskAssignedController.create)

app.route('/api/project/comment')
    .post(projectCommentController.create)
app.route('/api/project/comment/:comment_id')
    .delete(projectCommentController.delete)
app.route('/api/project/comments/:project_id')
    .get(projectCommentController.all)

app.route('/api/task/comment')
    .post(taskCommentController.create)
app.route('/api/task/comment/:comment_id')
    .delete(taskCommentController.delete)
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
