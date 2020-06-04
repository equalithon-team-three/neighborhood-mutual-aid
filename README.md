# Traid

![Traid Screenshot](./public/screenshot.png)

### Video Presentation:

[![Traid Video Presentation](https://img.youtube.com/vi/_QVQUhjbVqs/0.jpg)](https://www.youtube.com/watch?v=_QVQUhjbVqs)

### Deployed Web App:

https://tr-aid.web.app

### Description:

Responsive web app that allows users to offer and request aid from others in their community.

MVP completed using Agile methodologies in 7 days for the Essteem Hackathon for COVID-19 Relief sponsored by Girls Who Code, [in which it won first place](https://www.equalithon.io/past-challenges/traid).

### Tech Stack:

Built using Rails on the backend and React and Bootswatch on the frontend.

### Dev Team:

- Tal Luigi ([LinkedIn](https://www.linkedin.com/in/talluigi) | [GitHub](https://github.com/luigilegion))
- Graham Troyer-Joy ([LinkedIn](https://www.linkedin.com/in/grahamtroyerjoy) | [GitHub](https://github.com/telegraham))
- Meredith Strickland ([LinkedIn](https://www.linkedin.com/in/meredith-strickland) | [GitHub](https://github.com/merestrickland))
- Jessica Lin ([LinkedIn](https://www.linkedin.com/in/lin-jessica) | [GitHub](https://github.com/lin-jessica))

### Schema

    Users ----< Posts >-------- PostCategory
                  |                  |
                  |                  |
                  |                  ^
                  |             Taggability
                  |                 \/
                  |                  |
                  |                  |
                  |            TagCategories
                  |                  |
                  |                  |
                  |                  |
                  |                  |
                  |                  ^
                  ----------------< Tags
