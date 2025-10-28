# Use uma imagem com OpenJDK 21
FROM eclipse-temurin:21-jdk-focal

# Instalar Maven
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

# Defina o diretório de trabalho
WORKDIR /app

# Copiar os arquivos do projeto
COPY . .

# Instalar as dependências e criar o build
RUN mvn clean install -DskipTests

# Expor a porta padrão do Quarkus
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["mvn", "quarkus:dev"]
