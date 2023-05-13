*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.amazon.com.br/
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

verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]

