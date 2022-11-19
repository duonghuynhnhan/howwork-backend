const express = require('express')
const cors = require('cors')

const howworkController = require('./controllers/howwork.controller')
const ApiError = require('./api-error')

const app = express()

app.use(cors())
app.use(express.json())

app.get('/', (req, res) => {
    res.json({ messsage: 'Welcome to howwork-backend' })
})

// ACCOUNT
app.route('/api/account/login').post(howworkController.login)
app.route('/api/account/forgot-password').post(howworkController.forgotPassword)

// USER
// userHome
app.route('/api/user/home').get(howworkController.userHome)

// userProjects
app.route('/api/user/projects').get(howworkController.userProjects)
app.route('/api/user/project-detail').get(howworkController.userProjectDetail)

// userTasks
app.route('/api/user/tasks').get(howworkController.userTasks)
app.route('/api/user/task-detail').get(howworkController.userTaskDetail)

// userSummary
app.route('/api/user/summary').get(howworkController.userSummary)

// userInfo
app.route('/api/user/information').get(howworkController.userInformation)
app.route('/api/user/change-information/:id').put(howworkController.userChangeInformation)
app.route('/api/user/change-password/:id').put(howworkController.userChangePassword)
app.route('/api/user/change-key/:id').put(howworkController.userChangeKey)

// userNotifications
app.route('/api/user/notifications').get(howworkController.userNotifications)

// ADMIN
// adminHome
app.route('/api/admin/home').get(howworkController.adminHome)

// adminProjects
app.route('/api/admin/create-project').post(howworkController.adminCreateProject)
app.route('/api/admin/projects').get(howworkController.adminProjects)
app.route('/api/admin/project-detail').get(howworkController.adminProjectDetail)
app.route('/api/admin/edit-project/:id').put(howworkController.adminEditProject)
app.route('/api/admin/delete-project/:id').delete(howworkController.adminDeleteProject)

// adminTasks
app.route('/api/admin/create-task').post(howworkController.adminCreateTask)
app.route('/api/admin/tasks').get(howworkController.adminTasks)
app.route('/api/admin/task-detail').get(howworkController.adminTaskDetail)
app.route('/api/admin/edit-task/:id').put(howworkController.adminEditTask)
app.route('/api/admin/delete-task/:id').delete(howworkController.adminDeleteTask)

// adminAccounts
app.route('/api/admin/create-user').post(howworkController.adminCreateUser)
app.route('/api/admin/delete-user/:id').delete(howworkController.adminDeleteUser)
app.route('/api/admin/create-admin').post(howworkController.adminCreateAdmin)

// adminSummary
app.route('/api/admin/summary').get(howworkController.adminSummary)

// adminInfo
app.route('/api/admin/information').get(howworkController.adminInformation)
app.route('/api/admin/change-information/:id').put(howworkController.adminChangeInformation)
app.route('/api/admin/change-password/:id').put(howworkController.adminChangePassword)
app.route('/api/admin/change-key/:id').put(howworkController.adminChangeKey)

// adminNotifications
app.route('/api/admin/notifications').get(howworkController.adminNotifications)

app.use((req, res, next) => {
    return next(new ApiError(404, 'Resource not found'))
})

app.use((error, req, res, next) => {
    return res.status(error.statusCode || 500).json({
        message: error.message || 'Internal Server Error',
    })
})

module.exports = app
