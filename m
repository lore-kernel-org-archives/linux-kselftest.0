Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2F483804
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 21:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594712; cv=none; b=EojQePfJjHzDWrC/DoJtWj64E6VdvkcSrpIpkK1L0UXr1TBze92HY1x4xkyqmYVuEPV6I0Tq46n8BXCodKfg3C50i7dmVWd1PCHR9GB0sQt22owRHBErtTM2n3aRutsovE5YGUPlFjn6oko7kVf6Rtt7/AaGu2NhjIRZliL3/mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594712; c=relaxed/simple;
	bh=N92N9Soqsgy3ljnBeZT7dPYB/IKeBHlbbZ9u5e24XtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fx8XKKuhyhhcf18QVFZqaJRYTl0wlJkskxl2z8KLz8LdeaIcySHM3mEkGiUeVBIE+x1oc9rs3o08qvE6x/9nzbwnltgPNSMJPtJJ4yZOqXrVEbfiqzx6OJw9wE9MN7UJ4mAikcscxvY5/WkkUkyFUsOzdiN06tpqhcQJLcRX1b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZPYkm5m; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZPYkm5m"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso126914a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 14:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789594702; x=1790199502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6nLWrSoP2nchYc66LNz6+l7g8MGnIRoZZkPmGmB13k=;
        b=rZPYkm5m9x2ktHKty7NqVhrYq6fgvTcAQ3pELF15yfrJDHUmFJe2l8fOEkjcgBIZEF
         Y22/xmMHGQD1NK2vVgzeD7Olbayph8FFbZ/SIkX21Z3ewOf/XEEcLjQqo3VVLIqrrcUp
         rmfj8ZUR5eoPGamZOg5ZSpmXflIFXK4KnIEVU3/I2ifZzGId0pV7y+X8U8fs6sJAto/h
         YY3uNK59VDWmWsjokKCi3TFiaPqQf2YnrVg/aHrUu4Z6cWCK/karrsh7F+eaCq8SxLRI
         YYWx9ClmigWMDwWXJR17Haw7+JAAitSqMMlPBAfuwpuFKCdu2HEXkO52nq1KOG1ka1SX
         hZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789594702; x=1790199502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6nLWrSoP2nchYc66LNz6+l7g8MGnIRoZZkPmGmB13k=;
        b=lKOj15Db9g9aI24EsfFlu8+bQY+hM5iT9CxmYoUEwjaoXbAZsVMLCUBbBYn5JN2X07
         3Io3incArMiDGDfworEeBTkn01ARyJEGNWwaVC4YeNZVpGEbkmaP38zUCzuGI4QBRhdz
         JrnLyFTPJW3NqU2Fn6QocltsYz0A9jvOyWK4dkb9HwuuBGVlu6QAATFzcoj5p73uDWL9
         bbg/22hLizKSozdVjXzqJt/PB81/8TM9gGXjx9+1M2WPhNwbKzE5Nfc+eZRBSLto9Atl
         3+Cvnw+RaP6j9psi+3AIDuMUQa3xgYicdTEMdC8G8cn+Js/NiYw2DnQ2Zi7e6XzcYbo9
         1pDA==
X-Forwarded-Encrypted: i=1; AKwUvBwak3SmiigVeD9XeCWpTlq+PhNwqDeU8LbLBWKHFTN9LdAd3/lP/C926oRBxQNzPMaqIqk8p7TvMQMbm48h6Hk=@vger.kernel.org
X-Gm-Message-State: AFuF++lqXVDY/p6hMQuRZdOisxXBGQaA/mLRbxmd4g1dMklCZifTMucQ
	TO7pzZJmzkCHOyFytt29whjyZ4hGkKaBwx6XHAGHgMMU5gwsPfsVCUh3
X-Gm-Gg: AYBFou07l00bHQpQl7lBeLYs2wq4sjyTSHBmYH5vkGvg5QkdEOt97H+oUShhtbE4xOR
	ZoYOL467BuKf79wRp8c0Nigqr5m9ZoyocS9u6eZF7lbJQgEs7AGF7lTIwfcUGib6N9CMb60yr/M
	eCr/XFTsJe3cTrY6E/LYgF8T3ePHyl4fHzTZ3IM44TbU28Jes7Nog+AcrNTrZ9Xf2lwg4L5qVl7
	sgthxlmrxtyq2nECHcC3v23OntN63TcHwfpW2KfP4qOotZlsLsUCYUrDi6DJNW0mZ88oFZIPjVv
	4jngHIwejlkX7yK3lbxjUCmvJYVuz4Or9AKGNIzth6cPmLakf+DnG126waZWt1PR4/cbeZxC6lU
	rZ1PqcqayPOXjYbBdvfLdnzVEk1y8EsowzShbaYNDu9Z1T9lpXab+zRlx4sU4wai4lhV5t6xQBi
	ngm5PKSpXlQqvfJwmUAZX7WvVKNAp4li6zgkkrm++AsPIw40f9Pt4u2xEG+z67w/6grR90prYoJ
	K1Y3C1QhOI=
X-Received: by 2002:a17:90a:e18e:b0:39e:ac:b776 with SMTP id 98e67ed59e1d1-39e1e5187b4mr8796340a91.25.1789594702392;
        Wed, 16 Sep 2026 14:38:22 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9f81asm1379913a91.3.2026.09.16.14.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:38:20 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Thu, 17 Sep 2026 06:38:12 +0900
Subject: [PATCH RFC net-next v3 1/2] seg6: add support for the SRv6 End.MAP
 behavior
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-seg6-mobile-end-map-v3-1-9890a60ac6a7@gmail.com>
References: <20260917-seg6-mobile-end-map-v3-0-9890a60ac6a7@gmail.com>
In-Reply-To: <20260917-seg6-mobile-end-map-v3-0-9890a60ac6a7@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Justin Iurman <justin.iurman@gmail.com>, 
 Florian Westphal <fw@strlen.de>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=26518;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=N92N9Soqsgy3ljnBeZT7dPYB/IKeBHlbbZ9u5e24XtI=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqqwxFgUclwbWvzdbdlOF7JJLUZ8Wjq7FaQ6R46
 7PvE/Mzv3CJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCaqsMRQAKCRAq19F1Kl0b
 TSF7EAC/WfOeJLeYetJQSGOAoM7fi5YwTlEwm7mKKkjU5drHsMQVK3nbMq/hKQJ7BRUcfk1+LW6
 RVt78gqNMJyCWAaGJqbJLqR1xX6b5+s8JRqoJvLEfwl/U1SGRWiKD9AL7RlXSS4wBE/wRzvcEGk
 qe9vNAZjBfRrKdydCwfWDSWYM/DIfIJANtqBdpbQ+P2G7HCfO8/3rPL0G+nfaAvHbqyvQcBvO6U
 VwHo/mped/7edv+rua0twAzJHFU9xwWgeUmLMf/uGGPBug7tz/BTUu4/mIuBtulWNX3lPqY4IvU
 5MYa8aUh+FqZ5wbYzdaaBXwtKZL82ie8NGYNFw+OQHFZj88Hflz4XVXba/VNb8W4a3OJpOp/Skv
 WvON2z7a9iKZcl2pzDkWMbZjixTXGGpBfLQYLunNTCx51IhhVloYgrjiHp5uAppg/2TzdqNXpVh
 tlz/gS21IAm9BT7iCSmlPLjXdgaAq+VGZJwjVGOM0xy1bCnbEmYOa16l5UMbjGWVeGfESBAZ/pF
 bAAnVl9bXN4XfSWPEXJT4j1CZzZp82PC5seTaHpXnPd11209OzNqk0LnjtEDOESs3WkENwQDp/q
 mM1kCPTX2Bb4UjGNXonVfCG1UZjYnBNJqP0zfCYlWuPiEqvtRQpnfFsF1iRUgjSITfG5v6MgdWn
 00p2aPofb5DeJZw==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

SRv6 End.MAP is defined in RFC 9433 [1].

The SRv6 End.MAP is an SRv6 endpoint that replaces the IPv6
destination address with the configured mapped SID and forwards the
packet via the IPv6 FIB without consuming the SRH.

The SRv6 End.MAP Linux implementation is the first behavior of the
SRv6 Mobile User Plane and introduces a dedicated
LWTUNNEL_ENCAP_SEG6_MOBILE encap type, a CONFIG_IPV6_SEG6_MOBILE
build option and a net/ipv6/seg6_mobile.c file that hosts the
action dispatch table.  The user-space ABI lives in
include/uapi/linux/seg6_mobile.h under a SEG6_MOBILE_* namespace,
kept separate from SEG6_LOCAL_* so that attributes whose semantics
differ between behaviors do not overload the same UAPI table.

The SRv6 End.MAP behavior can be instantiated using a command
similar to the following:

 $ ip -6 route add 2001:db8:f::/64 encap seg6mobile action End.MAP \
     mapped_sid 2001:db8:2::e dev eth0

We introduce the "seg6mobile" extension in iproute2 in a following
patch.

[1] https://www.rfc-editor.org/rfc/rfc9433.html

Assisted-by: Claude:claude-fable-5
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 include/net/seg6.h               |   8 +
 include/uapi/linux/lwtunnel.h    |   1 +
 include/uapi/linux/seg6_mobile.h |  61 ++++
 net/core/lwtunnel.c              |   2 +
 net/ipv6/Kconfig                 |  10 +
 net/ipv6/Makefile                |   1 +
 net/ipv6/seg6.c                  |   7 +
 net/ipv6/seg6_mobile.c           | 701 +++++++++++++++++++++++++++++++++++++++
 8 files changed, 791 insertions(+)

diff --git a/include/net/seg6.h b/include/net/seg6.h
index 82b3fbbcbb93..789e9bcc4773 100644
--- a/include/net/seg6.h
+++ b/include/net/seg6.h
@@ -64,6 +64,14 @@ static inline int seg6_local_init(void) { return 0; }
 static inline void seg6_local_exit(void) {}
 #endif
 
+#ifdef CONFIG_IPV6_SEG6_MOBILE
+extern int seg6_mobile_init(void);
+extern void seg6_mobile_exit(void);
+#else
+static inline int seg6_mobile_init(void) { return 0; }
+static inline void seg6_mobile_exit(void) {}
+#endif
+
 extern bool seg6_validate_srh(struct ipv6_sr_hdr *srh, int len, bool reduced);
 extern struct ipv6_sr_hdr *seg6_get_srh(struct sk_buff *skb, int flags);
 extern void seg6_icmp_srh(struct sk_buff *skb, struct inet6_skb_parm *opt);
diff --git a/include/uapi/linux/lwtunnel.h b/include/uapi/linux/lwtunnel.h
index 229655ef792f..6e48f79c548e 100644
--- a/include/uapi/linux/lwtunnel.h
+++ b/include/uapi/linux/lwtunnel.h
@@ -16,6 +16,7 @@ enum lwtunnel_encap_types {
 	LWTUNNEL_ENCAP_RPL,
 	LWTUNNEL_ENCAP_IOAM6,
 	LWTUNNEL_ENCAP_XFRM,
+	LWTUNNEL_ENCAP_SEG6_MOBILE,
 	__LWTUNNEL_ENCAP_MAX,
 };
 
diff --git a/include/uapi/linux/seg6_mobile.h b/include/uapi/linux/seg6_mobile.h
new file mode 100644
index 000000000000..068ab91b2873
--- /dev/null
+++ b/include/uapi/linux/seg6_mobile.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ *  SRv6 Mobile User Plane implementation
+ *
+ *  Author:
+ *  Yuya Kusakabe <yuya.kusakabe@gmail.com>
+ */
+#ifndef _UAPI_LINUX_SEG6_MOBILE_H
+#define _UAPI_LINUX_SEG6_MOBILE_H
+
+enum {
+	SEG6_MOBILE_UNSPEC,
+	SEG6_MOBILE_ACTION,
+	SEG6_MOBILE_MAPPED_SID,
+	SEG6_MOBILE_COUNTERS,
+	__SEG6_MOBILE_MAX,
+};
+
+#define SEG6_MOBILE_MAX	(__SEG6_MOBILE_MAX - 1)
+
+enum {
+	SEG6_MOBILE_ACTION_UNSPEC	= 0,
+	/* swap IPv6 DA with the mapped SID, leave SRH untouched */
+	SEG6_MOBILE_ACTION_END_MAP	= 1,
+
+	__SEG6_MOBILE_ACTION_MAX,
+};
+
+#define SEG6_MOBILE_ACTION_MAX	(__SEG6_MOBILE_ACTION_MAX - 1)
+
+/* SRv6 Mobile Behavior counters are encoded as netlink attributes
+ * guaranteeing the correct alignment.
+ * Each counter is identified by a different attribute type (i.e.
+ * SEG6_MOBILE_CNT_PACKETS).
+ *
+ * - SEG6_MOBILE_CNT_PACKETS: identifies a counter that counts the number
+ *   of packets that have been CORRECTLY processed by an SRv6 Behavior
+ *   instance (i.e., packets that generate errors or are dropped are NOT
+ *   counted).
+ *
+ * - SEG6_MOBILE_CNT_BYTES: identifies a counter that counts the total
+ *   amount of traffic in bytes of all packets that have been CORRECTLY
+ *   processed by an SRv6 Behavior instance (i.e., packets that generate
+ *   errors or are dropped are NOT counted).
+ *
+ * - SEG6_MOBILE_CNT_ERRORS: identifies a counter that counts the number
+ *   of packets that have NOT been properly processed by an SRv6 Behavior
+ *   instance (i.e., packets that generate errors or are dropped).
+ */
+enum {
+	SEG6_MOBILE_CNT_UNSPEC,
+	SEG6_MOBILE_CNT_PACKETS,
+	SEG6_MOBILE_CNT_BYTES,
+	SEG6_MOBILE_CNT_ERRORS,
+	SEG6_MOBILE_CNT_PAD,		/* pad for 64 bits values */
+	__SEG6_MOBILE_CNT_MAX,
+};
+
+#define SEG6_MOBILE_CNT_MAX	(__SEG6_MOBILE_CNT_MAX - 1)
+
+#endif /* _UAPI_LINUX_SEG6_MOBILE_H */
diff --git a/net/core/lwtunnel.c b/net/core/lwtunnel.c
index b01a395d9a96..4476293ccb37 100644
--- a/net/core/lwtunnel.c
+++ b/net/core/lwtunnel.c
@@ -53,6 +53,8 @@ static const char *lwtunnel_encap_str(enum lwtunnel_encap_types encap_type)
 	case LWTUNNEL_ENCAP_XFRM:
 		/* module autoload not supported for encap type */
 		return NULL;
+	case LWTUNNEL_ENCAP_SEG6_MOBILE:
+		return "SEG6MOBILE";
 	case LWTUNNEL_ENCAP_IP6:
 	case LWTUNNEL_ENCAP_IP:
 	case LWTUNNEL_ENCAP_NONE:
diff --git a/net/ipv6/Kconfig b/net/ipv6/Kconfig
index c3806c6ac96f..e094b835a118 100644
--- a/net/ipv6/Kconfig
+++ b/net/ipv6/Kconfig
@@ -314,6 +314,16 @@ config IPV6_SEG6_BPF
 	depends on IPV6_SEG6_LWTUNNEL
 	depends on IPV6 = y
 
+config IPV6_SEG6_MOBILE
+	bool "IPv6: SRv6 Mobile User Plane (RFC 9433) behaviors"
+	depends on IPV6_SEG6_LWTUNNEL
+	help
+	  Support for the SRv6 Mobile User Plane behaviors defined by
+	  RFC 9433, exposed via the LWTUNNEL_ENCAP_SEG6_MOBILE lightweight
+	  tunnel encapsulation.
+
+	  If unsure, say N.
+
 config IPV6_RPL_LWTUNNEL
 	bool "IPv6: RPL Source Routing Header support"
 	depends on IPV6
diff --git a/net/ipv6/Makefile b/net/ipv6/Makefile
index cf5e01f83ce3..95961f180439 100644
--- a/net/ipv6/Makefile
+++ b/net/ipv6/Makefile
@@ -24,6 +24,7 @@ ipv6-$(CONFIG_SYN_COOKIES) += syncookies.o
 ipv6-$(CONFIG_NETLABEL) += calipso.o
 ipv6-$(CONFIG_IPV6_SEG6_LWTUNNEL) += seg6_iptunnel.o seg6_local.o
 ipv6-$(CONFIG_IPV6_SEG6_HMAC) += seg6_hmac.o
+ipv6-$(CONFIG_IPV6_SEG6_MOBILE) += seg6_mobile.o
 ipv6-$(CONFIG_IPV6_RPL_LWTUNNEL) += rpl_iptunnel.o
 ipv6-$(CONFIG_IPV6_IOAM6_LWTUNNEL) += ioam6_iptunnel.o
 
diff --git a/net/ipv6/seg6.c b/net/ipv6/seg6.c
index 62a7eb779202..14626b15abd5 100644
--- a/net/ipv6/seg6.c
+++ b/net/ipv6/seg6.c
@@ -525,10 +525,16 @@ int __init seg6_init(void)
 	if (err)
 		goto out_unregister_iptun;
 
+	err = seg6_mobile_init();
+	if (err)
+		goto out_unregister_local;
+
 	pr_info("Segment Routing with IPv6\n");
 
 out:
 	return err;
+out_unregister_local:
+	seg6_local_exit();
 out_unregister_iptun:
 	seg6_iptunnel_exit();
 out_unregister_genl:
@@ -540,6 +546,7 @@ int __init seg6_init(void)
 
 void seg6_exit(void)
 {
+	seg6_mobile_exit();
 	seg6_local_exit();
 	seg6_iptunnel_exit();
 	genl_unregister_family(&seg6_genl_family);
diff --git a/net/ipv6/seg6_mobile.c b/net/ipv6/seg6_mobile.c
new file mode 100644
index 000000000000..f3757ab45848
--- /dev/null
+++ b/net/ipv6/seg6_mobile.c
@@ -0,0 +1,701 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  SRv6 Mobile User Plane implementation
+ *
+ *  Author:
+ *  Yuya Kusakabe <yuya.kusakabe@gmail.com>
+ */
+
+#include <linux/icmpv6.h>
+#include <linux/in6.h>
+#include <linux/ipv6.h>
+#include <linux/module.h>
+#include <linux/skbuff.h>
+#include <linux/tcp.h>
+#include <linux/types.h>
+#include <linux/udp.h>
+#include <net/checksum.h>
+#include <net/ipv6.h>
+#include <net/lwtunnel.h>
+#include <net/seg6.h>
+#ifdef CONFIG_IPV6_SEG6_HMAC
+#include <net/seg6_hmac.h>
+#endif
+#include <uapi/linux/seg6_mobile.h>
+
+#define SEG6_MOBILE_F_ATTR(i)		BIT(i)
+#define SEG6_F_MOBILE_COUNTERS		SEG6_MOBILE_F_ATTR(SEG6_MOBILE_COUNTERS)
+
+struct seg6_mobile_lwt;
+
+struct seg6_mobile_action_desc {
+	int action;
+	unsigned long attrs;
+	unsigned long optattrs;
+	int (*input)(struct sk_buff *skb, struct seg6_mobile_lwt *slwt);
+};
+
+struct seg6_mobile_action_param {
+	int (*parse)(struct nlattr **attrs, struct seg6_mobile_lwt *slwt,
+		     struct netlink_ext_ack *extack);
+	int (*put)(struct sk_buff *skb, struct seg6_mobile_lwt *slwt);
+	int (*cmp)(struct seg6_mobile_lwt *a, struct seg6_mobile_lwt *b);
+
+	/* optional destroy() callback to release resources acquired in
+	 * the corresponding parse() function.
+	 */
+	void (*destroy)(struct seg6_mobile_lwt *slwt);
+};
+
+struct pcpu_seg6_mobile_counters {
+	u64_stats_t packets;
+	u64_stats_t bytes;
+	u64_stats_t errors;
+
+	struct u64_stats_sync syncp;
+};
+
+/* User-space aggregate format for the per-CPU counters.  Kept private
+ * to the kernel; userspace receives the values through SEG6_MOBILE_CNT_*
+ * nested netlink attributes.
+ */
+struct seg6_mobile_counters {
+	__u64 packets;
+	__u64 bytes;
+	__u64 errors;
+};
+
+#define seg6_mobile_alloc_pcpu_counters(__gfp)				\
+	__netdev_alloc_pcpu_stats(struct pcpu_seg6_mobile_counters,	\
+				  ((__gfp) | __GFP_ZERO))
+
+struct seg6_mobile_lwt {
+	int action;
+	struct in6_addr mapped_sid;
+	const struct seg6_mobile_action_desc *desc;
+	struct pcpu_seg6_mobile_counters __percpu *pcpu_counters;
+
+	/* required attrs are tracked by desc->attrs; optional attrs that
+	 * the user actually configured are tracked here so that fill_encap
+	 * / cmp / destroy can iterate only over what was parsed.
+	 */
+	unsigned long parsed_optattrs;
+};
+
+static struct seg6_mobile_lwt *seg6_mobile_lwtunnel(struct lwtunnel_state *lwt)
+{
+	return (struct seg6_mobile_lwt *)lwt->data;
+}
+
+/* ABSENT is told apart from MALFORMED so that a behavior which accepts
+ * SRH-less packets still drops a malformed SRH
+ */
+enum seg6_mobile_srh_state {
+	SEG6_MOBILE_SRH_ABSENT,
+	SEG6_MOBILE_SRH_PRESENT,
+	SEG6_MOBILE_SRH_MALFORMED,
+};
+
+static struct ipv6_sr_hdr *
+seg6_mobile_get_and_validate_srh(struct sk_buff *skb,
+				 enum seg6_mobile_srh_state *state)
+{
+	struct ipv6_sr_hdr *srh;
+	unsigned int srhoff = 0;
+	int hdr_proto;
+	int flags = 0;
+
+	srh = seg6_get_srh(skb, 0);
+	if (srh) {
+#ifdef CONFIG_IPV6_SEG6_HMAC
+		if (!seg6_hmac_validate_skb(skb)) {
+			*state = SEG6_MOBILE_SRH_MALFORMED;
+			return NULL;
+		}
+#endif
+		*state = SEG6_MOBILE_SRH_PRESENT;
+		return srh;
+	}
+
+	hdr_proto = ipv6_find_hdr(skb, &srhoff, IPPROTO_ROUTING, NULL, &flags);
+	*state = hdr_proto == -ENOENT ? SEG6_MOBILE_SRH_ABSENT
+				      : SEG6_MOBILE_SRH_MALFORMED;
+	return NULL;
+}
+
+static int seg6_mobile_l4_csum_hlen(u8 nexthdr)
+{
+	switch (nexthdr) {
+	case IPPROTO_TCP:
+		return sizeof(struct tcphdr);
+	case IPPROTO_UDP:
+		return sizeof(struct udphdr);
+	case IPPROTO_ICMPV6:
+		return sizeof(struct icmp6hdr);
+	}
+	return 0;
+}
+
+static __sum16 *seg6_mobile_l4_csum(struct sk_buff *skb, int l4_off,
+				    u8 nexthdr)
+{
+	switch (nexthdr) {
+	case IPPROTO_TCP:
+		return &((struct tcphdr *)(skb->data + l4_off))->check;
+	case IPPROTO_UDP: {
+		struct udphdr *uh = (struct udphdr *)(skb->data + l4_off);
+
+		/* zero UDPv6 checksum on a non-offloaded skb means "no checksum" */
+		if (!uh->check && skb->ip_summed != CHECKSUM_PARTIAL)
+			return NULL;
+		return &uh->check;
+	}
+	case IPPROTO_ICMPV6:
+		return &((struct icmp6hdr *)(skb->data + l4_off))->icmp6_cksum;
+	}
+	return NULL;
+}
+
+/* rewrite DA; the L4 checksum follows only when the receiver will verify
+ * it against the new DA, i.e. no SRH is left for it to process
+ */
+static int seg6_mobile_advance_da(struct sk_buff *skb,
+				  const struct in6_addr *nh, bool srh_present)
+{
+	int l4_off = 0, l4_hlen = 0;
+	struct in6_addr old_da;
+	struct ipv6hdr *ip6h;
+	__be16 frag_off;
+	u8 nexthdr = 0;
+	__sum16 *csum;
+	int write_len;
+
+	if (!pskb_may_pull(skb, sizeof(*ip6h)))
+		return -EINVAL;
+
+	ip6h = ipv6_hdr(skb);
+	write_len = sizeof(*ip6h);
+
+	if (!srh_present) {
+		nexthdr = ip6h->nexthdr;
+		l4_off = ipv6_skip_exthdr(skb, sizeof(*ip6h), &nexthdr,
+					  &frag_off);
+		if (l4_off < 0)
+			return -EINVAL;
+
+		/* only the first fragment carries the L4 header; frag_off is the
+		 * raw field, M flag included
+		 */
+		if (!(frag_off & htons(IP6_OFFSET)))
+			l4_hlen = seg6_mobile_l4_csum_hlen(nexthdr);
+		if (l4_hlen)
+			write_len = l4_off + l4_hlen;
+	}
+
+	if (skb_ensure_writable(skb, write_len))
+		return -ENOMEM;
+
+	/* skb_ensure_writable() may change skb pointers; evaluate ip6h again */
+	ip6h = ipv6_hdr(skb);
+	old_da = ip6h->daddr;
+
+	csum = l4_hlen ? seg6_mobile_l4_csum(skb, l4_off, nexthdr) : NULL;
+	if (csum) {
+		inet_proto_csum_replace16(csum, skb, old_da.s6_addr32,
+					  nh->s6_addr32, true);
+		if (nexthdr == IPPROTO_UDP && !*csum)
+			*csum = CSUM_MANGLED_0;
+	} else if (skb->ip_summed == CHECKSUM_COMPLETE) {
+		/* no L4 patch, so skb->csum must track the DA change itself */
+		update_csum_diff16(skb, old_da.s6_addr32, (__be32 *)nh);
+	}
+
+	ip6h->daddr = *nh;
+	skb_clear_hash(skb);
+
+	return 0;
+}
+
+static int seg6_mobile_forward(struct sk_buff *skb)
+{
+	seg6_lookup_nexthop(skb, NULL, 0);
+	return dst_input(skb);
+}
+
+/* replace DA with the mapped SID and forward, leaving the SRH untouched */
+static int input_action_end_map(struct sk_buff *skb,
+				struct seg6_mobile_lwt *slwt)
+{
+	enum seg6_mobile_srh_state srh_state;
+	struct ipv6_sr_hdr *srh;
+
+	srh = seg6_mobile_get_and_validate_srh(skb, &srh_state);
+	if (srh_state == SEG6_MOBILE_SRH_MALFORMED)
+		goto drop;
+
+	/* SL == 0: SRH spent, L4 is verified against the new DA */
+	if (seg6_mobile_advance_da(skb, &slwt->mapped_sid,
+				   srh && srh->segments_left))
+		goto drop;
+
+	return seg6_mobile_forward(skb);
+
+drop:
+	kfree_skb(skb);
+	return -EINVAL;
+}
+
+static int parse_nla_mapped_sid(struct nlattr **attrs,
+				struct seg6_mobile_lwt *slwt,
+				struct netlink_ext_ack *extack)
+{
+	memcpy(&slwt->mapped_sid, nla_data(attrs[SEG6_MOBILE_MAPPED_SID]),
+	       sizeof(struct in6_addr));
+
+	return 0;
+}
+
+static int put_nla_mapped_sid(struct sk_buff *skb, struct seg6_mobile_lwt *slwt)
+{
+	if (nla_put_in6_addr(skb, SEG6_MOBILE_MAPPED_SID, &slwt->mapped_sid))
+		return -EMSGSIZE;
+
+	return 0;
+}
+
+static int cmp_nla_mapped_sid(struct seg6_mobile_lwt *a, struct seg6_mobile_lwt *b)
+{
+	return memcmp(&a->mapped_sid, &b->mapped_sid, sizeof(struct in6_addr));
+}
+
+static const struct
+nla_policy seg6_mobile_counters_policy[SEG6_MOBILE_CNT_MAX + 1] = {
+	[SEG6_MOBILE_CNT_PACKETS]	= { .type = NLA_U64 },
+	[SEG6_MOBILE_CNT_BYTES]		= { .type = NLA_U64 },
+	[SEG6_MOBILE_CNT_ERRORS]	= { .type = NLA_U64 },
+};
+
+static int parse_nla_counters(struct nlattr **attrs,
+			      struct seg6_mobile_lwt *slwt,
+			      struct netlink_ext_ack *extack)
+{
+	struct pcpu_seg6_mobile_counters __percpu *pcounters;
+	struct nlattr *tb[SEG6_MOBILE_CNT_MAX + 1];
+	int ret;
+
+	ret = nla_parse_nested(tb, SEG6_MOBILE_CNT_MAX,
+			       attrs[SEG6_MOBILE_COUNTERS],
+			       seg6_mobile_counters_policy, extack);
+	if (ret < 0)
+		return ret;
+
+	/* basic support for SRv6 Behavior counters requires at least:
+	 * packets, bytes and errors.
+	 */
+	if (!tb[SEG6_MOBILE_CNT_PACKETS] || !tb[SEG6_MOBILE_CNT_BYTES] ||
+	    !tb[SEG6_MOBILE_CNT_ERRORS])
+		return -EINVAL;
+
+	/* counters are always zero initialized */
+	pcounters = seg6_mobile_alloc_pcpu_counters(GFP_KERNEL);
+	if (!pcounters)
+		return -ENOMEM;
+
+	slwt->pcpu_counters = pcounters;
+
+	return 0;
+}
+
+static int seg6_mobile_fill_nla_counters(struct sk_buff *skb,
+					 struct seg6_mobile_counters *counters)
+{
+	if (nla_put_u64_64bit(skb, SEG6_MOBILE_CNT_PACKETS, counters->packets,
+			      SEG6_MOBILE_CNT_PAD))
+		return -EMSGSIZE;
+
+	if (nla_put_u64_64bit(skb, SEG6_MOBILE_CNT_BYTES, counters->bytes,
+			      SEG6_MOBILE_CNT_PAD))
+		return -EMSGSIZE;
+
+	if (nla_put_u64_64bit(skb, SEG6_MOBILE_CNT_ERRORS, counters->errors,
+			      SEG6_MOBILE_CNT_PAD))
+		return -EMSGSIZE;
+
+	return 0;
+}
+
+static int put_nla_counters(struct sk_buff *skb, struct seg6_mobile_lwt *slwt)
+{
+	struct seg6_mobile_counters counters = { 0, 0, 0 };
+	struct nlattr *nest;
+	int rc, i;
+
+	nest = nla_nest_start(skb, SEG6_MOBILE_COUNTERS);
+	if (!nest)
+		return -EMSGSIZE;
+
+	for_each_possible_cpu(i) {
+		struct pcpu_seg6_mobile_counters *pcounters;
+		u64 packets, bytes, errors;
+		unsigned int start;
+
+		pcounters = per_cpu_ptr(slwt->pcpu_counters, i);
+		do {
+			start = u64_stats_fetch_begin(&pcounters->syncp);
+
+			packets = u64_stats_read(&pcounters->packets);
+			bytes = u64_stats_read(&pcounters->bytes);
+			errors = u64_stats_read(&pcounters->errors);
+
+		} while (u64_stats_fetch_retry(&pcounters->syncp, start));
+
+		counters.packets += packets;
+		counters.bytes += bytes;
+		counters.errors += errors;
+	}
+
+	rc = seg6_mobile_fill_nla_counters(skb, &counters);
+	if (rc < 0) {
+		nla_nest_cancel(skb, nest);
+		return rc;
+	}
+
+	return nla_nest_end(skb, nest);
+}
+
+static int cmp_nla_counters(struct seg6_mobile_lwt *a,
+			    struct seg6_mobile_lwt *b)
+{
+	/* tunnels with counters enabled and disabled are different. */
+	return (!!((unsigned long)a->pcpu_counters)) ^
+		(!!((unsigned long)b->pcpu_counters));
+}
+
+static void destroy_attr_counters(struct seg6_mobile_lwt *slwt)
+{
+	free_percpu(slwt->pcpu_counters);
+}
+
+static const struct seg6_mobile_action_desc seg6_mobile_action_table[] = {
+	{
+		.action		= SEG6_MOBILE_ACTION_END_MAP,
+		.attrs		= SEG6_MOBILE_F_ATTR(SEG6_MOBILE_MAPPED_SID),
+		.optattrs	= SEG6_F_MOBILE_COUNTERS,
+		.input		= input_action_end_map,
+	},
+};
+
+static const struct seg6_mobile_action_param
+seg6_mobile_action_params[SEG6_MOBILE_MAX + 1] = {
+	[SEG6_MOBILE_MAPPED_SID] = {
+		.parse	= parse_nla_mapped_sid,
+		.put	= put_nla_mapped_sid,
+		.cmp	= cmp_nla_mapped_sid,
+	},
+	[SEG6_MOBILE_COUNTERS] = {
+		.parse		= parse_nla_counters,
+		.put		= put_nla_counters,
+		.cmp		= cmp_nla_counters,
+		.destroy	= destroy_attr_counters,
+	},
+};
+
+static const struct nla_policy
+seg6_mobile_policy[SEG6_MOBILE_MAX + 1] = {
+	[SEG6_MOBILE_ACTION]	= { .type = NLA_U32 },
+	[SEG6_MOBILE_MAPPED_SID]	= NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
+	[SEG6_MOBILE_COUNTERS]	= { .type = NLA_NESTED },
+};
+
+static const struct seg6_mobile_action_desc *
+seg6_mobile_get_action_desc(int action)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(seg6_mobile_action_table); i++) {
+		if (seg6_mobile_action_table[i].action == action)
+			return &seg6_mobile_action_table[i];
+	}
+
+	return NULL;
+}
+
+/* call the destroy() callback (if available) for each set attribute in
+ * @parsed_attrs, starting from the first attribute up to the @max_parsed
+ * (excluded) attribute.
+ */
+static void __destroy_attrs(unsigned long parsed_attrs, int max_parsed,
+			    struct seg6_mobile_lwt *slwt)
+{
+	const struct seg6_mobile_action_param *param;
+	int i;
+
+	for (i = SEG6_MOBILE_ACTION + 1; i < max_parsed; i++) {
+		if (!(parsed_attrs & SEG6_MOBILE_F_ATTR(i)))
+			continue;
+
+		param = &seg6_mobile_action_params[i];
+		if (param->destroy)
+			param->destroy(slwt);
+	}
+}
+
+static void destroy_attrs(struct seg6_mobile_lwt *slwt)
+{
+	unsigned long attrs = slwt->desc->attrs | slwt->parsed_optattrs;
+
+	__destroy_attrs(attrs, SEG6_MOBILE_MAX + 1, slwt);
+}
+
+static int seg6_mobile_parse_attrs(struct nlattr **attrs,
+				   struct seg6_mobile_lwt *slwt,
+				   struct netlink_ext_ack *extack)
+{
+	const struct seg6_mobile_action_param *param;
+	const struct seg6_mobile_action_desc *desc;
+	unsigned long parsed_optattrs = 0;
+	int i, err;
+
+	desc = slwt->desc;
+
+	if (WARN_ON_ONCE(desc->attrs & desc->optattrs))
+		return -EINVAL;
+
+	for (i = SEG6_MOBILE_ACTION + 1; i <= SEG6_MOBILE_MAX; i++) {
+		bool required = desc->attrs & SEG6_MOBILE_F_ATTR(i);
+		bool optional = desc->optattrs & SEG6_MOBILE_F_ATTR(i);
+
+		if (!required && !optional)
+			continue;
+
+		if (required && !attrs[i]) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "missing required attribute");
+			err = -EINVAL;
+			goto err;
+		}
+
+		if (!attrs[i])
+			continue;
+
+		param = &seg6_mobile_action_params[i];
+		err = param->parse(attrs, slwt, extack);
+		if (err < 0)
+			goto err;
+
+		if (optional)
+			parsed_optattrs |= SEG6_MOBILE_F_ATTR(i);
+	}
+
+	slwt->parsed_optattrs = parsed_optattrs;
+
+	return 0;
+
+err:
+	__destroy_attrs(desc->attrs | parsed_optattrs, i, slwt);
+	return err;
+}
+
+static bool seg6_mobile_counters_enabled(struct seg6_mobile_lwt *slwt)
+{
+	return slwt->parsed_optattrs & SEG6_F_MOBILE_COUNTERS;
+}
+
+static void seg6_mobile_update_counters(struct seg6_mobile_lwt *slwt,
+					unsigned int len, int err)
+{
+	struct pcpu_seg6_mobile_counters *pcounters;
+
+	pcounters = this_cpu_ptr(slwt->pcpu_counters);
+	u64_stats_update_begin(&pcounters->syncp);
+
+	if (likely(!err)) {
+		u64_stats_inc(&pcounters->packets);
+		u64_stats_add(&pcounters->bytes, len);
+	} else {
+		u64_stats_inc(&pcounters->errors);
+	}
+
+	u64_stats_update_end(&pcounters->syncp);
+}
+
+static int seg6_mobile_input(struct sk_buff *skb)
+{
+	struct dst_entry *orig_dst = skb_dst(skb);
+	struct seg6_mobile_lwt *slwt;
+	unsigned int len = skb->len;
+	int rc;
+
+	if (skb->protocol != htons(ETH_P_IPV6)) {
+		kfree_skb(skb);
+		return -EINVAL;
+	}
+
+	slwt = seg6_mobile_lwtunnel(orig_dst->lwtstate);
+
+	rc = slwt->desc->input(skb, slwt);
+
+	if (seg6_mobile_counters_enabled(slwt))
+		seg6_mobile_update_counters(slwt, len, rc);
+
+	return rc;
+}
+
+static int seg6_mobile_build_state(struct net *net, struct nlattr *nla,
+				   unsigned int family, const void *cfg,
+				   struct lwtunnel_state **ts,
+				   struct netlink_ext_ack *extack)
+{
+	const struct seg6_mobile_action_desc *desc;
+	struct nlattr *tb[SEG6_MOBILE_MAX + 1];
+	struct lwtunnel_state *newts;
+	struct seg6_mobile_lwt *slwt;
+	int err;
+
+	if (family != AF_INET6)
+		return -EINVAL;
+
+	err = nla_parse_nested(tb, SEG6_MOBILE_MAX, nla,
+			       seg6_mobile_policy, extack);
+	if (err < 0)
+		return err;
+
+	if (!tb[SEG6_MOBILE_ACTION]) {
+		NL_SET_ERR_MSG_MOD(extack, "missing SEG6_MOBILE_ACTION");
+		return -EINVAL;
+	}
+
+	desc = seg6_mobile_get_action_desc(nla_get_u32(tb[SEG6_MOBILE_ACTION]));
+	if (!desc) {
+		NL_SET_ERR_MSG_MOD(extack, "unknown SRv6 Mobile action");
+		return -EOPNOTSUPP;
+	}
+
+	newts = lwtunnel_state_alloc(sizeof(*slwt));
+	if (!newts)
+		return -ENOMEM;
+
+	slwt = seg6_mobile_lwtunnel(newts);
+	slwt->action = desc->action;
+	slwt->desc = desc;
+
+	err = seg6_mobile_parse_attrs(tb, slwt, extack);
+	if (err < 0) {
+		kfree(newts);
+		return err;
+	}
+
+	newts->type = LWTUNNEL_ENCAP_SEG6_MOBILE;
+	newts->flags = LWTUNNEL_STATE_INPUT_REDIRECT;
+
+	*ts = newts;
+
+	return 0;
+}
+
+static void seg6_mobile_destroy_state(struct lwtunnel_state *lwt)
+{
+	destroy_attrs(seg6_mobile_lwtunnel(lwt));
+}
+
+static int seg6_mobile_fill_encap(struct sk_buff *skb,
+				  struct lwtunnel_state *lwt)
+{
+	struct seg6_mobile_lwt *slwt = seg6_mobile_lwtunnel(lwt);
+	const struct seg6_mobile_action_param *param;
+	unsigned long attrs;
+	int i, err;
+
+	if (nla_put_u32(skb, SEG6_MOBILE_ACTION, slwt->action))
+		return -EMSGSIZE;
+
+	attrs = slwt->desc->attrs | slwt->parsed_optattrs;
+	for (i = SEG6_MOBILE_ACTION + 1; i <= SEG6_MOBILE_MAX; i++) {
+		if (!(attrs & SEG6_MOBILE_F_ATTR(i)))
+			continue;
+
+		param = &seg6_mobile_action_params[i];
+		err = param->put(skb, slwt);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static int seg6_mobile_get_encap_size(struct lwtunnel_state *lwt)
+{
+	struct seg6_mobile_lwt *slwt = seg6_mobile_lwtunnel(lwt);
+	unsigned long attrs;
+	int nlsize;
+
+	nlsize = nla_total_size(sizeof(u32)); /* SEG6_MOBILE_ACTION */
+
+	attrs = slwt->desc->attrs | slwt->parsed_optattrs;
+	if (attrs & SEG6_MOBILE_F_ATTR(SEG6_MOBILE_MAPPED_SID))
+		nlsize += nla_total_size(sizeof(struct in6_addr));
+
+	if (attrs & SEG6_F_MOBILE_COUNTERS)
+		nlsize += nla_total_size(0) + /* nest SEG6_MOBILE_COUNTERS */
+			  /* SEG6_MOBILE_CNT_PACKETS */
+			  nla_total_size_64bit(sizeof(__u64)) +
+			  /* SEG6_MOBILE_CNT_BYTES */
+			  nla_total_size_64bit(sizeof(__u64)) +
+			  /* SEG6_MOBILE_CNT_ERRORS */
+			  nla_total_size_64bit(sizeof(__u64));
+
+	return nlsize;
+}
+
+static int seg6_mobile_cmp_encap(struct lwtunnel_state *a,
+				 struct lwtunnel_state *b)
+{
+	struct seg6_mobile_lwt *slwt_a = seg6_mobile_lwtunnel(a);
+	struct seg6_mobile_lwt *slwt_b = seg6_mobile_lwtunnel(b);
+	const struct seg6_mobile_action_param *param;
+	unsigned long attrs_a, attrs_b;
+	int i;
+
+	if (slwt_a->action != slwt_b->action)
+		return 1;
+
+	attrs_a = slwt_a->desc->attrs | slwt_a->parsed_optattrs;
+	attrs_b = slwt_b->desc->attrs | slwt_b->parsed_optattrs;
+
+	if (attrs_a != attrs_b)
+		return 1;
+
+	for (i = SEG6_MOBILE_ACTION + 1; i <= SEG6_MOBILE_MAX; i++) {
+		if (!(attrs_a & SEG6_MOBILE_F_ATTR(i)))
+			continue;
+
+		param = &seg6_mobile_action_params[i];
+		if (param->cmp(slwt_a, slwt_b))
+			return 1;
+	}
+
+	return 0;
+}
+
+static const struct lwtunnel_encap_ops seg6_mobile_ops = {
+	.build_state	= seg6_mobile_build_state,
+	.destroy_state	= seg6_mobile_destroy_state,
+	.input		= seg6_mobile_input,
+	.fill_encap	= seg6_mobile_fill_encap,
+	.get_encap_size	= seg6_mobile_get_encap_size,
+	.cmp_encap	= seg6_mobile_cmp_encap,
+	.owner		= THIS_MODULE,
+};
+
+int __init seg6_mobile_init(void)
+{
+	BUILD_BUG_ON(SEG6_MOBILE_MAX + 1 > BITS_PER_TYPE(unsigned long));
+
+	return lwtunnel_encap_add_ops(&seg6_mobile_ops,
+				      LWTUNNEL_ENCAP_SEG6_MOBILE);
+}
+
+void seg6_mobile_exit(void)
+{
+	lwtunnel_encap_del_ops(&seg6_mobile_ops, LWTUNNEL_ENCAP_SEG6_MOBILE);
+}

-- 
2.50.1

