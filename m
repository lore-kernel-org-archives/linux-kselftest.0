From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Tue, 3 Apr 2018 23:41:53 +0900
Subject: [PATCH v6 10/21] tracing: probeevent: Return consumed bytes of
 dynamic area
In-Reply-To: <20180402160207.23c96309@gandalf.local.home>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
 <152129069244.31874.7879658400858676349.stgit@devbox>
 <20180402160207.23c96309@gandalf.local.home>
Message-ID: <20180403234153.7bd44567305ca11cead0e35b@kernel.org>

On Mon, 2 Apr 2018 16:02:07 -0400
Steven Rostedt <rostedt at goodmis.org> wrote:

> On Sat, 17 Mar 2018 21:44:52 +0900
> Masami Hiramatsu <mhiramat at kernel.org> wrote:
> 
> > -static nokprobe_inline void
> > -fetch_store_string(unsigned long addr, void *dest)
> > +static nokprobe_inline int
> > +fetch_store_string(unsigned long addr, void *dest, void *base)
> >  {
> > -	int maxlen = get_rloc_len(*(u32 *)dest);
> > -	u8 *dst = get_rloc_data(dest);
> > +	int maxlen = get_loc_len(*(u32 *)dest);
> > +	u8 *dst = get_loc_data(dest, base);
> >  	long ret;
> >  
> >  	if (!maxlen)
> > -		return;
> > +		return -ENOMEM;
> >  
> >  	/*
> >  	 * Try to get string again, since the string can be changed while
> > @@ -854,19 +851,19 @@ fetch_store_string(unsigned long addr, void *dest)
> >  
> >  	if (ret < 0) {	/* Failed to fetch string */
> >  		dst[0] = '\0';
> > -		*(u32 *)dest = make_data_rloc(0, get_rloc_offs(*(u32 *)dest));
> > -	} else {
> > -		*(u32 *)dest = make_data_rloc(ret, get_rloc_offs(*(u32 *)dest));
> > +		ret = 0;
> 
> Why do you return 0 here and not the error value? You return -ENOMEM
> above if maxlen is zero.

Good catch! it should clear dst[0] and return 0 even if no buffer remains...
OK, I'll fix it.

Thank you!

> 
> -- Steve
> 
> >  	}
> > +	*(u32 *)dest = make_data_loc(ret, (void *)dst - base);
> > +	return ret;
> >  }


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
