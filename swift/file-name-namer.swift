import Foundation

func run() {
    let args = Process.arguments

    guard args.count > 1 else {
        print("Please supply strings to be used for the name")
        return
    }

		// The first element is the application name, which we don't care about in
		// this case.
    let slice = args[1..<args.count]
    let joined = slice.joinWithSeparator("-")
    print (joined.lowercaseString)
}

run()
