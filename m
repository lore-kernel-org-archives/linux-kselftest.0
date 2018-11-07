From: sdf at fomichev.me (Stanislav Fomichev)
Date: Wed, 7 Nov 2018 15:13:33 -0800
Subject: [PATCH bpf-next 3/3] bpftool: support loading flow dissector
In-Reply-To: <20181107150944.5d5480ba@cakuba.netronome.com>
References: <20181107224356.73080-1-sdf@google.com>
 <20181107224356.73080-4-sdf@google.com>
 <20181107150944.5d5480ba@cakuba.netronome.com>
Message-ID: <20181107231333.n34ffy4dl6rtbs7e@mini-arch>

On 11/07, Jakub Kicinski wrote:
> On Wed,  7 Nov 2018 14:43:56 -0800, Stanislav Fomichev wrote:
> > bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
> >         key 0 0 0 0 \
> >         value pinned /sys/fs/bpf/flow/IP/0
> 
> Where is that /0 coming from ?  Is that in source code?  I don't see
> libbpf adding it, maybe I'm missing something.
libbpf adds that, that's a program instance:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/bpf/libbpf.c#n1744
