import
  button,
  dropdown,
  textField



type
  UI* = object of RootObj
    buttons*: seq[UiButton]
    dropdowns*: seq[UiDropdown]
    textFields*: seq[UiTextField]