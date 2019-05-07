From: jpoimboe at redhat.com (Josh Poimboeuf)
Date: Tue, 7 May 2019 14:49:25 -0500
Subject: [RFC][PATCH 2/3] x86_64: Allow breakpoints to emulate call
 functions
In-Reply-To: <20190507152016.77f7a3af@gandalf.local.home>
References: <20190507174227.673261270@goodmis.org>
 <20190507174400.219947724@goodmis.org>
 <20190507175342.fskdj2qidpao65qi@treble>
 <20190507150153.7a5d376d@gandalf.local.home>
 <20190507191412.n4uhoyfwagagyfwi@treble>
 <20190507152016.77f7a3af@gandalf.local.home>
Message-ID: <20190507194925.qndvv67rinrmbefj@treble>

On Tue, May 07, 2019 at 03:20:16PM -0400, Steven Rostedt wrote:
> On Tue, 7 May 2019 14:14:12 -0500
> Josh Poimboeuf <jpoimboe at redhat.com> wrote:
> 
> > On Tue, May 07, 2019 at 03:01:53PM -0400, Steven Rostedt wrote:
> > > How's this?
> > > 
> > > -- Steve
> > > 
> > > From d29dc2e9e0275c9857932b80cebc01551b669efb Mon Sep 17 00:00:00 2001
> > > From: Peter Zijlstra <peterz at infradead.org>
> > > Date: Wed, 1 May 2019 15:11:17 +0200
> > > Subject: [PATCH] x86_64: Allow breakpoints to emulate call functions
> > > 
> > > In order to allow breakpoints to emulate call functions, they need to push
> > > the return address onto the stack. But because the breakpoint exception
> > > frame is added to the stack when the breakpoint is hit, there's no room to
> > > add the address onto the stack and return to the address of the emulated
> > > called funtion.  
> > 
> > The 2nd sentence can probably be removed since it's technically no
> > longer true, thanks to the previous patch.
> > 
> > > This helper functions are added:  
> > 
> > "These"
> 
> New version:
> 
>     x86_64: Allow breakpoints to emulate call functions
>     
>     In order to allow breakpoints to emulate call functions, they need to push

Sorry to keep nitpicking, but "call functions" -> "function calls" would
sound more accurate to me (in both subject and description).

Otherwise it looks good.

>     the return address onto the stack. The x86_64 int3 handler adds a small gap
>     to allow the stack to grow some. Use this gap to add the return address to
>     be able to emulate a call instruction at the breakpoint location.
>     
>     These helper functions are added:
>     
>       int3_emulate_jmp(): changes the location of the regs->ip to return there.
>     
>      (The next two are only for x86_64)
>       int3_emulate_push(): to push the address onto the gap in the stack
>       int3_emulate_call(): push the return address and change regs->ip

-- 
Josh
