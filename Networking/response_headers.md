# Common HTTP Response Headers

| Header                         | Description                                                                                                                                                 |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Content-Security-Policy`      | Specifies the content security policy for the response, defining allowed sources of content to prevent various types of attacks.                            |
| `Strict-Transport-Security`    | Indicates that the server should only be accessed over HTTPS (HTTP Secure) connections for a specified period, enhancing security by preventing downgrade attacks and enforcing secure communication. |
| `X-Content-Type-Options`       | Prevents the browser from MIME-sniffing the response content type, reducing the risk of certain types of attacks, such as MIME confusion attacks.             |
| `X-Frame-Options`              | Specifies whether the browser should allow the response content to be framed by other web pages, mitigating clickjacking attacks.                            |
| `X-Xss-Protection`             | Enables the browser's built-in XSS (cross-site scripting) protection mechanism, helping to prevent XSS attacks by blocking potentially malicious scripts.   |
| `Referrer-Policy`              | Specifies the referrer policy for the response, controlling how much referrer information should be included in the Referer header when navigating to other pages. |
| `Content-Encoding`             | Indicates the encoding algorithms applied to the response body (e.g., gzip, deflate, br).                                                                   |
| `Cache-Control`                | Specifies directives for caching mechanisms in both requests and responses.                                                                                  |
| `Pragma`                       | Provides backward compatibility for HTTP/1.0 cache control.                                                                                                  |
| `Expires`                      | Specifies the date and time after which the response should be considered stale.                                                                             |
| `Last-Modified`                | Indicates the date and time at which the resource was last modified.                                                                                         |
| `Etag`                         | Provides a unique identifier for the current version of the resource.                                                                                        |
| `Content-Length`               | Specifies the size of the response body in bytes.                                                                                                            |
| `Content-Type`                 | Indicates the media type and character encoding of the response body.                                                                                        |
| `Server`                       | Specifies information about the server software handling the request.                                                                                        |
| `X-Powered-By`                 | Indicates the technology or framework powering the server.                                                                                                   |
| `Set-Cookie`                   | Sets a cookie in the client's browser for session management or other purposes.                                                                              |
| `Access-Control-Allow-Origin`  | Specifies the origins that are allowed to access the resource in cross-origin requests.                                                                      |
| `Access-Control-Allow-Methods` | Specifies the HTTP methods allowed when accessing the resource in cross-origin requests.                                                                     |
| `Access-Control-Allow-Headers` | Specifies the headers allowed when accessing the resource in cross-origin requests.                                                                          |
| `Access-Control-Allow-Credentials` | Indicates whether the resource supports credentials in cross-origin requests.                                                                               |
| `Access-Control-Expose-Headers` | Specifies the headers exposed to the browser in the response to a cross-origin request.                                                                     |
| `Access-Control-Max-Age`       | Specifies the time in seconds that preflight requests can be cached by the client.                                                                          |
| `WWW-Authenticate`             | Indicates the authentication method required for accessing the resource.                                                                                     |
| `Location`                     | Specifies the URL to which the client should be redirected.                                                                                                  |
| `Retry-After`                  | Specifies the time after which the client should retry the request.                                                                                          |
| `Vary`                         | Specifies the request headers used to determine the response caching behavior.                                                                               |
| `Alt-Svc`                      | Provides alternative services for accessing the resource.                                                                                                    |
| `Timing-Allow-Origin`          | Indicates whether timing information is available for the response and which origin is allowed to access it.                                                  |
