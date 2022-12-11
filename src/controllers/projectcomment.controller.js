const ProjectCommentService = require('../services/projectcomment.service')
const ApiError = require('../api-error')

exports.all = async (req, res, next) => {
    let comments = []

    try {
        const projectCommentService = new ProjectCommentService()
        comments = await projectCommentService.all(req.params.project_id)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while retrieving comments of project')
        )
    }

    return res.send(comments)
}

exports.create = async (req, res, next) => {
    try {
        const projectCommentService = new ProjectCommentService()
        const comment = await projectCommentService.create(req.body)
        return res.send(comment)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while creating the comment project')
        )
    }
}

exports.delete = async (req, res, next) => {
    try {
        const projectCommentService = new ProjectCommentService();
        const deleted = await projectCommentService.delete(req.params.comment_id)
        if (!deleted) {
            return next(new ApiError(404, 'Comment not found'))
        }
        return res.send({ message: 'Comment was deleted successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Could not deleted comment with id=${req.params.comment_id}`
            )
        )
    }
}

exports.update = async (req, res, next) => {
    if (Object.keys(req.body).length === 0) {
        return next(new ApiError(400, 'Data to update can not be empty'))
    }

    try {
        const projectCommentService = new ProjectCommentService()
        const updated = await projectCommentService.update(req.params.comment_id, req.body)
        if (!updated) {
            return next(new ApiError(404, 'Comment not found'))
        }
        return res.send({ message: 'Comment was updated successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, `Error updating comment with id=${req.params.comment_id}`)
        )
    }
}
