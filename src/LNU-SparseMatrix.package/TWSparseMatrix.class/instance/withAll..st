instance creation
withAll: aCollection
	| columnMarkers rawArr |
	columnMarkers := self columns copy.
	1 to: rowsNumber
		do: [ :rowIndex | 
			rawArr := (((1 to: ((aCollection at: rowIndex) size)) 
				collect: [ :columnIndex | 
						((aCollection at: rowIndex) at: columnIndex) = 0
							ifFalse: [
								TWMatrixNode 
									row: rowIndex
									column: columnIndex
									value: ((aCollection at: rowIndex) at: columnIndex) ]])
				reject: [ :el | el isNil ]).
			rawArr isEmpty
				ifTrue: [ (self rows at: rowIndex) rightNeighbour: (self rows at: rowIndex) ]
				ifFalse: [ 
					1 to: rawArr size - 1 do: [ :colIndex | 
						(rawArr at: colIndex) rightNeighbour: (rawArr at: colIndex + 1).
						(columnMarkers at: colIndex) belowNeighbour: (rawArr at: colIndex).
						columnMarkers at: colIndex put: (rawArr at: colIndex) ].
					(self rows at: rowIndex) rightNeighbour: rawArr first.
					rawArr last rightNeighbour: (self rows at: rowIndex).
					(columnMarkers at: rawArr last column) belowNeighbour: rawArr last.
					columnMarkers at: rawArr last column put: rawArr last ] ].
		self columns withIndexDo: [ :columnHead :colIndex | (columnMarkers at: colIndex) belowNeighbour: columnHead ]