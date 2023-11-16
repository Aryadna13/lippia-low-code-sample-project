@TimeEntry
Feature: Trabajo Final

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk


 @GetWokspaces #1
  Scenario: Get all my workspaces
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces
    When execute method GET
    Then the status code should be 200
   * define workspaceId = $.[0].id

 @GetAllProjects #2
  Scenario: Llamar a todos los proyectos
    Given call Project.feature@GetWorkspaces
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
   # * define projectId = $.[0].id
    * define userId = $.[0].memberships[0].userId

  @ConsultarUnTimeEntry #3
  Scenario: Consultar un time entry de un proyecto
    Given call TimeEntry.feature@GetAllProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time-entries
    When execute method GET
    Then the status code should be 200
    * define consultaTimeEntryId = $.[1].id
    * define idEspecifico = $.[0].id

  @AgregarHorasAUnProyecto #4
  Scenario: Agregar horas a un proyecto
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time-entries
    And body agregarHoras.json
    When execute method POST
    Then the status code should be 201

  @ModificarHorasAUnProyecto #5
  Scenario: Modificar horas en un proyecto
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/time-entries/{{idEspecifico}}
    And body updateTimeEntry.json
    When execute method PUT
    Then the status code should be 200

    @@deleteTimeEntry #6
    Scenario: Borrar horas en un proyecto
      Given base url https://api.clockify.me/api
      And endpoint /v1/workspaces/{{workspaceId}}/time-entries/{{consultaTimeEntryId}}
      When execute method DELETE
      Then the status code should be 204
