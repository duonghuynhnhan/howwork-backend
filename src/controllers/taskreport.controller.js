exports.add = (req, res, next) => {
    return res.send({ message: 'Create Task Report' })
}

exports.detail = (req, res, next) => {
    return res.send({ message: 'Task Report Detail'})
}

exports.edit = (req, res, next) => {
    return res.send({ message: 'Task Report Edit' })
}

exports.delete = (req, res, next) => {
    return res.send({ message: 'Task Report Delete' })
}