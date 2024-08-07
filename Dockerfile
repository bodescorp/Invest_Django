# Usar a imagem base do Python 3.10
FROM python:3.10-slim

# Configurando o diretório de trabalho no container
WORKDIR /app

# Instalando as dependências do sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Instale o Poetry
RUN pip install poetry

# Copiar o arquivo de configuração do Poetry
COPY pyproject.toml poetry.lock ./

# Instalar as dependências no ambiente virtual
RUN poetry config virtualenvs.create true \
    && poetry install --no-root

# Copiar o código da aplicação
COPY . .

# Ajustar permissões para o usuário 'django' (criação do usuário)
# RUN useradd --create-home django && chown -R django:django /app

# Usar o usuário não root
USER django

# Expor a porta 8000
EXPOSE 8000

# Comando para iniciar a aplicação Django usando Gunicorn
CMD ["poetry", "run", "start", "runserver", "0.0.0.0:8000"]


