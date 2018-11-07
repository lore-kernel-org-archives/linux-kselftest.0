From: jakub.kicinski@netronome.com (Jakub Kicinski)
Date: Wed, 7 Nov 2018 15:09:44 -0800
Subject: [PATCH bpf-next 3/3] bpftool: support loading flow dissector
In-Reply-To: <20181107224356.73080-4-sdf@google.com>
References: <20181107224356.73080-1-sdf@google.com>
 <20181107224356.73080-4-sdf@google.com>
Message-ID: <20181107150944.5d5480ba@cakuba.netronome.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181107230944.6SYudpPKRhWPlzlGIBgJbdB7Fzt6BL4BhG2mRMsP6Nk@z>

On Wed,  7 Nov 2018 14:43:56 -0800, Stanislav Fomichev wrote:
> bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
>         key 0 0 0 0 \
>         value pinned /sys/fs/bpf/flow/IP/0

Where is that /0 coming from ?  Is that in source code?  I don't see
libbpf adding it, maybe I'm missing something.
