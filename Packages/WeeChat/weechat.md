### Quick Start

### Add New Server
`/server add freenode chat.freenode.net`

### Set Username/NickName
`
/set irc.server.freenode.nicks "mynick,mynick2,mynick3,mynick4,mynick5"
/set irc.server.freenode.username "My user name"
/set irc.server.freenode.realname "My real name"
```

### Enable auto-connect to server at startup

`/set irc.server.freenode.autoconnect on`

### Connect To Server
`/connect freenode`

### Join channel
`/join #channel`

### Send A Message To Foo User
`/query foo this is a message`

### Close Current Buffer
`/close`

### Register You NickName
`/msg NickServ REGISTER password youremail@example.com`

### Login
`/msg nickserv identify <password>`

### AutoJoin channels
1. Download the autojoin.py script to ~/.weechat/python/autoload
2. Run `/python autoload` to load the script
3. Run `/autojoin --run` to store the channels to join
4. Run `/layout store` to store the order of the channels
5. Run `/save` to save your settings to a file


### Links
1. [weechat_quickstart](https://weechat.org/files/doc/devel/weechat_quickstart.en.html)
2. [how_to_auto_join_channels](https://superuser.com/questions/743206/how-do-i-join-all-the-channels-in-my-weechat-layout)
