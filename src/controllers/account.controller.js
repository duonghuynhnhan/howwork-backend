const crypto = require('crypto')

const AccountService = require('../services/account.service')     
const ApiError = require('../api-error')

exports.login = async (req, res, next) => {
    const username = req.body.username
    const password = req.body.password

    const accountService = new AccountService()
    const isExisted = await accountService.findByUsername(username)

    if (isExisted) {
        if (isExisted.password === crypto.createHash('sha512').update(password).digest('hex'))
            res.send({ message: 'Success', username, role: isExisted.role })
        else
            res.send({ message: 'Wrong password' })
    } else {
        res.send({ message: 'Username does not valid' })
    }
}

exports.forgotPassword = async (req, res, next) => {
    const username = req.body.username
    const keypass = req.body.keypass

    const accountService = new AccountService()
    const isExisted = await accountService.findByUsername(username)

    if (isExisted) {
        if (isExisted.keypass === crypto.createHash('sha256').update(keypass).digest('hex'))
            res.send({ message: 'Success' })
        else
            res.send({ message: 'Wrong key' })
    } else {
        res.send({ message: 'Username does not valid' })
    }
}

exports.changePassword = async (req, res, next) => {
    if (Object.keys(req.body).length === 0) {
        return next(new ApiError(400, 'Data to update can not be empty'))
    }

    const newPassword = crypto.createHash('sha512').update(req.body.password).digest('hex')

    try {
        const accountService = new AccountService()
        const updated = await accountService.update(req.params.username, {password: newPassword})
        if (!updated) {
            return next(new ApiError(404, 'Account not found'))
        }
        return res.send({ message: 'Account was updated successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, `Error updating account with id=${req.params.username}`)
        )
    }
}

exports.changeKey = async (req, res, next) => {
    if (Object.keys(req.body).length === 0) {
        return next(new ApiError(400, 'Data to update can not be empty'))
    }

    const newKeyPass = crypto.createHash('sha256').update(req.body.keypass).digest('hex')
    
    try {
        const accountService = new AccountService()
        const updated = await accountService.update(req.params.username, {keypass: newKeyPass})
        if (!updated) {
            return next(new ApiError(404, 'Account not found'))
        }
        return res.send({ message: 'Account was updated successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, `Error updating account with id=${req.params.username}`)
        )
    }
}

 exports.delete = async (req, res, next) => {
    try {
        const accountService = new AccountService();
        const deleted = await accountService.delete(req.params.username)
        if (!deleted) {
            return next(new ApiError(404, 'Account not found'))
        }
        return res.send({ message: 'Account was deleted successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Could not deleted account with id=${req.params.username}`
            )
        )
    }
}
