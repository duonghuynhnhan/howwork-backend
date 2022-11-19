const express = require('express')
const cors = require('cors')

const accountController = require('./controllers/account.controller')
const userController = require('./controllers/user.controller')
const adminController = require('./controllers/admin.controller')
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
app.route('/api/user/home').get(userController.userHome)

// userProjects
app.route('/api/user/projects').get(userController.userProjects)
app.route('/api/user/project-detail').get(userController.userProjectDetail)

// userTasks
app.route('/api/user/tasks').get(userController.userTasks)
app.route('/api/user/task-detail').get(userController.userTaskDetail)

// userSummary
app.route('/api/user/summary').get(userController.userSummary)

// userInfo
app.route('/api/user/information').get(userController.userInformation)
app.route('/api/user/change-information/:id').put(userController.userChangeInformation)
app.route('/api/user/change-password/:id').put(userController.userChangePassword)
app.route('/api/user/change-key/:id').put(userController.userChangeKey)

// userNotifications
app.route('/api/user/notifications').get(userController.userNotifications)

// ADMIN
// adminHome
app.route('/api/admin/home').get(adminController.adminHome)

// adminProjects
app.route('/api/admin/create-project').post(adminController.adminCreateProject)
app.route('/api/admin/projects').get(adminController.adminProjects)
app.route('/api/admin/project-detail').get(adminController.adminProjectDetail)
app.route('/api/admin/edit-project/:id').put(adminController.adminEditProject)
app.route('/api/admin/delete-project/:id').delete(adminController.adminDeleteProject)

// adminTasks
app.route('/api/admin/create-task').post(adminController.adminCreateTask)
app.route('/api/admin/tasks').get(adminController.adminTasks)
app.route('/api/admin/task-detail').get(adminController.adminTaskDetail)
app.route('/api/admin/edit-task/:id').put(adminController.adminEditTask)
app.route('/api/admin/delete-task/:id').delete(adminController.adminDeleteTask)

// adminAccounts
app.route('/api/admin/create-user').post(adminController.adminCreateUser)
app.route('/api/admin/delete-user/:id').delete(adminController.adminDeleteUser)
app.route('/api/admin/create-admin').post(adminController.adminCreateAdmin)

// adminSummary
app.route('/api/admin/summary').get(adminController.adminSummary)

// adminInfo
app.route('/api/admin/information').get(adminController.adminInformation)
app.route('/api/admin/change-information/:id').put(adminController.adminChangeInformation)
app.route('/api/admin/change-password/:id').put(adminController.adminChangePassword)
app.route('/api/admin/change-key/:id').put(adminController.adminChangeKey)

// adminNotifications
app.route('/api/admin/notifications').get(adminController.adminNotifications)

app.use((req, res, next) => {
    return next(new ApiError(404, 'Resource not found'))
})

app.use((error, req, res, next) => {
    return res.status(error.statusCode || 500).json({
        message: error.message || 'Internal Server Error',
    })
})

module.exports = app
