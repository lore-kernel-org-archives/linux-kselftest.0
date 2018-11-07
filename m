From: jakub.kicinski at netronome.com (Jakub Kicinski)
Date: Wed, 7 Nov 2018 15:29:17 -0800
Subject: [PATCH bpf-next 3/3] bpftool: support loading flow dissector
In-Reply-To: <20181107231333.n34ffy4dl6rtbs7e@mini-arch>
References: <20181107224356.73080-1-sdf@google.com>
 <20181107224356.73080-4-sdf@google.com>
 <20181107150944.5d5480ba@cakuba.netronome.com>
 <20181107231333.n34ffy4dl6rtbs7e@mini-arch>
Message-ID: <20181107152917.729ea83c@cakuba.netronome.com>

On Wed, 7 Nov 2018 15:13:33 -0800, Stanislav Fomichev wrote:
> On 11/07, Jakub Kicinski wrote:
> > On Wed,  7 Nov 2018 14:43:56 -0800, Stanislav Fomichev wrote:  
> > > bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
> > >         key 0 0 0 0 \
> > >         value pinned /sys/fs/bpf/flow/IP/0  
> > 
> > Where is that /0 coming from ?  Is that in source code?  I don't see
> > libbpf adding it, maybe I'm missing something.  
> libbpf adds that, that's a program instance:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/bpf/libbpf.c#n1744

Ugh, I was looking at bpf_object__pin() which uses names :(

We never use this multi-instance thing, and I don't think bpftool ever
will, so IMHO it'd be good if we just re-did the pinning loop in
bpftool.
