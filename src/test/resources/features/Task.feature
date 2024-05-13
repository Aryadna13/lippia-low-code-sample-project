@Regression @Task @TaskSuccess @Success @Taski
Feature: Task success

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And base url https://api.clockify.me/api
    And call 1-Workspace.feature@GetWokspaces
    And call 2-Project.feature@GetAllProject

  Scenario: Get all projects on workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
    * define projectId = $.[0].id

  @PostAddANewTask
  Scenario: Add a new task on project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body Task/AddNewTask.json
    When execute method POST
    Then the status code should be 201

  @GetAllTasks
  Scenario: Get all my Tasks
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method GET
    Then the status code should be 200
    * define taskId = $.[0].id

  @PutUpdateTask
  Scenario: Update task on project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    And body Task/Update-deleteTask.json
    When execute method PUT
    Then the status code should be 200

  @DeleteTask
  Scenario: Delete task from project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method DELETE
    Then the status code should be 200

  @PostAddANewTask
  Scenario: Add a new task on project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body Task/UpdateNameTaskFail.json
    When execute method POST
    Then the status code should be 201


