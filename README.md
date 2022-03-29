# aspace_mitm_proxy
    Use a tool like [mitmproxy](https://mitmproxy.org) to observe ArchivesSpace HTTP traffic

1. Download, install, and run mitmproxy - typically on port 8088.

2. Add this plugin to ArchivesSpace:

``` ruby
AppConfig[:plugins] = ['aspace_mitm_proxy']
```

3. Run the backend, frontend, and / or public devservers with a special environment variable:

``` shell
ASPACE_PROXY_PORT=8088 ./build/run backend:devserver
```

4. Make a curl request to a search endpoint:

``` shell
curl -H "X-ArchivesSpace-Session:$ASPACE_SESSION" "$ASPACE_BACKEND_URL/repositories/3/search?q=papers&page=1"
```

5. Inspect the backend's request to Solr in the mitmproxy console:
