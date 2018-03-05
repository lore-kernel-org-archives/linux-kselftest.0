From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Mon, 5 Mar 2018 19:05:12 +0900
Subject: [PATCH v4 01/19] [BUGFIX] tracing: probeevent: Fix to support
 minus offset from symbol
In-Reply-To: <20180305022814.GA8824@sejong>
References: <151978796240.2577.6531711990653677529.stgit@devbox>
 <151978799370.2577.9456049827647614166.stgit@devbox>
 <20180302044951.GA31540@sejong>
 <20180302153229.dbc4dc9be90a0132b7010010@kernel.org>
 <20180305022814.GA8824@sejong>
Message-ID: <20180305190512.d4939c53c5288ae0fe9bf2a8@kernel.org>

On Mon, 5 Mar 2018 11:28:14 +0900
Namhyung Kim <namhyung at kernel.org> wrote:

> Hi Masami,
> 
> On Fri, Mar 02, 2018 at 03:32:29PM +0900, Masami Hiramatsu wrote:
> > On Fri, 2 Mar 2018 13:49:51 +0900
> > Namhyung Kim <namhyung at kernel.org> wrote:
> > 
> > > Hi Masami,
> > > 
> > > On Wed, Feb 28, 2018 at 12:19:53PM +0900, Masami Hiramatsu wrote:
> > > > In Documentation/trace/kprobetrace.txt, it says
> > > > 
> > > >  @SYM[+|-offs] : Fetch memory at SYM +|- offs (SYM should be a data symbol)
> > > > 
> > > > However, the parser doesn't parse minus offset correctly, since
> > > > commit 2fba0c8867af ("tracing/kprobes: Fix probe offset to be
> > > > unsigned") drops minus ("-") offset support for kprobe probe
> > > > address usage.
> > > > 
> > > > This fixes the traceprobe_split_symbol_offset() to parse minus
> > > > offset again with checking the offset range, and add a minus
> > > > offset check in kprobe probe address usage.
> > > 
> > > It now parses a minus offset but doesn't allow it, right?
> > 
> > No, split_symbol_offset() is used for 2 cases
> >  - kprobe-event probe point
> >  - kporbe-event symbol-based argument
> > 
> > Former one doesn't accept a minus offset, but latter accepts it.
> 
> Ah, ok then.
> 
> Acked-by: Namhyung Kim <namhyung at kernel.org>

Thanks!!


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
