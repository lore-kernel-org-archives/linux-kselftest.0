From: sdf at fomichev.me (Stanislav Fomichev)
Date: Wed, 7 Nov 2018 15:25:16 -0800
Subject: [PATCH bpf-next 2/3] libbpf: cleanup after partial failure in
 bpf_object__pin
In-Reply-To: <20181107150605.59a8ac1c@cakuba.netronome.com>
References: <20181107224356.73080-1-sdf@google.com>
 <20181107224356.73080-3-sdf@google.com>
 <20181107145648.66f47037@cakuba.netronome.com>
 <20181107230021.4yr2h6fpzhvarfcj@mini-arch>
 <20181107150605.59a8ac1c@cakuba.netronome.com>
Message-ID: <20181107232516.qiy24ccbq3hh4ail@mini-arch>

On 11/07, Jakub Kicinski wrote:
> On Wed, 7 Nov 2018 15:00:21 -0800, Stanislav Fomichev wrote:
> > > > +err_unpin_programs:
> > > > +	bpf_object__for_each_program(prog, obj) {
> > > > +		char buf[PATH_MAX];
> > > > +		int len;
> > > > +
> > > > +		len = snprintf(buf, PATH_MAX, "%s/%s", path,
> > > > +			       prog->section_name);
> > > > +		if (len < 0)
> > > > +			continue;
> > > > +		else if (len >= PATH_MAX)
> > > > +			continue;
> > > > +
> > > > +		unlink(buf);  
> > > 
> > > I think that's no bueno, if pin failed because the file already exists
> > > you'll now remove that already existing file.  
> >
> > How about we check beforehand and bail early if we are going to
> > overwrite something?
> 
> Possible, although the most common way to handle situation like this in
> the kernel is to "continue the iteration in reverse" over the list.
> I.e. walk the list back.  I think the objects are on a double linked
> list.  You may need to add the appropriate foreach macro and helper..
That sounds more complicated than just ensuring that the top directory
for the pins doesn't exist and then rm -rf it on failure.
I'm thinking about copy-pasting rm_rf from perf
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/util/util.c#n119).
Thoughts?

Btw, current patch won't work because of those /0 added by bpf_program__pin.
