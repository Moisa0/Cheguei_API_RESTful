# CHEGUEI! - Requisitos e Regras


## RFs (Requisitos Funcionais – O que o usuário poderá fazer dentro da aplicação)

### MASTER
- [ ] Deve ser possível se autenticar;
- [ ] Deve ser possível (autenticado) cadastrar, atualizar e excluir ESDEP, Superiores, Coordenadores e Estagiários;
- [ ] Deve ser possível (autenticado) listar os pontos batidos por qualquer estagiário;
- [ ] Deve ser possível (autenticado) gerar PDF da folha de ponto de qualquer estagiário, por mês;
- [ ] Deve ser possível (autenticado) visualizar o upload da folha de ponto assinada no respectivo mês;

### ESDEP
- [ ] Deve ser possível se autenticar;
- [ ] Deve ser possível (autenticado) cadastrar, atualizar e excluir Superiores, Coordenadores e Estagiários;
- [ ] Deve ser possível (autenticado) listar os pontos batidos por qualquer estagiário;
- [ ] Deve ser possível (autenticado) gerar PDF da folha de ponto de qualquer estagiário, por mês;
- [ ] Deve ser possível (autenticado) visualizar o upload da folha de ponto assinada no respectivo mês;

### SUPERIOR
- [ ] Deve ser possível se autenticar;
- [ ] Deve ser possível (autenticado) cadastrar, atualizar e excluir Coordenadores (Direito, TI e ADM);
- [ ] Deve ser possível (autenticado) listar os pontos batidos por estagiários de nível superior;
- [ ] Deve ser possível (autenticado) gerar PDF da folha de ponto de estagiários de nível superior, por mês;
- [ ] Deve ser possível (autenticado) visualizar o upload da folha de ponto assinada no respectivo mês;

### COORDENADOR
- [ ] Deve ser possível se autenticar;
- [ ] Deve ser possível (autenticado) cadastrar, atualizar e excluir estagiários sob sua responsabilidade;
- [ ] Deve ser possível (autenticado) listar as folhas de ponto de seus estagiários, por mês;
- [ ] Deve ser possível (autenticado) aprovar ou rejeitar ajustes de pontos solicitados pelos estagiários;
- [ ] Deve ser possível (autenticado) gerar PDF da folha de ponto dos seus estagiários, por mês;
- [ ] Deve ser possível (autenticado) fazer upload do PDF da folha de ponto assinada do estagiário;

### ESTAGIÁRIO
- [ ] Deve ser possível se autenticar;
- [ ] Deve ser possível (autenticado) bater o ponto de entrada e saída;
- [ ] Deve ser possível (autenticado) solicitar ajustes de ponto para o dia anterior;
- [ ] Deve ser possível (autenticado) gerar PDF da própria folha de ponto, por mês;

## RNs (Regras de Negócio – Condições que devem ser respeitadas)
- [ ] Nenhum usuário poderá ser cadastrado com e-mail duplicado;
- [ ] Nenhum usuário poderá ser cadastrado com username duplicado;
- [ ] Todo usuário (Superior, Coordenador, Estagiário) deve estar associado hierarquicamente a um nível superior na árvore;
- [ ] Um Estagiário só pode solicitar ajuste de ponto para o dia anterior;
- [ ] Um Estagiário só pode gerar sua própria folha de ponto;
- [ ] Um Coordenador só pode manipular estagiários do seu setor;
- [ ] Um Superior só pode manipular coordenadores do seu domínio (Direito, TI, ADM);
- [ ] Apenas Coordenadores podem aprovar/rejeitar solicitações de ajuste de ponto;
- [ ] Apenas Master, ESDEP e Superior podem listar pontos de todos os estagiários debaixo da sua hierarquia;

## RNFs (Requisitos Não-Funcionais – Requisitos técnicos do sistema)
- [ ] Todas as senhas de usuários devem estar hasheadas (ex: bcrypt);
- [ ] O sistema deve persistir os dados em um banco PostgreSQL;
- [ ] O sistema deve utilizar JWT (JSON Web Token) para autenticação;
- [ ] Todas as listagens devem ser paginadas em 10 itens por página;
- [ ] O sistema deve permitir upload de arquivos em formato PDF e imagem (JPG/PNG) para folhas de ponto assinadas;
- [ ] O sistema deve gerar relatórios em PDF para folhas de ponto;
- [ ] O sistema deve registrar logs de autenticação e operações críticas (CRUD de usuários, aprovações/rejeições de ajustes);