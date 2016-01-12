## Cookie Monster App

<img src="https://media.giphy.com/media/E6pfGEOsrDidq/giphy.gif" width="400" title="cookie monster">

In this lab we will explore cookies and sessions. First we'll play with manually setting cookies on the front-end. Then we'll explore how cookies are used to create "sessions" that keep track of user data on the server-side.

## Setup
Clone this repo, bundle, and run the server.

```bash
cd cookie_monster_app
bundle
rails s
```

> Note: This rails application does not use a database or turbolinks.

####Challenges
Visit `http://localhost:3000/cookies` in your browser, with the Chrome Console open. Code in `app/controllers/cookies_controller.rb` for challenges 3 & 4.

> Pay special attention to `Resources > Cookies > localhost` in the Developer Console. The Cookies-view allows you to browse and delete cookies associated with the current domain.

1. Use the Chrome Console to manually set a cookie for the website to: `fav_color=blue`
2. Manually add a second cookie (`can_has=yarly`) so that you can access the 3 desert pages.
  * This is a cookie that the server is actually checking for! (see the `cookies#show` controller)
  * Without this cookie, you're blocked from viewing the desert pages!
3. When a user clicks "Save as Favorite" on a `cookies#show` page, store the cookie id in the user's session.
4. Modify the `cookies#show` view to indicate whether the cookie shown is the user's favorite cookie (aka a "conditional view").
5. Stretch: Can you DRY up the controller code by using a `before_action` to check whether the user is logged in?


#### Summary
By the end of this lab you should be able to explain how and why these cookies are present in your browser:

<img width="735" alt="screen shot 2016-01-11 at 7 30 58 pm" src="https://cloud.githubusercontent.com/assets/1489337/12254093/06d8244a-b89a-11e5-8e6d-3c68c8e279b2.png">

What's the difference between a cookie and a session?
