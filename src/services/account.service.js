const knex = require('../database/knex')

class AccountService {
    constructor() {
        this.accounts = knex('accounts')
    }

    #getAccount(payload) {
        const account = { ...payload }
        const accountProperties = [
            'username',
            'password',
            'keypass',
            'avatar',
            'role',
            'person',
        ]

        Object.keys(account).forEach(function (key) {
            if (accountProperties.indexOf(key) == -1) {
                delete account[key]
            }
        })

        return account
    }

    async create(payload) {
        const account = this.#getAccount(payload)
        await this.accounts.insert(account)
        return { account }
    }

    async findByUsername(username) {
        return await this.accounts.where('username', username).select('*').first()
    }

    async update(username, payload) {
        const update = this.#getAccount(payload)
        return await this.accounts.where('username', username).update(update)
    }

    async delete(username) {
        return await this.accounts.where('username', username).del()
    }
}

module.exports = AccountService
