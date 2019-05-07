From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 7 May 2019 14:57:24 -0400
Subject: [RFC][PATCH 1/3] x86_64: Add gap to int3 to allow for call
 emulation
In-Reply-To: <20190507175655.u3kcvedpfao4rchj@treble>
References: <20190507174227.673261270@goodmis.org>
 <20190507174400.064350937@goodmis.org>
 <20190507175655.u3kcvedpfao4rchj@treble>
Message-ID: <20190507145724.132dc8ec@gandalf.local.home>

On Tue, 7 May 2019 12:56:55 -0500
Josh Poimboeuf <jpoimboe at redhat.com> wrote:


> > +	.if \create_gap == 1
> > +	/*
> > +	 * If coming from kernel space, create a 6-word gap to allow the static
> > +	 * call #BP handler to emulate a call instruction.  
> 
> Might as well refer to it as the int3 handler, since that's what the
> rest of the code calls it.  Also, no static calls yet :-)  So:
> 
> s/static call #BP handler/int3 handler/
> 

Done.

-- Steve
