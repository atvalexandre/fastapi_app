FROM python:3.11-slim
ENV POETRY_VIRTUALENVS_CREATE=false

RUN pip install poetry
RUN pip install pydantic[email]
COPY . .

RUN poetry config installer.max-workers 10
RUN poetry install --no-interaction --no-ansi

EXPOSE 8000
CMD [ "poetry", "run", "uvicorn", "--host", "0.0.0.0", "fast_zero.app:app" ]
# CMD [ "task run" ]