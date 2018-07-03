From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 3 Jul 2018 10:23:50 -0400
Subject: [PATCH v9 0/7] Centralize and unify usage of preempt/irq
 tracepoints
In-Reply-To: <20180703141537.GA108396@joelaf.mtv.corp.google.com>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180703141537.GA108396@joelaf.mtv.corp.google.com>
Message-ID: <20180703102350.38d4e3fc@gandalf.local.home>

On Tue, 3 Jul 2018 07:15:37 -0700
Joel Fernandes <joel at joelfernandes.org> wrote:

> On Thu, Jun 28, 2018 at 11:21:42AM -0700, Joel Fernandes wrote:
> > From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
> > 
> > This is a posting of v9 preempt/irq tracepoint clean up series rebased
> > onto v4.18-rc2. No changes in the series, just a rebase + repost.
> > 
> > All patches have a Reviewed-by tags now from reviewers. This series has
> > been well tested and is a simplification/refactoring of existing code,
> > along with giving a speed-up for tracepoints using the rcu-idle API.
> > With this our users will find it easier to use tools depending on
> > existing preempt tracepoints since it simplifies the configuration for
> > them.  
> 
> Steve, all patches of this tracing series have been reviewed and/or acked and
> there haven't been additional changes for a couple of reposts. Are you Ok
> with it?
> 

I'm currently chasing down some fires, but I'll try to get to it this
week.

Thanks for the patience ;-)

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
