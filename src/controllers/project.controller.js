const ProjectService = require('../services/project.service')
const ApiError = require('../api-error')

exports.create = (req, res, next) => {
    return res.send({ message: 'Create Project' })
}

exports.detail = (req, res, next) => {
    return res.send({ message: 'Project Detail'})
}

exports.edit = (req, res, next) => {
    return res.send({ message: 'Project Edit' })
}

exports.delete = (req, res, next) => {
    return res.send({ message: 'Project Delete' })
}

exports.all = async (req, res, next) => {
    let projects = []

    try {
        const projectService = new ProjectService()
        projects = await projectService.all()
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while retrieving projects')
        )
    }

    return res.send(projects)
}
