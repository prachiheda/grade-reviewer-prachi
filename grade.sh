CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [ -e student-submission/ListExamples.java ]; then
    echo 'Expected file found. Proceeding with compilation and testing.'
    # Move student code and grading tests to grading-area
    cp -r student-submission/*.java grading-area/
    cp -r TestListExamples.java grading-area/
    # Add any other necessary files or directories
    # Change to grading-area directory
    cd grading-area
    javac -cp $CPATH *.java > compilation_output.txt 2>&1

    # Check the compilation status
    if [ $? -eq 0 ]; then
        echo 'Compilation successful. Proceeding with testing.'
        # Run JUnit tests and redirect the output to test_output.txt
        java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test_output.txt 2>&1

        # Check the test results using grep
         passed_tests=$(grep -o "OK ([0-9]\+ tests)" test_output.txt | grep -o "[0-9]\+")
         echo $passed_tests

        # Print the number of passed tests
        echo "Number of passed tests: $passed_tests"

        # Calculate the grade based on the number of passed tests
        if [ "$passed_tests" == "3" ]; then
            echo 'Grade: A'
        elif [ "$passed_tests" == "2" ]; then
            echo 'Grade: B'
        elif [ "$passed_tests" == "1" ]; then
            echo 'Grade: C'
        else
            echo 'Grade: F'
        fi

    else
        echo 'Error: Compilation failed. See compilation_output.txt for details.'
        exit 1  # Exit the script with an error code
    fi

else
    echo 'Error: Expected file not found in the student submission.'
    exit 1  # Exit the script with an error code
fi


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
