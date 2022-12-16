const TaskReportService = require('../services/taskreport.service')
const ApiError = require('../api-error')

exports.create = async (req, res, next) => {
    try {
        const taskReportService = new TaskReportService()
        const report = await taskReportService.create(req.body)
        return res.send(report)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while creating the task report')
        )
    }
}

exports.detail = async (req, res, next) => {
    try {
        const taskReportService = new TaskReportService()
        const report = await taskReportService.findBytask(req.params.task_id)
        if (!report) {
            return res.send()
        }
        return res.send(report)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Error retrieving task report with id=${req.params.task_id}`
            )
        )
    }
}

exports.delete = async (req, res, next) => {
    try {
        const taskReportService = new TaskReportService();
        const deleted = await taskReportService.delete(req.params.task_id)
        if (!deleted) {
            return next(new ApiError(404, 'Task report not found'))
        }
        return res.send({ message: 'Task report was deleted successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Could not deleted task report with id=${req.params.task_id}`
            )
        )
    }
}
