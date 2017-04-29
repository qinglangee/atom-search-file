FindHistoryView = require './atom-search-file-view'
{CompositeDisposable} = require 'atom'
fs = require 'fs'

module.exports = FindHistory =
  findHistoryView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @findHistoryView = new FindHistoryView(state.findHistoryViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @findHistoryView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-search-file:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @findHistoryView.destroy()

  serialize: ->
    findHistoryViewState: @findHistoryView.serialize()

  toggle: ->
    console.log 'FindHistory was toggled!'
    mainView = @findHistoryView
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      fs.readFile '/home/zhch/temp/d3/aa', (err,data)->
        if err
          throw err
        console.log data
        mainView.setContent data
      console.log "out data"
      @modalPanel.show()
