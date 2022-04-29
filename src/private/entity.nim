import
  imageGraphic,
  vector,
  textgraphic

type
  Entity* = ref object of RootObj
    pos*: Vector2
    graphic*: Graphic
    text*: TextGraphic



method update*(entity: var Entity) {.base.} =
  discard



method remove*(entity: var Entity) {.base.} =
  entity.graphic.remove()