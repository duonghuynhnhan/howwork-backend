const knex = require('../database/knex')

class TaskAssignedService {
    constructor() {
        this.taskassigneds = knex('taskassigned')
    }

    #getTaskAssigned(payload) {
        const taskAssigned = { ...payload }
        const taskAssignedProperties = [
            'id',
            'task',
            'user',
        ]

        Object.keys(taskAssigned).forEach(function (key) {
            if (taskAssignedProperties.indexOf(key) == -1) {
                delete taskAssigned[key]
            }
        })

        return taskAssigned
    }

    async all(username) {
        return await this.taskassigneds
                                    .join('tasks', 'tasks.id', 'taskassigned.task')
                                    .where('user', username)
                                    .select('tasks.id', 'tasks.name', 'tasks.description', 'tasks.start', 'tasks.end', 'tasks.time', 'tasks.createddate', 'tasks.completeddate', 'tasks.updateddate', 'tasks.memberof', 'tasks.completedstate', 'tasks.note',)
    }

    async create(payload) {
        const data = this.#getTaskAssigned(payload)
        await this.taskassigneds.insert(data)
        return data
    }
}

module.exports = TaskAssignedService
