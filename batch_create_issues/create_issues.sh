#!/bin/bash
# All Specification repos
repos=(jakartaee-platform faces-api jta-api jsonb-api jsonp jms-api jpa-api websocket-api concurrency-api servlet-api jsp-api common-annotations-api jaxrs-api injection-spec jstl-api cdi jax-ws-api jaspic jaxb-api batch-api el-ri jws-api saaj-api interceptor-api ejb-api security-api jacc beanvalidation-spec jca-api javamail jaf)
# repos=(jakartaee-platform)
issue_file="issue.md"

for r in "${repos[@]}"
do
    if [ ! -d "$r" ]; then
        hub clone "https://github.com/eclipse-ee4j/$r"
    fi

    cd "$r"
    echo "[$r] creating issue"
    # Generate first line as Title of Issue
    echo -e "Deliver $r Specification Version update for Jakarta EE 9\n$(cat ../$issue_file)" > issue.txt
    hub issue create -F issue.txt -l Epic
    cd ..
done
