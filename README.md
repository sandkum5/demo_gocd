# cicd-demo
Demo Repo test CICD using gocd


### GOCD Server
```
docker run -d -p8153:8153 gocd/gocd-server:v21.3.0
```

### GOCD Agent 
Create gocd Agent docker image and container with terraform installed

- Build Image
```
docker build -t gocdtf-agent .
```

- Create Container
```
docker run -td --rm --name gocdtf-agent gocdtf-agent:latest
```
