#' Request data from CalDav Server
#'
#' Function to build and execute web request against CalDav server.
#'
#' @param url url to caldav endpoint, e.g.: "https://nextcloud03.webo.cloud/remote.php/dav/calendars/me@myweb.de/personal/"
#' @param user user name
#' @param password user password
#' @param ret character vector naming list items to return
#'
#' @import curl
#' @import xml2
#'
#'
caldav_get_all_simple_auth <-
  function(url, user = "", password = "", ret = c("calendar", "response", "df")){
    # new handle
    h <- curl::new_handle()

    # HTTP Method
    curl::handle_setopt(h, customrequest = "REPORT")

    # authentication credentials
    curl::handle_setopt(h, userpwd = paste0(user, ":", password))

    # CalDav filter
    curl::handle_setopt(
      h,
      copypostfields =
        "<x1:calendar-query xmlns:x1=\"urn:ietf:params:xml:ns:caldav\">
          <x0:prop xmlns:x0=\"DAV:\">
          <x0:getcontenttype/>
          <x0:getetag/>
          <x0:resourcetype/>
          <x0:displayname/>
          <x0:owner/>
          <x0:resourcetype/>
          <x0:sync-token/>
          <x0:current-user-privilege-set/>
          <x0:getcontenttype/><x0:getetag/>
          <x0:resourcetype/>
          <x1:calendar-data/>
          </x0:prop>
          <x1:filter>
              <x1:comp-filter name=\"VCALENDAR\">
              </x1:comp-filter>
          </x1:filter>
      </x1:calendar-query>"
    )


    # headers
    curl::handle_setheaders(
      h,
      "accept"                     = "*/*",
      "content-type"               = "application/xml; charset=UTF-8",
      "depth"                      = "1",
      "x-nc-caldav-webcal-caching" = "On"
    )

    # execute request
    res <- curl::curl_fetch_memory(url  = url, handle = h)

    # parse response
    xml_parsed <- xml2::read_xml(res$content)

    # extract relevant content
    calendar_node <- xml2::xml_find_all(x = xml_parsed, xpath = "//cal:calendar-data")
    calendar_text <- xml2::xml_text(calendar_node)

    # return
    list(
      response = res,
      calendar = calendar_text,
      df       = ical_parse_df(text = calendar_text)
    )[ret]

  }