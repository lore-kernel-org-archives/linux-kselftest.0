From: rostedt at goodmis.org (Steven Rostedt)
Date: Wed, 8 May 2019 12:06:14 -0400
Subject: [PATCH 0/3] x86_64/ftrace: Emulate calls from int3 when
 patching functions
In-Reply-To: <20190508133022.78cd9c9b8fcb7838fc0280d0@kernel.org>
References: <20190508015559.767152678@goodmis.org>
 <20190508133022.78cd9c9b8fcb7838fc0280d0@kernel.org>
Message-ID: <20190508120614.037779be@gandalf.local.home>

On Wed, 8 May 2019 13:30:22 +0900
Masami Hiramatsu <mhiramat at kernel.org> wrote:

> > To solve this, an int3_emulate_call() is created for x86_64 to allow
> > ftrace on x86_64 to emulate the call to ftrace_regs_caller() which will
> > make sure all the registered handlers to that function are still called.
> > And this keeps live kernel patching happy!  
> 
> Out of curiosity, would you have any idea to re-use these function for
> other use-case? Maybe kprobes can reuse it, but very limited use-case.

Yes, but only for x86_64.

> 
> > To mimimize the changes, and to avoid controversial patches, this
> > only changes x86_64. Due to the way x86_32 implements the regs->sp
> > the complexity of emulating calls on that platform is too much for
> > stable patches, and live kernel patching does not support x86_32 anyway.  
> 
> This series looks good to me.
> 
> Reviewed-by: Masami Hiramatsu <mhiramat at kernel.org>

Thanks Masami!

-- Steve
