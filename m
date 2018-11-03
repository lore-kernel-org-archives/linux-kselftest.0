From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Sat, 3 Nov 2018 22:00:12 +0900
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181102121307.32e99414@gandalf.local.home>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
 <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
 <20181102154325.bt6xoysl4xdl33wd@treble>
 <20181102121307.32e99414@gandalf.local.home>
Message-ID: <20181103220012.55ecd97e671c43e4959c8b62@kernel.org>

On Fri, 2 Nov 2018 12:13:07 -0400
Steven Rostedt <rostedt at goodmis.org> wrote:

> On Fri, 2 Nov 2018 10:43:26 -0500
> Josh Poimboeuf <jpoimboe at redhat.com> wrote:
> 
> > > I'll hopefully have a prototype ready by plumbers.  
> > 
> > Why do we need multiple users?  It would be a lot simpler if we could
> > just enforce a single user per fgraphed/kretprobed function (and return
> > -EBUSY if it's already being traced/probed).
> 
> Because that means if function graph tracer is active, then you can't
> do a kretprobe, and vice versa. I'd really like to have it working for
> multiple users, then we could trace different graph functions and store
> them in different buffers. It would also allow for perf to use function
> graph tracer too.

Steve, how woul you allow multiple users on it? Something like this?

ret_trampoline_multiple(){
   list_for_each(handler, &shadow_entry[i].handlers, list)
	handler(shadow_entry[i]);
   restore_retval_and_jump_to(shadow_entry[i].orig);
}


> > > And this too will require each architecture to probably change. As a
> > > side project to this, I'm going to try to consolidate the function
> > > graph code among all the architectures as well. Not an easy task.  
> > 
> > Do you mean implementing HAVE_FUNCTION_GRAPH_RET_ADDR_PTR for all the
> > arches?  If so, I think have an old crusty patch which attempted to
> > that.  I could try to dig it up if you're interested.
> > 
> 
> I'd like to have that, but it still requires some work. But I'd just
> the truly architecture dependent code be in the architecture (basically
> the asm code), and have the ability to move most of the duplicate code
> out of the archs.

I will also do that for kretprobe handlers.

Thank you,

-- 
Masami Hiramatsu <mhiramat at kernel.org>
