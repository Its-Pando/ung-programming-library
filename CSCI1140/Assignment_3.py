##### Assignment 3 #####

### Question 1
# import random

# def random_studentID():
#     for i in range(10):
#         num = random.randint(900000000, 900999999)
#         id = str(num)
#         randomIDfile = open("C:\\Users\\cbray\\Downloads\\randomID.txt", "a")
#         randomIDfile.write(id + "\n")
#         randomIDfile.close()

# random_studentID()



### Question 2
# import csv

# grades = {}

# ### Format csv file into manipulatable data
# with open("C:\\Users\\cbray\\Downloads\\StudentInfo.csv", "r") as csv_file:
#     exam_scores = csv.reader(csv_file, delimiter=',')
#     for row in exam_scores:
#         name = row[0] + " " + row[1]
#         grades[name] = [0, 0, 0]
#         grades[name][0] = int(row[2])
#         grades[name][1] = int(row[3])
#         grades[name][2] = int(row[4])

# ### Calculate average scores of each exam
# examOne = 0
# examTwo = 0
# examThree = 0
# for name in grades:
#     examOne += grades[name][0]
#     examTwo += grades[name][1]
#     examThree += grades[name][2]
# examOne = examOne / 3
# examTwo = examTwo / 3
# examThree = examThree / 3

# outputFile = open("C:\\Users\\cbray\\Downloads\\studentExamScore.txt", "a")
# for name in grades:
#     outputFile.write(f"{name}: {grades[name][0]}, {grades[name][1]}, {grades[name][2]}\n")
# outputFile.write(f"Exam Average: {examOne:.2f}, {examTwo:.2f}, {examThree:.2f}\n")
# outputFile.close()



### Question 3

file = open("C:\\Users\\cbray\\Downloads\\unixtimestamp.txt", "r")

def convert_utime(unixtime):
    days = unixtime / 31536000
    hours = unixtime / 86400
    minutes = unixtime / 3600
    print(days, hours, minutes)
    
### 1563326924.1322 / 60 = Minutes
### 1563326924.1322 / 3600 = Hours
### 1563326924.1322 / 86400 = Days

for line in file:
    time = line.strip("cs1411 ")
    convert_utime(float(time))




