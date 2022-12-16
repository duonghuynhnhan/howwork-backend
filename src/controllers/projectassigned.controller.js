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

exports.allMember = async (req, res, next) => {
    let members = []

    try {
        const projectAssignedService = new ProjectAssignedService()
        members = await projectAssignedService.allMember(req.params.project_id)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while retrieving all project assigned')
        )
    }

    return res.send(members)
}

exports.create = async (req, res, next) => {
    try {
        const projectAssignedService = new ProjectAssignedService()
        const assign = await projectAssignedService.create(req.body)
        return res.send(assign)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while creating the assigned project')
        )
    }
}
