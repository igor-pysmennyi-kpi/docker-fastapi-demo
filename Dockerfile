
# https://pythonspeed.com/articles/base-image-python-docker-images/
FROM python:3.13.3-slim-bookworm


# Виставляємо робочу директорію контейнера
WORKDIR /code
# Копіюємо файл з залежностями, створюється новий шар
COPY ./requirements.txt /code/requirements.txt
# Встановлюємо залежності вказалі requirements.txt - теж новий шар
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
# Додаємо наш код /app - створили новий шар. таким чином при ребілді не потрібно заново ставити залежності при змані коду
# ADD працює так само як COPY, але може розпаковувати архіви
COPY ./app /code/app
# Документуємо порт, що використовується контейнером. В компоузі буде юзатися для міжконтейнерного зв'язку
# Ця команда не відкриває порт на хості, а лише документує його
EXPOSE 8080

# Run main.py when the container launches
# https://spacelift.io/blog/docker-entrypoint-vs-cmd
# https://docs.docker.com/reference/dockerfile/#shell-and-exec-form
ENTRYPOINT ["fastapi", "run", "app/main.py"]
CMD ["--port", "8080"]