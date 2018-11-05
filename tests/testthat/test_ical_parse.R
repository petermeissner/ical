context("ical_parse")


test_that(
  desc = "ical_parse(text = ...)",
  code =
    expect_true({
      ical_parse(
        text = readLines(system.file("birthdays.ics", package = "ical"))
      )

      TRUE
    })
)


test_that(
  desc = "ical_parse(file = ...)",
  code =
    expect_true({
      ical_parse(file = system.file("birthdays.ics", package = "ical"))

      TRUE
    })
)


test_that(
  desc = "ical_parse_df(text = ...)",
  code =
    expect_true({
      tmp_df <-
        ical_parse_df(
          text = readLines(system.file("birthdays.ics", package = "ical"))
        )

      nrow(tmp_df) == 4
    })
)


test_that(
  desc = "ical_parse_df(file = ...)",
  code =
    expect_true({
      tmp_df <-
        ical_parse_df(file = system.file("birthdays.ics", package = "ical"))

      nrow(tmp_df) == 4
    })
)




test_that(
  desc = "ical_parse_list(text = ...)",
  code =
    expect_true({
      tmp_list <-
        ical_parse_list(
          text = readLines(system.file("birthdays.ics", package = "ical"))
        )

      length(tmp_list) & is.list(tmp_list)
    })
)


test_that(
  desc = "ical_parse_list(file = ...)",
  code =
    expect_true({
      tmp_list <-
        ical_parse_list(file = system.file("birthdays.ics", package = "ical"))

      length(tmp_list) & is.list(tmp_list)
    })
)

