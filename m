From: alan.maguire at oracle.com (Alan Maguire)
Date: Tue,  9 Apr 2019 15:06:39 +0100
Subject: [PATCH v3 bpf-next 0/4] L2 encap support for bpf_skb_adjust_room
Message-ID: <1554818803-4070-1-git-send-email-alan.maguire@oracle.com>

Extend bpf_skb_adjust_room growth to mark inner MAC header so that
L2 encapsulation can be used for tc tunnels.

Patch #1 extends the existing test_tc_tunnel to support UDP
encapsulation; later we want to be able to test MPLS over UDP and
MPLS over GRE encapsulation.

Patch #2 adds the BPF_F_ADJ_ROOM_ENCAP_L2(len) macro, which
allows specification of inner mac length.  Other approaches were
explored prior to taking this approach.  Specifically, I tried
automatically computing the inner mac length on the basis of the
specified flags (so inner maclen for GRE/IPv4 encap is the len_diff
specified to bpf_skb_adjust_room minus GRE + IPv4 header length
for example).  Problem with this is that we don't know for sure
what form of GRE/UDP header we have; is it a full GRE header,
or is it a FOU UDP header or generic UDP encap header? My fear
here was we'd end up with an explosion of flags.  The other approach
tried was to support inner L2 header marking as a separate room
adjustment, i.e. adjust for L3/L4 encap, then call
bpf_skb_adjust_room for L2 encap.  This can be made to work but
because it imposed an order on operations, felt a bit clunky.

Patch #3 syncs tools/ bpf.h.

Patch #4 extends the tests again to support MPLSoverGRE,
MPLSoverUDP, and transparent ethernet bridging (TEB) where
the inner L2 header is an ethernet header.  Testing of BPF
encap against tunnels is done for cases where configuration
of such tunnels is possible (MPLSoverGRE[6], MPLSoverUDP,
gre[6]tap), and skipped otherwise.  Testing of BPF encap/decap
is always carried out.

Changes since v2:
 - updated tools/testing/selftest/bpf/config with FOU/MPLS CONFIG 
   variables (patches 1, 4)
 - reduced noise in patch 1 by avoiding unnecessary movement of code
 - eliminated inner_mac variable in bpf_skb_net_grow (patch 2)

Changes since v1:
 - fixed formatting of commit references.
 - BPF_F_ADJ_ROOM_FIXED_GSO flag enabled on all variants (patch 1)
 - fixed fou6 options for UDP encap; checksum errors observed were
   due to the fact fou6 tunnel was not set up with correct ipproto
   options (41 -6).  0 checksums work fine (patch 1)
 - added definitions for mask and shift used in setting L2 length
   (patch 2)
 - allow udp encap with fixed GSO (patch 2)
 - changed "elen" to "l2_len" to be more descriptive (patch 4)


Alan Maguire (4):
  selftests_bpf: extend test_tc_tunnel for UDP encap
  bpf: add layer 2 encap support to bpf_skb_adjust_room
  bpf: sync bpf.h to tools/ for BPF_F_ADJ_ROOM_ENCAP_L2
  selftests_bpf: add L2 encap to test_tc_tunnel

 include/uapi/linux/bpf.h                           |  10 +
 net/core/filter.c                                  |  12 +-
 tools/include/uapi/linux/bpf.h                     |  10 +
 tools/testing/selftests/bpf/config                 |   8 +
 tools/testing/selftests/bpf/progs/test_tc_tunnel.c | 321 +++++++++++++++++----
 tools/testing/selftests/bpf/test_tc_tunnel.sh      | 136 +++++++--
 6 files changed, 417 insertions(+), 80 deletions(-)

-- 
1.8.3.1
