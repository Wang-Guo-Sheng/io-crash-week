Object ancestors := method(
	prototype := self proto
	if(prototype != Object,
		writeln("Slots of ", prototype type, "\n---")
		prototype slotNames foreach(slotname, writeln(slotname))
		writeln
		prototype ancestors))

Animal := Object clone
Animal speak := method("noise" println)

Duck := Animal clone
Duck speak := method("quack" println)
Duck walk := method("waddle" println)

d := Duck clone
d ancestors

