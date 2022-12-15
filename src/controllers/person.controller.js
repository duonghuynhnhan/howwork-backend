const crypto = require('crypto')

const PersonService = require('../services/person.service')
const AccountService = require('../services/account.service')
const ApiError = require('../api-error')

exports.home = (req, res, next) => {
    return res.send({ message: 'admin Home' })
}

exports.create = async (req, res, next) => {
    try {
        const personService = new PersonService()
        const accountService = new AccountService()

        const personInfo = {
            'id': req.body.id,
            'fullname': req.body.fullname,
            'dob': req.body.dob,
            'sex': req.body.sex,
            'email': req.body.email,
            'phone': req.body.phone,
            'position': req.body.position,
            'unit': req.body.unit,
        }

        const accountInfo = {
            username: req.body.username,
            password: crypto.createHash('sha512').update(req.body.username).digest('hex'),
            keypass: crypto.createHash('sha256').update(req.body.username).digest('hex'),
            role: req.body.role,
            person: req.body.id,
        }

        const person = await personService.create(personInfo)
        const account = await accountService.create(accountInfo)
        return res.send({ ...person, ...account })
    } catch (error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while creating the person')
        )
    }
}

exports.summary = (req, res, next) => {
    return res.send({ message: 'adminSummary' })
}

exports.information = async (req, res, next) => {
    try {
        const personService = new PersonService()
        const person = await personService.findByUsername(req.params.username)
        if (!person) {
            return next(new ApiError(404, 'Person not found'))
        }
        return res.send(person)
    } catch (error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Error retrieving person with id=${req.params.username}`
            )
        )
    }
}

exports.allInformation = async (req, res, next) => {
    try {
        const personService = new PersonService()
        const person = await personService.findAll()
        if (!person) {
            return next(new ApiError(404, 'Person not found'))
        }
        return res.send(person)
    } catch (error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Error retrieving`
            )
        )
    }
}

exports.changeInformation = async (req, res, next) => {
    if (Object.keys(req.body).length === 0) {
        return next(new ApiError(400, 'Data to update can not be empty'))
    }

    try {
        const personService = new PersonService()
        const updated = await personService.update(req.params.username, req.body)
        if (!updated) {
            return next(new ApiError(404, 'Person not found'))
        }
        return res.send({ message: 'Person was updated successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, `Error updating person with id=${req.params.username}`)
        )
    }
}

exports.notifications = (req, res, next) => {
    return res.send({ message: 'adminNotifications' })
}
