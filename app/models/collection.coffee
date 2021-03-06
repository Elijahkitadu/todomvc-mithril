helpers = require 'helpers'
Todo = require './model'

module.exports = class Todos
  list: []
  fetch: ->
    promise = new Promise (resolve) ->
      resolve (new Todo todo for todo in helpers.store())

    promise.then (result) =>
      @list = result

    promise

  get: (id) => _.find @list, {id}
  save: => helpers.store @list
