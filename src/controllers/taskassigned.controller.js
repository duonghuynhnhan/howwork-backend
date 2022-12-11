const TaskAssignedService = require('../services/taskassigned.service')
const ApiError = require('../api-error')

exports.all = async (req, res, next) => {
    let tasks = []

    try {
        const taskAssignedService = new TaskAssignedService()
        tasks = await taskAssignedService.all(req.params.username)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while retrieving project assigned')
        )
    }

    return res.send(tasks)
}

exports.detail = (req, res, next) => {
    return res.send({ message: 'Detail Assigned Tasks' })
}
