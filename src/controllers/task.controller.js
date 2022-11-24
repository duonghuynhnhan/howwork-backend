exports.create = (req, res, next) => {
    return res.send({ message: 'Create Task' })
}

exports.detail = (req, res, next) => {
    return res.send({ message: 'Task Detail'})
}

exports.edit = (req, res, next) => {
    return res.send({ message: 'Task Edit' })
}

exports.delete = (req, res, next) => {
    return res.send({ message: 'Task Delete' })
}

exports.all = (req, res, next) => {
    return res.send({ message: 'All Task'})
}
