From: jakub.kicinski@netronome.com (Jakub Kicinski)
Date: Wed, 7 Nov 2018 13:12:23 -0800
Subject: [PATCH bpf-next 2/2] bpftool: support loading flow dissector
In-Reply-To: <20181107210009.y6jucu5oehlladkq@mini-arch>
References: <20181107193552.77894-1-sdf@google.com>
 <20181107193552.77894-3-sdf@google.com>
 <20181107120340.27001209@cakuba.netronome.com>
 <20181107210009.y6jucu5oehlladkq@mini-arch>
Message-ID: <20181107131223.02f1c16c@cakuba.netronome.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181107211223.f-k5umxGHMIxMPimLdyiCT1movOkAIwpymjhLjQ1ihg@z>

On Wed, 7 Nov 2018 13:00:09 -0800, Stanislav Fomichev wrote:
> > > +	}
> > > +
> > > +	if (attr.prog_type == BPF_PROG_TYPE_FLOW_DISSECTOR) {
> > > +		err = build_flow_dissector_jmp_table(obj, prog, "jmp_table");
> > > +		if (err) {
> > > +			p_err("failed to build flow dissector jump table");
> > > +			goto err_close_obj;
> > > +		}
> > > +		/* flow dissector consist of multiple programs,
> > > +		 * we want to pin them all  
> > 
> > Why pin them all shouldn't the main program be the only one pinned?  
> If I pin only the main program, the tail ones disappear from the jmp_table map
> when bpftool exits.
> Am I missing something?
> Should BPF_MAP_TYPE_PROG_ARRAY hold the referenced progs?

It does.

# bpftool map create /sys/fs/bpf/map \
	type prog_array key 4 value 4 entries 4 \
	name tail_call_map
# bpftool prog load perf_event_output_stack.o /sys/fs/bpf/prog \
	 type xdp 
# bpftool map update pinned /sys/fs/bpf/map \
	key 0 0 0 0 \
	value pinned /sys/fs/bpf/prog
# bpftool prog 
11: xdp  name xdp_prog1  tag 6f1b482b27443edf  gpl
	loaded_at 2018-11-07T13:09:20-0800  uid 0
	xlated 144B  jited 130B  memlock 4096B  map_ids 14
# rm /sys/fs/bpf/prog
# bpftool prog 
11: xdp  name xdp_prog1  tag 6f1b482b27443edf  gpl
	loaded_at 2018-11-07T13:09:20-0800  uid 0
	xlated 144B  jited 130B  memlock 4096B  map_ids 14
# rm /sys/fs/bpf/map 
# bpftool prog 
# bpftool prog show id 11
Error: get by id (11): No such file or directory


I think we should remove all this auto tail call construction unless
we have solid annotations in the elf file which can clearly guide the
loader.
