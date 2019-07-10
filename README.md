Quick links for Forest website:

- Orchestration: https://github.com/eea/eea.docker.plone.fise
- Demo website: https://demo-forests.eea.europa.eu
- Old Plone Theme: https://github.com/eea/forests.theme
- Plone content: https://github.com/eea/forests.content
- New Volto-based frontend: https://github.com/eea/forests-frontend
- Taskman project: https://taskman.eionet.europa.eu/projects/fise-dev/agile/board

## Quickstart for development

First, we need the data storage. Run:

```
# make setup-data
```

to setup the data folder. You'll need to enter password, to fix data folder
permissions.

Because the src/ path is mapped to host folder, you'll need to run

```
# make setup-plone
```

to checkout the products in src. This also adds an "admin:admin" user.

Now you can start the Plone instance with:

```
# make start-plone
```

Plone is available on http://localhost:8085/ You need to create the /fise
plone website.

Next, you can start the frontend server:

```
# make start-frontend
```
