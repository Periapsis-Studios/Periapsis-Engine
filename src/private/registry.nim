import
  button,
  ui,
  scene,
  entity,
  dropdown,
  textField,
  sdl2_nim / sdl

var
  entities*: seq[ptr Entity]
  sceneVar*: ptr Scene
  renderer*: Renderer
  buttons*: seq[ptr UiButton]
  dropdowns*: seq[ptr UiDropdown]
  textFields*: seq[ptr UiTextField]
  scenes: seq[ptr Scene]



proc register*(entity: Entity) =
  entities.add(addr(entity))

proc register*(button: UiButton) =
  buttons.add(addr(button))

proc register*(dropdown: UiDropdown) =
  dropdowns.add(addr(dropdown))

proc register*(textField: UiTextField) =
  textFields.add(addr(textField))

proc setActive*(sceneIn: Scene) =
  var sceneRegistered: bool = false
  for scene in scenes:
    if scene == addr(sceneIn) and not sceneRegistered:
      sceneRegistered = true

  entities = newSeq[ptr Entity]()
  buttons = newSeq[ptr UiButton]()
  sceneVar[].hide()

  for entity in sceneIn.entities:
    entity.register()

  for ui in sceneIn.ui:
    for button in ui.buttons:
      button.register()

    for dropdown in ui.dropdowns:
      dropdown.register()

    for textField in ui.textFields:
      textField.register()

  sceneVar = addr(sceneIn)
  sceneVar[].show()




proc isRegistered*(entityIn: Entity): bool =
  for entity in entities:
    if entity == addr(entityIn):
      return true
  return false

proc isCurrent*(sceneIn: Scene): bool =
  if addr(sceneIn) == sceneVar:
    return true
  return false

proc isRegistered*(buttonIn: UiButton): bool =
  for button in buttons:
    if button == addr(buttonIn):
      return true
  return false

proc isRegistered*(dropdownIn: UiDropdown): bool =
  for dropdown in dropdowns:
    if dropdown == addr(dropdownIn):
      return true
  return false

proc isRegistered*(textFieldIn: UiTextField): bool =
  for textField in textFields:
    if textField == addr(textFieldIn):
      return true
  return false



proc deRegister*(entityIn: Entity): bool =
  for i in 0 ..< entities.len:
    if entities[i] == addr(entityIn):
      entities.del(i)
      return true
  return false

proc deRegister*(buttonIn: UiButton): bool =
  for i in 0 ..< buttons.len:
    if buttons[i] == addr(buttonIn):
      buttons.del(i)
      return true
  return false

proc deRegister*(dropdownIn: UiDropdown): bool =
  for i in 0 ..< dropdowns.len:
    if dropdowns[i] == addr(dropdownIn):
      dropdowns.del(i)
      return true
  return false

proc deRegister*(textFieldIn: UiTextField): bool =
  for i in 0 ..< textFields.len:
    if textFields[i] == addr(textFieldIn):
      textFields.del(i)
      return true
  return false

proc deRegister*(sceneIn: Scene): bool =
  for i in 0 ..< scenes.len:
    if scenes[i] == addr(sceneIn):
      scenes.del(i)
      return true
  return false