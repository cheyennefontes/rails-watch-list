FROM ruby:3.1
# Definir diretório no container
WORKDIR /myapp
# Copiar arquivos de gemas para container
COPY Gemfile Gemfile.lock ./
# Instalar dependências do rails
RUN bundle install
# Instalar o PostgreSQL e suas dependências
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# Instalar yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
# Copiar app
COPY . .

# Script para executar app sempre que container for iniciado
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Processo principal a ser executado ao executar imagem
CMD ["rails", "server", "-b", "0.0.0.0"]                                             
