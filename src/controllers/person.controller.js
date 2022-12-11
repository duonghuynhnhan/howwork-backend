const PersonService = require('../services/person.service')
const AccountService = require('../services/account.service')
const ApiError = require('../api-error')

exports.home = (req, res, next) => {
    return res.send({ message: 'admin Home' })
}

exports.create = async (req, res, next) => {
    try {
        const personService = new PersonService()
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
        const person = await personService.create(personInfo)
        return res.send(person)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while creating the person')
        )
    }
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
