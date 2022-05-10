actions
followEntity: anEntity
	self model setEntities: (anEntity asMooseGroup).
	self updateEntitiesList 