const TaskService = require('../services/task.service')
const ApiError = require('../api-error')

exports.create = async (req, res, next) => {
    try {
        const taskService = new TaskService()
        const task = await taskService.create(req.body)
        return res.send(task)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while creating the task')
        )
    }
}

exports.detail = async (req, res, next) => {
    try {
        
        const taskService = new TaskService()
        const task = await taskService.findById(req.params.task_id)
        if (!task) {
            return next(new ApiError(404, 'Task not found'))
        }
        return res.send(task)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Error retrieving task with id=${req.params.task_id}`
            )
        )
    }
}

exports.update = async (req, res, next) => {
    if (Object.keys(req.body).length === 0) {
        return next(new ApiError(400, 'Data to update can not be empty'))
    }

    try {
        const taskService = new TaskService()
        const updated = await taskService.update(req.params.task_id, req.body)
        if (!updated) {
            return next(new ApiError(404, 'Task not found'))
        }
        return res.send({ message: 'Task was updated successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, `Error updating task with id=${req.params.task_id}`)
        )
    }
}

exports.delete = async (req, res, next) => {
    try {
        const taskService = new TaskService();
        const deleted = await taskService.delete(req.params.task_id)
        if (!deleted) {
            return next(new ApiError(404, 'Task not found'))
        }
        return res.send({ message: 'Task was deleted successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Could not deleted task with id=${req.params.id}`
            )
        )
    }
}

exports.all = async (req, res, next) => {
    let tasks = []

    try {
        const taskService = new TaskService()
        tasks = await taskService.all()
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while retrieving tasks')
        )
    }

    return res.send(tasks)
}
