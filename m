From: jakub.kicinski@netronome.com (Jakub Kicinski)
Date: Thu, 8 Nov 2018 11:45:44 -0800
Subject: [PATCH v3 bpf-next 4/4] bpftool: support loading flow dissector
In-Reply-To: <8c35340e-3ed7-70cd-3123-7cd0fb8824a7@netronome.com>
References: <20181108053957.205681-1-sdf@google.com>
 <20181108053957.205681-5-sdf@google.com>
 <8c35340e-3ed7-70cd-3123-7cd0fb8824a7@netronome.com>
Message-ID: <20181108114544.1ac0cd44@cakuba.hsd1.ca.comcast.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108194544.kouquKabn01b5Z3NSoQFybB_F2WJ1RKg8JlSsP17M8Q@z>

On Thu, 8 Nov 2018 11:16:43 +0000, Quentin Monnet wrote:
> > -	bpf_program__set_ifindex(prog, ifindex);
> >   	if (attr.prog_type == BPF_PROG_TYPE_UNSPEC) {
> > +		if (!prog) {
> > +			p_err("can not guess program type when loading all programs\n");

No new lines in p_err(), beaks JSON.

> > +			goto err_close_obj;
> > +		}
> > +
> >   		const char *sec_name = bpf_program__title(prog, false);
> >   
> >   		err = libbpf_prog_type_by_name(sec_name, &attr.prog_type,
> > @@ -936,8 +958,13 @@ static int do_load(int argc, char **argv)
> >   			goto err_close_obj;
> >   		}
> >   	}
> > -	bpf_program__set_type(prog, attr.prog_type);
> > -	bpf_program__set_expected_attach_type(prog, expected_attach_type);
> > +
> > +	bpf_object__for_each_program(pos, obj) {
> > +		bpf_program__set_ifindex(pos, ifindex);
> > +		bpf_program__set_type(pos, attr.prog_type);
> > +		bpf_program__set_expected_attach_type(pos,
> > +						      expected_attach_type);
> > +	}  
> 
> I still believe you can have programs of different types here, and be 
> able to load them. I tried it and managed to have it working fine. If no 
> type is provided from command line we can retrieve types for each 
> program from its section name. If a type is provided on the command 
> line, we can do the same, but I am not sure we should do it, or impose 
> that type for all programs instead.

attr->prog_type is one per object, though.  How do we set that one?
