initialization
initialize
	gap := 35.
	elementSize := 30.
	colors := Dictionary
		newFrom:
			{(#data -> Color blue).
			(#header -> Color green).
			(#select -> Color red).
			(#highlight -> Color yellow).
			(#label -> Color white)}.
	shapes := Dictionary
		newFrom:
			{(#data -> self getDefaultDataElementShape).
			(#header -> self getDefaultHeaderElementShape).
			(#edgeBuilder -> self getDefaultEdgeShapeBuilder)}.
			linkMessages := #(#next #previous).
	namedGroups := #(#left #result #right #leftMarker #rightMarker).
	backgroundGroups := #(#left #result #right).
	composer := RTComposer new.
	composer view: composer view @ RTZoomableView.
	composer gap: gap.
	metaLinks := OrderedCollection new.
	semaphore := Semaphore new.
	namedGroups := {}.
	backgroundGroups := {}.
	metaLinks := OrderedCollection new.
	delay := Delay new.
	semaphore := Semaphore new