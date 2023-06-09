*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}              chrome
${url}                   https://www.amazon.com.br/
${MENU_MAISVENDIDOS}    //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${HEADER_MAISVENDIDOS}    //h2[@class='a-carousel-heading a-inline-block'][contains(.,'Mais Vendidos em Dispositivos Amazon e Acessórios')]
${TEXTO_HEADER_MAISVENDIDOS}    Mais Vendidos em Dispositivos Amazon e Acessórios

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser 

Acessar a home page do site Amazon.com.br
    Go To                            url=${url}
    Wait Until Element Is Visible    locator=${MENU_MAISVENDIDOS}

Entrar no menu "MaisVendidos"
    Click Element      locator=${MENU_MAISVENDIDOS}

Verificar se aparece a frase "Mais Vendidos em Dispositivos Amazon e Acessórios"
    Wait Until Page Contains    text=${TEXTO_HEADER_MAISVENDIDOS}
    Wait Until Element Is Visible    locator=${HEADER_MAISVENDIDOS}

Verificar se o título da página fica "${TITLO}"
    Title Should Be    title=${TITLO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='Mais Vendidos em Dispositivos Amazon e Acessórios - Ver mais'][contains(.,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element   locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto pesquisado "${PRODUTO}"
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')])[1]
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]

Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=//a[contains(@data-csa-c-type,'button')]
    Click Element    locator=//input[contains(@aria-label,'Excluir Console Xbox Series S')]

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]



# GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    
    
Quando acessar o menu "MaisVendidos"
    Entrar no menu "MaisVendidos"
    Verificar se aparece a frase "Mais Vendidos em Dispositivos Amazon e Acessórios"
Então o título da página deve ficar "Mais Vendidos em Dispositivos Amazon e Acessórios"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    
E o texto "Ver mais" deve ser exibido na página
    Verificar se aparece a categoria "Ver mais"

Quando pesquisar pelo produto "Xbox Series S"
     Digitar o nome de produto "Xbox Series S" no campo de pesquisa
     Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    
Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Console Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto pesquisado "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso


E existe o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Console Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto pesquisado "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    
Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio




