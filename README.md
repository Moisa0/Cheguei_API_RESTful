# CHEGUEI! - Requisitos e Regras


## RFs (Requisitos funcionais - O que o usuário poderá fazer dentro da aplicação) 

### MASTER
- [ ] Deve ser possível se autenticar;
- [ ] Deve ser possível ( autenticado ) um MASTER cadastrar um USER e um ADMIN;
- [ ] Deve ser possível ( autenticado ) recuperar a própria senha;
- [ ] Deve ser possível ( autenticado ) alterar a própria senha;
- [ ] Deve ser possível ( autenticado ) um MASTER excluir um USER e um ADMIN;
- [ ] Deve ser possível ( autenticado ) um MASTER atualizar os dados de um USER e um ADMIN;

### ADMIN
- [ ] Deve ser possível se autenticar;
- [ ] Deve ser possível ( autenticado ) recuperar a própria senha;
- [ ] Deve ser possível ( autenticado ) alterar a própria senha;
- [ ] Deve ser possível ( autenticado ) visualizar a folha de ponto de um USER por mês;
- [ ] Deve ser possível ( autenticado ) aprovar uma solicitação de ponto de um USER;
- [ ] Deve ser possível ( autenticado ) recusar uma solicitação de ponto de um USER;

### USER
- [ ] Deve ser possível se autenticar;
- [ ] Deve ser possível ( autenticado ) recuperar a própria senha;
- [ ] Deve ser possível ( autenticado ) alterar a própria senha;
- [ ] Deve ser possível ( autenticado ) bater o ponto de início e término;
- [ ] Deve ser possível ( autenticado ) visualizar a folha de ponto de um USER por mês;


## RNs (Regras de negócio - Quais condições o usuário poderá fazer a ação na aplicação)

- [ ] USERS e ADMINS não devem poder ser cadastrados com um e-mail duplicado;
- [ ] USERS e ADMINS não devem poder ser cadastrados com um username duplicado;
- [ ] USERS só devem ser criados atribuídos a ADMINs;
- [ ] Um USER não pode excluir outro USER;
- [ ] Um ADMIN não pode excluir outro ADMIN;
- [ ] USER, ADMIN e MASTER deve se registrar utilizando username;


## RNFs (Requisitos não-funcionais - Aquilo que o cliente não consegue controlar, requisitos técnicos)

- [ ] A senha do usuário precisa estar hasheada;
- [ ] Os dados da aplicação precisam estar persistidos em um banco de dados PortgresSQL;
- [ ] Todas as listas de dados precisam estar paginadas com 10 itens por página;
- [ ] O usuário deve ser identificado por um JWT (JSON Web Token);
