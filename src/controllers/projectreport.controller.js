exports.create = (req, res, next) => {
    return res.send({ message: 'Create Projecr Report' })
}

exports.detail = (req, res, next) => {
    return res.send({ message: 'Projecr Report Detail'})
}

exports.update = (req, res, next) => {
    return res.send({ message: 'Projecr Report Edit' })
}

exports.delete = (req, res, next) => {
    return res.send({ message: 'Projecr Report Delete' })
}
