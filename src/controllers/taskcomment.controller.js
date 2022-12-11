exports.all = (req, res, next) => {
    return res.send({ message: 'All Comments Task'})
}

exports.create = (req, res, next) => {
    return res.send({ message: 'Create Comments Task'})
}

exports.delete = (req, res, next) => {
    return res.send({ message: 'Delete Comments Task'})
}

exports.update = (req, res, next) => {
    return res.send({ message: 'Update Comments Task'})
}