# Офіс аурз КШЕ №2  

Це репо твіст на [офіційну доку] (<https://fastapi.tiangolo.com/deployment/docker/>)  

## Список команд, що використоувалися  

```bash
docker build -t ip/ksedemo1:0.1 .
docker run -p 8080:8080 ip/ksedemo1:0.1
```

Конвеншен на імʼя образу `організація/сервіс:таг` (за змовчуванням таг `latest`)

Реєструємося на докерхабі, логіни cli та заливаємо імедж

```bash
docker login -u blacksun418
docker tag ip/ksedemo1:0.1 blacksun418/ksedemo:0.1
docker push blacksun418/ksedemo:0.1
docker run -p 8080:8080 blacksun418/ksedemo:0.1
```
