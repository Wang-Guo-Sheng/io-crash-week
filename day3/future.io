(futureResults := URL with("http://example.com/") @fetch) type println
writeln("Do something immediately while fetch goes on in background")
// ...
writeln("This will block until the result is available")
// this line iwll execute immediately

writeln("fetched", futureResults size, " bytes")
futureResults type println
// this wil block until the computation complete
// and Io prints the value
