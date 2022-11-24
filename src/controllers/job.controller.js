exports.create = (req, res, next) => {
    return res.send({ message: 'Create Job' })
}

exports.detail = (req, res, next) => {
    return res.send({ message: 'Job Detail'})
}

exports.edit = (req, res, next) => {
    return res.send({ message: 'Job Edit' })
}

exports.delete = (req, res, next) => {
    return res.send({ message: 'Job Delete' })
}

exports.all = (req, res, next) => {
    return res.send({ message: 'All Jobs'})
}
