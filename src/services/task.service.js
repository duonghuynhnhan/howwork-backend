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
            'note',
        ]

        Object.keys(task).forEach(function (key) {
            if (taskProperties.indexOf(key) == -1) {
                delete task[key]
            }
        })

        return task
    }

    async all(project_id) {
        return await this.tasks.where('memberof', project_id).select('*')
    }

    async create(payload) {
        const task = this.#getTask(payload)
        const [id] = await this.tasks.insert(task)
        return { id, ...task }
    }

    async findById(id) {
        return await this.tasks
                            .join('taskassigned', 'taskassigned.task', 'tasks.id')
                            .join('projects', 'tasks.memberof', 'projects.id')
                            .join('accounts', 'taskassigned.user', 'accounts.username')
                            .join('persons', 'accounts.person', 'persons.id')
                            .where('tasks.id', id)
                            .select('projects.leader', 'persons.fullname', 'accounts.username', 'tasks.id', 'tasks.name', 'tasks.description', 'tasks.memberof', 'tasks.start', 'tasks.end', 'tasks.time', 'tasks.createddate', 'tasks.completeddate', 'tasks.updateddate', 'tasks.completedstate', 'tasks.note',)
                            .first()
    }

    async update(id, payload) {
        const update = this.#getTask(payload)
        update.updateddate = moment().format('DD/MM/YYYY HH:mm:ss')
        console.log(update)
        return await this.tasks.where('id', id).update(update)
    }
}

module.exports = TaskService
