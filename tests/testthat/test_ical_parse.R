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