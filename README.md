# install

## Docker
* https://docs.docker.com/docker-for-mac/install/
* https://hub.docker.com

## Kubectl&Minikube
* sudo mv minikube /usr/local/bin
* minikube start
* kubectl get node


## K9S
* brew install k9s
* k9s



# compile

## image
* mvn compile jib:build

# run

* kubectl run hello   -- image=jianran/hello  --port=8080
* kubectl scale --replicas=3 deployment/hello
* kubectl port-forward deployment/hello 8080:8080
* curl 127.0.0.1:8080/hello.htm

# dev

[source,xml]
----
<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
				<configuration>
					<excludeDevtools>false</excludeDevtools>
				</configuration>
			</plugin>`
----

