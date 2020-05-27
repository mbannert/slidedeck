import io, json, cgi

# set the attribute 'user' of the session object
so = Session()
so.dta = request
with open('data.txt', 'w') as outfile:
		json.dump(so.dta, outfile)

# redirect to the home page
raise HTTP_REDIRECTION,"simple.html"

