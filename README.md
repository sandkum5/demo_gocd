# cicd-demo
Demo Repo test CICD using gocd


Create gocd Agent docker image and container with terraform installed

- Build Image
```
docker build -t gocdtf-agent .
```

- Create Container
```
docker run -td --rm --name gocdtf-agent gocdtf-agent:latest
```
