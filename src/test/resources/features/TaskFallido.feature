@Regresion @Task
Feature: Task

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And base url https://api.clockify.me/api
    And call Workspace.feature@GetWokspacesExitoso
    And call Project.feature@GetAllProjectsExitoso
    And call Task.feature@GetAllTasks


  @GetAllTasksFallido
  Scenario: error de endpoint
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    When execute method GET
    Then the status code should be 404

  Scenario: metodo errado
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method PATCH
    Then the status code should be 405

  Scenario: sin api key
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method GET
    Then the status code should be 401

  Scenario: sin proyectoID
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method GET
    Then the status code should be 400

#--------------------------------------

  @PostAddANewTaskFail
  Scenario: error de endpoint
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    And body Task/AddNewTask.json
    When execute method POST
    Then the status code should be 404


  Scenario: metodo errado
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body Task/AddNewTask.json
    When execute method PATCH
    Then the status code should be 405


  Scenario: sin apikey
   Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method POST
    Then the status code should be 401


  Scenario: sin projectid
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects//tasks
    When execute method POST
    Then the status code should be 405


  Scenario: sin name
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body Task/PostNewTaskFail.json
    When execute method POST
    Then the status code should be 400

  Scenario: name repetido
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body Task/AddNewTask.json
    When execute method POST
    Then the status code should be 400

    #-------------------------------

  @PutUpdateTask @ok
  Scenario: update tarea
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method PUT
    Then the status code should be 200

  Scenario: error de endpoint
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    When execute method PUT
    Then the status code should be 404

  @REVISARHARDCODEO
  Scenario: sin api key
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/663d389b0a3b3a2da28500a1
    When execute method PUT
    Then the status code should be 401



  Scenario: NAME en blanco
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/663d389b0a3b3a2da28500a1
    And body Task/PostNewTaskFail.json
    When execute method PUT
    Then the status code should be 400


  Scenario: NAME repetido
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/663d389b0a3b3a2da28500a1
    And body Task/AddNewTask.json
    When execute method PUT
    Then the status code should be 400


    #------------------------------------------------

  @DeleteTask

  Scenario: error de endpoint
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method DELETE
    Then the status code should be 404

  Scenario: metodo errado
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method PATCH
    Then the status code should be 405

  Scenario: sin api key
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method DELETE
    Then the status code should be 401


  Scenario: status "ACTIVE" en vez de "DONE"
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/663d389b0a3b3a2da28500a1
    And body Task/AddNewTask.json
    When execute method DELETE
    Then the status code should be 400