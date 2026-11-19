Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052318;
	b=k5P35a4VTMeXiViv+CC2WjvHH7ihoct1sIwPTjD+9S7KaB/O0k/LD+OYvSq6qXNyjCQ8
	 fncn+DgYj/a46anGTfychCJHBVBi9Ar7A51hk8JKmDqPZTdrYXrkfWB2IclVQsMdWqau5
	 xa9Xnlw0Kg6tdDIwo1vt9rd+ksqncFPGEJchj7RrAXj5bYhEjzTGQnFn8mFqql8WIG3KW
	 WFUJB3X4QqOzEiJ9YZ1RAgjdQKhWrKDy0M1Zi6+jAVaWxFqxdHBR2hEbA3h9heFz1rGt0
	 /oxAmIOhPuCL2z6KhBGdPtPXERFGnmmAXs3PnUI/FFdfd6XJHfAirGSSBBnjrD4ppgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xWmFAMLfaz7aon/MP5W7LeR089ODY2jYCmY0YF/QEHk=;
	b=3rIBEW1Y6uT4FRjsOU+Y2wKTdU+ud9JXQ11tll9/vWUxqfrrpdOz7AeoLxoJ5gjDdcM2
	 fMzIdRhZ5J0sMXH1OKG3qemlOOMUlVe1TuEoX+HQ/EaiQlIzkiOg9r1Hzu/KHbG8Vc+tE
	 Vr/MB9lttsTZxb06yhi7bIuZdEEVDu0Eqr+YWR08dzVQwmlqZDehPXh2ImrsNMJTwMP9t
	 ScPKperQfMRDNAbWebpenMigCo/vgaNuqt7FC0Ebr1n2E1JwuxAkqejERFRNuSZSV6vwR
	 5gB1LeUbWCliaCVOpqLGckbTqNyzCvUR/j54l/QFv0BuQCe/NOy2ZuZKO/041igpS7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ftmtS202;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21458606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 01:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21458606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ftmtS202
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d21051042so280708466b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 17:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052316; x=1795657116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWmFAMLfaz7aon/MP5W7LeR089ODY2jYCmY0YF/QEHk=;
        b=ftmtS2029GKX5UtZAgJGitX70lJkwUErFdKHtYPToccHq6NEAzp/y2zynrEO8TBbYA
         HLNNeLQ7RH/J1RJ3wOSBfM1z2xsLBF8nma8WNzcBwdAzsMjgYKxTmnhFbNqAJqNAJejM
         UJxr5YbLIpUBkEC5iaUXVTCwzJi0RPLnlF+7SiFZQ7WUb1zMU+CpjqzK0sXV2iIqUBHw
         Zp9CuL1FXGbtUP+rNfv4hyyA0qKkTiQso5wcOzKYtF1ggznDmlLfJDCWg04WiAE4BFJt
         A1PFd3A4WXgFfDeTHp6X4WOZdAQXr4ue9pnV1Q+bU/snB9pgoOWjvfDFR5lEWkVzq5pf
         HwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052316; x=1795657116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWmFAMLfaz7aon/MP5W7LeR089ODY2jYCmY0YF/QEHk=;
        b=xNc76r8Q+mmTAwsghVn4fZ0agkqaqHjMKinBJ/qaLcq5Q2uOtLzGiS27IuLl/1JM17
         WwGAFGxorH9gisTHin/oqCCIlfz89Ijqexjn7VnbSHqpDHdfqfR3yuXxzaSLnSJXuX9c
         7AYw6wgGgz2H24fJEqeIy0dxtP5DCNkdiYkQwd72sR4aQBG/fu9dzC9JmJrmPYZOlZa7
         J+kZN2aTr7CVFrpVTVMwnOC2KvEftoNnXlC/caSCwhIUeCZTXuIXPsmplbFdRDHaa2kF
         F4+D7hnigKB0WeibVOsDTza+Cg9Ytj1Fvq9j8wEXfk1SShhr2Z5ma59xiiD6xu72QKUu
         4dSg==
X-Forwarded-Encrypted: i=1; AL+hErFEqDA+FJbS7Bacfo6HJxvVphUT62aaYVc9Xd/NFGGFLVKds10QLx80DqI3Bd04PXBdtEt6m7XCuYiCiK3lzqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xCyB1E/TvlH1DS0YugSMjvXoMwbSNPifBIarzSQmnY5ISCgbI
	VOO6Et3IApzSGRHYvIDN1Kzj2PBxG3o1GHxdK6jYIkXOQf+DNp/jDW9yzPgCTs+uRv0=
X-Gm-Gg: AYBFou1PvsEtUUb2M2LFig3ZUi4m8R9FSUTS1dC42AMv2Olg6v1d1SpCLDahps4T4WQ
	qhJOWeN9rWFwihlaR4ot2w5xgVMCCdFSyOQ911GZxiwveV1a5TMQd8sIj0A4COl5XR3Rhl6Y3Tm
	4jEe0AuH4trDMnAmMnDW+0kDurlhO5XYojA4Iy+2kBIN/mO2JGu9t5dM50gb3y0pVXQZKD8wFjL
	7VUKsYB/59m+ZNUw2cWv89ylGKZJb7slYUg7H2fFEx8oXLtUBz8miVAxeJosKNWCEsw7HjjnTPn
	KEXNtbr37jIF/mnIEydPXk3gHnMND5jVGlUk9u8AOFeBMX0B48dycsTAy5sPZUXxzquxOt1PUXz
	4oegindy7JhYdO0FTg6vULKALRR5O+hlUNGFBtra8zVUXmK2vs0lnmDXCxKbZVckU5rajXtLbLs
	DaNZ+SwrCj/dcwEACEJsguGfeo08Q7k1TAr1o61GGF+UzHOv8wrYfPhQNG0hwhvEvyPtEIf4aQU
	t67PcKIs3swBeM8JoJM9dvjusdCETIG38FgUCD6E6ARKZEhonxtZeFi+AEmK1f0UCVKJ2PKgtAn
	kr7JzlvnJdnN3xtUP52h04oP2ORycD3b+9eho01FYsMvy91Jkwbk6OBkAA==
X-Received: by 2002:a17:907:934e:b0:c46:7ec3:fdfe with SMTP id a640c23a62f3a-c510e1b723bmr406658966b.19.1795052316475;
        Wed, 18 Nov 2026 17:38:36 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4080sm59785966b.16.2026.11.18.17.38.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:38:36 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Stephen Hemminger <stephen@networkplumber.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Remy D. Farley" <one-d-wide@protonmail.com>,
	Amery Hung <ameryhung@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Anil Kaushik <anilkaushikwireless@gmail.com>,
	Demos Ra <demosthenes.ra@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Joe Damato <joe@dama.to>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Li RongQing <lirongqing@baidu.com>,
	Louis Scalbert <louis.scalbert@6wind.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Song Liu <song@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Wang Zhan <wang.zhan@smartx.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Zhou Qiuyue <n0ps1edzz@gmail.com>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v2 00/11] net: extra TX headroom for local egress
Date: Thu, 19 Nov 2026 01:38:19 +0000
Message-ID: <20261119013830.36935-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the series that David Keogh posted as an RFC [1].
v1 is [2].

Locally generated UDP, raw and AF_PACKET packets, and AF_XDP packets in
copy mode, get only the headroom that needed_headroom asks for. If an
XDP or TC program needs more, the skb is reallocated or copied for every
packet. This happens in three cases:

- An XDP program on a veth peer needs XDP_PACKET_HEADROOM (256 bytes).
  The peer copies the packet.
- A program at TC egress adds headers. The skb is reallocated.
- A namespace sends through a veth pair, and a program at TC egress of
  another device, such as the host uplink, adds headers. The skb is
  reallocated on that device.

(patches 1-2, from David Keogh) This series adds tx_extra_headroom to
struct net_device. It is added only where a locally generated skb is
allocated.

Each case sets tx_extra_headroom in its own way, to keep the new UAPI
minimal:

- (patches 3-5) The kernel sets it when XDP is attached to the peer of
  a veth or netkit device. New skbs on the device then reserve enough
  headroom for XDP_PACKET_HEADROOM.
- (patches 6-8) Add a BTF decl tag "tx_extra_headroom:<bytes>" as
  UAPI. A tcx egress program declares it, and the verifier reads it at
  load.
- (patches 9-11) Add a VETH_INFO_TX_EXTRA_HEADROOM UAPI for headers that
  another device pushes, such as the host uplink. It is like
  IFLA_NETKIT_HEADROOM for netkit [3]. The CNI plugin sets it at veth
  creation, as Cilium does with netkit [4].

tx_extra_headroom is the sum of the extra headroom that each case
requires, limited to 512 bytes. For example, a program at TC egress
pushes a header, and XDP on the peer then still needs
XDP_PACKET_HEADROOM in front of it. The kernel recalculates
tx_extra_headroom when XDP or a tcx program is attached or detached.

For all three cases, one option is to raise needed_headroom instead.
This causes a regression for TCP and forwarding, because
needed_headroom is also the minimum that ip_finish_output2() and
ip_forward() require.

Patch 3 depends on commit f564749b3b26 ("net: record XDP programs
propagated to lower devices"), which is only in net-next, so the series
targets net-next. Patches 6-8 change tcx and the verifier. An Ack from
the BPF maintainers on them would be appreciated.

Performance:

All tests run on a Xeon E5-2640 v4 with a ConnectX-4 Lx NIC, on
net-next at d6816d9a93b6. Details of the artifacts are in [5].

The first table shows the regression when needed_headroom is raised
to 256 on both ends of a veth pair. XDP runs on the namespace side:

test                                 net-next       needed_headroom 256
netns sends TCP to host              32.1 Gbit/s    30.8 Gbit/s
host forwards 1400B UDP into netns   0.583 Mpps     0.366 Mpps

The second table shows the gain from tx_extra_headroom in all three
cases, with 1400-byte UDP payloads. All numbers come from one kernel
with this series applied, with tx_extra_headroom off and on. Between
two kernels, the code layout alone changed the rate by up to 13%.
Off uses a benchmark-only patch for the XDP case [5], the push program
without its decl tag, and a veth pair without
VETH_INFO_TX_EXTRA_HEADROOM:

test                                          off          on
host to netns, generic XDP_PASS in netns      0.237 Mpps   0.283 Mpps
host to netns, generic XDP_DROP in netns      0.386 Mpps   0.465 Mpps
host to netns, 20-byte push at TC egress      0.385 Mpps   0.468 Mpps
netns to uplink, 20-byte push on the uplink   0.190 Mpps   0.219 Mpps

Out of scope:

- Auto-tuning for the second and third cases [6].
- Backlinking the originating netdev to set tx_extra_headroom for the
  third case [7].
- Native XDP on veth. veth_convert_skb_to_xdp_buff() still copies
  these packets. A follow-up veth patch changes this for XDP_PASS and
  XDP_DROP.

Changes:

v2:
- Drop "configurable" from the series title and rework the cover
  letter.
- Drop IFLA_TX_EXTRA_HEADROOM (Willem, Stephen).
- Set tx_extra_headroom on veth XDP attach (Stephen), from the BPF decl
  tag "tx_extra_headroom:<bytes>" on tcx attach (Dragos, Willem), and
  with VETH_INFO_TX_EXTRA_HEADROOM at veth creation.
- Turn the LL_ALLOC_SPACE() and LL_ALLOC_SPACE_EX() macros into static
  inline functions (Willem).
- Test the veth attribute with YNL only (Jakub).

v1 [2]:
- Add the veth XDP case and the needed_headroom regression data to the
  cover letter.
- Remove LL_RESERVED_SPACE_EXTRA(), which has no user.
- Replace the RFC data-path selftests with a test of a push at TC
  egress.
- Add tests of generic XDP on a veth peer and of setting both ends of
  a veth pair.

RFC: [1]

[1] https://lore.kernel.org/all/20261015235335.4162993-1-dkeogh@amazon.com/
[2] https://lore.kernel.org/all/cover.1794020868.git.tianyi@cloudflare.com/
[3] https://git.kernel.org/torvalds/c/b9ed315d3c4c
[4] https://github.com/cilium/cilium/blob/4a5cd2a20e31/pkg/datapath/connector/netkit.go#L63-L67
[5] https://github.com/tgao-cf/tx-extra-headroom-bench/tree/main
[6] https://lore.kernel.org/all/20261108214356.95406-1-tianyi@cloudflare.com/
[7] https://lore.kernel.org/all/20261110201250.95225-1-tianyi@cloudflare.com/
---
David Keogh will post a TCP test as a reply to this series.

The iproute2 patch for VETH_INFO_TX_EXTRA_HEADROOM will be posted after
this series is accepted.

David Keogh (2):
  net: add tx_extra_headroom and netdev_get_alloc_headroom()
  net: reserve extra TX headroom for local egress

Tianyi Gao (9):
  net: set tx_extra_headroom of the peer on XDP attach
  selftests: net: add flag to send a frame in xdp_helper
  selftests: net: add tx_extra_headroom test
  bpf, tcx: Set tx_extra_headroom from a decl tag on egress programs
  selftests: net: tx_extra_headroom: test a push at TC egress
  selftests/bpf: Test the tx_extra_headroom decl tag
  veth: add VETH_INFO_TX_EXTRA_HEADROOM
  netlink: specs: rt-link: add veth attributes
  selftests: net: tx_extra_headroom: test the veth attribute

 Documentation/netlink/specs/rt-link.yaml      |  14 +
 .../networking/net_cachelines/net_device.rst  |   1 +
 Documentation/networking/netdevices.rst       |  44 ++
 drivers/net/veth.c                            |  44 ++
 include/linux/bpf.h                           |   1 +
 include/linux/netdevice.h                     |  40 +-
 include/net/tcx.h                             |   6 +
 include/uapi/linux/veth.h                     |   5 +-
 kernel/bpf/tcx.c                              |  24 +
 kernel/bpf/verifier.c                         |  31 ++
 net/core/dev.c                                |  44 ++
 net/ipv4/ip_output.c                          |   2 +-
 net/ipv4/raw.c                                |   2 +-
 net/ipv6/ip6_output.c                         |   2 +-
 net/ipv6/raw.c                                |   2 +-
 net/packet/af_packet.c                        |   7 +-
 net/xdp/xsk.c                                 |   6 +-
 tools/net/ynl/Makefile.deps                   |   3 +-
 .../selftests/bpf/prog_tests/verifier.c       |   2 +
 .../bpf/progs/verifier_tx_extra_headroom.c    |  40 ++
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/lib/xdp_helper.c  |  82 +++-
 .../selftests/net/tx_extra_headroom.bpf.c     | 138 ++++++
 .../selftests/net/tx_extra_headroom.py        | 426 ++++++++++++++++++
 24 files changed, 944 insertions(+), 23 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_tx_extra_headroom.c
 create mode 100644 tools/testing/selftests/net/tx_extra_headroom.bpf.c
 create mode 100755 tools/testing/selftests/net/tx_extra_headroom.py


base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
-- 
2.56.0

