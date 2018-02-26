From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Mon, 26 Feb 2018 19:16:45 +0900
Subject: [PATCH v3 15/18] tracing: probeevent: Add array type support
In-Reply-To: <20180226014532.GB1972@sejong>
References: <151945010287.27508.6226184958678620828.stgit@devbox>
 <151945054003.27508.54078842635361756.stgit@devbox>
 <20180226014532.GB1972@sejong>
Message-ID: <20180226191645.3b1f5b529b6c876dd279cb37@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180226101645.-eiJaYAqEwT8enHaoJCv-3uxAE9RANt9nZprZ1sRAcg@z>

On Mon, 26 Feb 2018 10:45:32 +0900
Namhyung Kim <namhyung@kernel.org> wrote:

> On Sat, Feb 24, 2018@02:35:40PM +0900, Masami Hiramatsu wrote:
> > Add array type support for probe events.
> > This allows user to get arraied types from memory address.
> > The array type syntax is
> > 
> > 	TYPE[N]
> > 
> > Where TYPE is one of types (u8/16/32/64,s8/16/32/64,
> > x8/16/32/64, symbol, string) and N is a fixed value less
> > than 64.
> > 
> > The string array type is a bit different from other types. For
> > other base types, <base-type>[1] is equal to <base-type>
> > (e.g. +0(%di):x32[1] is same as +0(%di):x32.) But string[1] is not
> > equal to string. The string type itself represents "char array",
> > but string array type represents "char * array". So, for example,
> > +0(%di):string[1] is equal to +0(+0(%di)):string.
> > 
> > Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> > ---
> >  Changes in v2:
> >   - Add array description in README file
> >   - Fix to init s3 code out of loop.
> >   - Fix to proceed code when the last code is OP_ARRAY.
> >   - Add string array type and bitfield array type.
> > ---
> 
> [SNIP]
> > @@ -546,11 +610,16 @@ int traceprobe_define_arg_fields(struct trace_event_call *event_call,
> >  	/* Set argument names as fields */
> >  	for (i = 0; i < tp->nr_args; i++) {
> >  		struct probe_arg *parg = &tp->args[i];
> > -
> > -		ret = trace_define_field(event_call, parg->type->fmttype,
> > -					 parg->name,
> > +		const char *fmt = parg->type->fmttype;
> > +		int size = parg->type->size;
> > +
> > +		if (parg->fmt)
> > +			fmt = parg->fmt;
> > +		if (parg->count)
> > +			size *= parg->count;
> > +		ret = trace_define_field(event_call, fmt, parg->name,
> >  					 offset + parg->offset,
> > -					 parg->type->size,
> > +					 parg->type->size * parg->count,
> 
> It should use the 'size' variable, otherwise scalar types will have 0 size.

Oops, good catch! I forgot to use it at the main point...
 
Thank you so much!

> 
> Thanks,
> Namhyung
> 
> 
> >  					 parg->type->is_signed,
> >  					 FILTER_OTHER);


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
