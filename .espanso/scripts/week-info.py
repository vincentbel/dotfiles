import datetime

def main():
    today = datetime.date.today()
    year, week_number, _ = today.isocalendar()
    week_start = today - datetime.timedelta(days = today.weekday())
    week_end = week_start + datetime.timedelta(days = 6)

    result = "{} Week {} ({} ~ {})".format(year, week_number, week_start.strftime("%m-%d"), week_end.strftime("%m-%d"))
    print(result)


if __name__ == "__main__":
    main()
