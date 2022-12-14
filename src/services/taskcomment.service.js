const knex = require('../database/knex')
const moment = require("moment")

class TaskComment {
    constructor() {
        this.taskcomments = knex('taskcomment')
    }

    #getTaskComment(payload) {
        const taskcomment = { ...payload }
        const taskcommentProperties = [
            'id',
            'task',
            'comment',
            'who',
            'time',
        ]

        Object.keys(taskcomment).forEach(function (key) {
            if (taskcommentProperties.indexOf(key) == -1) {
                delete taskcomment[key]
            }
        })

        return taskcomment
    }

    async all(id) {
        return await this.taskcomments
                                .join('accounts', 'taskcomment.who', 'accounts.username')
                                .join('persons', 'accounts.person', 'persons.id')
                                .where('taskcomment.task', id)
                                .select('taskcomment.id', 'taskcomment.task', 'taskcomment.comment', 'taskcomment.who', 'taskcomment.time', 'persons.fullname')
                                .orderBy('taskcomment.id')
    }

    async create(payload) {
        const comment = this.#getTaskComment(payload)
        comment.time = moment().format('DD/MM/YYYY HH:mm:ss')
        const [id] = await this.taskcomments.insert(comment)
        return { id, ...comment }
    }

    async update(id, payload) {
        const update = this.#getTaskComment(payload)
        update.time = moment().format('DD/MM/YYYY HH:mm:ss')
        return await this.taskcomments.where('id', id).update(update)
    }

    async delete(id) {
        return await this.taskcomments.where('id', id).del()
    }
}

module.exports = TaskComment