# HTTP Response Codes

HTTP status codes are standardized codes in HTTP responses, used to indicate the status of a request. They are divided into five classes (or categories). Here is a table summarizing these codes and their meanings:

| Status Code | Category                          | Meaning                                                                                                  |
|-------------|-----------------------------------|----------------------------------------------------------------------------------------------------------|
| 1xx         | Informational                     | Request received, continuing process                                                                     |
| 2xx         | Success                           | Successfully received, understood, and accepted                                                         |
| 3xx         | Redirection                       | Further action must be taken to complete the request                                                    |
| 4xx         | Client Error                      | Request contains bad syntax or cannot be fulfilled                                                      |
| 5xx         | Server Error                      | Server failed to fulfill an apparently valid request                                                    |

Now, let's break them down by specific codes:

| Status Code | Meaning                                                                                                         |
|-------------|-----------------------------------------------------------------------------------------------------------------|
| 100         | Continue                                                                                                        |
| 101         | Switching Protocols                                                                                             |
| 102         | Processing (WebDAV)                                                                                             |
| 103         | Early Hints                                                                                                     |
| 200         | OK                                                                                                              |
| 201         | Created                                                                                                         |
| 202         | Accepted                                                                                                        |
| 203         | Non-Authoritative Information                                                                                   |
| 204         | No Content                                                                                                      |
| 205         | Reset Content                                                                                                   |
| 206         | Partial Content                                                                                                 |
| 207         | Multi-Status (WebDAV)                                                                                           |
| 208         | Already Reported (WebDAV)                                                                                       |
| 226         | IM Used (HTTP Delta encoding)                                                                                   |
| 300         | Multiple Choices                                                                                                |
| 301         | Moved Permanently                                                                                               |
| 302         | Found (Previously "Moved temporarily")                                                                           |
| 303         | See Other                                                                                                       |
| 304         | Not Modified                                                                                                    |
| 305         | Use Proxy                                                                                                       |
| 306         | (Unused)                                                                                                        |
| 307         | Temporary Redirect                                                                                              |
| 308         | Permanent Redirect                                                                                              |
| 400         | Bad Request                                                                                                     |
| 401         | Unauthorized                                                                                                    |
| 402         | Payment Required                                                                                                |
| 403         | Forbidden                                                                                                       |
| 404         | Not Found                                                                                                       |
| 405         | Method Not Allowed                                                                                              |
| 406         | Not Acceptable                                                                                                  |
| 407         | Proxy Authentication Required                                                                                   |
| 408         | Request Timeout                                                                                                 |
| 409         | Conflict                                                                                                        |
| 410         | Gone                                                                                                            |
| 411         | Length Required                                                                                                 |
| 412         | Precondition Failed                                                                                             |
| 413         | Payload Too Large (Previously "Request Entity Too Large")                                                        |
| 414         | URI Too Long (Previously "Request-URI Too Long")                                                                 |
| 415         | Unsupported Media Type                                                                                          |
| 416         | Range Not Satisfiable (Previously "Requested Range Not Satisfiable")                                             |
| 417         | Expectation Failed                                                                                              |
| 418         | I'm a teapot (April Fools' joke, not used in practice)                                                          |
| 421         | Misdirected Request                                                                                             |
| 422         | Unprocessable Entity (WebDAV)                                                                                   |
| 423         | Locked (WebDAV)                                                                                                 |
| 424         | Failed Dependency (WebDAV)                                                                                      |
| 425         | Too Early                                                                                                       |
| 426         | Upgrade Required                                                                                                |
| 428         | Precondition Required                                                                                           |
| 429         | Too Many Requests                                                                                               |
| 431         | Request Header Fields Too Large                                                                                 |
| 451         | Unavailable For Legal Reasons                                                                                   |
| 500         | Internal Server Error                                                                                           |
| 501         | Not Implemented                                                                                                 |
| 502         | Bad Gateway                                                                                                     |
| 503         | Service Unavailable                                                                                             |
| 504         | Gateway Timeout                                                                                                 |
| 505         | HTTP Version Not Supported                                                                                      |
| 506         | Variant Also Negotiates                                                                                         |
| 507         | Insufficient Storage (WebDAV)                                                                                   |
| 508         | Loop Detected (WebDAV)                                                                                          |
| 510         | Not Extended                                                                                                    |
| 511         | Network Authentication Required                                                                                 |

This list includes the most commonly used HTTP status codes, as well as some that are less common. New codes can be introduced, so for the most up-to-date and detailed explanations, you might want to refer to the latest HTTP/1.1 specification or the documentation of newer HTTP versions.
