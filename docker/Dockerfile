FROM eeacms/plonesaas:5.1.5-67

COPY custom.cfg /plone/instance/

RUN gosu plone buildout -c custom.cfg

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
