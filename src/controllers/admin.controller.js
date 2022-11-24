exports.home = (req, res, next) => {
    return res.send({ message: 'admin Home' })
}

exports.create = (req, res, next) => {
    return res.send({ message: 'Create Admin'})
}

exports.summary = (req, res, next) => {
    return res.send({ message: 'adminSummary' })
}

exports.information = (req, res, next) => {
    return res.send({ message: 'adminInformation' })
}

exports.changeInformation = (req, res, next) => {
    return res.send({ message: 'adminChangeInformation' })
}

exports.notifications = (req, res, next) => {
    return res.send({ message: 'adminNotifications' })
}
