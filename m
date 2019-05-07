From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 7 May 2019 15:58:17 -0400
Subject: [RFC][PATCH 2/3] x86_64: Allow breakpoints to emulate call
 functions
In-Reply-To: <20190507194925.qndvv67rinrmbefj@treble>
References: <20190507174227.673261270@goodmis.org>
 <20190507174400.219947724@goodmis.org>
 <20190507175342.fskdj2qidpao65qi@treble>
 <20190507150153.7a5d376d@gandalf.local.home>
 <20190507191412.n4uhoyfwagagyfwi@treble>
 <20190507152016.77f7a3af@gandalf.local.home>
 <20190507194925.qndvv67rinrmbefj@treble>
Message-ID: <20190507155817.2d08d0eb@gandalf.local.home>

On Tue, 7 May 2019 14:49:25 -0500
Josh Poimboeuf <jpoimboe at redhat.com> wrote:

> > New version:
> > 
> >     x86_64: Allow breakpoints to emulate call functions
> >     
> >     In order to allow breakpoints to emulate call functions, they need to push  
> 
> Sorry to keep nitpicking, but "call functions" -> "function calls" would
> sound more accurate to me (in both subject and description).

I disagree ;-)

Matters how you look at it. I look at it as emulating the "call"
function, not a function call. Like emulating an "addl" function, or a
"jmp" function.

See?

To remove the ambiguity, I could replace "function" with "instruction".

> 
> Otherwise it looks good.

Thanks!

-- Steve
