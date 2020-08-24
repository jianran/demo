FROM oracle/graalvm-ce:20.1.0
WORKDIR /opt/graalvm
RUN gu install native-image
RUN mkdir -p /opt/demo-native/target/
COPY demo-0.0.1-SNAPSHOT.jar /opt/demo-native/target/
COPY svm.sh /opt/demo-native/
COPY META-INF /opt/demo-native/
ENV PATH "$PATH:/opt/graalvm"
WORKDIR /opt/demo-native/
RUN bash -c "svm.sh"
ENTRYPOINT ["/demo"]
