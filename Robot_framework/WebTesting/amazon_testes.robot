*** Settings ***
Documentation    Este suite testa o site Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Este teste verifica o menu Eletrônicos do site Amazon.com.br
    ...                e verifica a categoria Computadores e Informática
    [Tags]             menus    categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "MaisVendidos"
    Verificar se aparece a frase "Mais Vendidos em Dispositivos Amazon e Acessórios"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    
    Verificar se aparece a categoria "Ver mais"

caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Este teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca  
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

    