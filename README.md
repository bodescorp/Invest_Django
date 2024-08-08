# Aplicação de Investimentos

Este repositório contém uma aplicação Django para gerenciamento de investimentos, desenvolvida seguindo um tutorial. O projeto utiliza [Poetry](https://python-poetry.org/) para gerenciamento de dependências e [Docker Compose](https://docs.docker.com/compose/) para orquestração de containers.

## Índice

- [Instalação](#instalação)
- [Configuração](#configuração)
- [Uso](#uso)
- [Tecnologias](#tecnologias)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Instalação

### Usando Docker e Docker Compose

Para construir a imagem Docker e iniciar os containers, use:

```bash
docker-compose up --build
```

Isso:

- Constrói a imagem Docker usando o `Dockerfile`.
- Instala as dependências com Poetry.
- Inicia o servidor Django.

A aplicação estará disponível em [http://localhost:8000](http://localhost:8000).

Para parar e remover os containers:

```bash
docker-compose down
```

### Executando Localmente (Sem Docker)

1. **Clone o Repositório**

   ```bash
   git clone https://github.com/bodescorp/Invest_Django.git
   cd Invest_Django
   ```

2. **Instale as Dependências**

   ```bash
   pip install poetry
   poetry install
   ```

3. **Configure o Banco de Dados**

   Atualize as configurações de banco de dados em `core_project/settings.py`.

4. **Aplique Migrações**

   ```bash
   poetry run python manage.py migrate
   ```

5. **Inicie o Servidor de Desenvolvimento**

   ```bash
   poetry run python manage.py runserver
   ```

   A aplicação estará disponível em [http://localhost:8000](http://localhost:8000).

6. **Parar o Servidor**

   Use `Ctrl + C` no terminal para parar o servidor.

## Configuração

### Configuração do Docker

- **Dockerfile**: Define a imagem Docker da aplicação.
- **docker-compose.yml**: Configuração dos serviços e ambiente de desenvolvimento.

### Configuração Local

- **pyproject.toml**: Gerencia dependências do projeto com Poetry.
- **poetry.lock**: Bloqueia as versões das dependências.
- **core_project/settings.py**: Configurações do Django, incluindo o banco de dados.

## Uso

### Executando Comandos Django

Para executar comandos Django com Poetry:

```bash
poetry run python manage.py <comando>
```

Por exemplo, para aplicar migrações:

```bash
poetry run python manage.py migrate
```

## Tecnologias

- **Django**: Framework web para Python.
- **Poetry**: Gerenciador de dependências e ferramenta de build para Python.
- **Docker**: Plataforma para criar, distribuir e executar aplicações em containers.
- **Docker Compose**: Ferramenta para definir e executar aplicações multi-container Docker.

## Tutorial

O projeto foi desenvolvido seguindo o tutorial disponibilizado por [\[link\]](https://pythonando.com.br/).

## Contribuição

Contribuições são bem-vindas! Para contribuir:

1. Faça um fork do repositório.
2. Crie uma branch para sua feature (`git checkout -b feature/nome-da-feature`).
3. Faça commit das suas mudanças (`git commit -am 'Adiciona nova feature'`).
4. Envie a branch para o repositório remoto (`git push origin feature/nome-da-feature`).
5. Abra um Pull Request.

## Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para detalhes.

---

Para mais informações, consulte a [documentação](docs/README.md) ou entre em contato com os mantenedores.
