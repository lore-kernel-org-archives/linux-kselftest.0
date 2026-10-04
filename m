Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A23C4B68
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134200; cv=none; b=dQdBOU0Lta78lziq+SkXKE8ZQmTeHIds1jEEH/PgrubTSLBN7zv5Q7lcpaeBbz5dLAYA/V5sFTywHwhDGkYOdf3MywvmvZpf4nyg7wsWPq1QEBx254TM0hoUpHfg9IvQXxtZQqLAmGyi3yDeIwjD+CwpiQogHZod5q0PVfSCdqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134200; c=relaxed/simple;
	bh=o+JP6AFkjXqu+xgn0kPky3tJsPD7UpyZPMamq+tPVVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWE3iX2BUVpd/uN3lK4wE/egtnpqGzwXYDvsz9DCT6xGaEKdcFYdDG7mbU89lThqLf21FqSqcj+0zf5TQBqJjGqy9j/eQbL3MmX+2Rhm6ExAoyDYz8CvNq5UvV0lDK1hVQKcg7+ZCqvQ5jtydWviakGDGdutrOXLfwg1ODdZBQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=DpEDTgQR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="DpEDTgQR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so151620566b.1
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 10:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134192; x=1791738992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJNhbzdzUtweI2bWLQScQsYVxoKpUAcTekhWP7Abrus=;
        b=DpEDTgQRauCXnYOV7ZoTK/2porP1x5M+2Q1zQnBHLxTxA5kzM3O8BNIB+gZRTYk9i1
         HWH6yFPxWqqyfZeB/BdutxpmlPELsvOZE6i8mzJHs8gqmjTjovkFkoqaiNJStCgNhcAk
         VB8K51s6ji3q7/0ReSrPFOgVJ6AaBRiBsxN78Qdk3nEQngYOVyFIGiY3Hf8HphHLy5mz
         r/e/jjiDEq5lyADdqqAGeAv3Tsmw5MKr1DFb8LZpKKivVbn2YpuRl72Li5Vw8kmG+HAG
         p7OU6p4cVIfR4eVpZ1xP4JJgBHa/pm6S9njFzFYggZmv9ckdRRATZCfxdRlIJTmAS6q6
         nomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134192; x=1791738992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJNhbzdzUtweI2bWLQScQsYVxoKpUAcTekhWP7Abrus=;
        b=hS0WWeXtMn1lGycuBPbPODT2pbxk87S/BeLd/XogsRhXzcKN7YZoDGEkQfAbLeq4m4
         vnPJcof0m56kDVCWlPQiV5QMu7+KTDMXva3a8LHxPTM5KjpHief3rX/DPzMF4CsGoBRk
         zETI1xDxWlWAsb6FnWkLwRdvzNxi1yVXcZd6aPg6HuwYYJG2GW3W+74hjXwgxqLhnRcU
         gWDHCi7L5zLYamoOy1q2BpA+VyEqL3wNh9HniHdrrOR3oU5xg+GEuzZtfrWaJVVCWU8R
         j0HpNv0xd6Vnes0k5iTfSrmJ7ZPwt3y8hJcoOMb1VjDFqvQe7qG1PQz2adQA0rPNqokS
         DWzQ==
X-Forwarded-Encrypted: i=1; AKwUvByeMvGMAh7vaXWW56pJ1ZlRuWmjXzEV/gC863bIrIXL4NR19e43cvcOAby8VK4VQGumSDDHoYqgfVo15yZKb3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn4pP7UttUM3rv+rjiEcYE0Vo2MmAuRmBJDiwVbb091qHCxUPT
	wNKD8CGv7jWZLOom9RtuLcxU7LGX+kSX5pdsBuixNUzaDxmGI8CgM5O4Nq40EFnyDg==
X-Gm-Gg: AYBFou3DOaTdbupUc4C7N/pVs/EGt+XhrLlpyjpZMRKU4BKLCt871Kz0kwSTsejkFGC
	mXadHjtkBrrYNi1wgSFPpf4t7YVkRJ4nsTA8OravtMerkmw2PoZokO4sX0rBdbknYhiGCc7E6i7
	wh//XeR6rdVKUeHEprx8X7hiFB9czmwOLdX9/kMXEtb2nmXqiS+2T0vfTOLGxo/jb4MU09Sixsw
	6wKf9xkXsTdhnuLQrIccX0+Yd4GD+mOXoXfns1RGAQdRJZuMfCcLtE6MzEV3pl4jbwyA/Euaa37
	wjmgjbwQehg1wEpx5d0/xg5i0leEX0bpUNpLryZhl6BWv/RKskSfxVYbLu4xf9yWr78fHaGmizc
	F/j9+abiq5a0roA5F7uorT+s/dM/J3p+83JCDAqQrEJsisu2pbbsOYpIcSOi8q/mNPdac0flTAt
	B2WtaDK2lRFhxIMr1CJ4FkcuiYbfzgGfTMjrBgK5Ql6piTCb9NgU4fGD+Wp8+JZkyXVYRPyDazF
	Ek43byb7U+KixPOgfH3omCOtwuPNyylXTXKdQN57LhH5qbI78HVYifsUMf7LsOjSJFmqOAgDAiL
	uk+l+sGM7LsIxUpGFo6LLRGTduKSdkEejL2/bQeKu4X5apmCdlQdbgqR8ds9ZgvoZ+cD0kUxJv9
	OAvfIDBaHLDRzsd6M6cm/ziLuNeNS+2x8a4yWaiJXc3y2kpnJX4LKYxv8C0RDznraNlJBYZWzxQ
	2Fv3kUg22AD1m641TmtCq4gQQOm2SB8+VSOw==
X-Received: by 2002:a17:906:f586:b0:c2d:c8be:4e71 with SMTP id a640c23a62f3a-c2e6ed46571mr421857166b.19.1791134192089;
        Sun, 04 Oct 2026 10:16:32 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf9ddbesm317345166b.69.2026.10.04.10.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:31 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	netfilter-devel@vger.kernel.org
Cc: kadlec@netfilter.org,
	fw@strlen.de,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	geldot@protonmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v2 3/4] netfilter: nft_flow_offload: offload a TCP flow that has no reply
Date: Sun,  4 Oct 2026 19:16:27 +0200
Message-ID: <20261004171628.3544978-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171628.3544978-1-julius@bairaktaris.de>
References: <20261004171628.3544978-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Dotzler <geldot@protonmail.com>

A TCP connection picked up without a reply is not assured, so it is not
offloaded. Offload it in the original direction; if a reply arrives and
the connection becomes assured, the reply direction follows.

When such a flow leaves the flowtable, cap the conntrack timeout at
UNACK, as nf_conntrack_tcp_packet() does without a reply.

Signed-off-by: Gary Dotzler <geldot@protonmail.com>
Assisted-by: Claude:claude-opus-5
Co-developed-by: Julius Bairaktaris <julius@bairaktaris.de>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
With nf_conntrack_tcp_timeout_established=7440, an idle unreplied flow
that aged out of the flowtable had 7390 s left without the cap and
250 s with it (3 runs each, virtme-ng).

 include/net/netfilter/nf_conntrack_l4proto.h | 9 +++++++++
 net/netfilter/nf_flow_table_core.c           | 5 +++++
 net/netfilter/nft_flow_offload.c             | 6 ++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/net/netfilter/nf_conntrack_l4proto.h b/include/net/netfilter/nf_conntrack_l4proto.h
index fde2427ceb8f..c251ee862bb6 100644
--- a/include/net/netfilter/nf_conntrack_l4proto.h
+++ b/include/net/netfilter/nf_conntrack_l4proto.h
@@ -208,6 +208,15 @@ static inline bool nf_conntrack_tcp_established(const struct nf_conn *ct)
 	return ct->proto.tcp.state == TCP_CONNTRACK_ESTABLISHED &&
 	       test_bit(IPS_ASSURED_BIT, &ct->status);
 }
+
+/* Picked up mid-stream, no reply seen yet. Caller must check
+ * nf_ct_protonum(ct) is IPPROTO_TCP.
+ */
+static inline bool nf_conntrack_tcp_unreplied(const struct nf_conn *ct)
+{
+	return ct->proto.tcp.state == TCP_CONNTRACK_ESTABLISHED &&
+	       !test_bit(IPS_SEEN_REPLY_BIT, &ct->status);
+}
 #endif
 
 #ifdef CONFIG_NF_CT_PROTO_SCTP
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 03241d4bfd5e..2f2a6ecc9195 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -224,6 +224,11 @@ static void flow_offload_fixup_ct(struct flow_offload *flow)
 			tcp_state = READ_ONCE(ct->proto.tcp.state);
 			flow_offload_fixup_tcp(ct, tcp_state);
 			timeout = READ_ONCE(tn->timeouts[tcp_state]);
+			if (nf_conntrack_tcp_unreplied(ct)) {
+				u32 unack = READ_ONCE(tn->timeouts[TCP_CONNTRACK_UNACK]);
+
+				timeout = min_t(s32, timeout, unack);
+			}
 			expired = nf_flow_has_expired(flow);
 		}
 		offload_timeout = READ_ONCE(tn->offload_timeout);
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 32b4281038dd..b37590c3dac0 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -73,7 +73,8 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
 		tcph = skb_header_pointer(pkt->skb, nft_thoff(pkt),
 					  sizeof(_tcph), &_tcph);
 		if (unlikely(!tcph || tcph->fin || tcph->rst ||
-			     !nf_conntrack_tcp_established(ct)))
+			     (!nf_conntrack_tcp_established(ct) &&
+			      !nf_conntrack_tcp_unreplied(ct))))
 			goto out;
 		break;
 	case IPPROTO_UDP:
@@ -117,7 +118,8 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
 	if (tcph)
 		flow_offload_ct_tcp(ct);
 
-	__set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
+	if (!tcph || test_bit(IPS_ASSURED_BIT, &ct->status))
+		__set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
 	ret = flow_offload_add(flowtable, flow);
 	if (ret < 0)
 		goto err_flow_add;
-- 
2.53.0

