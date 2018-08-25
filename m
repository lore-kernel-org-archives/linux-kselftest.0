From: rostedt at goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 21:42:04 -0400
Subject: [PATCH v2 03/32] selftests/ftrace: Add --console hidden option
In-Reply-To: <20180825103513.5b86d42a7ee2d20435522fbb@kernel.org>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443703653.23257.12015337438174061938.stgit@devbox>
 <20180824163737.0f47535a@gandalf.local.home>
 <20180825103513.5b86d42a7ee2d20435522fbb@kernel.org>
Message-ID: <20180824214204.38e2004d@vmware.local.home>

On Sat, 25 Aug 2018 10:35:13 +0900
Masami Hiramatsu <mhiramat at kernel.org> wrote:

> On Fri, 24 Aug 2018 16:37:37 -0400
> Steven Rostedt <rostedt at goodmis.org> wrote:
> 
> > On Fri, 17 Aug 2018 01:30:36 +0900
> > Masami Hiramatsu <mhiramat at kernel.org> wrote:
> >   
> > > Add --console hidden option for debug test cases.
> > > This option allows to put "sh" or something else
> > > when the test case hits a bug.  
> > 
> > Can you add more information to why and how this would be used.  
> 
> For example, if you find a testcase which doesn't
> pass, you can insert sh for interactive debug as below
> 
>   #!/bin/sh
>   # description: sample test case
> 
>   good-command
>   suspicious-wrong-command
>   sh # <- add this for interactive debug
> 

Ah! OK. But this needs to be explained a little better in the change
log as well as in the comments for it.

Thanks!

-- Steve
