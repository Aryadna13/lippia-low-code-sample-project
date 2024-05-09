@Regresion @Task
Feature: Task

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And base url https://api.clockify.me/api

  @GetAllTasks @ok
  Scenario: Obtengo una lista de las tasks
    Given call Workspace.feature@GetWokspacesExitoso
    And call Project.feature@GetAllProjectsExitoso
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method GET
    Then the status code should be 200
    * define taskId = $.[0].id

  @PostAddANewTask
  Scenario: Añadir una nueva tarea
    Given call Workspace.feature@GetWokspacesExitoso
    And call Project.feature@GetAllProjectsExitoso
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body Task/AddNewTask.json
    When execute method POST
    Then the status code should be 201

    @PutUpdateTask
    Scenario: update tarea
      Given call Workspace.feature@GetWokspacesExitoso
      And call Project.feature@GetAllProjectsExitoso
      And call Task.feature@GetAllTasks
      And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
      And body Task/UpdateTask.json
      When execute method PUT
      Then the status code should be 200

      @DeleteTask @ok
      Scenario: borra una tarea
        Given call Workspace.feature@GetWokspacesExitoso
        And call Project.feature@GetAllProjectsExitoso
        And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
        When execute method DELETE
        And print Response
        Then the status code should be 200


