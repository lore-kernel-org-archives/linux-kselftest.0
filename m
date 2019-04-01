From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Mon, 1 Apr 2019 13:23:17 -0400
Subject: [PATCH bpf-next 0/4] L2 encap support for bpf_skb_adjust_room
In-Reply-To: <1554132731-3095-1-git-send-email-alan.maguire@oracle.com>
References: <1554132731-3095-1-git-send-email-alan.maguire@oracle.com>
Message-ID:
 <CAF=yD-+YDxYXPhAG+yiEo7ZZXZNxmWXw91RZq6yoTBiR8CDy=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190401172317.58p1dyP-Itj4Ka41RBg_aRWSif5VNq5PINTyL_XJaEQ@z>

On Mon, Apr 1, 2019@11:33 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> Extend bpf_skb_adjust_room growth to mark inner MAC header so that
> L2 encapsulation can be used for tc tunnels.
>
> Patch #1 extends the existing test_tc_tunnel to support UDP
> encapsulation; later we want to be able to test MPLS over UDP and
> MPLS over GRE encapsulation.
>
> Patch #2 adds the BPF_F_ADJ_ROOM_ENCAP_L2(len) macro, which
> allows specification of inner mac length.  Other approaches were
> explored prior to taking this approach.  Specifically, I tried
> automatically computing the inner mac length on the basis of the
> specified flags (so inner maclen for GRE/IPv4 encap is the len_diff
> specified to bpf_skb_adjust_room minus GRE + IPv4 header length
> for example).  Problem with this is that we don't know for sure
> what form of GRE/UDP header we have; is it a full GRE header,
> or is it a FOU UDP header or generic UDP encap header? My fear
> here was we'd end up with an explosion of flags.

Agreed.

> The other approach
> tried was to support inner L2 header marking as a separate room
> adjustment, i.e. adjust for L3/L4 encap, then call
> bpf_skb_adjust_room for L2 encap.  This can be made to work but
> because it imposed an order on operations, felt a bit clunky.

It seems slightly simpler to me. But this removes one extra call, so
is fine, too. Given that there is prior art of encoding length fields
in flags.

That is, if it works for all cases of L2 encap: by itself, before and
after L3 tunneling:

- [eth] {mpls} [ip] [tcp] [payload]
- [eth] {ip} {gre} {mpls} [ip] [tcp] [payload]
- [eth] {mpls} {ip} {gre} [ip] [tcp] [payload]

Less important, instead of encoding length inside flags, it is
arguably cleaner to have a one-bit flag BPF_F_ADJ_ROOM_ENCAP_L2 plus a
new argument l2_len.

> Patch #3 syncs tools/ bpf.h.
>
> Patch #4 extends the tests again to support MPLSoverGRE and
> MPLSoverUDP encap, along with existing test coverage.
>
> Alan Maguire (4):
>   selftests_bpf: extend test_tc_tunnel for UDP encap
>   bpf: add layer 2 encap support to bpf_skb_adjust_room
>   bpf: sync bpf.h to tools/ for BPF_F_ADJ_ROOM_ENCAP_L2
>   selftests_bpf: extend test_tc_tunnel.sh test for L2 encap
>
>  include/uapi/linux/bpf.h                           |   5 +
>  net/core/filter.c                                  |  19 +-
>  tools/include/uapi/linux/bpf.h                     |   5 +
>  tools/testing/selftests/bpf/progs/test_tc_tunnel.c | 281 ++++++++++++++++-----
>  tools/testing/selftests/bpf/test_tc_tunnel.sh      | 105 +++++---
>  5 files changed, 318 insertions(+), 97 deletions(-)
>
> --
> 1.8.3.1
>
