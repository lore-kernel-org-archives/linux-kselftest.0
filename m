From: sdf@fomichev.me (Stanislav Fomichev)
Date: Wed, 7 Nov 2018 16:40:23 -0800
Subject: [PATCH bpf-next 3/3] bpftool: support loading flow dissector
In-Reply-To: <20181107154155.4e7ca3b3@cakuba.netronome.com>
References: <20181107224356.73080-1-sdf@google.com>
 <20181107224356.73080-4-sdf@google.com>
 <20181107150944.5d5480ba@cakuba.netronome.com>
 <20181107231333.n34ffy4dl6rtbs7e@mini-arch>
 <20181107152917.729ea83c@cakuba.netronome.com>
 <20181107233448.r7vcnxtdzfnzegas@mini-arch>
 <20181107154155.4e7ca3b3@cakuba.netronome.com>
Message-ID: <20181108004023.4zwhen2xj6yolf5e@mini-arch>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108004023.61E_EyG-gEQZUOXAxA_RqCPF1TEpr-_mIAOpygBT8MY@z>

On 11/07, Jakub Kicinski wrote:
> On Wed, 7 Nov 2018 15:34:48 -0800, Stanislav Fomichev wrote:
> > On 11/07, Jakub Kicinski wrote:
> > > On Wed, 7 Nov 2018 15:13:33 -0800, Stanislav Fomichev wrote:  
> > > > On 11/07, Jakub Kicinski wrote:  
> > > > > On Wed,  7 Nov 2018 14:43:56 -0800, Stanislav Fomichev wrote:    
> > > > > > bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
> > > > > >         key 0 0 0 0 \
> > > > > >         value pinned /sys/fs/bpf/flow/IP/0    
> > > > > 
> > > > > Where is that /0 coming from ?  Is that in source code?  I don't see
> > > > > libbpf adding it, maybe I'm missing something.    
> > > > libbpf adds that, that's a program instance:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/bpf/libbpf.c#n1744  
> > > 
> > > Ugh, I was looking at bpf_object__pin() which uses names :(
> > > 
> > > We never use this multi-instance thing, and I don't think bpftool ever
> > > will, so IMHO it'd be good if we just re-did the pinning loop in
> > > bpftool.  
> > I wonder whether I should just add special case to bpf_program__pin: don't
> > create a subdir when instances.nr == 1 (and just create a file pin for
> > single instance)? In that case I can continue to use libbpf and don't reinvent
> > the wheel. Any objections?
> 
> Mm.. I'm afraid libbpf needs to keep backward compatibility.  We'd have
> to add some way for the user (bpftool code) to request the instance ID
> does not appear, but (potential) existing users should keep seeing them.
> Perhaps others disagree.
AFAICT, nobody (seriously) uses bpf_object__pin in the kernel tree and I
have a feeling that the situation is the same outside of the kernel tree.
We can revert/work around if we break somebody, I just don't want to
reimplement the same code in bpftool while there is a possibility that
nobody is using that.

I'll post my proposal as v3, let's see whether other people have
the same objections.

Btw, did we officially commit to the libbpf api/abi somewhere? It always
felt to me like an internal and work-in-progress library.
