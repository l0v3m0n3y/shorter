import asyncdispatch, httpclient, json, uri

proc short_link*(url:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = newHttpHeaders({"Connection": "keep-alive", "content-type": "application/x-www-form-urlencoded; charset=UTF-8","host": "shorter.me", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let response = await client.post("https://shorter.me/page/shorten", body ="url=" & encodeUrl(url) & "&alias=&password=")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc unshort_link*(url:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = newHttpHeaders({"Connection": "keep-alive", "content-type": "application/x-www-form-urlencoded; charset=UTF-8","host": "shorter.me", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let response = await client.post("https://shorter.me/page/url-unshortener", body ="url=" & encodeUrl(url))
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc analytics_link*(url:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = newHttpHeaders({"Connection": "keep-alive", "content-type": "application/x-www-form-urlencoded; charset=UTF-8","host": "shorter.me", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let response = await client.post("https://shorter.me/page/url-analytics", body ="url=" & encodeUrl(url) & "&password=")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
