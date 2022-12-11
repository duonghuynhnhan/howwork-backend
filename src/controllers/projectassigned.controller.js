const ProjectAssignedService = require('../services/projectassigned.service')
const ApiError = require('../api-error')

exports.all = async (req, res, next) => {
    let projects = []

    try {
        const projectAssignedService = new ProjectAssignedService()
        projects = await projectAssignedService.all(req.params.username)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while retrieving project assigned')
        )
    }

    return res.send(projects)
}

exports.detail = (req, res, next) => {
    return res.send({ message: 'Detail Assigned Projects' })
}
