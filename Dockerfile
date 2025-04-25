# Используем официальный образ Python 3.11
FROM python:3.11

# Отключаем буферизацию вывода Python
ENV PYTHONUNBUFFERED=1

# Устанавливаем рабочую директорию
WORKDIR /code

# Копируем весь код приложения в директорию
COPY . /code/

# Устанавливаем зависимости
RUN pip install -r requirements.txt

# Создаём volume для хранения данных
VOLUME ["/code/db"]

# Пробрасываем порт
EXPOSE 8000

# Команда для запуска приложения
CMD sh init.sh && python3 manage.py runserver 0.0.0.0:8080