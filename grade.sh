CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

#Step 2
if [[ -f student-submission/ListExamples.java ]]
then
    echo "ListExamples.java file found"
else 
    echo "ListExamples.java file not found"
    echo "Grade: 0"
    exit
fi 

#Step 3
cp TestListExamples.java student-submission/ListExamples.java grading-area
cp -r lib grading-area

#Step 4
cd grading-area
javac -cp $CPATH *.java

if [[ $? != 0 ]]
then 
    echo "The java files failed to compile"
    echo "Grade: 0"
    exit
else
    echo "Succesfully compiled all java files"
fi

#Step 5
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt
tail -n 2 output.txt
result=$(tail -n 2 output.txt)
firstTwo=$(echo $result | cut -d " " -f1)
if [[ $firstTwo == "OK" ]]
then
    echo "Grade: 100"
else
    totalTestWithColon=$(echo $result | cut -d " " -f3)
    totalTest=$(echo $totalTestWithColon | cut -d "," -f1)
    failTest=$(echo $result | cut -d " " -f5)
    passTest=$(($totalTest - $failTest))
    #echo $passTest
    #echo $totalTest
    echo "Grade: $(($passTest * 100 / $totalTest))"

fi


