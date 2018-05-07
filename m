From: rostedt at goodmis.org (Steven Rostedt)
Date: Mon, 7 May 2018 11:21:54 -0400
Subject: [PATCH v7 00/16] tracing: probeevent: Improve fetcharg features
In-Reply-To: <20180505113803.45700179a93091b114ec6984@kernel.org>
References: <152465856498.26224.16969986455942749517.stgit@devbox>
 <20180503181137.6d82d897@gandalf.local.home>
 <20180505004828.9b75b6802472f09b0d2de5b8@kernel.org>
 <20180504120642.354cdd1f@gandalf.local.home>
 <20180505113803.45700179a93091b114ec6984@kernel.org>
Message-ID: <20180507112154.5c1ea44c@gandalf.local.home>

On Sat, 5 May 2018 11:38:03 +0900
Masami Hiramatsu <mhiramat at kernel.org> wrote:

> On Fri, 4 May 2018 12:06:42 -0400
> Steven Rostedt <rostedt at goodmis.org> wrote:
> 
> > On Sat, 5 May 2018 00:48:28 +0900
> > Masami Hiramatsu <mhiramat at kernel.org> wrote:
> >   
> > > So the syntax will be
> > > 
> > > p[:EVENT] SYM[(CAST)|+OFFS] [FETCHARG]
> > > 
> > > And here is an example;
> > > 
> > > p:myevent vfs_read(void *file, char *buf, size_t count, void *pos) $arg1 $arg2  
> > 
> > If we do this, why bother with $arg1 $arg2?  
> 
> User may want to trace only some of them. :)

Yes, and this is why I like my solution of the NULL parameter, and you
don't need to show anything after what you want.

 p:myevent vfs_read(void *file, NULL, size_t count)

would only trace file and count, and ignore buf and pos.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
