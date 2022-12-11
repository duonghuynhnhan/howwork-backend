const knex = require('../database/knex')
const moment = require("moment")

class ProjectComment {
    constructor() {
        this.projectcomments = knex('projectcomment')
    }

    #getProjectComment(payload) {
        const projectcomment = { ...payload }
        const projectcommentProperties = [
            'id',
            'project',
            'comment',
            'who',
            'time',
        ]

        Object.keys(projectcomment).forEach(function (key) {
            if (projectcommentProperties.indexOf(key) == -1) {
                delete projectcomment[key]
            }
        })

        return projectcomment
    }

    async all(id) {
        return await this.projectcomments.where('project', id).select('*')
    }

    async create(payload) {
        const comment = this.#getProjectComment(payload)
        comment.time = moment().format('DD/MM/YYYY HH:mm:ss')
        const [id] = await this.projectcomments.insert(comment)
        return { id, ...comment }
    }

    async update(id, payload) {
        const update = this.#getProjectComment(payload)
        update.time = moment().format('DD/MM/YYYY HH:mm:ss')
        return await this.projectcomments.where('id', id).update(update)
    }

    async delete(id) {
        return await this.projectcomments.where('id', id).del()
    }
}

module.exports = ProjectComment