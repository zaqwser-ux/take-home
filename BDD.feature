Feature: Match user CRM data with external library using category dropdowns

Scenario: Select a single category from dropdown
Given the user is on the matching screen
When the user opens the category dropdown
And selects the "ID" category
Then the required field "SSN" should appear in the mapping table

Scenario: Select multiple categories from dropdown
Given the user is on the matching screen
When the user selects "Personal Info" and "General Info" categories
Then the required fields "First Name" and "Last Name" should appear only once
And the other required fields from both categories should be listed

Scenario: Deselect a category
Given "Personal Info" and "General Info" are selected
When the user deselects "General Info"
Then all fields from "General Info" are removed
But fields shared with "Personal Info" (First Name, Last Name) remain

Scenario: Display of required vs optional fields
Given the user selects the "Personal Info" category
When the field mapping table appears
Then it should show "First Name" and "Last Name" as required
And show "Address", "Education Level", and "Age" as optional

Scenario: Progress button is disabled without required fields mapped
Given no categories have all required fields mapped to CRM fields
When the user tries to proceed to the next step
Then the "Next" button should be disabled

Scenario: Progress button is enabled when required fields are mapped
Given the user has mapped all required fields for "Contact Info"
When the user tries to proceed to the next step
Then the "Next" button should be enabled

Scenario: Category requiring one of two fields (phone OR email)
Given the user selects "Contact Info"
When the user maps only the "phone" field
Then the category should be considered valid

Scenario: Network delay while opening dropdown
Given the dropdown requires data from the server
When the user clicks on the dropdown
Then a spinner should be shown
And the options should appear only after the network call completes

Scenario: Dropdown is searchable
Given the dropdown has many category options
When the user types "contact"
Then only matching options should be shown

Scenario: Visual display of selected categories as badges
Given the user selects multiple categories
When they view the dropdown closed state
Then selected categories should appear as badges above the field

Scenario: Resilience to network error
Given the dropdown relies on a network call
When the network request fails
Then the user should see a clear error message
And no broken UI state should be left

