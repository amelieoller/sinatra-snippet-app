# create seed data
amelie = User.create(name: "Amelie", email: "amelie@email.com", password: "password")
jeff = User.create(name: "Jeff", email: "jeff@email.com", password: "password")

Snippet.create(content: "This is a new snippet", user: amelie)
Snippet.create(content: "This is another snippet", user_id: amelie.id)
jeff.snippets.create(content: "More snippets")
jeffs_entry = jeff.snippets.build(content: "Another snippet")
jeffs_entry.save
