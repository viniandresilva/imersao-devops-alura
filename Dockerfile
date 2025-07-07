# Usar uma imagem base Python Alpine para um container mais leve
FROM python:3.12.3-alpine

# Definir diretório de trabalho no container
WORKDIR /app

# Copiar os arquivos de requisitos primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o resto do código da aplicação
COPY . .

# Expor a porta que a aplicação irá rodar
EXPOSE 9000

# Comando para executar a aplicação com Uvicorn
# "app:app" refere-se ao arquivo app.py e à instância app = FastAPI() dentro dele
# "--host 0.0.0.0" permite que a aplicação seja acessível de fora do container
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "9000", "--reload"]