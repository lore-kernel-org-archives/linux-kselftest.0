From: mrostecki at opensuse.org (Michal Rostecki)
Date: Thu, 16 May 2019 13:20:56 +0200
Subject: [PATCH bpf-next 0/2] Move bpf_printk to bpf_helpers.h
Message-ID: <20190516112105.12887-1-mrostecki@opensuse.org>

This series of patches move the commonly used bpf_printk macro to
bpf_helpers.h which is already included in all BPF programs which
defined that macro on their own.

Michal Rostecki (2):
  selftests: bpf: Move bpf_printk to bpf_helpers.h
  samples: bpf: Do not define bpf_printk macro

 samples/bpf/hbm_kern.h                               | 12 +++---------
 samples/bpf/hbm_out_kern.c                           |  2 ++
 samples/bpf/tcp_basertt_kern.c                       |  7 -------
 samples/bpf/tcp_bufs_kern.c                          |  7 -------
 samples/bpf/tcp_clamp_kern.c                         |  7 -------
 samples/bpf/tcp_cong_kern.c                          |  7 -------
 samples/bpf/tcp_iw_kern.c                            |  7 -------
 samples/bpf/tcp_rwnd_kern.c                          |  7 -------
 samples/bpf/tcp_synrto_kern.c                        |  7 -------
 samples/bpf/tcp_tos_reflect_kern.c                   |  7 -------
 samples/bpf/xdp_sample_pkts_kern.c                   |  7 -------
 tools/testing/selftests/bpf/bpf_helpers.h            |  8 ++++++++
 .../testing/selftests/bpf/progs/sockmap_parse_prog.c |  7 -------
 .../selftests/bpf/progs/sockmap_tcp_msg_prog.c       |  7 -------
 .../selftests/bpf/progs/sockmap_verdict_prog.c       |  7 -------
 .../testing/selftests/bpf/progs/test_lwt_seg6local.c |  7 -------
 .../testing/selftests/bpf/progs/test_xdp_noinline.c  |  7 -------
 tools/testing/selftests/bpf/test_sockmap_kern.h      |  7 -------
 18 files changed, 13 insertions(+), 114 deletions(-)

-- 
2.21.0
