Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F67A2FE05C
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150616; cv=none; b=kZWQCBCxDIy0CcFTXyW6BPrJzsVuccOFCpi05PfBI862VvXYXkf2xauN//gFAPTYkswGoz4t0c7gkKCawX3oRRrzrO9mZz0BtWwJa57F7qll78YAIcGyvNdoRtcl9CO0s3XtBmAPG/ocGFfYLcCE31pM9IwAejGXTjdXnxv3mk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150616; c=relaxed/simple;
	bh=T0RjTWuQ+2/lL9aoFWrGRiZzgtI2eOK8+W6T0zf9pak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gpugkm6742ftyBIUM1SuRDXmzXyl6Lb3E82IdsO+9xVMcHIj9PpBQhadE54AKRK1ZSkPdH5vLEq2ENS1+BTU3WZwCzqyCPenu1xKaIgh17h33HWx7EXb62GemQ2dBGcpuM9lWqZSCfmz+fTN4wrU+j1HeqIkkpoSzjIPDKUAf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6F7gfOL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6F7gfOL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso131952a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786150614; x=1786755414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/1TzYDcUXNZpa7mQIBzWuP+KknfPHzOJXzXsgHlbeQ=;
        b=f6F7gfOLiiL6pdiBs3AMPsiBuVIyZQlGPVyBZTetDX5rpVdNr/1M1tyghxMs4J9wnq
         oI54r+CtoEMjck1rnojGkFz+7mfkbYNSPD6l+I2uK+sh6SLkIgFUI/YFLTDk/5NSba0Q
         EHhc54tQHztgkAd+sgmGOK4lRMsf1cESS99iGUOcPYva7o3waCw3w56ELAe77uvnk/Pk
         jWGrPcu2BPMwexu7xQ9oEzBgxGPh2CEej5sS3pD1Xdshlc4XAhca87ihaM1TOiV8R3Su
         Z0mtF/1esEH4VA54af8xCkFVcVHgPmk9GiGS426mNFLec5Zh9Dj+wPGO6z9kOsikMBeP
         Hn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786150614; x=1786755414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/1TzYDcUXNZpa7mQIBzWuP+KknfPHzOJXzXsgHlbeQ=;
        b=jc9fp4/fNwnAKs4kwNvE68XRyr5yoTI38ZHCbE5rT9See/drkiOxsAS2SlRCctGkr5
         6V1bsEfAA8uBaJjSCu/1cjRPxmjn3G34nFmCGlc6Z2RKyer7Bl3btTQVI4EwbPeRiyTu
         u3lL6VUjlGzw1GCjpKT+4sNTf2kG2yX0iEdV40VOnzcjvBczcOz3QgBu2timmu2hq6qC
         jpPRlrFeJg9eweEFcy6U6HfRbI29td0ZKY+mU70ZqWhfKarNbn/z8ykFBB3YWBMQ9xp2
         O/zVFmXszeu1D/M7Ct7WBdOtnRvcMfElVRShwHR+LfxqkxFS9I8+36n8KjFIjIlhA8PE
         79xg==
X-Forwarded-Encrypted: i=1; AHgh+RpiSI6WlV1LJxhAR/RrKku7N9s0VbQcajsl7lFOvObNPlYUTFdxMeHY4QZJ3x8O91rwfFgk+AI4GjdPpI8AJY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH03r4TfMgeiNG5GxWgcmvSkixQGWXeJ+2JAAiGiAUy0SShakc
	UOD+67xaFueSkdjET6vO/DkeIKCW9v9iVEXiE1FK7XAHoc5dLndV4fhF
X-Gm-Gg: AR+sD12fj9qQnx8eXCQaB0wp278JUh699a4jlE0K/lftroxP8IWkuXh1tLeVz+W4M9S
	Htwgky4gWxsBY9ZW6ti7xB+Dd60E0QmiIkksxydvkNQoHsafWFgS9ocMLSxPOQpV6vFM8A8SReT
	L9BI8unOOTxmwB3CW98V39DA2/y7QNcwuSnntpP1YfZCNkv6lbf8SzmBWKsg5+wsTH6fJvy0TUu
	/6gr8/Z4OWx6MNMJ5mAADT2XTDPPoxmo47Frlr6mMWoXK7LNo/VY7PD7A6sn7ottXq1NucczMP7
	zjGIqGkRnPssVpK5VkFUqgYRVvU/IXDrnbbef+S1lPv30aRNLwoI7aE58eTHCgkEDOonLnUumSn
	Fb0BO/QiV+TnHyEk4sNP+kthqYyVNaKoh7Hq1RWGvy08B7bc+Ms/Vh731Ek1LtcLMVtDMQ7cAjG
	jfgOj4SGtlSjoQ2jXyLhaUGsp9xssc52N6QBHMvwbJvts0Ryx9RCaM7IQKHZ0CycfshGxMVwX/P
	9NEumVtb0l0LHlw3VW+bcEC/nmiV3dOVw0mh9CiJMmNfkfztMQ=
X-Received: by 2002:a17:90b:2e46:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39282430494mr3914716a91.11.1786150613992;
        Fri, 07 Aug 2026 17:56:53 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:d7e9:6449:7464:1dfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm4205182a91.2.2026.08.07.17.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:56:53 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 01/10] ipv6: add ip6_del_rt_reason()
Date: Sat,  8 Aug 2026 09:56:33 +0900
Message-ID: <20260808005642.26901-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808005642.26901-1-sigefriedhyy@gmail.com>
References: <20260808005642.26901-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RTA_DEL_REASON and enum rt_del_reason to the rtnetlink uAPI, and
add ip6_del_rt_reason(), which takes the reason a route is being
deleted. It has no skip_notify argument: a caller that records a
deletion reason wants the notification that carries it.

The reason is unused for now. Subsequent patches propagate it to the
deletion path and report it on RTM_DELROUTE.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 include/net/ip6_route.h        |  2 ++
 include/uapi/linux/rtnetlink.h | 25 +++++++++++++++++++++++++
 net/ipv6/route.c               |  8 ++++++++
 3 files changed, 35 insertions(+)

diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
index 09ffe0f13ce7..cc045705862d 100644
--- a/include/net/ip6_route.h
+++ b/include/net/ip6_route.h
@@ -126,6 +126,8 @@ int ipv6_route_ioctl(struct net *net, unsigned int cmd,
 int ip6_route_add(struct fib6_config *cfg, gfp_t gfp_flags,
 		  struct netlink_ext_ack *extack);
 int ip6_ins_rt(struct net *net, struct fib6_info *f6i);
+int ip6_del_rt_reason(struct net *net, struct fib6_info *f6i,
+		      enum rt_del_reason del_reason);
 #if IS_ENABLED(CONFIG_IPV6)
 int ip6_del_rt(struct net *net, struct fib6_info *f6i, bool skip_notify);
 #else
diff --git a/include/uapi/linux/rtnetlink.h b/include/uapi/linux/rtnetlink.h
index 27265fd31e5f..3988b51db539 100644
--- a/include/uapi/linux/rtnetlink.h
+++ b/include/uapi/linux/rtnetlink.h
@@ -399,6 +399,7 @@ enum rtattr_type_t {
 	RTA_DPORT,
 	RTA_NH_ID,
 	RTA_FLOWLABEL,
+	RTA_DEL_REASON,
 	__RTA_MAX
 };
 
@@ -407,6 +408,30 @@ enum rtattr_type_t {
 #define RTM_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct rtmsg))))
 #define RTM_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct rtmsg))
 
+/* RTA_DEL_REASON: why the kernel deleted the route. u32.
+ * Emitted only on RTM_DELROUTE notifications, and only when the deletion
+ * path records a cause. Absence means either an older kernel or a
+ * deletion path that does not (yet) record its cause - consumers must
+ * treat "absent" and "unspec" identically. New causes may be appended.
+ * Currently only IPv6 deletion paths record a cause.
+ *
+ * The attribute is notification-only: the kernel rejects it in
+ * requests, so a notification must not be echoed back verbatim.
+ *
+ * The value space is family-agnostic: a value must never be
+ * reinterpreted per address family. A cause that only one family can
+ * produce still gets its own value rather than reusing another
+ * family's.
+ */
+enum rt_del_reason {
+	RT_DEL_REASON_UNSPEC,		/* cause not recorded */
+	RT_DEL_REASON_EXPIRED,		/* RTF_EXPIRES lifetime ran out (GC) */
+	RT_DEL_REASON_RA_WITHDRAWN,	/* zero-lifetime RA / PIO / RIO */
+	__RT_DEL_REASON_MAX
+};
+
+#define RT_DEL_REASON_MAX (__RT_DEL_REASON_MAX - 1)
+
 /* RTM_MULTIPATH --- array of struct rtnexthop.
  *
  * "struct rtnexthop" describes all necessary nexthop information,
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index fc42d67e5822..ca374b056f5a 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -4004,6 +4004,14 @@ int ip6_del_rt(struct net *net, struct fib6_info *rt, bool skip_notify)
 	return __ip6_del_rt(rt, &info);
 }
 
+int ip6_del_rt_reason(struct net *net, struct fib6_info *rt,
+		      enum rt_del_reason del_reason)
+{
+	struct nl_info info = { .nl_net = net };
+
+	return __ip6_del_rt(rt, &info);
+}
+
 static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_config *cfg)
 {
 	struct nl_info *info = &cfg->fc_nlinfo;
-- 
2.43.0

