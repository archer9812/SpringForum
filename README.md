学校论坛系统

[开发环境]
1.系统用idea编译，idea集成tomcat服务器
2.数据库使用MySQL
3.使用idea集成maven，或下载maven3.6.0
4.所有项目所需依赖（包）都由maven在pom.xml文件中自动添加配置

[功能描述]
1.游客用户可查看系统平台网站首页，浏览首页展示的信息，查看不同的板块的论坛、帖子等信息，但是需要注册成为网站用户才可进行发布帖子，评价帖子，点赞等操作。
2.个人用户注册和个人账户管理:用户可注册成为网站个人用户，注册需要提供必要的信息，如账户(或学号)、密码、性别、出生日期、身份证号、邮箱、手机号、密码找回问题等。注册请求提交后显示提示信息页面，提示用户需要等待管理员审核通过方可登录。审核通过后用户会收到邮件通知，之后可使用注册账户登录校园论坛网站。用户注册经管理员审核通过后，可登录校园论坛网站。个人用户登录后可修改个人信息和密码，请为修改个人信息和密码提供不同的操作界面，修改密码需要验证旧密码，修改后要求用户重新登录。如果用户打算不再使用该平台，可注销个人账户，注销后不可再使用个人账户登录平台，可通过提供要求的信息重新激活账户。个人用户登录需要检查密码，用户名的正确性和有效性，个人用户登录后可以发表帖子，游览帖子，回复帖子，修改个人信息。
3.个人用户登录之后，就可以发表帖子，未注册的用户（游客）不可以发表帖子，需要设置发布帖子的模块，包括发帖人，帖子标题，帖子摘要，帖子内容等。个人用户（非游客）可以对某一话题展开讨论，发表意见并给出回复，需要有回复帖子的用户的昵称，回帖人的回复标题，回帖人的回复摘要，回帖人的回复内容等。
4.管理员功能需求：管理员作为管理网站的用户，拥有对网站管理功能的所有操作权限。可使用管理员界面管理用户、帖子、留言、公告等信息。管理员可以查看新注册用户列表，并进行批量审核，选择审核通过与否，审核通过与否，系统发送邮件给对应的用户。管理员可以添加、修改、删除和禁用用户。管理员禁用的用户可登录，但是只看到提示界面，提示账户不可用，并可以发送消息给管理员请求解冻账户。管理员可查看被举报的用户列表，根据举报次数对用户执行操作，如禁用其账户或彻底删除其账户。如果禁用或删除了用户账户，系统发送邮件给对应用户，通知其账户被禁用或删除。管理员可以针对管理的帖子进行转移、置顶和删除，设置精华帖，控制帖子的点击量等操作，管理员可删除单个帖子或批量删除某个板块的帖子。管理员可以查看被举报的帖子，可以选择删除该帖子。根据不同的讨论内容和话题，管理员可以将整个讨论区划分成不同的区域，个人用户可以选择进入不同的讨论区，允许管理者对分类进行调整。管理员可查看被举报的不良帖子，并可选择对该帖子进行删除还是禁用，管理员也可以对一些无用的版块删除。

[用户身份分配]
管理员：（账号：Admin密码：123456）
版主
副站长
用户：（账号：LiuTao密码：123)

[作者列表]
刘承启，刘钟涛，谭伟栋，邱山岭

[更新链接]
https://github.com/archer9812/SpringForum

[联系方式]
qq:962303194