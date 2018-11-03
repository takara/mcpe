```
docker build -t manga:v1.0 .
docker run -d --name manga -h manga --privileged -v `pwd`/comics:/var/www/comics -v `pwd`/src:/var/www/server manga:v1.0
```

