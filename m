From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Tue, 27 Feb 2018 14:23:51 +0900
Subject: [PATCH v3 01/18] [BUGFIX] tracing: probeevent: Fix to support
 minus offset from symbol
In-Reply-To: <20180226003818.GA1972@sejong>
References: <151945010287.27508.6226184958678620828.stgit@devbox>
 <151945013281.27508.4068021929757474274.stgit@devbox>
 <20180226003818.GA1972@sejong>
Message-ID: <20180227142351.576f8d8c1964b661dc1dc5a6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180227052351.7iRzMb5NsB0XXTZHhbbT6NgBbKDCYjuYtxsOINJrytw@z>

On Mon, 26 Feb 2018 09:38:18 +0900
Namhyung Kim <namhyung@kernel.org> wrote:

> Hi Masami,
> 
> On Sat, Feb 24, 2018@02:28:52PM +0900, Masami Hiramatsu wrote:
> > In Documentation/trace/kprobetrace.txt, it says
> > 
> >  @SYM[+|-offs] : Fetch memory at SYM +|- offs (SYM should be a data symbol)
> > 
> > However, the parser doesn't parse minus offset correctly, since
> > commit 2fba0c8867af ("tracing/kprobes: Fix probe offset to be
> > unsigned") drops minus ("-") offset support for kprobe probe
> > address usage.
> > 
> > This fixes the traceprobe_split_symbol_offset() to parse minus
> > offset again with checking the offset range, and add a minus
> > offset check in kprobe probe address usage.
> > 
> > Fixes: 2fba0c8867af ("tracing/kprobes: Fix probe offset to be unsigned")
> > Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> > ---
> >  Changes in v3:
> >   - Use kstrtol instead of kstrtoul. (Thanks Namhyung!)
> > ---
> >  kernel/trace/trace_kprobe.c |    4 ++--
> >  kernel/trace/trace_probe.c  |    8 +++-----
> >  kernel/trace/trace_probe.h  |    2 +-
> >  3 files changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> > index 5ce9b8cf7be3..b5b1d8aa47d6 100644
> > --- a/kernel/trace/trace_kprobe.c
> > +++ b/kernel/trace/trace_kprobe.c
> > @@ -667,7 +667,7 @@ static int create_trace_kprobe(int argc, char **argv)
> >  	char *symbol = NULL, *event = NULL, *group = NULL;
> >  	int maxactive = 0;
> >  	char *arg;
> > -	unsigned long offset = 0;
> > +	long offset = 0;
> >  	void *addr = NULL;
> >  	char buf[MAX_EVENT_NAME_LEN];
> >  
> > @@ -755,7 +755,7 @@ static int create_trace_kprobe(int argc, char **argv)
> >  		symbol = argv[1];
> >  		/* TODO: support .init module functions */
> >  		ret = traceprobe_split_symbol_offset(symbol, &offset);
> > -		if (ret) {
> > +		if (ret || offset < 0) {
> 
> Hmm.. is minus offset an error?  Then why not removing it from the
> documentation?  And the 'ret' would be 0 in that case.

Yes, since the kprobe.offset is unsigned, it is not possible.
BTW, I found it is "unsigned int", so it should check UINT_MAX too...
(Or make it unsigned long)

> 
> 
> >  			pr_info("Failed to parse either an address or a symbol.\n");
> >  			return ret;
> >  		}
> > diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
> > index d59357308677..d3d1ee820336 100644
> > --- a/kernel/trace/trace_probe.c
> > +++ b/kernel/trace/trace_probe.c
> > @@ -320,7 +320,7 @@ static fetch_func_t get_fetch_size_function(const struct fetch_type *type,
> >  }
> >  
> >  /* Split symbol and offset. */
> > -int traceprobe_split_symbol_offset(char *symbol, unsigned long *offset)
> > +int traceprobe_split_symbol_offset(char *symbol, long *offset)
> >  {
> >  	char *tmp;
> >  	int ret;
> > @@ -328,13 +328,11 @@ int traceprobe_split_symbol_offset(char *symbol, unsigned long *offset)
> >  	if (!offset)
> >  		return -EINVAL;
> >  
> > -	tmp = strchr(symbol, '+');
> > +	tmp = strpbrk(symbol, "+-");
> >  	if (tmp) {
> > -		/* skip sign because kstrtoul doesn't accept '+' */
> > -		ret = kstrtoul(tmp + 1, 0, offset);
> > +		ret = kstrtol(tmp + 1, 0, offset);
> 
> It should not skip the sign anymore.

Oops, yes. I'll fix it and I should add a test case for it. Thanks!


> 
> Thanks,
> Namhyung
> 
> 
> >  		if (ret)
> >  			return ret;
> > -
> >  		*tmp = '\0';
> >  	} else
> >  		*offset = 0;
> > diff --git a/kernel/trace/trace_probe.h b/kernel/trace/trace_probe.h
> > index 0745f895f780..75daff22ccea 100644
> > --- a/kernel/trace/trace_probe.h
> > +++ b/kernel/trace/trace_probe.h
> > @@ -365,7 +365,7 @@ extern int traceprobe_conflict_field_name(const char *name,
> >  extern void traceprobe_update_arg(struct probe_arg *arg);
> >  extern void traceprobe_free_probe_arg(struct probe_arg *arg);
> >  
> > -extern int traceprobe_split_symbol_offset(char *symbol, unsigned long *offset);
> > +extern int traceprobe_split_symbol_offset(char *symbol, long *offset);
> >  
> >  /* Sum up total data length for dynamic arraies (strings) */
> >  static nokprobe_inline int
> > 


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
