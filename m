Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3271A3E2778
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912223; cv=none; b=c1kW3VO1pkKryVVXBIJk1OiXttoD7vIEPhEdUs6e5fnN1LC4orvGKPYtdULlR3Sp2+laVFodljZdXIvSNARqKIRHeKD1oP2wOHevejRN0wCTMpVgj2bWIifFZpsNwD2T1uVhM2Qw3J4kRGlECI8m3oiA6PoDY8VD4YDKHdxB7ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912223; c=relaxed/simple;
	bh=+iiiX3BvtYgkBAUfsPCcDZX4Aid/ECDwiIQZzdJjkNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5X6lFvzrIuNX6r1ndlXI0XS1FxfBKgXb8sPP+UtxJsxCe9oiHg4G+2L7dtPxnKZi46b9EpKcGPrXW9zpSGcLoThv1Ej9QT9P1LanPEo46l8DijitxAg58wv5zwb5FPamja88D6YQxcrd0PDnqT4NI5n9KkNa9Zrxa+82WKtdaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfgHUusY; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfgHUusY"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82748257f5fso3736936b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777912220; x=1778517020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4SDDOQTi/UT2LIZcsZGLS3qiP3+rr4zN9xXGDgjw4U=;
        b=lfgHUusYEg7LgD+BuBOI3EuiVMM5H4bghSXghViiri8ojDluvFUrpEYDsGYpCrPiAb
         Pw9lDTGxhX0+R5sVptxcKjHnz1YhVpoZYvYGiJcBkwjKr9qnrxc04Lzqg7Tv55/lhVDA
         Jf22UHV2ub01iRfOkNaVkgaFwNpW004wDbcaXprpMMIGsOye6u0NRMdy1g2gQ+soa8+v
         j7b/EFbhtzz9uEzxvFuDUuIf/GI5tds4Elr3S4+qPgyFhkdKB3QZjuEqEDRBYUpzU//5
         rx4uS+p8OXB8eUBjizhuSN9nF9FUvcqnRL9zjfrYZ57Qns0nkaGWy6vo0SifcIq5L/dM
         hDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912220; x=1778517020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K4SDDOQTi/UT2LIZcsZGLS3qiP3+rr4zN9xXGDgjw4U=;
        b=HndS1+ziSmbbQrNjwqNkQVF8Aq9TO93mqFobAxCRKXUocl6Zo6dDfaHaBSk8DGERX/
         rCcfhupTEo08S5xpwkunu+IbcnXOSQAKygXBRhXdUrwKwVtNDr5KhLHJuR/KBCP7Ar2/
         jWrhHygeQp5RW7Vi9rvDIS4xmYc9My1HfLvo07SPIINNZSsGcGNxgbrxoq9O2Xsuxbhb
         0CgG8yzKhkt/id6/Hwr9zjcrhm1A7Li6a8XLHO4VUb2Y7kWInyStaD4uDFzw23b7USU0
         PDFlomB5pQ0R95vkciX/IYUNrQaghemPQh0S5pZzxl+grnQbNpX3/dRlYXazvXUW4fN3
         7jog==
X-Forwarded-Encrypted: i=1; AFNElJ8GhxByEYTsOulCPDR4hLz/PvNE83N5MYTLp3sjDQByxy65tTlxY/tgBkUw/zTgDTBsUPkr6BJNs7M+5oAJoJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2CskuwUbVMqOpiFRmnqEKCpFjAx3bmTs8R2Q2lpY7uZCLmDxK
	BEWCMFrWVyCtJwi6DAvbj2FWUEc36gJlc11sYyN0MAQVV1NEcrkTR+KN
X-Gm-Gg: AeBDiet2u9lD2N5GSxaoAm2K7stgOlQg+sHH7H7oeOeXrRWKOc+X4X4E5rJrQGM3blZ
	pFTZVdIm0feTrV9Jo8R/49UHEMV0Fv04FOJ5B2vHgy0cQL7Wlg6KSe8ME320haleIKbOH+wU/qu
	Ix6ZzDfUkyhwBnogtvarwlcGxCKOgU2GfIpHtungwQMreOJsx6yrX+PA7hpyocWWqNYz2h5vC3d
	5CPbltt43DdaKKMVWsvZqhUO6d4xrQ6FJv4G7EolfW94BDw1PzOGBdER86Jp06SX1L+FAGS/CDZ
	tdrF9rBXZv0YN+UXvxeS6XAp3MUqc/iIO6Ct9HofJkO71zM9JZ6pZvkOhc24v+P+IOSaEb6sO4w
	Sm4aEmk9a3/ew2SEV29Cua/TjgZhZs29PoeFPnZxTNGIpwLWoMcui+RlQ5OhjNLcKCvFqIAYaGB
	7erHbb059WNWvwpeWuxOt7JSKCJpxCF5VV4eFehQCD5t99
X-Received: by 2002:a05:6a00:98f:b0:82f:4725:f6d0 with SMTP id d2e1a72fcca58-838fe8711b3mr144617b3a.29.1777912220379;
        Mon, 04 May 2026 09:30:20 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-837081abadfsm4998663b3a.42.2026.05.04.09.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:30:19 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Tue, 05 May 2026 01:30:11 +0900
Subject: [PATCH v2 1/7] seg6: add End.MAP behavior
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-seg6-mobile-v2-1-9e8022bdfdb6@gmail.com>
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
In-Reply-To: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrea Mayer <andrea.mayer@uniroma2.it>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9123;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=+iiiX3BvtYgkBAUfsPCcDZX4Aid/ECDwiIQZzdJjkNs=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBp+MmUQwE1DvRY1mrT1chXPXCYjnWz3JzuPfrDm
 HL6Zvy/U6yJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCafjJlAAKCRAq19F1Kl0b
 TbUmD/0UeSzpAQ0PNYbxTBqMwqlVIxxKM/NPWe8+lzUZukIj4qXV+wYtXi6zYARHws7Wl5pkAwt
 s85uTo9/zK97uY2+hH7g57YfdMrqEjdJUHvYsTeVdK4EFO9PbB/YMdoVCLq7OUvbsM/J+Wo6cR+
 K/ZJ9ZRY7QzBV24fd+GnJtRPP9FzUobQCZU/zHaTeDKrfris9RBlK7A6jOImCnvKv82ohS86nCR
 gMvbG0ZrdOL5gco+X4QYyfdQwAfyFU851S56e21r1TY2bLlPH6hRXzdDPf40dJ7RYF+Sn9nR/VS
 D2d8OGL0ICoB+VB6wDeL5d69zejtfH0S8jGp8hQuZmptsEjUOFl2+nEagB89KcoQszSLreJOqUw
 +CO719N6TLHKgaEGndoBb0GEmc1hJegxuADzAPHhiD8W7wYq5W5u0O6lRQGEP981GMmKONW5HFw
 r0Qko/sZR/XNwhcyK9JlzkEaIGupe4hW99jCxmTpxdh0QsnPdhW4CKdnDHkS95UHMF+ol5DuHFd
 kdOpcIzN8ycDDEs51KAHBqVOmpnSB2T0naONNP5RsJiAtkCkVjV8cDeXrXVCF5SW0CV7pa1+AE4
 TU359/LfJhNLzFjrE/vn8MSU2IW6jP4aLh9rIr8Q6Lo5rIL2K+axkXa5I/TgfhFRcZTA3vJMKNL
 /9vHveYD2hm0RYw==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

Add the End.MAP behavior (RFC 9433 Section 6.2): an endpoint that
replaces the IPv6 destination address with a configured next SID
and forwards via IPv6 routing without consuming the SRH.  The new
nh6 attribute selects the replacement SID.

Add three drop reasons that End.MAP emits to dropreason-core.h, so
dropped packets show up in the standard skb:kfree_skb tracepoint:

  SEG6_MOBILE_INVALID_SRH_SL
  SEG6_MOBILE_HOP_LIMIT_EXCEEDED
  SEG6_MOBILE_NOMEM

Configuration:

  ip -6 route add 2001:db8:f::/64 \
      encap seg6local action End.MAP nh6 2001:db8:1::e \
      dev <dev>

Link: https://www.rfc-editor.org/rfc/rfc9433.html#section-6.2
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 include/net/dropreason-core.h                    |  12 +++
 include/uapi/linux/seg6_local.h                  |   2 +
 net/ipv6/seg6_local.c                            |  73 ++++++++++++++++
 tools/testing/selftests/net/Makefile             |   1 +
 tools/testing/selftests/net/srv6_end_map_test.sh | 103 +++++++++++++++++++++++
 5 files changed, 191 insertions(+)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index e0ca3904ff8e..1be5c54d7605 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -127,6 +127,8 @@
 	FN(PSP_INPUT)			\
 	FN(PSP_OUTPUT)			\
 	FN(RECURSION_LIMIT)		\
+	FN(SEG6_MOBILE_INVALID_SRH_SL)	\
+	FN(SEG6_MOBILE_NOMEM)		\
 	FNe(MAX)
 
 /**
@@ -600,6 +602,16 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_PSP_OUTPUT,
 	/** @SKB_DROP_REASON_RECURSION_LIMIT: Dead loop on virtual device. */
 	SKB_DROP_REASON_RECURSION_LIMIT,
+	/**
+	 * @SKB_DROP_REASON_SEG6_MOBILE_INVALID_SRH_SL: invalid Segments Left
+	 * value or SRH validation failure on an SRv6 Mobile path.
+	 */
+	SKB_DROP_REASON_SEG6_MOBILE_INVALID_SRH_SL,
+	/**
+	 * @SKB_DROP_REASON_SEG6_MOBILE_NOMEM: skb head/tail expansion or
+	 * helper allocation failed on an SRv6 Mobile path.
+	 */
+	SKB_DROP_REASON_SEG6_MOBILE_NOMEM,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/include/uapi/linux/seg6_local.h b/include/uapi/linux/seg6_local.h
index 4fdc424c9cb3..45386fdfa821 100644
--- a/include/uapi/linux/seg6_local.h
+++ b/include/uapi/linux/seg6_local.h
@@ -67,6 +67,8 @@ enum {
 	SEG6_LOCAL_ACTION_END_BPF	= 15,
 	/* decap and lookup of DA in v4 or v6 table */
 	SEG6_LOCAL_ACTION_END_DT46	= 16,
+	/* swap DA with new SID, leave SRH untouched (RFC 9433 Section 6.2) */
+	SEG6_LOCAL_ACTION_END_MAP	= 17,
 
 	__SEG6_LOCAL_ACTION_MAX,
 };
diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 2b41e4c0dddd..bd8e3312973f 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -1468,6 +1468,73 @@ static int input_action_end_bpf(struct sk_buff *skb,
 	return -EINVAL;
 }
 
+/* SRH validation helper for SRv6 Mobile (RFC 9433) behaviors that may
+ * receive an SRv6 encapsulated packet.  Returns the SRH on success or
+ * NULL on validation failure / when the SRH is absent.  The caller
+ * uses @missing to distinguish the two NULL cases: an SRH-less packet
+ * may be acceptable depending on the behavior.
+ */
+static struct ipv6_sr_hdr *seg6_mobile_get_validated_srh(struct sk_buff *skb,
+							 bool *missing)
+{
+	struct ipv6_sr_hdr *srh = seg6_get_srh(skb, 0);
+
+	if (!srh) {
+		if (missing)
+			*missing = true;
+		return NULL;
+	}
+	if (missing)
+		*missing = false;
+
+#ifdef CONFIG_IPV6_SEG6_HMAC
+	if (!seg6_hmac_validate_skb(skb))
+		return NULL;
+#endif
+	return srh;
+}
+
+/* RFC 9433 Section 6.2 -- End.MAP
+ * Replace the outer IPv6 destination address with the configured next
+ * SID, decrement the Hop Limit, and forward via IPv6 routing.  The
+ * SRH is left untouched, so any subsequent End* behavior continues to
+ * see the original Segment List unchanged.
+ */
+static int input_action_end_map(struct sk_buff *skb,
+				struct seg6_local_lwt *slwt)
+{
+	enum skb_drop_reason reason;
+	struct ipv6_sr_hdr *srh;
+	struct ipv6hdr *ip6h;
+	bool no_srh = false;
+
+	reason = SKB_DROP_REASON_SEG6_MOBILE_INVALID_SRH_SL;
+
+	/* When an SRH is present it must HMAC-validate before we touch
+	 * the destination; an SRH-less packet is also accepted because
+	 * End.MAP does not consume the SRH.
+	 */
+	srh = seg6_mobile_get_validated_srh(skb, &no_srh);
+	if (!srh && !no_srh)
+		goto drop;
+
+	if (skb_ensure_writable(skb, sizeof(*ip6h))) {
+		reason = SKB_DROP_REASON_SEG6_MOBILE_NOMEM;
+		goto drop;
+	}
+
+	ip6h = ipv6_hdr(skb);
+	ip6h->daddr = slwt->nh6;
+
+	skb_dst_drop(skb);
+	seg6_lookup_nexthop(skb, NULL, 0);
+	return dst_input(skb);
+
+drop:
+	kfree_skb_reason(skb, reason);
+	return -EINVAL;
+}
+
 static struct seg6_action_desc seg6_action_table[] = {
 	{
 		.action		= SEG6_LOCAL_ACTION_END,
@@ -1565,6 +1632,12 @@ static struct seg6_action_desc seg6_action_table[] = {
 		.optattrs	= SEG6_F_LOCAL_COUNTERS,
 		.input		= input_action_end_bpf,
 	},
+	{
+		.action		= SEG6_LOCAL_ACTION_END_MAP,
+		.attrs		= SEG6_F_ATTR(SEG6_LOCAL_NH6),
+		.optattrs	= SEG6_F_LOCAL_COUNTERS,
+		.input		= input_action_end_map,
+	},
 
 };
 
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index a275ed584026..4fbb1eff79f8 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -90,6 +90,7 @@ TEST_PROGS := \
 	srv6_end_dx4_netfilter_test.sh \
 	srv6_end_dx6_netfilter_test.sh \
 	srv6_end_flavors_test.sh \
+	srv6_end_map_test.sh \
 	srv6_end_next_csid_l3vpn_test.sh \
 	srv6_end_x_next_csid_l3vpn_test.sh \
 	srv6_hencap_red_l3vpn_test.sh \
diff --git a/tools/testing/selftests/net/srv6_end_map_test.sh b/tools/testing/selftests/net/srv6_end_map_test.sh
new file mode 100755
index 000000000000..7ee54b4cc97f
--- /dev/null
+++ b/tools/testing/selftests/net/srv6_end_map_test.sh
@@ -0,0 +1,103 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# shellcheck disable=SC2034,SC2154
+#
+# Selftest for the SRv6 End.MAP behavior (RFC 9433 Section 6.2).
+#
+#   +--------+   2001:db8:1::/64   +--------+   2001:db8:2::/64   +--------+
+#   | srupf1 | ------------------- | srupf2 | ------------------- | srupf3 |
+#   +--------+       veth-1        +--------+       veth-2        +--------+
+#                                (intermediate
+#                                 SRv6-aware UPF,
+#                                 End.MAP)
+#
+# All three netns are SRv6-aware UPFs in the RFC 9433 sense (not
+# 3GPP UPFs).  Per RFC 9433 Section 6.2 End.MAP is used by the
+# intermediate UPF (here srupf2): srupf2 has an End.MAP SID for
+# locator 2001:db8:f::/64 mapping to the new SID 2001:db8:2::e.
+# srupf1 sends an IPv6 packet to 2001:db8:f::1; on srupf3 the
+# destination address is expected to have been replaced by
+# 2001:db8:2::e.
+
+source lib.sh
+
+readonly TIMEOUT=4
+
+cleanup()
+{
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+setup()
+{
+	setup_ns srupf1 srupf2 srupf3
+
+	ip -n "$srupf1" link set lo up
+	ip -n "$srupf2" link set lo up
+	ip -n "$srupf3" link set lo up
+
+	ip link add veth-1 netns "$srupf1" type veth peer name veth-1-srupf2 \
+		netns "$srupf2"
+	ip -n "$srupf1" addr add 2001:db8:1::1/64 dev veth-1 nodad
+	ip -n "$srupf2" addr add 2001:db8:1::2/64 dev veth-1-srupf2 nodad
+	ip -n "$srupf1" link set veth-1 up
+	ip -n "$srupf2" link set veth-1-srupf2 up
+
+	ip link add veth-2 netns "$srupf2" type veth peer name veth-2-srupf3 \
+		netns "$srupf3"
+	ip -n "$srupf2" addr add 2001:db8:2::1/64 dev veth-2 nodad
+	ip -n "$srupf3" addr add 2001:db8:2::e/64 dev veth-2-srupf3 nodad
+	ip -n "$srupf2" link set veth-2 up
+	ip -n "$srupf3" link set veth-2-srupf3 up
+
+	ip netns exec "$srupf2" sysctl -wq net.ipv6.conf.all.forwarding=1
+
+	ip -n "$srupf1" -6 route add 2001:db8:f::/64 via 2001:db8:1::2
+
+	ip -n "$srupf2" -6 route add 2001:db8:f::/64 \
+		encap seg6local action End.MAP nh6 2001:db8:2::e \
+		dev veth-2
+
+	# allow srupf3 to reply back to srupf1
+	ip -n "$srupf3" -6 route add 2001:db8:1::/64 via 2001:db8:2::1
+}
+
+check_dependencies()
+{
+	if ! command -v ping >/dev/null; then
+		echo "SKIP: ping is required"; exit "$ksft_skip"
+	fi
+
+	if ! ip route help 2>&1 | grep -qF "End.MAP"; then
+		echo "SKIP: iproute2 too old, missing seg6local action End.MAP"
+		exit "$ksft_skip"
+	fi
+}
+
+run_test()
+{
+	# srupf3 replies to ICMPv6 echo on 2001:db8:2::e, so a successful
+	# ping from srupf1 to the End.MAP SID demonstrates that the action
+	# replaced the destination address with 2001:db8:2::e.
+	if ! ip netns exec "$srupf1" ping -6 -c 1 -W "$TIMEOUT" \
+			2001:db8:f::1 >/dev/null 2>&1; then
+		return 1
+	fi
+	return 0
+}
+
+main()
+{
+	check_dependencies
+	setup
+
+	if run_test; then
+		echo "TEST: End.MAP [PASS]"; exit "$ksft_pass"
+	else
+		echo "TEST: End.MAP [FAIL]"; exit "$ksft_fail"
+	fi
+}
+
+main "$@"

-- 
2.50.1

