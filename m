Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ADB46AA89
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921993; cv=none; b=gNpKzENEdRD372FAiKfulYmb/qEcGFq32+G/oaNH1aYrkocSs/TDGTDaN8gVxmtfNLf2s/RS3/LkvZ2lr1+Jk3DC6bwpmV2vqaZb2DEfKf+KEDubIjXNsR4+MbN4DF2rEfI7ulf2QYVltBVAuGlEzYlAVc4rDqsa5R2a/3Jls/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921993; c=relaxed/simple;
	bh=9b28pbK9azbLidjba42geuga0SJ1WJgd6Ehnda9bR/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plFmA3SiP2GyLou5ev3na8KGf09IU1yrv+TdO4pt/EUrmA8xpc65Io3Mz2jss6zCQSNd0n25s0RBLtbU/R9yu5PnpjlUgGIL6pVvRUx6ZPZpe7cabd5SwfT1MKeChec9TNaEEz+xmuWd+0MLuxl90vIO2ZAByPRWQDJEho+4L3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGsfOe/a; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGsfOe/a"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fbef5018so28622505ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789921988; x=1790526788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1bOr4cY3cVT9fuwETlIQTXCDoyIrnhNiHPjwyjuD7g=;
        b=OGsfOe/aK26NYgpKtUmW0yGyX65PH7MsC1nC6TRTGKppgSDd1jkdJs9OoH3Ti1gXMf
         9Q6r7FCKC0zxtidIIyCMQ8dcJ/tdU8hiPhIu8gV6FST8XKKP5c/7LLbHk3L6ECO/KrSP
         Ss6Off+S8/r/jN5fhTAOgh3WRmvku53FC4AhigE8EMODf+1u+U1pzsfTBv8J1FCt6Lg4
         T0twFn4ATG0YjrjkQRFLoUOeVaDfwOBn29HZGxSeqLIdAIZ0Tf+RoZh1bAP9JyUAq2DS
         0yQQpx8uxDGVkf7acYD1mxoHH4GzXJnlLnVQUejTgcy9jq4OSo7Hl45u4CLYRDwXi0RF
         RJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789921988; x=1790526788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x1bOr4cY3cVT9fuwETlIQTXCDoyIrnhNiHPjwyjuD7g=;
        b=FNHj7bf1B7lEqZvXo9peqO1M7Y/1jXxtHeYEPiiPZNUoIyjoxsS4FAzlhr8SsJxi3Q
         kTCbOHA8UMKGWXDqx3T90REXLkhqOFQVAAm68BweyvK08CDb8iqhd42AL48DP+OG8Cnu
         FrDLN9bQhpnhukCiucBFRo7gyflU/UaGiyfScujlT91Mw60y8rxD9lgYDTRb7/fNMcQR
         UO8wncX0EQIh3H6I+vcjAOJzET/OSf0tw7gDuB2IWrY1CotBeAHHdK4go0GsPb0s1gBC
         eou9wZYRv5PbrPZNIy4vziIbFFed6+htlG7dfoibMjgGPvPG0+33nrKsaAgw/g9yMoxl
         L7Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzM3+24vvLZQmgu28HQHlyqIKGB7hkeZ3wiDAymlbnC7kj90CudIsisH2rYTBmd6nRnaeSMJh0ExcCvpiTYRrs=@vger.kernel.org
X-Gm-Message-State: AFuF++mOW4lgYmdMCwqhZtp4jyQT8uUp0i9e969yt+ElOPnZAR/54bQY
	mlOPk40wZKVuKz097o7PHZ+esw9sTWhVW9DKkOhui1mylTDTI9aI64tC
X-Gm-Gg: AYBFou04KR95yGMF9FkxecXnW5rQVIx8bAV8RFCUj60vz+avJjWQruywoaq3zym6nl7
	ZzaW3DuiONe54Ga3vWJaHE65oh1Fi7kgkrCr4OVP8u+o34El3t7+kn8vaXh0uxoBjV4vhWlc6PI
	1prRHhxecAbWLiUN9ETysscKCoOcwEFDO5KOP+SNCnNt0NhyrkjRyKPLI/1BkXPRbZkTlYVJT+W
	+I62agNmujwQ+GmxVfCXT2FKbY1pO/arN82LGpgUZc/F5mAXuHocObZpELenLww7EHOVkd6Qnbo
	sEUCInBUwK94ptwKHRoBkhNITobylYWDYQ+7pqSekqZmSqdLD+2XitI9deHSZptu+F59Or9gt0z
	f9o4a8eT6QoV9kJbteP6HAi5oLMdjZwaBNUcZix5+Y6d5IFbjWk5Iv3WpZDsZbB2dtkBZjPGFpk
	yPDPMfeKYk60KjJc/ueaecbpIJXJYlUfzlAg7puhbbhZFOFl3DZtna5LConiFr7t8pKN3dA2q5N
	1V+s1absti5WaJmZcxnyIDpfoNYmXSS
X-Received: by 2002:a17:902:fd8c:b0:2dd:ad74:ac22 with SMTP id d9443c01a7336-2ddb1bd6e1bmr144054675ad.29.1789921987745;
        Sun, 20 Sep 2026 09:33:07 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17e17e0sm21784355ad.70.2026.09.20.09.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 09:33:07 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Peter Oskolkov <posk@google.com>,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] bpf: clear stale IPv4 options after LWT encapsulation
Date: Mon, 21 Sep 2026 00:32:10 +0800
Message-ID: <20260920163211.795547-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920163211.795547-1-bestswngs@gmail.com>
References: <20260920163211.795547-1-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_lwt_push_ip_encap() rebases the network header after prepending an IP
header, but leaves IPCB(skb)->opt describing the inner IPv4 header. An
ingress LWT route can consequently make an ICMP error use stale option
offsets when constructing its reply.

Mark each completed LWT IP encapsulation in the run's BPF network context
and reset the protocol control block after bpf_prog_run_save_cb() restores
it. This also covers an skb which was already marked encapsulated before
entering LWT. A failed SEG6 encapsulation does not set the marker, so it no
longer causes valid IPv6 metadata to be cleared.

Select the reset layout from the protocol callback which consumes the
packet: the original family for BPF_OK and unsupported redirects, or the
new family for supported reroute and redirect paths. Preserve the ingress
interface and L3-slave state from the restored original control block and
initialize the IPv6 next-header offset when needed. Save and restore the
marker around nested LWT runs.

Cc: stable@vger.kernel.org
Fixes: 52f278774e79 ("bpf: implement BPF_LWT_ENCAP_IP mode in bpf_lwt_push_encap")
Reported-by: Xiang Mei <xmei5@asu.edu>
Link: https://lore.kernel.org/bpf/20260915170147.3943392-2-bestswngs@gmail.com/
Suggested-by: Daniel Borkmann <daniel@iogearbox.net>
Link: https://lore.kernel.org/bpf/48990076-414c-4196-99b9-86fce41b8054@iogearbox.net/
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 include/linux/filter.h |  1 +
 net/core/lwt_bpf.c     | 47 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/linux/filter.h b/include/linux/filter.h
index 788c2d625db4a..c8ca526d0661d 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -848,6 +848,7 @@ struct bpf_nh_params {
 #define BPF_RI_F_CPU_MAP_INIT	BIT(2)
 #define BPF_RI_F_DEV_MAP_INIT	BIT(3)
 #define BPF_RI_F_XSK_MAP_INIT	BIT(4)
+#define BPF_RI_F_LWT_IP_ENCAP	BIT(5)
 
 struct bpf_redirect_info {
 	u64 tgt_index;
diff --git a/net/core/lwt_bpf.c b/net/core/lwt_bpf.c
index da49364ec63de..d585484a3a766 100644
--- a/net/core/lwt_bpf.c
+++ b/net/core/lwt_bpf.c
@@ -36,10 +36,44 @@ static inline struct bpf_lwt *bpf_lwt_lwtunnel(struct lwtunnel_state *lwt)
 #define NO_REDIRECT false
 #define CAN_REDIRECT true
 
+static void bpf_lwt_reset_cb(struct sk_buff *skb, __be16 orig_proto,
+			     bool use_new_proto)
+{
+	__be16 cb_proto = use_new_proto ? skb->protocol : orig_proto;
+	int iif = skb->skb_iif;
+	bool l3slave = false;
+
+	/* VRF may have replaced skb_iif with the master device index. */
+	if (orig_proto == htons(ETH_P_IP)) {
+		iif = IPCB(skb)->iif;
+		l3slave = ipv4_l3mdev_skb(IPCB(skb)->flags);
+	} else if (orig_proto == htons(ETH_P_IPV6)) {
+		iif = IP6CB(skb)->iif;
+		l3slave = ipv6_l3mdev_skb(IP6CB(skb)->flags);
+	}
+
+	if (cb_proto == htons(ETH_P_IP)) {
+		memset(IPCB(skb), 0, sizeof(*IPCB(skb)));
+		IPCB(skb)->iif = iif;
+		if (l3slave)
+			IPCB(skb)->flags |= IPSKB_L3SLAVE;
+	} else if (cb_proto == htons(ETH_P_IPV6)) {
+		memset(IP6CB(skb), 0, sizeof(*IP6CB(skb)));
+		IP6CB(skb)->iif = iif;
+		IP6CB(skb)->nhoff = offsetof(struct ipv6hdr, nexthdr);
+		if (l3slave)
+			IP6CB(skb)->flags |= IP6SKB_L3SLAVE;
+	}
+}
+
 static int run_lwt_bpf(struct sk_buff *skb, struct bpf_lwt_prog *lwt,
 		       struct dst_entry *dst, bool can_redirect)
 {
 	struct bpf_net_context __bpf_net_ctx, *bpf_net_ctx;
+	struct bpf_redirect_info *ri;
+	bool lwt_ip_encap, nested_lwt_ip_encap;
+	__be16 orig_proto = skb->protocol;
+	bool use_new_proto;
 	int ret;
 
 	/* Disabling BH is needed to protect per-CPU bpf_redirect_info between
@@ -47,8 +81,20 @@ static int run_lwt_bpf(struct sk_buff *skb, struct bpf_lwt_prog *lwt,
 	 */
 	local_bh_disable();
 	bpf_net_ctx = bpf_net_ctx_set(&__bpf_net_ctx);
+	ri = bpf_net_ctx_get_ri();
+	nested_lwt_ip_encap = ri->kern_flags & BPF_RI_F_LWT_IP_ENCAP;
+	ri->kern_flags &= ~BPF_RI_F_LWT_IP_ENCAP;
 	bpf_compute_data_pointers(skb);
 	ret = bpf_prog_run_save_cb(lwt->prog, skb);
+	lwt_ip_encap = ri->kern_flags & BPF_RI_F_LWT_IP_ENCAP;
+	ri->kern_flags &= ~BPF_RI_F_LWT_IP_ENCAP;
+	if (nested_lwt_ip_encap)
+		ri->kern_flags |= BPF_RI_F_LWT_IP_ENCAP;
+	use_new_proto = (ret == BPF_LWT_REROUTE &&
+			 lwt->prog->type != BPF_PROG_TYPE_LWT_OUT) ||
+			(ret == BPF_REDIRECT && can_redirect);
+	if (lwt_ip_encap)
+		bpf_lwt_reset_cb(skb, orig_proto, use_new_proto);
 
 	switch (ret) {
 	case BPF_OK:
@@ -668,6 +714,7 @@ int bpf_lwt_push_ip_encap(struct sk_buff *skb, void *hdr, u32 len, bool ingress)
 	} else {
 		skb->protocol = htons(ETH_P_IPV6);
 	}
+	bpf_net_ctx_get_ri()->kern_flags |= BPF_RI_F_LWT_IP_ENCAP;
 
 	if (skb_is_gso(skb))
 		return handle_gso_encap(skb, ipv4, len);
-- 
2.55.0

