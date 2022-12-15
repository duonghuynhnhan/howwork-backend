const ProjectReportService = require('../services/projectreport.service')
const ApiError = require('../api-error')

exports.create = async (req, res, next) => {
    try {
        const projectReportService = new ProjectReportService()
        const report = await projectReportService.create(req.body)
        return res.send(report)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while creating the project report')
        )
    }
}

exports.detail = async (req, res, next) => {
    try {
        const projectReportService = new ProjectReportService()
        const report = await projectReportService.findByProject(req.params.project_id)
        if (!report) {
            return res.send()
        }
        return res.send(report)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Error retrieving project report with id=${req.params.project_id}`
            )
        )
    }
}

exports.update = (req, res, next) => {
    return res.send({ message: 'Project Report Edit' })
}

exports.delete = async (req, res, next) => {
    try {
        const projectReportService = new ProjectReportService();
        const deleted = await projectReportService.delete(req.params.project_id)
        if (!deleted) {
            return next(new ApiError(404, 'Project report not found'))
        }
        return res.send({ message: 'Project report was deleted successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Could not deleted project report with id=${req.params.project_id}`
            )
        )
    }
}
