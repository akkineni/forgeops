FROM forgerock-docker-internal.bintray.io/forgerock/openig:latest

ADD config /var/openig/config
ADD scripts /var/openig/scripts
ADD keystore.jks /var/openig
ADD wellKnownCheck.sh /

USER root

RUN chown -R forgerock /var/openig

USER forgerock
