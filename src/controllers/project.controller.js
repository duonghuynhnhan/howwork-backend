const ProjectService = require('../services/project.service')
const ApiError = require('../api-error')

exports.create = async (req, res, next) => {
    try {
        const projectService = new ProjectService()
        const project = await projectService.create(req.body)
        return res.send(project)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while creating the project')
        )
    }
}

exports.detail = async (req, res, next) => {
    try {
        const projectService = new ProjectService()
        const project = await projectService.findById(req.params.project_id)
        if (!project) {
            return next(new ApiError(404, 'Project not found'))
        }
        return res.send(project)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Error retrieving project with id=${req.params.project_id}`
            )
        )
    }
}

exports.update = async (req, res, next) => {
    if (Object.keys(req.body).length === 0) {
        return next(new ApiError(400, 'Data to update can not be empty'))
    }

    try {
        const projectService = new ProjectService()
        const updated = await projectService.update(req.params.project_id, req.body)
        if (!updated) {
            return next(new ApiError(404, 'Project not found'))
        }
        return res.send({ message: 'Project was updated successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, `Error updating project with id=${req.params.project_id}`)
        )
    }
}

exports.delete = async (req, res, next) => {
    try {
        const projectService = new ProjectService();
        const deleted = await projectService.delete(req.params.project_id)
        if (!deleted) {
            return next(new ApiError(404, 'Project not found'))
        }
        return res.send({ message: 'Project was deleted successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Could not deleted project with id=${req.params.id}`
            )
        )
    }
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
