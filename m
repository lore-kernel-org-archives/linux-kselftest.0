From: sdf@fomichev.me (Stanislav Fomichev)
Date: Wed, 7 Nov 2018 15:12:07 -0800
Subject: [PATCH bpf-next 2/2] bpftool: support loading flow dissector
In-Reply-To: <20181107145122.170daba2@cakuba.netronome.com>
References: <20181107193552.77894-1-sdf@google.com>
 <20181107193552.77894-3-sdf@google.com>
 <484ea7f5-0d4c-b828-c5fe-1fd4d9bf847d@netronome.com>
 <20181107123231.6d2f4782@cakuba.netronome.com>
 <6628387d-cf89-573f-7b9c-2d49ef19634e@netronome.com>
 <20181107221506.ha4c7wr4p2zswgjd@mini-arch>
 <20181107145122.170daba2@cakuba.netronome.com>
Message-ID: <20181107231207.v425etmqm4v6rito@mini-arch>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181107231207.xwbLMkXmRsb5UtMGQzwp23zXJrZaaehQNk0Tm0zaTSY@z>

On 11/07, Jakub Kicinski wrote:
> On Wed, 7 Nov 2018 14:15:06 -0800, Stanislav Fomichev wrote:
> > On 11/07, Quentin Monnet wrote:
> > > 2018-11-07 12:32 UTC-0800 ~ Jakub Kicinski <jakub.kicinski at netronome.com>  
> > > > On Wed, 7 Nov 2018 20:08:53 +0000, Quentin Monnet wrote:  
> > > > > > +		err = bpf_obj_pin(bpf_program__fd(prog), pinfile);
> > > > > > +		if (err) {
> > > > > > +			p_err("failed to pin program %s",
> > > > > > +			      bpf_program__title(prog, false));
> > > > > > +			goto err_close_obj;
> > > > > > +		}  
> > > > > 
> > > > > I don't have the same opinion as Jakub for pinning :). I was hoping we
> > > > > could also load additional programs (for tail calls) for
> > > > > non-flow_dissector programs. Could this be an occasion to update the
> > > > > code in that direction?  
> > > > 
> > > > Do you mean having the bpftool construct an array for tail calling
> > > > automatically when loading an object?  Or do a "mass pin" of all
> > > > programs in an object file?
> > > > 
> > > > I'm not convinced about this strategy of auto assembling a tail call
> > > > array by assuming that a flow dissector object carries programs for
> > > > protocols in order (apart from the main program which doesn't have to
> > > > be first, for some reason).  
> > > 
> > > Not constructing the prog array, I don't think this should be the role of
> > > bpftool either. Much more a "mass pin", so that you have a link to each
> > > program loaded from the object file and can later add them to a prog array
> > > map with subsequent calls to bpftool.  
> 
> Makes sense, specific files named after index or program name/title?
> Program name may be nicer?
> 
> > I agree, constructing the jmp_table is a bit fragile with all the
> > dependencies on the order of the progs. I'll drop that and will send a
> > v2 that pins all the programs from the obj file instead and offloads
> > jmp_table construction to the user. So the supposed use case would be
> > something like the following:
> > 
> > bpftool prog load bpf_flow.o /sys/fs/bpf/flow type flow_dissector
> 
> Okay.  One more thing - how do we differentiate between mass pin and the
> existing pin first behaviour?  Should we perhaps add a loadall command
> or some flag?
In v2 I did by program type:
* flow_dissector -> pin all
* not flow_dissector -> pin first?

But we can have loadall or something like:
load OBJ [pinfirst|pinall] FILE|DIR [type TYPE]

If we want to add user control, I'd go with loadall command,
adding more optional flags in between is a mess..

> > bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
> > 	key ... value pinned /sys/fs/bpf/flow/<PROTO>/0
> 
> Interesting, why $dir/$title/0 ?  Perhaps $dir/$title is sufficient?
That's how bpf_program__pin does the pinning, for each program instance.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/bpf/libbpf.c#n1744

> 
> > bpftool map update ...
> > bpftool prog attach pinned /sys/fs/bpf/flow/flow_dissector/0 flow_dissector
> 
