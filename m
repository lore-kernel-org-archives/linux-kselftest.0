From: rostedt at goodmis.org (Steven Rostedt)
Date: Sat, 3 Nov 2018 09:13:41 -0400
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181103220012.55ecd97e671c43e4959c8b62@kernel.org>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
 <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
 <20181102154325.bt6xoysl4xdl33wd@treble>
 <20181102121307.32e99414@gandalf.local.home>
 <20181103220012.55ecd97e671c43e4959c8b62@kernel.org>
Message-ID: <20181103091341.3d32683e@vmware.local.home>

On Sat, 3 Nov 2018 22:00:12 +0900
Masami Hiramatsu <mhiramat at kernel.org> wrote:

> On Fri, 2 Nov 2018 12:13:07 -0400
> Steven Rostedt <rostedt at goodmis.org> wrote:
> 

> > Because that means if function graph tracer is active, then you can't
> > do a kretprobe, and vice versa. I'd really like to have it working for
> > multiple users, then we could trace different graph functions and store
> > them in different buffers. It would also allow for perf to use function
> > graph tracer too.  
> 
> Steve, how woul you allow multiple users on it? Something like this?
> 
> ret_trampoline_multiple(){
>    list_for_each(handler, &shadow_entry[i].handlers, list)
> 	handler(shadow_entry[i]);
>    restore_retval_and_jump_to(shadow_entry[i].orig);
> }
>

Something like that. But since it's not a single mapping between shadow
entries and handlers, that is we have multiple tasks with multiple
shadow entries and multiple handlers, we can't use a link list (two
different parents per handler).

I was thinking of a bitmask that represents the handlers, and use that
to map which handler gets called for which shadow entry for a
particular task.

-- Steve
