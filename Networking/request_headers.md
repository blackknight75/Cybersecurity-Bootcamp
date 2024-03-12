# Common HTTP Request Headers

| Header                   | Description                                                                                                                                                      |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Sec-Fetch-Dest`         | Specifies the intended destination of the request (e.g., `document`, `font`, `image`).                                                                           |
| `Sec-Fetch-Mode`         | Indicates the mode of the request (e.g., `navigate`, `cors`, `no-cors`, `same-origin`).                                                                         |
| `Sec-Fetch-Site`         | Specifies the site type (e.g., `same-origin`, `cross-origin`, `none`)                                                                                           |
| `Sec-Fetch-User`         | Indicates whether the request includes user credentials (`?1` if it does, otherwise `?0`).                                                                      |
| `Sec-Ch-Ua`              | Specifies user-agent client hints, including the browser brand and version.                                                                                      |
| `Sec-Ch-Ua-Mobile`       | Indicates whether the device is mobile (`?1` if it is, otherwise `?0`).                                                                                          |
| `Sec-Ch-Ua-Platform`     | Indicates the platform (operating system) of the user agent.                                                                                                     |
| `Upgrade-Insecure-Requests` | Signals that the client prefers to receive secure responses, and thus, may upgrade insecure requests to secure ones.                                           |
| `Referer`                | Specifies the URL of the page that referred the request.                                                                                                         |
| `Origin`                 | Indicates the origin of the request, i.e., the URL of the document or script that initiated the request.                                                        |
| `Content-Security-Policy`| Specifies the content security policy for the request, defining allowed sources of content to prevent various types of attacks.                                   |
| `User-Agent`             | Identifies the client software (e.g., browser) initiating the request.                                                                                            |
| `Accept`                 | Specifies the media types that the client is willing to accept in the response.                                                                                   |
| `Accept-Encoding`        | Indicates the encoding algorithms that the client can handle for the response body.                                                                               |
| `Accept-Language`        | Specifies the natural languages that the client prefers for the response.                                                                                         |
| `DNT`                    | Signals the client's preference regarding tracking by third-party websites.                                                                                       |
| `Connection`             | Specifies whether the client wishes to maintain a persistent connection with the server (`keep-alive` or `close`).                                              |
| `Cookie`                 | Contains cookies previously sent by the server with `Set-Cookie`.                                                                                                 |
| `Authorization`          | Provides authentication credentials for the request.                                                                                                              |
| `Cache-Control`          | Specifies directives for caching mechanisms in both requests and responses.                                                                                      |
| `Pragma`                 | Provides backward compatibility for HTTP/1.0 cache control.                                                                                                      |
| `If-Modified-Since`      | Allows conditional retrieval of a resource based on its modification date.                                                                                        |
| `If-None-Match`          | Allows conditional retrieval of a resource based on its ETag value.                                                                                               |
| `Content-Length`         | Specifies the size of the request body in bytes.                                                                                                                  |
| `Content-Type`           | Indicates the media type and character encoding of the request body.                                                                                              |
| `Date`                   | Specifies the date and time at which the request was initiated.                                                                                                   |
| `Host`                   | Specifies the domain name and port number of the server to which the request is being sent.                                                                       |
| `Origin`                 | Indicates the origin of the request, i.e., the URL of the document or script that initiated the request.                                                        |
| `Referer`                | Specifies the URL of the page that referred the request.                                                                                                         |
| `Sec-Fetch-Dest`         | Specifies the intended destination of the request (e.g., `document`, `font`, `image`).                                                                           |
| `Sec-Fetch-Mode`         | Indicates the mode of the request (e.g., `navigate`, `cors`, `no-cors`, `same-origin`).                                                                         |
| `Sec-Fetch-Site`         | Specifies the site type (e.g., `same-origin`, `cross-origin`, `none`)                                                                                           |
