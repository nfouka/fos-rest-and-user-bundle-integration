Feature: Handle user registration via the RESTful API

  In order to allow a user to sign up
  As a client software developer
  I need to be able to handle registration


  Background:
    Given there are Users with the following details:
      | id | username | email          | password |
      | 1  | peter    | peter@test.com | testpass |
    And I set header "Content-Type" with value "application/json"


#  ############################
#  ## Password Reset Request ##
#  ############################
#
#  Scenario: Cannot request a password reset for an invalid username
#    When I send a "POST" request to "/password/reset/request" with body:
#      """
#      { "username": "davey" }
#      """
#    Then the response code should be 403
#     And the response should contain "Invalid username"
#
#
#  Scenario: Can request a password reset for a valid username
#    When I send a "POST" request to "/password/reset/request" with body:
#      """
#      { "username": "peter" }
#      """
#    Then the response code should be 200
#     And the response should contain "Password reset request accepted, please check your email"
#
#  Scenario: Cannot request another password reset for an account already requesting, but not yet actioning the reset request
#     When I send a "POST" request to "/password/reset/request" with body:
#      """
#      { "username": "john" }
#      """
#    Then the response code should be 403
#     And the response should contain "Password reset request is already in progress. Please check your email"
#
#

#  ############################
#  ## Password Reset Confirm ##
#  ############################
#
#  Scenario: Cannot confirm without a token
#    When I send a "POST" request to "/password/reset/confirm" with body:
#      """
#      { "bad": "data" }
#      """
#    Then the response code should be 400
#    And the response should contain "You must submit a token"
#
#  Scenario: Cannot confirm with an invalid token
#    When I send a "POST" request to "/password/reset/confirm" with body:
#      """
#      { "token": "invalid token string" }
#      """
#    Then the response code should be 400
#
#  Scenario: Cannot confirm without a valid new password
#    When I send a "POST" request to "/password/reset/confirm" with body:
#      """
#      {
#        "token": "some-token-string",
#        "plainPassword": {
#          "second": "first-is-missing"
#        }
#      }
#      """
#    Then the response code should be 400
#     And the response should contain "The entered passwords don't match"
#
#  Scenario: Cannot confirm with a mismatched password and confirmation
#    When I send a "POST" request to "/password/reset/confirm" with body:
#      """
#      {
#        "token": "some-token-string",
#        "plainPassword": {
#          "first": "some password",
#          "second": "oops"
#        }
#      }
#      """
#    Then the response code should be 400
#    And the response should contain "The entered passwords don't match"
#
#  Scenario: Can confirm with valid new password
#    When I send a "POST" request to "/password/reset/confirm" with body:
#      """
#      {
#        "token": "some-token-string",
#        "plainPassword": {
#          "first": "new password",
#          "second": "new password"
#        }
#      }
#      """
#    Then the response code should be 200
#     And the response should contain "Successfully updated password"
#     And I send a "POST" request to "/login" with body:
#      """
#      {
#        "username": "john",
#        "password": "new password"
#      }
#      """
#    Then the response code should be 200
#     And the response should contain "token"