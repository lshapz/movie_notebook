README


One weekend, I was hoping to practice my brand-new Rails skills. I figured I would find an API and make a little app that searches it. 


One of the first things I googled in this search was "IMDb API." Turns out they do not have an official one, but a kindly Internet fellow has created one, available at http://www.omdbapi.com/. 

Seeing the options reminded me of some family history: way back in the pre-PC 1980s, when my dad was a young movie nerd around NYC, he kept a physical notebook where he logged every film he saw and his rating thereof. This app is designed to function similarly. 

When you go to add a movie, the search box leads to the OMDb Search API. It returns several relevant options (so if you search The Dark Knight, you'll see, among other choices, The Dark Knight 2008 & The Dark Knight Rises 2012). You can select one of those options (to add another one you'll have to make another query) and assign it your personal rating. 

Upon making that choice, the app will use the OMDb ID/Title API and grab a bit more information before creating the movie in your database. It will find or create a Director, and create a page for them as well, which should list and link to all of their movies.  


To Do List (not in order of priority at all):

1) The app is currently limited in its ability to handle movies with multiple directors - for now, it chooses the first listed name as director, and saves the other names as "collaborators" of the first guy. The collaborators are referenced on the director's page, but not yet associated to the movie on which they collaborated.

DONE !2) Currently set up to handle only one user (your personal rating is an attribute of movie) a) once we implement multiple users, add fields for "year seen" and "seen on big screen?" b) user authentication / bcrypt passwords 

3) IMDb poster API is cool, but I don't want to add it till much later, to keep page-load time low during testing.

4) Basic rspec/capybara tests have been implemented for Movie and Director. 

  a) need tests for users and usermovies (model and controller/features)


Possible Fork / New App Idea:

OMDB's API can handle TV Season/Episode requests. 
With the many ways to view television these days (Hulu, Netflix, Amazon, actual TV), it's hard to keep track of the last episode you've seen of any given show. Perhaps a "Last Seen" app?
http://www.omdbapi.com/?t=Game%20of%20Thrones&Season=1&Episode=1