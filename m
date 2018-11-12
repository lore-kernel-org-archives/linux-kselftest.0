From: kafai@fb.com (Martin Lau)
Date: Mon, 12 Nov 2018 23:41:46 +0000
Subject: [PATCH v5 bpf-next 2/7] libbpf: cleanup after partial failure in
 bpf_object__pin
In-Reply-To: <20181112232925.74cajfncscaf7sc6@mini-arch>
References: <20181109162146.78019-1-sdf@google.com>
 <20181109162146.78019-3-sdf@google.com>
 <20181112215337.5ztvb5v7cf4kzr2h@kafai-mbp.dhcp.thefacebook.com>
 <20181112221011.qqqkexvr3mw5clnr@mini-arch>
 <20181112231040.l4qdresmbhcyf7vs@kafai-mbp.dhcp.thefacebook.com>
 <20181112232925.74cajfncscaf7sc6@mini-arch>
Message-ID: <20181112234143.d6k3ost7drecu6up@kafai-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181112234146.QpdZt7h1QmD-CyDuNYZChfg78Sx2tl60RvXCCG_6A9Y@z>

On Mon, Nov 12, 2018@03:29:25PM -0800, Stanislav Fomichev wrote:
> On 11/12, Martin Lau wrote:
> > On Mon, Nov 12, 2018@02:10:11PM -0800, Stanislav Fomichev wrote:
> > > On 11/12, Martin Lau wrote:
> > > > On Fri, Nov 09, 2018@08:21:41AM -0800, Stanislav Fomichev wrote:
> > > > [ ... ]
> > > > > @@ -1918,23 +2160,20 @@ void *bpf_object__priv(struct bpf_object *obj)
> > > > >  }
> > > > >  
> > > > >  static struct bpf_program *
> > > > > -__bpf_program__next(struct bpf_program *prev, struct bpf_object *obj)
> > > > > +__bpf_program__iter(struct bpf_program *p, struct bpf_object *obj, int i)
> > > > >  {
> > > > > -	size_t idx;
> > > > > +	ssize_t idx;
> > > > >  
> > > > >  	if (!obj->programs)
> > > > >  		return NULL;
> > > > > -	/* First handler */
> > > > > -	if (prev == NULL)
> > > > > -		return &obj->programs[0];
> > > > >  
> > > > > -	if (prev->obj != obj) {
> > > > > +	if (p->obj != obj) {
> > > > >  		pr_warning("error: program handler doesn't match object\n");
> > > > >  		return NULL;
> > > > >  	}
> > > > >  
> > > > > -	idx = (prev - obj->programs) + 1;
> > > > > -	if (idx >= obj->nr_programs)
> > > > > +	idx = (p - obj->programs) + i;
> > > > > +	if (idx >= obj->nr_programs || idx < 0)
> > > > >  		return NULL;
> > > > >  	return &obj->programs[idx];
> > > > >  }
> > > > > @@ -1944,8 +2183,29 @@ bpf_program__next(struct bpf_program *prev, struct bpf_object *obj)
> > > > >  {
> > > > >  	struct bpf_program *prog = prev;
> > > > >  
> > > > > +	if (prev == NULL)
> > > > > +		return obj->programs;
> > > > > +
> > > > This patch breaks the behavior introduced in
> > > > commit eac7d84519a3 ("tools: libbpf: don't return '.text' as a program for multi-function programs"):
> > > > "Make bpf_program__next() skip over '.text' section if object file
> > > >  has pseudo calls.  The '.text' section is hardly a program in that
> > > >  case, it's more of a storage for code of functions other than main."
> > > > 
> > > > For example, the userspace could have been doing:
> > > > 	prog = bpf_program__next(NULL, obj);
> > > > 	bpf_program__set_type(prog, BPF_PROG_TYPE_TRACEPOINT);
> > > > 	bpf_object__load(obj);
> > > > 
> > > > For the bpf_prog.o that has pseudo calls, after this patch in bpf-next,
> > > > the prog returned by bpf_program__next() could be in ".text" instead of
> > > > the main bpf program.  The next bpf_program__set_type() has
> > > > no effect to the main program.  The following bpf_object__load()
> > > > will catch user in surprise with the main bpf prog in
> > > > the wrong BPF_PROG_TYPE.
> > > 
> > > Will something like the following fix your concern? (plus, assuming the
> > > same for prev):
> > > 
> > > --- a/tools/lib/bpf/libbpf.c
> > > +++ b/tools/lib/bpf/libbpf.c
> > > @@ -2216,8 +2216,11 @@ bpf_program__next(struct bpf_program *prev, struct bpf_object *obj)
> > >  {
> > >         struct bpf_program *prog = prev;
> > >  
> > > -       if (prev == NULL)
> > > -               return obj->programs;
> > > +       if (prev == NULL) {
> > > +               prog = obj->programs;
> > > +               if (!prog || !bpf_program__is_function_storage(prog, obj))
> > > +                       return prog;
> > > +       }
> > >  
> > >         do {
> > >                 prog = __bpf_program__iter(prog, obj, 1);
> > > 
> > > Any suggestions for a better way to do it?
> > I think that would work.  The bpf_program__prev() will need the same
> > treatment though...
> > 
> > Here is my mostly untested fix to unblock my other dev works.  It moves
> > the very first NULL check back to __bpf_program__iter():
> I like your version and it works with my simple flow dissector test :-)
Great.  I will send out an offical patch.

> Thanks for spotting and fixing it!
> 
> 
> > From de1c89ae1768e756825a6874268b5b1686695c93 Mon Sep 17 00:00:00 2001
> > From: Martin KaFai Lau <kafai at fb.com>
> > Date: Mon, 12 Nov 2018 14:52:39 -0800
> > Subject: [PATCH] bpf: libbpf: Fix bpf_program__next() API
> > 
> > This patch restores the behavior in
> > commit eac7d84519a3 ("tools: libbpf: don't return '.text' as a program for multi-function programs"):
> > such that bpf_program__next() does not return pseudo programs in ".text".
> > 
> > Fixes: 0c19a9fbc9cd ("libbpf: cleanup after partial failure in bpf_object__pin")
> > Signed-off-by: Martin KaFai Lau <kafai at fb.com>
> > ---
> >  tools/lib/bpf/libbpf.c | 25 +++++++++++--------------
> >  1 file changed, 11 insertions(+), 14 deletions(-)
> > 
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index e827542ffa3a..a01eb9584e52 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> > @@ -2193,19 +2193,25 @@ void *bpf_object__priv(struct bpf_object *obj)
> >  }
> >  
> >  static struct bpf_program *
> > -__bpf_program__iter(struct bpf_program *p, struct bpf_object *obj, int i)
> > +__bpf_program__iter(struct bpf_program *p, struct bpf_object *obj, bool forward)
> >  {
> > +	size_t nr_programs = obj->nr_programs;
> >  	ssize_t idx;
> >  
> > -	if (!obj->programs)
> > +	if (!nr_programs)
> >  		return NULL;
> >  
> > +	if (!p)
> > +		/* Iter from the beginning */
> > +		return forward ? &obj->programs[0] :
> > +			&obj->programs[nr_programs - 1];
> > +
> >  	if (p->obj != obj) {
> >  		pr_warning("error: program handler doesn't match object\n");
> >  		return NULL;
> >  	}
> >  
> > -	idx = (p - obj->programs) + i;
> > +	idx = (p - obj->programs) + (forward ? 1 : -1);
> >  	if (idx >= obj->nr_programs || idx < 0)
> >  		return NULL;
> >  	return &obj->programs[idx];
> > @@ -2216,11 +2222,8 @@ bpf_program__next(struct bpf_program *prev, struct bpf_object *obj)
> >  {
> >  	struct bpf_program *prog = prev;
> >  
> > -	if (prev == NULL)
> > -		return obj->programs;
> > -
> >  	do {
> > -		prog = __bpf_program__iter(prog, obj, 1);
> > +		prog = __bpf_program__iter(prog, obj, true);
> >  	} while (prog && bpf_program__is_function_storage(prog, obj));
> >  
> >  	return prog;
> > @@ -2231,14 +2234,8 @@ bpf_program__prev(struct bpf_program *next, struct bpf_object *obj)
> >  {
> >  	struct bpf_program *prog = next;
> >  
> > -	if (next == NULL) {
> > -		if (!obj->nr_programs)
> > -			return NULL;
> > -		return obj->programs + obj->nr_programs - 1;
> > -	}
> > -
> >  	do {
> > -		prog = __bpf_program__iter(prog, obj, -1);
> > +		prog = __bpf_program__iter(prog, obj, false);
> >  	} while (prog && bpf_program__is_function_storage(prog, obj));
> >  
> >  	return prog;
> > -- 
> > 2.17.1
> > 
> > > 
> > > > >  	do {
> > > > > -		prog = __bpf_program__next(prog, obj);
> > > > > +		prog = __bpf_program__iter(prog, obj, 1);
> > > > > +	} while (prog && bpf_program__is_function_storage(prog, obj));
> > > > > +
> > > > > +	return prog;
> > > > > +}
> > > > > +
> > > > > +struct bpf_program *
> > > > > +bpf_program__prev(struct bpf_program *next, struct bpf_object *obj)
> > > > > +{
> > > > > +	struct bpf_program *prog = next;
> > > > > +
> > > > > +	if (next == NULL) {
> > > > > +		if (!obj->nr_programs)
> > > > > +			return NULL;
> > > > > +		return obj->programs + obj->nr_programs - 1;
> > > > > +	}
> > > > > +
> > > > > +	do {
> > > > > +		prog = __bpf_program__iter(prog, obj, -1);
> > > > >  	} while (prog && bpf_program__is_function_storage(prog, obj));
> > > > >  
> > > > >  	return prog;
