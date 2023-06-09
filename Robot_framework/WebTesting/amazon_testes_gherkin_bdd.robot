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

    Dado que estou na home page da Amazon.com.br    
    Quando acessar o menu "MaisVendidos"
    Então o título da página deve ficar "Mais Vendidos em Dispositivos Amazon e Acessórios"
    E o texto "Ver mais" deve ser exibido na página


caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Este teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca  

    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho

    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Console Xbox Series S" no carrinho
    Quando remover o produto "Console Xbox Series S" do carrinho
    Então o carrinho deve ficar vazio
