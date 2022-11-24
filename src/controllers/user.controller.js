exports.home = (req, res, next) => {
    return res.send({ message: 'userHome' })
}

exports.summary = (req, res, next) => {
    return res.send({ message: 'userSummary' })
}

exports.information = (req, res, next) => {
    return res.send({ message: 'userInformation' })
}

exports.changeInformation = (req, res, next) => {
    return res.send({ message: 'userChangeInformation' })
}

exports.create = (req, res, next) => {
    return res.send({ message: 'Create User' })
}

exports.delete = (req, res, next) => {
    return res.send({ message: 'Delete User' })
}

exports.notifications = (req, res, next) => {
    return res.send({ message: 'userNotifications' })
}
