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
> I want to be able to add new bookmarks with address and title

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

## Database Setup Instructions

### Production Database

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query in the file `01_create_bookmarks_table.sql`
5. Run the query in the file `02_add_title_to_bookmarks.sql`
6. Run the query in the file `03_create_comments_table.sql`

### Test Database

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager_test;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager_test;`
4. Run the query in the file `01_create_bookmarks_table.sql`
5. Run the query in the file `02_add_title_to_bookmarks.sql`
6. Run the query in the file `03_create_comments_table.sql`

## Domain Modelling

### Object Messages Table

| Objects  | Messages                                    |
| -------- | ------------------------------------------- |
| User     |                                             |
| Owner    |                                             |
| List     | View, Filter                                |
| Bookmark | Add, Edit, Delete, Add tag, Comment, Access |
| Comment  |                                             |
| Tag      |                                             |

## User Story 1

> As a User  
> So that I can visit my favourite sites  
> I want to be able to view a list of bookmarks

### Sequence Diagram - View Bookmarks

![User Story 1 Sequence Diagram][user story 1 sequence diagram]

## User Story 2

> As a User  
> So I can refer to them later  
> I want to be able to add new bookmarks with address and title

### Sequence Diagram - Add Bookmark

![user story 2 sequence diagram][user story 2 sequence diagram]

<!--  Links -->

[user story 1 sequence diagram]: https://mermaid.ink/img/eyJjb2RlIjoic2VxdWVuY2VEaWFncmFtXG5cdCBDbGllbnQtPj5Db250cm9sbGVyOiBIVFRQIEdFVCByZXF1ZXN0XG5cdCBDb250cm9sbGVyLT4-TW9kZWw6IGdpdmUgbWUgYWxsIGJvb2ttYXJrc1xuXHQgTW9kZWwtPj5Db250cm9sbGVyOiByZXR1cm5zIGFsbCBib29rbWFya3Ncblx0IENvbnRyb2xsZXItPj5WaWV3OiBlbWJlZCBib29rbWFya3Ncblx0IFZpZXctPj5Db250cm9sbGVyOiBodG1sXG5cdCBDb250cm9sbGVyLT4-Q2xpZW50OiBIVFRQIFJlc3BvbnNlXG5cdCIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2V9
[user story 2 sequence diagram]: https://mermaid.ink/img/eyJjb2RlIjoic2VxdWVuY2VEaWFncmFtXG5cdHBhcnRpY2lwYW50IENsaWVudFxuXHRwYXJ0aWNpcGFudCBDb250cm9sbGVyXG5cdHBhcnRpY2lwYW50IE1vZGVsXG5cdHBhcnRpY2lwYW50IFZpZXdcblx0Q2xpZW50LT4-Q29udHJvbGxlcjogSFRUUCBHRVQgL2Jvb2ttYXJrcy9uZXdcblx0Q29udHJvbGxlci0-PlZpZXc6IC9ib29rbWFya3MvbmV3XG5cdFZpZXctPj5Db250cm9sbGVyOiBodG1sXG5cdENvbnRyb2xsZXItPj5DbGllbnQ6IEhUVFAgUmVzcG9uc2Vcblx0Q2xpZW50LT4-Q29udHJvbGxlcjogSFRUUCBQT1NUIC9ib29rbWFya3MgKGZvcm0pXG5cdENvbnRyb2xsZXItPj5Nb2RlbDogc3RvcmUgYm9va21hcmtcblx0Q29udHJvbGxlci0-PkNsaWVudDogSFRUUCBSZWRpcmVjdCAvYm9va21hcmtzIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifX0