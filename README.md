# README

# Task Management API with User Authentication

This is a simple RESTful API built with Ruby on Rails that manages tasks and user authentication. The API provides JWT-based authentication for users, allowing them to register, log in, and manage tasks.

## Requirements

- Ruby 3.3.6
- Rails 8.0.1
- PostgreSQL

## Gems Used

- `devise`: For user authentication and password management.
- `devise-jwt`: To implement JWT token authentication with Devise.
- `kaminari`: For pagination on task lists.
- `active_model_serializers`: To serialize models for JSON responses.

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/task-management-api.git
cd task-management-api
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server.

Postman documentation
https://documenter.getpostman.com/view/20906822/2sAYJ1mhkU

