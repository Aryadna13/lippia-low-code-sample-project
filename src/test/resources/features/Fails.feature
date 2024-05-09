@projectFails
Feature: Projects

  Background:
    And header Content-Type = application/json
    And header Accept = */*

#Error No Autorizado (Status Code 401)

  @GetWokspacesFail401 #1 api-key erronea (simbolos)
  Scenario: Get all my workspaces
    Given header x-api-key = ??????
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces
    When execute method GET
    Then the status code should be 401

  @GetAllProjectsFail401 #2 Sin api-key
  Scenario: Llamar a todos los proyectos
    Given call Project.feature@GetWorkspaces
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces//projects
    When execute method GET
    Then the status code should be 401

  @GetProjectFail401 #3 api-key erronea (numeros)
  Scenario: Consultar un proyecto
    Given header x-api-key = 123456
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/6537291f940183327c06fc57/projects/654a61122ed65844fa0fd84d
    When execute method GET
    Then the status code should be 401

  @PostProjectFail401 #4 api-key erronea (201 caracteres)
  Scenario: Añadir un nuevo proyecto
    Given header x-api-key = 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/6537291f940183327c06fc57/projects
    And body projectBody.json
    When execute method POST
    Then the status code should be 401

  @PatchProjectFail401 #5 api-key erronea (key value repetido)
  Scenario: Update project estimate
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFkNTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/6537291f940183327c06fc57/projects/65394f6c9aa6dc598ece0757/memberships
    And body patch.json
    When execute method PATCH
    Then the status code should be 401

#Proyecto no encontrado (Status Code 404)

  @PostProjectFail404 #6 dejar Url de workspace y project vacia
  Scenario: Añadir un nuevo proyecto
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces//projects/
    And body projectBody.json
    When execute method POST
    Then the status code should be 404

  @GetProjectFail404 #7 El endpoint enviado no es el correcto
  Scenario: Consultar un proyecto
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/https://www.youtube.com/watch?v=V4qorFKV_DI/projects/
    When execute method GET
    Then the status code should be 404

  @PatchProjectFail404 #8 No hay base url
  Scenario: Update project estimate
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And endpoint 12345/$%$&&
    And body patch.json
    When execute method PATCH
    Then the status code should be 404

  #Bad Request (Status Code 400)

  @GetProjectFail400 #9 Endpoint project fallido
  Scenario: consultar un proyecto
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/6537291f940183327c06fc57/projects/1234
    When execute method GET
    Then the status code should be 400

  @PostProjectFail400 #10 #Proyecto repetido
  Scenario: Añadir un nuevo proyecto
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/6537291f940183327c06fc57/projects
    And body projectBody.json
    When execute method POST
    Then the status code should be 400

  @PatchProjectFail400 #11 Falta de datos escenciales en el body
  Scenario: Update project estimate
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/6537291f940183327c06fc57/projects/65394f6c9aa6dc598ece0757/memberships
    And body patchFail.json
    When execute method PATCH
    Then the status code should be 400
