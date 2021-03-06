import
  entity,
  sdl2_nim / sdl,
  ui

type
  Scene* = object of RootObj
    entities*: seq[Entity]
    ui*: seq[UI]



method add*(scene: var Scene, entity: Entity) {.base.} =
  scene.entities.add(entity)



method remove*(scene: var Scene, entity: var Entity) {.base.} =
  for i in 0 ..< scene.entities.len:
    if scene.entities[i] == entity:
      scene.entities.del(i)
      entity.remove()



method remove*(scene: var Scene) {.base.} =
  for entity in scene.entities.mitems():
    entity.remove()



method show*(scene: Scene) {.base.} =
  discard



method hide*(scene: Scene) {.base.} =
  discard



method update*(scene: var Scene, keys: seq[cint]) {.base.} =
  for entity in scene.entities.mitems():
    entity.update()