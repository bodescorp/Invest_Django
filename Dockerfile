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

# Copiar o código da aplicação
COPY . .

# Criação do usuário 'django' e configuração de permissões
RUN useradd -m -d /home/django -s /bin/bash django && \
    chown -R django:django /app

# Definir o usuário não root para os próximos comandos
USER django

# Criar um ambiente virtual com venv e ativá-lo no Poetry
RUN poetry config virtualenvs.in-project true && \
    poetry install --no-root
    
# Expor a porta 8000
EXPOSE 8000

CMD ["sh", "-c", "python", "manage.py", "runserver", "0.0.0.0:8000"]