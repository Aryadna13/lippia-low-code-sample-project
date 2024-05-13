@Regression @Task @TaskFailed @Failed
Feature: Task Failed

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And base url https://api.clockify.me/api
    And call 1-Workspace.feature@GetWokspaces
    And call 2-Project.feature@GetAllProject
    And call Task.feature@GetAllTasks


  @GetAllTasks @BadEndpoint
  Scenario: Get all my Tasks
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    When execute method GET
    Then the status code should be 404

  @GetAllTasks @BadMethod
  Scenario: Get all my Tasks
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method PATCH
    Then the status code should be 405

  @GetAllTasks @NoApiKey
  Scenario: Get all my Tasks
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method GET
    Then the status code should be 401

  @GetAllTasks @NoProjectId
  Scenario: Get all my Tasks
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects//tasks
    When execute method GET
    Then the status code should be 400

#--------------------------------------

  @PostAddANewTaskFail @BadEndpoint
  Scenario: Add a new task on project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    And body Task/AddNewTask.json
    When execute method POST
    Then the status code should be 404

  @PostAddANewTaskFail @BadMethod
  Scenario: Add a new task on project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body Task/AddNewTask.json
    When execute method PATCH
    Then the status code should be 405

  @PostAddANewTaskFail @NoApiKey
  Scenario: Add a new task on project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method POST
    Then the status code should be 401

  @PostAddANewTaskFail @NoProjectId
  Scenario: Add a new task on project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects//tasks
    When execute method POST
    Then the status code should be 405

  @PostAddANewTaskFail @EmptyTaskName
  Scenario: Add a new task on project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body Task/PostNewTaskFail.json
    When execute method POST
    Then the status code should be 400

  @PostAddANewTaskFail @RepeatedTaskName
  Scenario: Add a new task on project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body Task/UpdateNameTaskFail.json
    When execute method POST
    Then the status code should be 400

    #-------------------------------

  @PutUpdateTask @BadEndpoint
  Scenario: Update task on project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    When execute method PUT
    Then the status code should be 404

  @PutUpdateTask @NoApiKey
  Scenario: Update task on project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method PUT
    Then the status code should be 401

  @PutUpdateTask @EmptyTaskName
  Scenario: Update task on project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    And body Task/PostNewTaskFail.json
    When execute method PUT
    Then the status code should be 400

  @PutUpdateTask @RepeatedTaskName
  Scenario: Update task on project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    And body Task/UpdateNameTaskFail.json
    When execute method PUT
    Then the status code should be 400

    #--------------------------------

  @DeleteTask @BadEndpoint @oka
  Scenario: Delete task from project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    When execute method DELETE
    Then the status code should be 404

  @DeleteTask @BadMethod
  Scenario: Delete task from project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method PATCH
    Then the status code should be 405

  @DeleteTask @NoApiKey
  Scenario: Delete task from project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method DELETE
    Then the status code should be 401

  @DeleteTask @BadBodyActive
  Scenario: Delete task from project
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method DELETE
    Then the status code should be 400