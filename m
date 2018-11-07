From: jakub.kicinski at netronome.com (Jakub Kicinski)
Date: Wed, 7 Nov 2018 15:30:28 -0800
Subject: [PATCH bpf-next 2/2] bpftool: support loading flow dissector
In-Reply-To: <20181107231207.v425etmqm4v6rito@mini-arch>
References: <20181107193552.77894-1-sdf@google.com>
 <20181107193552.77894-3-sdf@google.com>
 <484ea7f5-0d4c-b828-c5fe-1fd4d9bf847d@netronome.com>
 <20181107123231.6d2f4782@cakuba.netronome.com>
 <6628387d-cf89-573f-7b9c-2d49ef19634e@netronome.com>
 <20181107221506.ha4c7wr4p2zswgjd@mini-arch>
 <20181107145122.170daba2@cakuba.netronome.com>
 <20181107231207.v425etmqm4v6rito@mini-arch>
Message-ID: <20181107153028.43506cc5@cakuba.netronome.com>

On Wed, 7 Nov 2018 15:12:07 -0800, Stanislav Fomichev wrote:
> > > I agree, constructing the jmp_table is a bit fragile with all the
> > > dependencies on the order of the progs. I'll drop that and will send a
> > > v2 that pins all the programs from the obj file instead and offloads
> > > jmp_table construction to the user. So the supposed use case would be
> > > something like the following:
> > > 
> > > bpftool prog load bpf_flow.o /sys/fs/bpf/flow type flow_dissector  
> > 
> > Okay.  One more thing - how do we differentiate between mass pin and the
> > existing pin first behaviour?  Should we perhaps add a loadall command
> > or some flag?  
> In v2 I did by program type:
> * flow_dissector -> pin all
> * not flow_dissector -> pin first?
> 
> But we can have loadall or something like:
> load OBJ [pinfirst|pinall] FILE|DIR [type TYPE]
> 
> If we want to add user control, I'd go with loadall command,
> adding more optional flags in between is a mess..

I think user control would be good.  Agreed on loadall being better.
