# docker factorio server

## setup

create world data

```bash
docker-compose run --rm factorio --create ${WORLD_NAME}
```

edit `docker-compose.yaml`

```diff
- FACTORIO_SAVE_NAME: world-hoge
+ FACTORIO_SAVE_NAME: ${WORLD_NAME}
```

start the server

```bash
docker-compose up -d --build

# savedata
ls ./data
${WORLD_NAME}.zip
```

## server config

see: `data/*-example.json` in `factorio_headless_x64_${VERSION}.tar.xz`

example

```diff
# docker-compose.yaml
EXTRA_ARGS: --server-settings /world/server-settings.json
```

