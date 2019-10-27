# dynamic-form
A tool to define, create, and validate dynamic forms 

## DyForms

DyForms stands for Dynamic Forms.
A form(similar to an html form) is a set of elements. The elements have the below characteristics
Elements can be of type - Number, String, Enumerated.  
The form initially has a few elements which are shown by default.  
When some of the elements in the form are populated with specific values, other elements get active.  

Let's take the example of a support ticket management system and assume a simple lifecycle for such a system as NEW -> COMPLETED, NEW -> CANCELLED.

**Field Definitions**  
CreatedBy(text)  
Description(text)  
Severity(number)  
Status(enumerated) - [CANCELLED, COMPLETED]  
CancelledReason(enumerated) - [ENDUSER, OTHERS]  
CancelledOtherDescription(text)  
Comments(text)

### Use case: User completing a ticket. Convention: FIELD[VALUE(if the field has a value the user has selected)]
* OnLoad 
Active Fields  
[CreatedBy, Description, Severity, Status]

* User Enters a description - 'Internet is not working'
Active Fields  
[CreatedBy, Description['Internet is not working'], Severity, Status]

* User selects status as 'COMPLETED'
Active Fields  
[CreatedBy, Description['Internet is not working'], Severity, Status['COMPLETED'], Comments]

### Use case: User cancelling a ticket
* OnLoad
Active Fields  
[CreatedBy, Description, Severity, Status]

* User Enters a description - 'Internet is not working'  
Active Fields
[CreatedBy, Description['Internet is not working'], Severity, Status]

* User selects status as 'CANCELLED'  
Active Fields
[CreatedBy, Description['Internet is not working'], Severity, Status['CANCELLED'], CancelledReason], 

* User selects CancelledReason as OTHERS.  
[CreatedBy, Description['Internet is not working'], Severity, Status['CANCELLED'], CancelledReason[OTHERS], CancelledOtherDescription]

## Problem:
Come up with a way to define such forms(code or JSON, XML etc) and also implement a system based on the earlier definition.  
I should be able to use the system to declare any such form with different fields and rules.  
The system need not have any UI. You can implement a CLI (command line interface) to print the current set of elements which have to be shown and enter in values for elements from the CLI.  
The system should also expose a way to enable submission of the form. For now lets limit this to fetching data from the form(key-value pairs).  

## Solution:

* Define a form schema

* Pass it as argument to the program to start

    `dart ./main.dart -p path_to_a_form_schema.json`
    
* Running test cases
 
    `dart test.dart`

### Form Schema
    `
    [
        {
             label: string,
             key: string,
             type: (TEXT, CHOICE, NUMBER),
             required: boolean,
             disabled: boolean,
             visible: boolean,
             choices: []string, // considered only for CHOICE type 
             validations: [
               {
                 type: (IS, IS_NOT, CONTAINS, IS_EMPTY, IS_NOT_EMPTY, GREATER_THAN, LESSER_THAN)
                 value: string
               }
             ],
             rules: [
               {
                 condition: {
                   type: (IS, IS_NOT, CONTAINS, IS_EMPTY, IS_NOT_EMPTY, GREATER_THAN, LESSER_THAN)
                   value: string
                 },
                 actions: [
                    {
                        targetKey: string // key of the element to be affected,
                        type: (ENABLE, DISABLE, SHOW, HIDE),
                        value: string
                    }
                 ]
               },                 
             ]
        }
    ]
    `