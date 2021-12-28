# demo_gocd
Demo Repo to test CICD workflow using gocd


Host: 172.16.221.45
- Container1: gocd server
- Container2: gocd agent

While Loop added to keep the container running:
while true; do sleep 100; done 

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
