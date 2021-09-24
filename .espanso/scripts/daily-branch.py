import datetime

def main():
    today = datetime.date.today()
    result = "daily/{}".format(today.strftime("%y.%m.%d"))
    print(result)


if __name__ == "__main__":
    main()
