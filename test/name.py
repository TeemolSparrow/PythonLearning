def get_formatted_name(first_name, mid_name, last_name):
    full_name = first_name + " " + mid_name + " " + last_name
    return full_name


def input_name():
    print("Enter 'q' at any time to quit.")
    while True:
        first_name = input("Please input your first name:")
        if first_name == 'q':
            break
        last_name = input("Please input your last name:")
        if last_name == 'q':
            break

        full_name = get_formatted_name(first_name, last_name)
        print(full_name)
