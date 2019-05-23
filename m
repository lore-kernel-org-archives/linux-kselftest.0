From: yhs@fb.com (Yonghong Song)
Date: Thu, 23 May 2019 16:51:20 +0000
Subject: [PATCH bpf-next v2 RESEND 0/2] Move bpf_printk to bpf_helpers.h
In-Reply-To: <20190523125355.18437-1-mrostecki@opensuse.org>
References: <20190523125355.18437-1-mrostecki@opensuse.org>
Message-ID: <4642ca96-22ab-ad61-a6a1-1d2ef7239cb8@fb.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523165120.HuByC8l93gi0UCOaAuSw5ryFJ9hntTRlPWRST2HWAEA@z>



On 5/23/19 5:53 AM, Michal Rostecki wrote:
> This series of patches move the commonly used bpf_printk macro to
> bpf_helpers.h which is already included in all BPF programs which
> defined that macro on their own.
> 
> v1->v2:
> - If HBM_DEBUG is not defined in hbm sample, undefine bpf_printk and set
>    an empty macro for it.
> 
> Michal Rostecki (2):
>    selftests: bpf: Move bpf_printk to bpf_helpers.h
>    samples: bpf: Do not define bpf_printk macro
> 
>   samples/bpf/hbm_kern.h                                | 11 ++---------
>   samples/bpf/tcp_basertt_kern.c                        |  7 -------
>   samples/bpf/tcp_bufs_kern.c                           |  7 -------
>   samples/bpf/tcp_clamp_kern.c                          |  7 -------
>   samples/bpf/tcp_cong_kern.c                           |  7 -------
>   samples/bpf/tcp_iw_kern.c                             |  7 -------
>   samples/bpf/tcp_rwnd_kern.c                           |  7 -------
>   samples/bpf/tcp_synrto_kern.c                         |  7 -------
>   samples/bpf/tcp_tos_reflect_kern.c                    |  7 -------
>   samples/bpf/xdp_sample_pkts_kern.c                    |  7 -------
>   tools/testing/selftests/bpf/bpf_helpers.h             |  8 ++++++++
>   .../testing/selftests/bpf/progs/sockmap_parse_prog.c  |  7 -------
>   .../selftests/bpf/progs/sockmap_tcp_msg_prog.c        |  7 -------
>   .../selftests/bpf/progs/sockmap_verdict_prog.c        |  7 -------
>   .../testing/selftests/bpf/progs/test_lwt_seg6local.c  |  7 -------
>   tools/testing/selftests/bpf/progs/test_xdp_noinline.c |  7 -------
>   tools/testing/selftests/bpf/test_sockmap_kern.h       |  7 -------
>   17 files changed, 10 insertions(+), 114 deletions(-)

Ack for the whole series.
Acked-by: Yonghong Song <yhs at fb.com>
