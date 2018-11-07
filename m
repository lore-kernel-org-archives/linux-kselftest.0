From: jakub.kicinski@netronome.com (Jakub Kicinski)
Date: Wed, 7 Nov 2018 12:32:31 -0800
Subject: [PATCH bpf-next 2/2] bpftool: support loading flow dissector
In-Reply-To: <484ea7f5-0d4c-b828-c5fe-1fd4d9bf847d@netronome.com>
References: <20181107193552.77894-1-sdf@google.com>
 <20181107193552.77894-3-sdf@google.com>
 <484ea7f5-0d4c-b828-c5fe-1fd4d9bf847d@netronome.com>
Message-ID: <20181107123231.6d2f4782@cakuba.netronome.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181107203231.9LykpnivaPhR7GvEabUdVjzRpyeUp4H4h7-BNVojbv8@z>

On Wed, 7 Nov 2018 20:08:53 +0000, Quentin Monnet wrote:
> > +		err = bpf_obj_pin(bpf_program__fd(prog), pinfile);
> > +		if (err) {
> > +			p_err("failed to pin program %s",
> > +			      bpf_program__title(prog, false));
> > +			goto err_close_obj;
> > +		}  
> 
> I don't have the same opinion as Jakub for pinning :). I was hoping we
> could also load additional programs (for tail calls) for
> non-flow_dissector programs. Could this be an occasion to update the
> code in that direction?

Do you mean having the bpftool construct an array for tail calling
automatically when loading an object?  Or do a "mass pin" of all
programs in an object file?

I'm not convinced about this strategy of auto assembling a tail call
array by assuming that a flow dissector object carries programs for
protocols in order (apart from the main program which doesn't have to
be first, for some reason).
