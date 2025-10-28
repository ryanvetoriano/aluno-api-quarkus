# Use uma imagem com OpenJDK, mas sem Maven
FROM openjdk:17-jdk-slim AS build

# Instalar Maven na imagem
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

# Diretório de trabalho
WORKDIR /app

# Copiar os arquivos do projeto
COPY . .

# Instalar as dependências e gerar a lista de dependências
RUN mvn -B -DskipTests clean dependency:list install -DoutputFile=target/mvn-dependency-list.log

# Continuar com o resto do seu Dockerfile, por exemplo:
# RUN mvn package

# Run the quarkus app 
CMD ["sh", "-c", "java -jar target/quarkus-app/quarkus-run.jar"]