# Bookmark Manager

This is a project to practice creating web apps that interact with databases, using TDD and OOP.

## Specifications

- Show a list of bookmarks
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks

## User Stories

> As a User  
> So that I can visit my favourite sites  
> I want to be able to view a list of bookmarks

> As a User  
> So I can refer to them later
> I want to be able to add new bookmarks to the list

> As a User  
> So that my bookmark list doesn't get cluttered  
> I want to be able to delete bookmarks from the list

> As a User  
> So that I can keep my bookmarks up to date  
> I want to be able to update and edit existing bookmarks

> As a User  
> So that I can make notes on my bookmarks  
> I want to be able to add comments to bookmarks

> As a User  
> So I can organise my bookmarks  
> I want to be able to add tags to bookmarks

> As a User  
> So I can view bookmarks relevant to what I'm interested in  
> I want to be able to filter the bookmark list by tags

> As a User  
> So no one else can change my bookmarks  
> I want edit access for my bookmarks to restricted to me alone

## Domain Modelling

| Objects  | Messages                                    |
| -------- | ------------------------------------------- |
| User     |                                             |
| Owner    |                                             |
| List     | View, Filter                                |
| Bookmark | Add, Edit, Delete, Add tag, Comment, Access |
| Comment  |                                             |
| Tag      |                                             |

