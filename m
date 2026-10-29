Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266570;
	b=IpjcPs/UwXa91+5K33QZkyYCMNNl9f8Tqv3kTq12rlOnPxnKzQtYHU69fup/kX+yUOVK
	 pRGhWghGuVFELYFPzJcjvrQ6NpurFKc7uUquZXfzod1ybHGOnPJZPgu43mzoBYiIaXs5X
	 5CPEq6Qo5qHNdDwNIbywLuxJth9i1vzzRHKlcBF3nw1uC3Mbkw1zDOlzB0WFgA9FTvQ18
	 UsDJjLB8VotJE09lIz9T+W7Wx6ngbxK5DBt+RdH10IQf28uCLmyb/R6UiONUgDZr4wH5X
	 kwpvOXi/lBZS5/ywuHUm3a0ZQ8aPYhCZTpBnzbIFqAXAtVfulCQUyqCG5HKA2Bmhflw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hzOUhhpV11demFlh59Tft/tHrYohYb0/kBzwZWpxs64=;
	b=nr3TEbjwQwfvv4WYrYrJCVg+xo1tymqvhd3QuAz9hhRo78bcL+007NqD9Lk4rxTpDM5p
	 SUZ4kkJD9g5rXCl2w+KAElOLIVOnCgChnF8UPYqnwWBEp4sR9/b456EZ+VaQSDjKkPTvS
	 vVHT86pi5EL7e/vGjaXADlIipDHmB6ziWqOY5yuePeHnGkYWK6cA/Sty2UpugQx/4zn6P
	 Gv28eqYBrL6S8AYJQhYszCd0pPEl1Z+Jk2WayADv/w22d9+Gc+B95PpAHt2Eg1w1fUNvo
	 hmdGcWFa5oJ7srzeSd6RbUWJ/NNNES6Jpv6HVRBXq440v4fo7/zah4JgDWo84LGkbXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b="ly/wfBfW";
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AEF606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 09:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51AEF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=ly/wfBfW
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-679e6ab6471so429186d50.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1793266568; x=1793871368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzOUhhpV11demFlh59Tft/tHrYohYb0/kBzwZWpxs64=;
        b=ly/wfBfWMVEzWxCgsqsaGeWG9kaAy9McsBcfGXzxZ6JEl4eZFJztoAYNbUYnAtnQdT
         kwWj7GOIxz1UP3KhSEJRd6XI+FjCMz661R7ylsTSIcQJPZejEfal/SKCX4Bx62Pdko/+
         VX1mxT1xyAN6+sr3cOmLuDZrea2OHjRNdCFhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266568; x=1793871368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzOUhhpV11demFlh59Tft/tHrYohYb0/kBzwZWpxs64=;
        b=WxHRqI8jt8S42goXG6996wdwSZ7ZtYkXRqYWRcR89wPXeoegdLE9zynHPEAqGgycEE
         WhGfeYdTvuEcoLsVvL23fZqjsxzG9TppEFpl8DQTXc71glQQKrelAWgZ/USZ9j1MQ1Ym
         5AZ9OsAuke/oWEltGJwP0MRaa9Ds2GYPTq7EOf1A5wiBwil6u157+YBymbu9rqsj4cLQ
         EpEqWMAej0w0mkg13eynqzj2VUYhcETwL9SUnTfRidytPkI3L/rDSltwXLZn+VDVeaaP
         BCcPh/ZpTauZmQqBCQ5T0UzpUPzC2tkv2jUP4zdc488Kgs+Cp4XhjT4JyN+FWTRx7Beq
         ccUA==
X-Forwarded-Encrypted: i=1; AKwUvBwsAT5SQCy09ANohD3OZeZj2FJgD7Fh4MUy3Hkov1vFiTXcCADmccjBHualUngLvqnxAtBOaOS/QFsP6AGUibk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd2SvkEnAZnyRanVEHIxoa5/m3b5jfHkNVZXjBvu5k2agvr5dY
	pk98OrnxZLQhAFqTKM+Irr0xJn5K0sblUmn/ivpe8hWyH5ognAJHU4bj37y4/tkdwQ==
X-Gm-Gg: AYBFou1wL2IN4sS1oDJIWV+Sl44oFWze/xwDawV2fMebMoIq43c3665KrFA0Vv2V4kc
	WzspZLxUewArX7ct5BubE8tddBtvltqyg5WsplWsrHABWJ5ug8iGoshqvahNSNgCBwI6rUGsRLP
	Hed04nkYM/Grrv8VSpt/7UJtu7qn2KUDEy0+PDwkhT8YZPc6v7MDusPvk+/wG5Fgq8j9GIRDffy
	lkXFe8LnR/ixtdvEhlLHtZd/LA8lJxGwklS21m45+RsCrUk7uAKf1p0V183eAfSpGdfD/M5T4fX
	UaS0Hy20XVEQYIMWo0J6XA7qFX4TOsiFKXM7qtUXGZc1gfmMpOjSptvWkgXapK5hAwl8S3Q3CZU
	nUWKQGCv/8ZqF/uUmjGqB2NC6bwW5Pc5Su3sJ9xPpeMFs2A1tpgbXarA4P2HFaIKGhE4JAXvstP
	GM8gQ+Pgo6NCY6tr1WtQPQyFE7YND1tFUTDOFR4Vqk/VKgW+hVcBdR6c4TcJgfvAlw8JGsoj53N
	3YZTPaXpmP8SHzgM9B9Rh0lXgQ+N6kiiA9meuYDT2BRNXbqGZKMVrKL2dJvC3o28EUeepAL7QTC
	tC+otcOxHOTZhoBxRcQhcqYEetsak82nLvB71isSQdc30dlkb1hoeW2iiYbaexcBNr/RAXgrFBq
	3pHjkAFLuBtadscA=
X-Received: by 2002:a05:690e:1909:b0:677:b7c3:12c3 with SMTP id 956f58d0204a3-67a8d22eb63mr1824691d50.29.1793266568197;
        Thu, 29 Oct 2026 02:36:08 -0700 (PDT)
Received: from mbili.tail33bf8.ts.net ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a0c31cfsm3058873d50.9.2026.10.29.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:36:07 -0700 (PDT)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Eric Dumazet <edumazet@kernel.org>,
	bpf@vger.kernel.org,
	bot+bpf-ci@kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	David Ahern <dsahern@gmail.com>,
	Martin KaFai Lau <kafai@fb.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH net v2] bpf: Fix skb_pull() BUG in __bpf_redirect_neigh()
Date: Thu, 29 Oct 2026 05:36:03 -0400
Message-Id: <bpf_redirect_neigh_short_linear.v2.r0.20261028080316-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
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

The issue:
This is a follow-up to the short link-layer header fixes from Eric.
After vlan pop_eth, a privileged SCHED_ACT BPF program can call
bpf_skb_change_head(skb, 1, 0) and then bpf_redirect_neigh().

__bpf_redirect_neigh() calls skb_pull(skb, sizeof(*ethh)) after checking
only that mac_header < network_header.  It does not check that the MAC
header is long enough or that it is linear.

A SCHED_ACT BPF program can do:

    bpf_skb_change_head(skb, 1, 0);
    bpf_redirect_neigh(lo, NULL, 0, 0);

after vlan pop_eth.  The skb then has mac_len == 1 and only one byte of
linear data; skb_pull(ETH_HLEN) trips the skb->len < skb->data_len BUG in
__skb_pull():

    kernel BUG at include/linux/skbuff.h:2839
    RIP: skb_pull+0xc5/0x100
    Call Trace: skb_do_redirect -> ...

The Fix:
Use skb_mac_header_len(), i.e. network_header - mac_header, rather than
skb->mac_len.  mac_len is zero for locally generated tc egress and netkit
packets, while skb_mac_header_len() still rejects the one-byte header
produced by pop_eth + bpf_skb_change_head(skb, 1, 0).

Also use pskb_may_pull() to ensure the Ethernet header is linear before
reading or pulling it, and re-read ethh afterwards since pskb_may_pull()
may reallocate skb->head.

Add egress coverage to tc_redirect_neigh: the existing test only attaches
redirect_neigh at ingress, where mac_len is populated.

Conditions to recreate the bug:
On x86-64 with 4 KiB pages, enable CONFIG_PACKET, CONFIG_BPF_SYSCALL,
CONFIG_NET_SCH_INGRESS, CONFIG_NET_CLS_MATCHALL, CONFIG_NET_ACT_VLAN and
CONFIG_NET_ACT_BPF.  Run as root with BPF loading, network administration
and raw-packet privileges.  Bring lo up and attach a SCHED_ACT program
that calls bpf_skb_change_head(skb, 1, 0), then returns
bpf_redirect_neigh(skb->ifindex, NULL, 0, 0):

  ip link set lo up
  tc qdisc add dev lo clsact
  tc filter add dev lo egress matchall action vlan pop_eth pipe \
      action bpf object-file neigh_chghead.o section action

Send an untagged ETH_P_IP frame of ETH_HLEN + 8192 bytes through an
AF_PACKET/SOCK_RAW socket bound to lo, without PACKET_VNET_HDR or
PACKET_QDISC_BYPASS.  Use a unicast destination MAC.  The sender's skb
has a 14-byte linear Ethernet prefix and a fragmented payload; pop_eth
removes that prefix and change_head restores only one linear byte.
The unfixed neighbor redirect then tries to pull 14 bytes and BUGs.

Fixes: b4ab31414970 ("bpf: Add redirect_neigh helper as redirect drop-in")
Reported-by: BPF CI <bot+bpf-ci@kernel.org>
Link: https://lore.kernel.org/all/2a0f5ff1d8db81b07fc4b344b8e68e3505fcbf36f72a471d1678b2f1cecd881b@mail.kernel.org/
Link: https://lore.kernel.org/netdev/20261027082604.1485903-1-edumazet@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v2:
- use skb_mac_header_len() instead of mac_len; mac_len is zero for
  locally generated tc egress and netkit packets (BPF CI)
- add tc-egress coverage to tc_redirect_neigh
- document the nonlinear AF_PACKET reproduction conditions

 net/core/filter.c                             |  6 ++++-
 .../selftests/bpf/prog_tests/tc_redirect.c    | 26 +++++++++++++++++++
 .../selftests/bpf/progs/test_tc_neigh.c       | 10 +++++++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/net/core/filter.c b/net/core/filter.c
index 70dc621672f2..4925f3e355d4 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -2432,10 +2432,14 @@ static int __bpf_redirect_neigh_v4(struct sk_buff *skb, struct net_device *dev,
 static int __bpf_redirect_neigh(struct sk_buff *skb, struct net_device *dev,
 				struct bpf_nh_params *nh)
 {
-	struct ethhdr *ethh = eth_hdr(skb);
+	struct ethhdr *ethh;
 
 	if (unlikely(skb->mac_header >= skb->network_header))
 		goto out;
+	if (unlikely(skb_mac_header_len(skb) < ETH_HLEN ||
+		     !pskb_may_pull(skb, ETH_HLEN)))
+		goto out;
+	ethh = eth_hdr(skb);
 	bpf_push_mac_rcsum(skb);
 	if (is_multicast_ether_addr(ethh->h_dest))
 		goto out;
diff --git a/tools/testing/selftests/bpf/prog_tests/tc_redirect.c b/tools/testing/selftests/bpf/prog_tests/tc_redirect.c
index af8968b89ad7..829f84fb64a3 100644
--- a/tools/testing/selftests/bpf/prog_tests/tc_redirect.c
+++ b/tools/testing/selftests/bpf/prog_tests/tc_redirect.c
@@ -407,6 +407,26 @@ static int netns_load_bpf(const struct bpf_program *src_prog,
 	return -1;
 }
 
+static int netns_load_egress_bpf(const struct bpf_program *prog,
+				 const char *ns, int ifindex)
+{
+	LIBBPF_OPTS(bpf_tc_hook, qdisc);
+	struct nstoken *nstoken;
+	int err;
+
+	nstoken = open_netns(ns);
+	if (!ASSERT_OK_PTR(nstoken, "setns egress"))
+		return -1;
+
+	QDISC_CLSACT_CREATE(&qdisc, ifindex);
+	XGRESS_FILTER_ADD(&qdisc, BPF_TC_EGRESS, prog, 0);
+	close_netns(nstoken);
+	return 0;
+fail:
+	close_netns(nstoken);
+	return -1;
+}
+
 static struct bpf_link *netns_attach_nk(const char *ns, int ifindex,
 					struct bpf_program *prog)
 {
@@ -1055,6 +1075,12 @@ static void test_tc_redirect_neigh(struct netns_setup_result *setup_result)
 			   skel->progs.tc_chk, setup_result))
 		goto done;
 
+	if (netns_load_egress_bpf(skel->progs.tc_egress, NS_SRC,
+				  setup_result->ifindex_src) ||
+	    netns_load_egress_bpf(skel->progs.tc_egress, NS_DST,
+				  setup_result->ifindex_dst))
+		goto done;
+
 	if (!ASSERT_OK(set_forwarding(false), "disable forwarding"))
 		goto done;
 
diff --git a/tools/testing/selftests/bpf/progs/test_tc_neigh.c b/tools/testing/selftests/bpf/progs/test_tc_neigh.c
index de15155f2609..e0b6c14a3935 100644
--- a/tools/testing/selftests/bpf/progs/test_tc_neigh.c
+++ b/tools/testing/selftests/bpf/progs/test_tc_neigh.c
@@ -133,4 +133,14 @@ int tc_src(struct __sk_buff *skb)
 	return bpf_redirect_neigh(IFINDEX_DST, NULL, 0, 0);
 }
 
+SEC("tc")
+int tc_egress(struct __sk_buff *skb)
+{
+	if (skb->mark)
+		return TC_ACT_OK;
+
+	skb->mark = 1;
+	return bpf_redirect_neigh(skb->ifindex, NULL, 0, 0);
+}
+
 char __license[] SEC("license") = "GPL";
-- 
2.43.0

