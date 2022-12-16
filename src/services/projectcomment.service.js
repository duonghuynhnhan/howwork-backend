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
        return await this.projectcomments
                                        .join('accounts', 'projectcomment.who', 'accounts.username')
                                        .join('persons', 'accounts.person', 'persons.id')
                                        .where('projectcomment.project', id)
                                        .select('projectcomment.id', 'projectcomment.project', 'projectcomment.comment', 'projectcomment.who', 'projectcomment.time', 'persons.fullname')
                                        .orderBy('projectcomment.id')
    }

    async create(payload) {
        const comment = this.#getProjectComment(payload)
        comment.time = moment().format('DD/MM/YYYY HH:mm:ss')
        const [id] = await this.projectcomments.insert(comment)
        return { id, ...comment }
    }

    async delete(id) {
        return await this.projectcomments.where('id', id).del()
    }
}

module.exports = ProjectComment