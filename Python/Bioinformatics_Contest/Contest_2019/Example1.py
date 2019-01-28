file = open("input_example1.txt", "r")
def get_output(file):
    i = int(file.readline())
    total = []
    for j in range(i):
        line = file.readline()
        numbers = line.strip().split(" ")
        sum = int(numbers[0]) + int(numbers[1])
        total.append(sum)
    return(total)

with open("output_example1.txt", "w") as f:
    for number in get_output(file):
        f.write(str(number) + "\n")

file.close()