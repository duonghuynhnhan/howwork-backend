const knex = require('../database/knex')
const moment = require("moment")

class ProjectService {
    constructor() {
        this.projects = knex('projects')
    }

    #getProject(payload) {
        const project = { ...payload }
        const projectProperties = [
            'id',
            'name',
            'description',
            'start',
            'end',
            'time',
            'createddate',
            'completeddate',
            'updateddate',
            'leader',
            'completedstate',
            'note',
        ]

        Object.keys(project).forEach(function (key) {
            if (projectProperties.indexOf(key) == -1) {
                delete project[key]
            }
        })

        return project
    }

    async all() {
        return await this.projects
                        .join('accounts', 'accounts.username', 'projects.leader')
                        .join('persons', 'accounts.person', 'persons.id')
                        .select('projects.id','projects.name', 'projects.description', 'projects.start', 'projects.end', 'projects.time', 'projects.createddate', 'projects.completeddate', 'projects.updateddate', 'projects.leader', 'projects.completedstate', 'projects.note', 'persons.fullname')
    }

    async create(payload) {
        const project = this.#getProject(payload)
        const [id] = await this.projects.insert(project)
        return { id, ...project }
    }

    async findById(id) {
        return await this.projects.where('id', id).select('*').first()
    }

    async update(id, payload) {
        const update = this.#getProject(payload)
        update.updateddate = moment().format('DD/MM/YYYY HH:mm:ss')
        return await this.projects.where('id', id).update(update)
    }
}

module.exports = ProjectService
