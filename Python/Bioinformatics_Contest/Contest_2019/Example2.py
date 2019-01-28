def get_output(file):
    i = int(file.readline())
    total = []
    for j in range(i):
        string = file.readline().strip()
        pattern = file.readline().strip()
        indices = []
        true_index = 0
        while True:
            index = string.find(pattern)
            string = string[index+1:]
            if index == -1:
                break
            true_index += index + 1
            indices.append(true_index)
        total.append(indices)
    return(total)

file = open("input_example2.txt", "r")
output = get_output(file)
file.close()

with open("output_exmample2.txt", "w") as f:
    for line in output:
        for index in line:
            f.write(str(index) + " ")
        f.write("\n")