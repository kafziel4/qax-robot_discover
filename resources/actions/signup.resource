*** Settings ***
Documentation       Ações, steps e elemento da funcionalidade de cadastro

Library             Browser


*** Keywords ***
Go to signup page
    Click    a[href="/signup"]

    Wait For Elements State    form h1    visible    5
    Get Text    form h1    equal    Faça seu cadastro

Fill signup form
    [Arguments]    ${dog_walker}
    Fill Text    input[name=name]    ${dog_walker}[name]
    Fill Text    input[name=email]    ${dog_walker}[email]
    Fill Text    input[name=cpf]    ${dog_walker}[cpf]
    Fill Text    input[name=cep]    ${dog_walker}[cep]

    Click    input[type=button][value$=CEP]

    Get Property    input[name=addressStreet]    value    equal    ${dog_walker}[street]
    Get Property    input[name=addressDistrict]    value    equal    ${dog_walker}[district]
    Get Property    input[name=addressCityUf]    value    equal    ${dog_walker}[city_uf]

    Fill Text    input[name=addressNumber]    ${dog_walker}[number]
    Fill Text    input[name=addressDetails]    ${dog_walker}[details]

    Upload File By Selector    input[type=file]    ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]

Additional Service
    [Arguments]    ${additional_service}
    Click    //span[text()="${additional_service}"]/..

Submit signup form
    Click    .button-register

Popup should be
    [Arguments]    ${expected_text}
    Wait For Elements State    .swal2-html-container    visible    5
    Get Text    .swal2-html-container    equal    ${expected_text}

Alert should be
    [Arguments]    ${expected_text}
    Wait For Elements State    .alert-error >> text=${expected_text}
    ...    visible    5
