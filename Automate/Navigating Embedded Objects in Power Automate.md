Step into an embedded JSON object in Power Automate when using an Initialize Variable action, and also possibly add nested properties dynamically.
Here’s how to do both in Power Automate.

1. Accessing an Embedded JSON Object
If you have initialized a variable like:
Json{
  "feed": {
    "content": {
      "Record": {
        "id": 123,
        "name": "Sample"
      }
    }
  }
}

and stored it in a variable called JsonObject (type: Object),
you can access nested properties using expression syntax:
Plaintextvariables('JsonObject')?['feed']?['content']?['Record']?['id']


? is the null-conditional operator — it prevents errors if a property is missing.
You can step down as deep as needed.

Example:

variables('JsonObject')?['feed'] → returns the feed object.
variables('JsonObject')?['feed']?['content'] → returns the content object.
variables('JsonObject')?['feed']?['content']?['Record'] → returns the Record object.


2. Adding or Updating Properties
Power Automate variables are immutable — you can’t directly mutate an object in place.
Instead, you create a new object using setProperty() or addProperty().
Example: Add a new property status inside Record:
PlaintextsetProperty(
    variables('JsonObject')?['feed']?['content']?['Record'],
    'status',
    'Active'
)

If you want to update the whole object variable with the new nested property:
PlaintextsetProperty(
    variables('JsonObject'),
    'feed',
    setProperty(
        variables('JsonObject')?['feed'],
        'content',
        setProperty(
            variables('JsonObject')?['feed']?['content'],
            'Record',
            setProperty(
                variables('JsonObject')?['feed']?['content']?['Record'],
                'status',
                'Active'
            )
        )
    )
)

This is verbose, but it’s how Power Automate handles deep updates — you rebuild the path down to the property.

3. Looping Through Stops
If you have an array of stops inside your JSON, e.g.:
Json{
  "stops": [
    { "id": 1, "name": "Stop A" },
    { "id": 2, "name": "Stop B" }
  ]
}

You can use Apply to each:

Select: variables('JsonObject')?['stops']
Inside the loop, access:
items('Apply_to_each')?['name']


✅ Key Tips:

Always use ? to avoid runtime errors when a property might be missing.
For deep updates, use nested setProperty() calls.
If you need to add multiple properties, it’s often easier to compose a new object with json().


If you want, I can give you a ready-to-use Power Automate expression that updates variables('JsonObject')?['feed']?['content']?['Record'] with new fields in one step.
Do you want me to prepare that?
