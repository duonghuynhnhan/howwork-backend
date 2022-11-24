const express = require('express')
const cors = require('cors')

const accountController = require('./controllers/account.controller')

const adminController = require('./controllers/admin.controller')
const adminAccountController = require('./controllers/adminaccount.controller')

const userController = require('./controllers/user.controller')
const userAccountController = require('./controllers/useraccount.controller')

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

app.use(cors())
app.use(express.json())

app.get('/', (req, res) => {
    res.json({ messsage: 'Welcome to howwork-backend' })
})

// ACCOUNT
app.route('/api/account/login').post(accountController.login)
app.route('/api/account/forgot-password').post(accountController.forgotPassword)

// USER
// userHome
app.route('/api/user/home').get(userController.home)

// userProjects
app.route('/api/user/all-projects/:username').get(projectAssignedController.all)
app.route('/api/user/detail-project/:project_id').get(projectController.detail)

// userTasks
app.route('/api/user/all-tasks/:username').get(taskAssignedController.all)
app.route('/api/user/detail-task/:task_id').get(taskController.detail)

// userSummary
app.route('/api/user/summary/:content').get(userController.summary)

// userInfo
app.route('/api/user/information/:username').get(userController.information)
app.route('/api/user/change-information/:username').put(userController.changeInformation)
app.route('/api/user/change-password/:username').put(userAccountController.changePassword)
app.route('/api/user/change-key/:username').put(userAccountController.changeKey)

// userNotifications
app.route('/api/user/notifications/:username').get(userController.notifications)

// ADMIN
// adminHome
app.route('/api/admin/home').get(adminController.home)

// adminProjects
app.route('/api/admin/create-project').post(projectController.create)
app.route('/api/admin/all-projects').get(projectController.all)
app.route('/api/admin/project-detail/:project_id').get(projectController.detail)
app.route('/api/admin/edit-project/:project_id').put(projectController.edit)
app.route('/api/admin/delete-project/:project_id').delete(projectController.delete)

// adminTasks
app.route('/api/admin/create-task').post(taskController.create)
app.route('/api/admin/all-tasks').get(taskController.all)
app.route('/api/admin/task-detail/:task_id').get(taskController.detail)
app.route('/api/admin/edit-task/:task_id').put(taskController.edit)
app.route('/api/admin/delete-task/:task_id').delete(taskController.delete)

// adminAccounts
app.route('/api/admin/create-user').post(userController.create)
app.route('/api/admin/delete-user/:username').delete(userController.delete)
app.route('/api/admin/create-admin').post(adminController.create)

// adminSummary
app.route('/api/admin/summary/:content').get(adminController.summary)

// adminInfo
app.route('/api/admin/information/:username').get(adminController.information)
app.route('/api/admin/change-information/:username').put(adminController.changeInformation)
app.route('/api/admin/change-password/:username').put(adminAccountController.changePassword)
app.route('/api/admin/change-key/:username').put(adminAccountController.changeKey)

// adminNotifications
app.route('/api/admin/notifications/:username').get(adminController.notifications)

// Jobs
app.route('/api/job/all-jobs/').get(jobController.all)
app.route('/api/job/detail-job/:job_id').get(jobController.detail)
app.route('/api/job/create-job').post(jobController.create)
app.route('/api/job/edit-job/:job_id').put(jobController.edit)
app.route('/api/job/delete-job/:job_id').delete(jobController.delete)

// Reports
app.route('/api/project/report/:project_id').get(projectReportController.detail)
app.route('/api/project/add-report').post(projectReportController.add)
app.route('/api/project/edit-report/:project_id').put(projectReportController.edit)
app.route('/api/project/delete-report/:project_id').delete(projectReportController.delete)

app.route('/api/task/report/:task_id').get(taskReportController.detail)
app.route('/api/task/add-report').post(taskReportController.add)
app.route('/api/task/edit-report/:task_id').put(taskReportController.edit)
app.route('/api/task/delete-report/:task_id').delete(taskReportController.delete)

// Comments
app.route('/api/project/comment/:project_id').get(projectCommentController.all)
app.route('/api/task/comment/:project_id').get(taskCommentController.all)

app.use((req, res, next) => {
    return next(new ApiError(404, 'Resource not found'))
})

app.use((error, req, res, next) => {
    return res.status(error.statusCode || 500).json({
        message: error.message || 'Internal Server Error',
    })
})

module.exports = app
