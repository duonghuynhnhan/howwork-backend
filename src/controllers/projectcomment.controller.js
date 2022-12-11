exports.all = (req, res, next) => {
    return res.send({ message: 'All Comments Project'})
}

exports.create = (req, res, next) => {
    return res.send({ message: 'Create Comments Project'})
}

exports.delete = (req, res, next) => {
    return res.send({ message: 'Delete Comments Project'})
}

exports.update = (req, res, next) => {
    return res.send({ message: 'Update Comments Project'})
}