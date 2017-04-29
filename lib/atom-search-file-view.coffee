module.exports =
class FindHistoryView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('atom-search-file')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The FindHistory package is Alive! It's ALIVE!" + @getName()
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
  getName: ->
    "abhaha"
  setContent:(content) ->
    @element.children[0].textContent = content
