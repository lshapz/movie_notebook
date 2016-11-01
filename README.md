MovieNotebook.rails 

One weekend, I was hoping to practice my brand-new Rails skills. I figured I would find an API and make a little app that searches it. 

One of the first things I googled in this search was "IMDb API." Turns out they do not have an official one, but a kindly Internet fellow has created one, available at http://www.omdbapi.com/. 

Seeing the options reminded me of some family history: way back in the pre-PC 1980s, when my dad was a young movie nerd around NYC, he kept a physical notebook where he logged every film he saw and his rating thereof. This app is designed to function similarly. 

This app can handle multiple users. Each user can input their opinion of each  movie. 

When you go to add a movie, the search box leads to the OMDb Search API. It returns several relevant options (so if you search The Dark Knight, you'll see, among other choices, The Dark Knight 2008 & The Dark Knight Rises 2012).

When you select one of these options, the app will use the OMDb ID/Title API and grab a bit more information before creating the movie in your database. It will find or create a Director, and create a page for them as well, which should list and link to all of their movies.

If you are logged in, the options form will show you fields for the year you saw the movie and your rating of the movie, along with a checkbox to indicate whether you've seen it in theaters. These options will also show up in the "edit movie" form if you're logged in, so if another user (or a logged out user) created the movie, you can just add your opinion. 

To Do List (not in order of priority at all):

  1) The app is currently limited in its ability to handle movies with multiple directors - for now, it chooses the first listed name as director, and saves the other names as "collaborators" of the first guy. The collaborators are referenced on the director's page, but not yet associated to the movie on which they collaborated.

  2) IMDb poster API is cool, but I don't want to add it till much later, to keep page-load time low during testing.
  2a) on the other hand I just added chartkick javascript so maybe get I'll started on that soon

  3) Basic rspec/capybara tests have been implemented for Movie and Director. More tests are needed: 
    a) user model 
    b) users controller
    c) choice model
    d) choices controller 
    e) user_movie model
    f) user_movie controller

  4) I am using a weird hack for the edit/update of a movie, in that the same thing is rendered in two different files (/movies/edit & /user_movies/edit) so that I can pass the appropriate error messages. There must be a better way to do this. 

  5) it'd be cool if you could organize movies on your user page by directors and ratings and stuff, like a sortable spreadsheet instead of a plain html unordered list. (the pie chart is a start but not granular enough)

Possible Fork / New App Idea:

OMDB's API can handle TV Season/Episode requests. 
With the many ways to view television these days (Hulu, Netflix, Amazon, actual TV), it's hard to keep track of the last episode you've seen of any given show. Perhaps a "Last Seen" app?
http://www.omdbapi.com/?t=Game%20of%20Thrones&Season=1&Episode=1