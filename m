From: jpoimboe@redhat.com (Josh Poimboeuf)
Date: Tue, 7 May 2019 15:02:44 -0500
Subject: [RFC][PATCH 2/3] x86_64: Allow breakpoints to emulate call
 functions
In-Reply-To: <20190507155817.2d08d0eb@gandalf.local.home>
References: <20190507174227.673261270@goodmis.org>
 <20190507174400.219947724@goodmis.org>
 <20190507175342.fskdj2qidpao65qi@treble>
 <20190507150153.7a5d376d@gandalf.local.home>
 <20190507191412.n4uhoyfwagagyfwi@treble>
 <20190507152016.77f7a3af@gandalf.local.home>
 <20190507194925.qndvv67rinrmbefj@treble>
 <20190507155817.2d08d0eb@gandalf.local.home>
Message-ID: <20190507200244.mo6po3xxdg3kv2xy@treble>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507200244.piWO4dzeH0fEx3Cm5gItgHDPfBUL9Fiz2TOYp2IEKYQ@z>

On Tue, May 07, 2019@03:58:17PM -0400, Steven Rostedt wrote:
> On Tue, 7 May 2019 14:49:25 -0500
> Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> 
> > > New version:
> > > 
> > >     x86_64: Allow breakpoints to emulate call functions
> > >     
> > >     In order to allow breakpoints to emulate call functions, they need to push  
> > 
> > Sorry to keep nitpicking, but "call functions" -> "function calls" would
> > sound more accurate to me (in both subject and description).
> 
> I disagree ;-)
> 
> Matters how you look at it. I look at it as emulating the "call"
> function, not a function call. Like emulating an "addl" function, or a
> "jmp" function.
> 
> See?

I kind of see your point... but then you're overloading the meaning of
the word "function", in a context where it clearly means something else.

> To remove the ambiguity, I could replace "function" with "instruction".

Yes, that would be much better :-)

-- 
Josh
