# Use a imagem oficial do Node.js
FROM node:18-slim

# Crie e defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie os arquivos de configuração e as dependências do projeto
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie o código-fonte do aplicativo
COPY . .

# Compile o TypeScript
RUN npm run build

# Exponha a porta em que o aplicativo será executado
EXPOSE 3000

# Comando para iniciar o aplicativo
CMD ["npm", "start"]
