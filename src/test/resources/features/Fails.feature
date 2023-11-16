@timeEntryFails
Feature: Time entry

  Background:
    And header Content-Type = application/json
    And header Accept = */*

  @GetWokspaces #1
  Scenario: Get all my workspaces
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces
    When execute method GET
    Then the status code should be 200
    * define workspaceId = $.[0].id

  @GetAllProjects #2
  Scenario: Llamar a todos los proyectos
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And call Project.feature@GetWorkspaces
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
   # * define projectId = $.[0].id
    * define userId = $.[0].memberships[0].userId

  @ConsultarUnTimeEntry #3
  Scenario: Consultar un time entry de un proyecto
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And call TimeEntry.feature@GetAllProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time-entries
    When execute method GET
    Then the status code should be 200
    * define consultaTimeEntryId = $.[1].id
    * define idEspecifico = $.[0].id



#Error No Autorizado (Status Code 400,401,404,405)

  @GetWokspacesFail #1 api-key erronea (simbolos) 4
  Scenario: Get all my workspaces
    Given header x-api-key = ??????
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces
    When execute method GET
    Then the status code should be 401

  @GetAllProjectsFail #2 Sin call Project.feature@GetWorkspaces 5
  Scenario: Llamar a todos los proyectos
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces//projects
    When execute method GET
    Then the status code should be 404

  @ConsultarUnTimeEntry #3 sin /time entries
  Scenario: Consultar un time entry de un proyecto
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    #And call TimeEntry.feature@GetAllProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/
    When execute method GET
    Then the status code should be 404

  @AgregarHorasAUnProyecto #4 sin body 7
  Scenario: Agregar horas a un proyecto
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time-entries
    When execute method POST
    Then the status code should be 400

  @ModificarHorasAUnProyecto #5 sin /workspaceId 7
  Scenario: Modificar horas en un proyecto
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces//time-entries/{{idEspecifico}}
    And body updateTimeEntry.json
    When execute method PUT
    Then the status code should be 404

  @@deleteTimeEntry #6 Id de time entry invalido 201 caracteres 8
  Scenario: Borrar horas en un proyecto
    Given header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/6537291f940183327c06fc57/time-entries/654e9ec0be6ceb7cf2a6cfcd
    When execute method POST
    Then the status code should be 405







