
## Desafio 6 - Personalizando Acessos e Automatizando ações no MySQL<br />
### Parte 1 – Personalizando acessos com views  <br />

Neste desafio você irá criar visões para os seguintes cenários <br />
* Número de empregados por departamento e localidade 
* Lista de departamentos e seus gerentes 
* Projetos com maior número de empregados (ex: por ordenação desc) 
* Lista de projetos, departamentos e gerentes 
* Quais empregados possuem dependentes e se são gerentes 

Além disso, serão definidas as permissões de acesso as views de acordo com o tipo de conta de usuários. Lembre-se que as views ficam armazaneadas no banco de dados como uma “tabela”. Assim podemos definir permissão de acesso a este item do banco de dados.  <br />

Efetuar o mesmo processo para o cenário de ecommerce, através da criação de outras views. <br />

<br />
<br />


### Parte 2 – Criando gatilhos para cenário de company <br />

Sabemos que a criação de triggers está associadas a ações que podem ser tomadas em momento anterior ou posterior a inserção, ou atualização dos dados.
Além disso, em casos de remoção podemos utilizar as triggers. <br />

Sendo assim, crie as seguintes triggers para o cenário de company: <br />

* Triggers de atualização: before update statement
** Atribuindo aumento de salário para um dept específico = 1 salary = salary * 1.20;

* Triggers de remoção: before delete statement
** Salvando em outra tabela os employees demitidos usando old.attribute

Replique o mesmo procedimento para o cenário de ecommerce, da seguinte forma: <br />
* Triggers de atualização: before update statement
** Desconto por produtos de determinada categoria em razão da Black Fiday

* Triggers de remoção: before delete statement
** Usuários podem excluir suas contas por algum motivo. Dessa forma, para não perder as informações sobre estes usuários, crie um gatilho before remove 
