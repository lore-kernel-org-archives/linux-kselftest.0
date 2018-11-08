From: jakub.kicinski@netronome.com (Jakub Kicinski)
Date: Thu, 8 Nov 2018 13:54:26 -0800
Subject: [PATCH v3 bpf-next 4/4] bpftool: support loading flow dissector
In-Reply-To: <20181108212940.wvfnkanxqs2owcy6@mini-arch>
References: <20181108053957.205681-1-sdf@google.com>
 <20181108053957.205681-5-sdf@google.com>
 <20181108114630.28907570@cakuba.hsd1.ca.comcast.net>
 <20181108212940.wvfnkanxqs2owcy6@mini-arch>
Message-ID: <20181108135426.616baf8f@cakuba.hsd1.ca.comcast.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108215426.f5Gw8VrJwdVQVPgo9UvAW_xJI-VCuHYJmVIDvCfi9SY@z>

On Thu, 8 Nov 2018 13:29:40 -0800, Stanislav Fomichev wrote:
> On 11/08, Jakub Kicinski wrote:
> > On Wed,  7 Nov 2018 21:39:57 -0800, Stanislav Fomichev wrote:  
> > > This commit adds support for loading/attaching/detaching flow
> > > dissector program. The structure of the flow dissector program is
> > > assumed to be the same as in the selftests:
> > > 
> > > * flow_dissector section with the main entry point
> > > * a bunch of tail call progs
> > > * a jmp_table map that is populated with the tail call progs  
> > 
> > Could you split the loadall changes and the flow_dissector changes into
> > two separate patches?  
> Sure, will do, but let's first agree on the semantical differences of
> load vs loadall.
> 
> So far *load* actually loads _all_ progs (via bpf_object__load), but pins
> only the first program. Is that what we want? I wonder whether the
> assumption there was that there is only single program in the object.
> Should we load only the first program in *load*?
> 
> If we add *loadall*, then the difference would be:
> *load*:
>   * loads all maps and only the first program, pins only the first
>     program
> *loadall*:
>   * loads all maps and all programs, pins everything (maps and programs)
> 
> Is this the expected behavior?

Loading all programs and maps for "load" is just a libbpf limitation we
can remove at some point.
