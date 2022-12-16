const TaskCommentService = require('../services/taskcomment.service')
const ApiError = require('../api-error')

exports.all = async (req, res, next) => {
    let comments = []

    try {
        const taskCommentService = new TaskCommentService()
        comments = await taskCommentService.all(req.params.task_id)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while retrieving comments of task')
        )
    }

    return res.send(comments)
}

exports.create = async (req, res, next) => {
    try {
        const taskCommentService = new TaskCommentService()
        const comment = await taskCommentService.create(req.body)
        return res.send(comment)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while creating the comment task')
        )
    }
}

exports.delete = async (req, res, next) => {
    try {
        const taskCommentService = new TaskCommentService();
        const deleted = await taskCommentService.delete(req.params.comment_id)
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
