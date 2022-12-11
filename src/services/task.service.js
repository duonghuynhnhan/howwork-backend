const knex = require('../database/knex')
const moment = require("moment")

class TaskService {
    constructor() {
        this.tasks = knex('tasks')
    }

    #getTask(payload) {
        const task = { ...payload }
        const taskProperties = [
            'id',
            'name',
            'description',
            'memberof',
            'start',
            'end',
            'time',
            'createddate',
            'completeddate',
            'updateddate',
            'completedstate',
            'state',
            'note',
        ]

        Object.keys(task).forEach(function (key) {
            if (taskProperties.indexOf(key) == -1) {
                delete task[key]
            }
        })

        return task
    }

    async all() {
        return await this.tasks.select('*')
    }

    async create(payload) {
        const task = this.#getTask(payload)
        const [id] = await this.tasks.insert(task)
        return { id, ...task }
    }

    async findById(id) {
        return await this.tasks.where('id', id).select('*').first()
    }

    async update(id, payload) {
        const update = this.#getTask(payload)
        update.updateddate = moment().format('DD/MM/YYYY HH:mm:ss')
        return await this.tasks.where('id', id).update(update)
    }

    async delete(id) {
        return await this.tasks.where('id', id).del()
    }
}

module.exports = TaskService
