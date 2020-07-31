# DESCRIPTION:

This is an example which shows how to configure and run ROR proxy which will provide pretty the same functionality as ROR plugin installed with Elasticsearch.

# CONTAINS:

* /proxy folder - ROR proxy jar and simple configuration
* launch.sh - script which runs ES 7.8.0 in docker and then launches ROR proxy configured to use the ES container

# HOW IT WORKS:

ROR proxy should be accessed on port 5000. It calls backend ES (localhost:9201). Each call to backend contains authentication header (credentials are loaded on ROR proxy start from environment variables - see launch.sh)

# EXAMPLE INTERACTION:

Launch example:

`$ chmod 777 launch.sh`

`$ ./launch.sh`

Try to call  ROR proxy:

`$ curl -kv -u user1:test "http://localhost:5000/_cat/indices"` 

the curl above will call proxy and should be allowed

`$ curl -kv -u user1:wrong "http://localhost:5000/_cat/indices"`

the next one should be forbidden, because user1 send wrong credentials
