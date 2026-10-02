Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B3139022A
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944287; cv=none; b=Q8b4scLUS2HF5KcHmNwgVXXyje/Axi76CN9thgzDXhzFnTkFzekThUb92aklRmE/v11/WJ6yDoISqCL9KsYCWheOoXFdFONW2P+4yWoyhE4Bd+PCDC5O2GTfeLVMQH6c+YPMP3vyRT0OJGpY/PQAoZ6+tFPVXFYs2fsHwuIwwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944287; c=relaxed/simple;
	bh=yEKSdvYiUQnk2OPWfSThF5HFZhlH1p49IlTTEPxIgxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqaxzJx2XboicFrXkO046VgQ2WfkHTCsUrxNKp3wKRdxL64Uj5nmymMpUMDqNJ7KB42byTkYXzwMKv4wTbD3BboALDmMtubcbnqCqUpDYqWJxnxwV5y0l51bVR21aPwwAIC65YgbJGNhefVui4lBOMtyMJIA7s/DbUq/oHgj6rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OowCOqPu; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OowCOqPu"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d9fdf798so15897495ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790944285; x=1791549085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v5ii6TfP9FO3+IPzpTmqGqHl9/teaNXkGBFJeS5lsU=;
        b=OowCOqPuFuc6kSGycRmCtSGdavj100/qgADyvUXRL/gAzOJHUPAy8cAjueOSJx6rH0
         spWvCkvyCoPvSnYOevXpg/ZO31pEDXjlS5fvpMt9r9G6I0GPP+N/Ov7feKXneSf9EFdQ
         u+PTL7AP4yWEnId0fpl73Wt+AG41x+hVkjT9B6P+153PGP+G9QqUTS9OLvzSYdjFqlui
         TFE3Eis+BsTN3noLMixE9MgjLKNHUlC2zQ1NZTFiY0ixJw5mhDawC+CdLu0KwoZF2luy
         Zc7Q+TvXZ1qmcvirsAIaoqQFfRKIANedjC+FGw60sXSHDC7XvyHhyqBJWanIIv6jurzi
         DSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944285; x=1791549085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v5ii6TfP9FO3+IPzpTmqGqHl9/teaNXkGBFJeS5lsU=;
        b=SRGVv11mQfOxGXj4kH2eodLEeliDV6EzwlKq4dnV61VOU4BW8tLpfw/UJaNmDa1oTd
         ItT2flFchS75cKh7t2scHXlItHKITBSdOnIqBCg9EmLOAI+yLVoPGiotaSrK0d6/FQF2
         HvrPXtwH2zfIZBwxeJH6BTfx6WnT4pDwL84ODulKTJoteFnYJrot1J5YnQ1vb7AyXUMt
         dFf5fWsAgNxKqw1SoTg1tICvWwOgP/eBNB9Nl8JzGDhM+elH3asLS3Mf/D9hCURyn0Iz
         mE48jBn5+OYT8+v0bDAzbogAJFcPiqzlH/XowIem74O+stjmWcqktEBz0NArl56Qsnhd
         suqA==
X-Forwarded-Encrypted: i=1; AKwUvBxqKr5gkIgLtWPO1Zn2vJGocyTrKLSUp6hb0cjftTZVtel2ufJlJK7PmELql3BhJh6qEJRTqa/AqYV5Rs+rysY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWswPtINIwarL1lyL+zEdj+PsHfHrxZR4nPOYGXjASpft2Hr97
	mSNGI7mzBTzriynpfeo5qawY6/ngr48Pc8zD/DNkH99tdwSY8qzYpZ4L
X-Gm-Gg: AYBFou0pXWvuFDyVBpkZbYoorpFcdFX4mBzNC4K9LBPIXAKrwWUkENJAgBXIgp26izd
	iBHBYf4vqeQkd+eddfXW2u65fBN9pwKDTeA3Cci5UJ+ALwQziFhnIwNJDcZKpmV+ar0ESOvRdX4
	gRbxYL9xkKFiUrThp53nN4GxJgKuhbApm7NiBpgNv55X/O9L8XpXEdmS/Zf1JbYDOMdajAQupQj
	QWjsqvQLNx6mE07M0Sbw2H8zl3gzSscsDWl5NuJ9f4287XNGv3khpL0KLqjN5Yxp/CVFJOGLesQ
	xmNyIu+yUw4Iu4ym8OtHg6GLmLLMoT92Ufnh5BRbnhefLNURyO6XTHlr8vfDBjhnBWaWSuARGdo
	PELFmBgnXlYSpvaJA1g0NwLbQ88K50zLppzgQdMpVbcGBE+hJaoR3nTkxdo+w5tDmWcSMH06u2z
	K64KqyC1ONkVR2d+Lf/42NkTxzcIn+Z/4ztqUXdwSvOnRtZOsyjlSx5RuEDGQa/R24q02WK2/+i
	LsN8Yfg
X-Received: by 2002:a17:903:1b06:b0:2e2:de8e:7315 with SMTP id d9443c01a7336-2e49b6a0c59mr23651015ad.38.1790944284835;
        Fri, 02 Oct 2026 05:31:24 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f705f37sm6938125ad.64.2026.10.02.05.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:31:24 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Fri, 02 Oct 2026 21:31:17 +0900
Subject: [PATCH RFC net-next v5 1/2] seg6: add support for the SRv6 End.MAP
 behavior
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-seg6-mobile-end-map-v5-1-30eec37563a8@gmail.com>
References: <20261002-seg6-mobile-end-map-v5-0-30eec37563a8@gmail.com>
In-Reply-To: <20261002-seg6-mobile-end-map-v5-0-30eec37563a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=27295;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=yEKSdvYiUQnk2OPWfSThF5HFZhlH1p49IlTTEPxIgxs=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqv6QWPM8tq7/FmOFHVermLqE6t1NcXELUQDP2y
 SHBCZep8QOJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCar+kFgAKCRAq19F1Kl0b
 TQ+OEADG+ypG4zUACi8cv3Qk91F2HArEYb77Q7mJxDUXUb/sRlkXQvNqSInR4o9QU82oTZv3BGy
 ccEmp2hF0+2qabSps8YfhGlwbyjdQQAnZknA4N+YoXRer3bWbcnhjh1wnHQO3pLoNiJCvIgo6Kk
 5zCmuuDZCQS8M/ISj7SnfaAz99AsTR4R5ErtqhFH7KGTeYiWqoLdYk80HAZTUiT9+kCrQCmppXK
 EJ0bbJl1BXdtxpRKIsZe367iu3EH0BrrasG4VUfGvQu6+suUB1vO13GjSnmIaDmYWWRqkBt+DxI
 MutFWo9EH2KriN5FZfEu+ty0mwZlUSY00/oMi4EAzMfkzGwGGGwpvMuXV4a9Bkj19Msq3UriXEr
 iTnxEfyNnUw2+6tjKGBrOmVkzziVwzEz15C7QlmXCixtMxzLacomMSVgD9rAQ1p0vZCzr+RLj+b
 hSlRlr9Ykq2YxRZvO6kL5wxObiXbkSQYf7S+juxV1d3CDEYZRipTPV12CwNGylteetFLHwsF1A8
 JMhwKBw9NWvA8tbZFgUu3H4eJzmIrQinl0RLRoT0JlWnV4+lLj4azxUbE6HsvTHhbjU0xFjoQaj
 BW19ll7LikfJkDgFY1aax5/TkCnO6ByOeZHvttvGb1T6msx0OU52d2TRw/Sd6o1A4ZEr05yMId3
 bJVaoQE9y2U9+Qw==
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

Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 include/net/seg6.h               |   8 +
 include/uapi/linux/lwtunnel.h    |   1 +
 include/uapi/linux/seg6_mobile.h |  61 ++++
 net/core/lwtunnel.c              |   2 +
 net/ipv6/Kconfig                 |  10 +
 net/ipv6/Makefile                |   1 +
 net/ipv6/seg6.c                  |   7 +
 net/ipv6/seg6_mobile.c           | 723 +++++++++++++++++++++++++++++++++++++++
 8 files changed, 813 insertions(+)

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
index 8c2b156c227a..c7f71174b6d0 100644
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
index 000000000000..8a228f44d1e2
--- /dev/null
+++ b/net/ipv6/seg6_mobile.c
@@ -0,0 +1,723 @@
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
+	struct ipv6_rt_hdr _rh, *rh;
+	struct ipv6_sr_hdr *srh;
+	unsigned int srhoff = 0;
+	int hdr_proto;
+	int flags = 0;
+
+	srh = seg6_get_srh(skb, 0);
+	if (srh) {
+#ifdef CONFIG_IPV6_SEG6_HMAC
+		if (!seg6_hmac_validate_skb(skb, srh)) {
+			*state = SEG6_MOBILE_SRH_MALFORMED;
+			return NULL;
+		}
+#endif
+		*state = SEG6_MOBILE_SRH_PRESENT;
+		return srh;
+	}
+
+	hdr_proto = ipv6_find_hdr(skb, &srhoff, IPPROTO_ROUTING, NULL, &flags);
+	if (hdr_proto == -ENOENT) {
+		*state = SEG6_MOBILE_SRH_ABSENT;
+		return NULL;
+	}
+
+	/* RFC 8200 Section 4.4: an unrecognized Routing Type with Segments
+	 * Left 0 is ignored
+	 */
+	rh = hdr_proto == IPPROTO_ROUTING ?
+	     skb_header_pointer(skb, srhoff, sizeof(_rh), &_rh) : NULL;
+	if (rh && rh->type != IPV6_SRCRT_TYPE_4 && !rh->segments_left)
+		*state = SEG6_MOBILE_SRH_ABSENT;
+	else
+		*state = SEG6_MOBILE_SRH_MALFORMED;
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
+		/* zero UDPv6 checksum on a non-offloaded skb means "none" */
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
+static enum skb_drop_reason
+seg6_mobile_advance_da(struct sk_buff *skb, const struct in6_addr *nh,
+		       bool srh_present)
+{
+	int l4_off = 0, l4_hlen = 0;
+	unsigned int nonext_off = 0;
+	struct in6_addr old_da;
+	struct ipv6hdr *ip6h;
+	__be16 frag_off;
+	u8 nexthdr = 0;
+	__sum16 *csum;
+	int write_len;
+
+	if (!pskb_may_pull(skb, sizeof(*ip6h)))
+		return SKB_DROP_REASON_NOT_SPECIFIED;
+
+	ip6h = ipv6_hdr(skb);
+	write_len = sizeof(*ip6h);
+
+	if (!srh_present) {
+		nexthdr = ip6h->nexthdr;
+		l4_off = ipv6_skip_exthdr(skb, sizeof(*ip6h), &nexthdr,
+					  &frag_off);
+		/* a chain ending in No Next Header has no L4 checksum */
+		if (l4_off < 0 &&
+		    ipv6_find_hdr(skb, &nonext_off, NEXTHDR_NONE, NULL,
+				  NULL) != NEXTHDR_NONE)
+			return SKB_DROP_REASON_NOT_SPECIFIED;
+
+		/* only the first fragment carries the L4 header; frag_off
+		 * is the raw field, M flag included
+		 */
+		if (l4_off >= 0 && !(frag_off & htons(IP6_OFFSET)))
+			l4_hlen = seg6_mobile_l4_csum_hlen(nexthdr);
+		if (l4_hlen)
+			write_len = l4_off + l4_hlen;
+	}
+
+	if (skb_ensure_writable(skb, write_len))
+		return SKB_DROP_REASON_NOMEM;
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
+	return SKB_NOT_DROPPED_YET;
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
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
+	enum seg6_mobile_srh_state srh_state;
+	struct ipv6_sr_hdr *srh;
+
+	srh = seg6_mobile_get_and_validate_srh(skb, &srh_state);
+	if (srh_state == SEG6_MOBILE_SRH_MALFORMED)
+		goto drop;
+
+	/* SL == 0: SRH spent, L4 is verified against the new DA */
+	reason = seg6_mobile_advance_da(skb, &slwt->mapped_sid,
+					srh && srh->segments_left);
+	if (reason)
+		goto drop;
+
+	return seg6_mobile_forward(skb);
+
+drop:
+	kfree_skb_reason(skb, reason);
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
+static int cmp_nla_mapped_sid(struct seg6_mobile_lwt *a,
+			      struct seg6_mobile_lwt *b)
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
+	[SEG6_MOBILE_MAPPED_SID]	=
+		NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
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

