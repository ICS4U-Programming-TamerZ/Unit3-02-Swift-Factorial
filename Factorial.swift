import Foundation

/**
 Function to read an integer from a file.
 
 - Parameter atPath: The path of the file to read.
 - Returns: The integer read from the file, or nil if an error occurs.
 */
func readIntegerFromFile(atPath path: String) -> Int? {
    do {
        // Read content of the file
        let content = try String(contentsOfFile: path)
        // Convert content to integer after trimming whitespace and newline characters
        return Int(content.trimmingCharacters(in: .whitespacesAndNewlines))
    } catch {
        // Handle file reading errors
        print("Error reading file: \(error)")
        return nil
    }
}

/**
 Recursive function to calculate factorial.
 
 - Parameter n: The number whose factorial needs to be calculated.
 - Returns: The factorial of the given number.
 */
func factorial(_ n: Int) -> Int {
    // Base case: factorial of 0 is 1
    if n == 0 {
        return 1
    }
    // Recursive case: factorial of n is n multiplied by factorial of (n - 1)
    return n * factorial(n - 1)
}

/**
 Function to write content to a file.
 
 - Parameters:
   - fileName: The name of the file to write to.
   - content: The content to write to the file.
 */
func writeToFile(_ fileName: String, _ content: String) {
    do {
        try content.write(toFile: fileName, atomically: true, encoding: .utf8)
        print("Output written to \(fileName)")
    } catch {
        // Handle file writing errors
        print("Error writing to file: \(error)")
    }
}

// File paths
let inputFileName = "input.txt"
let outputFileName = "output.txt"

// Attempt to read integer from file
if let n = readIntegerFromFile(atPath: inputFileName) {
    // Calculate factorial
    let result = factorial(n)
    // Print the result
    print("Factorial of \(n) is: \(result)")
    // Write the result to output file
    writeToFile(outputFileName, "Factorial of \(n) is: \(result)")
} else {
    // Print error message if file reading fails
    print("Failed to read the file.")
}
