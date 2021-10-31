***Settings***
Library         SeleniumLibrary
Test Teardown   Close Browser

***Test Cases*** 
Cenario 1: buscar por um produto existente 
   Abrir o firefox 
   Abrir a página home do Site Automation Practice 
   Digitar o nome do prduto "Blouse" no campo de Pesquisar
   Clicar no botão pesquisar
   Conferir se o produto "Blouse" foi listado no site

Cenario 2: buscar por um produto não existente
   Abrir o firefox
   Abrir a página home do Site Automation Practice
   Digitar o nome do prduto "itemNãoExistente" no campo de Pesquisar
   Clicar no botão pesquisar
   Conferir mensagem "No results were found for your search "itemNãoExistente""

Cenario 3: Listar produtos
   Abrir o firefox
   Abrir a página home do Site Automation Practice
   Passar o mouse por cuma da categoria "Women" no menu principal superior de categorias
   Clicar na sub categoria "Summer Dresses"
   Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

***Keywords***
Abrir o firefox 
   Open Browser   browser=firefox
   Set Selenium Timeout  20

Abrir a página home do Site Automation Practice 
   Go To          http://automationpractice.com/index.php

Digitar o nome do prduto "${produto}" no campo de Pesquisar
  Wait Until Element Is Visible  id=search_query_top
  Input Text     id=search_query_top  ${produto}

Clicar no botão pesquisar
  Click Element  name=submit_search

Conferir se o produto "Blouse" foi listado no site
  Wait Until Element Is Visible  xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[1]/div/a[1]/img
  Page Should Contain Element    xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[1]/div/a[1]/img

Conferir mensagem "No results were found for your search "itemNãoExistente""
  Wait Until Element Is Visible  css=.alert
  Element Text Should Be   css=.alert   No results were found for your search "itemNãoExistente"

Passar o mouse por cuma da categoria "Women" no menu principal superior de categorias
  Mouse Over  css=.sf-menu > li:nth-child(1) > a

Clicar na sub categoria "Summer Dresses"
  Wait Until Element Is Visible  css=.sf-menu > li:nth-child(1) > ul:nth-child(2) > li:nth-child(2) > ul:nth-child(2) > li:nth-child(3) > a:nth-child(1)
  Click Element  css=.sf-menu > li:nth-child(1) > ul:nth-child(2) > li:nth-child(2) > ul:nth-child(2) > li:nth-child(3) > a:nth-child(1)

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
  Wait Until Element Is Visible  xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li[1]/div/div[1]/div/a[1]/img
  Page Should Contain Element    xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li[1]/div/div[1]/div/a[1]/img
  Page Should Contain Element    xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li[2]/div/div[1]/div/a[1]/img
  Page Should Contain Element    xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li[3]/div/div[1]/div/a[1]/img