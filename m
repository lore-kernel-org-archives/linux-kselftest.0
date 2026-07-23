Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C743C041
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803464; cv=none; b=HiamMa1+qyz/5JC6px61f0ryM/xGzOWZ82MR5tpLMtWCaxdBwu+XI29ZgYYeMhhxrcLCeQbxt57mE8EUdPzTdkuD5EnjiY4B60hhqSS4XAjUdpZPGp0C8q4dR0c7De0ouyAbZ+gLUf1HQtgy/8X424NPBAq0c+g94yaGA3U8QLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803464; c=relaxed/simple;
	bh=oovsr2na6ByECQ79v2yVYUdKbr0hEqCkiDAT1w6sVJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vce8gTTdnyncYwQJYaeexowG56BHniJ/xm9k3iOQrra1bznsFxTF87glspRQ31KFgKjLr59T4bk/jLyyHQ830DNqmYTwfqIMgGAsHu/ZuuFZKCIS2HEz+OpNHKkDwU6m7sW2rl8IOmmJUOG0Y4uF6fFAMazdgVs+bFrlYhx9tKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPSIi1xq; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPSIi1xq"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so408943a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784803460; x=1785408260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQDE0WLryyqfn2W/fjBps5PNAUIYDVKYIDit1fnBt9g=;
        b=dPSIi1xqx6CbtefTYjMl0lfkKQwsuJKZC4XbaphqnQ5JB0xa8m0iZihQ1sl8rC/xPX
         YhtGu7NZDJ+Igs2FPzaqiJM5AIhK50WenXnqekE5I2x3B0BkoB9HXspBnQlesiokyZ+w
         Ja7AO76KQEKwLZOpr9MT/jOBFYflNdxvVQmCR7docf5/J0fuylrok+cAYx9wLb7HJxZd
         hR1ZzKLjKopps7M6A/jwfJ4a6Kty0V+6lwDXxx0ZIc9DgB6MUUFwOyqXwCreVtHD94Hw
         o5Y7Levz/QnneyR5O0P8WUtmfA+kc3XWVvJamnc29HYldfEhLcRfV5xpWv2FeHeNC2BS
         cU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803460; x=1785408260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQDE0WLryyqfn2W/fjBps5PNAUIYDVKYIDit1fnBt9g=;
        b=tU8AhpucexGtjz5obIEO7HEXiwsMQK65jWsqDizq2WkRhjxV+SNvviX+3DLGa8NQt0
         05xXgvbW5gG+SRuAbsmPMZJbOg9HN0G+M6/A0EVMBXhpAuJTM3WsxlVQb1lgRKtT/A39
         P6JOFK75aOgB9hXmtVGX++4JT6IUa8MyP/R1OE8vOVTS4iDlG89VoJswzz9zPDCNRF24
         FDAy04HvSlk0pt+7pCrtm0Mozb2qGYRS92j0PPAWNGgKpsdkVJBM90Re4xgx13M3nJq4
         miwhOgXouwSbE2X0MYzQ1pVXtc3QDgtzOC/7Gdf7SKbaGK3HDntOWPhRdhV3+Oqfo6Xq
         boTw==
X-Forwarded-Encrypted: i=1; AHgh+RoTiqwUb4YQn79ZUaCzYO3m51Yi+0IuvPKcIAzpg23UTxSYOZM9BCgIHg24FVt0uyctR77BEdRcaQgTp92Ooig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvI/idh/KbS6hUwiQ0qlEfsnT3pREaEgYTn9EdpDlIY6BnPwMS
	uGbg9wajbz5ToRV3vlW4By+HIAFaSgtEV9nMxI/SpMBQ6dys32ldM8qd
X-Gm-Gg: AR+sD11YNAum3CWlIq/BNjMld78Xm77qdsbbdDj7cp79qASAb+aGUPZ/Pk2bBEWpqPh
	2KHBTKs94vctLZfAF+qFUsFyPFVj+PeHi+0QW8UOQnOdXVzdn9MDjgn58dMoy+rK0WV97qzDlN0
	4pmta6SV+ohuyRKVz7tGr+owTVq1KtrBpkIkqBNRBtGZPDzS0M/CA/Y2FctHIHakFw3HWlEDoma
	IQlUNiTTNssclFONrkczlJNjBpUdoTp89tyBHgWbm3vL3jcDU35xQ48b2Bol1D9Hkl8411gqIPD
	5Bf/3kFKYVWNuDe5i3LVfCiyLlfwJ1D5D5CcW37XjHA11MIUXYhZ0CUo+LZIixe0lPIHyzBfS8B
	G9yGtPdm5Oc4wAt3IobImwrg5gn35ol/IF7fM+y/UIZ8mZhJkOQKGKwAAhqfyBKqY+oOGgTTXUa
	xGDMoo7/cWlc6mQFOe6dDnkkTgo0rFcMePazjSPiLEuXNcqLlJVgURAOcle7Dk/w==
X-Received: by 2002:a17:90b:1a8a:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-38ec697957fmr2371843a91.12.1784803459343;
        Thu, 23 Jul 2026 03:44:19 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:86fb:a344:1a3d:eba0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea59c9b5asm1210262a91.3.2026.07.23.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:44:18 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Gal Pressman <gal@nvidia.com>,
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
Subject: [PATCH net-next v2 1/2] ipv6: report why a route was deleted in RTM_DELROUTE
Date: Thu, 23 Jul 2026 19:44:02 +0900
Message-ID: <20260723104403.7970-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723104403.7970-1-sigefriedhyy@gmail.com>
References: <20260723104403.7970-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RTA_DEL_REASON (u8) to RTM_DELROUTE notifications to report the
cause of kernel-initiated IPv6 route deletions, so user space can tell
routes that expired from routes explicitly withdrawn by Router
Advertisements.

The two causes call for different treatment in user space. An expired
RA route means the router failed to refresh it before its lifetime ran
out, which points at a misconfigured or unreliable router; user space
may want to react, for example by disabling IPv6 on that network
entirely. An RA withdrawal (zero lifetime) is valid, RFC-compliant
operation and needs no such recovery. Today both surface as an
identical RTM_DELROUTE.

Plumb the deletion reason through the IPv6 FIB and notification paths:
- Update `fib6_del`, `fib6_del_route`, and `inet6_rt_notify` signatures
  to explicitly pass the `del_reason` (u8) down the call chain.
- Update `rt6_fill_node()` to emit `RTA_DEL_REASON` attribute when the
  reason is not UNSPEC.
- Record the cause in the kernel-initiated IPv6 deletion paths:
  - RTA_DEL_REASON_EXPIRED: for routes cleaned up by the FIB6 garbage
    collector.
  - RTA_DEL_REASON_RA_WITHDRAWN: for default routes, prefix routes, or
    route information option routes withdrawn by Router Advertisements.
- Update the `rt-route` Netlink YAML spec to define the new attribute,
  notifications, and multicast groups.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-route.yaml | 33 ++++++++++++
 include/net/ip6_fib.h                     |  4 +-
 include/net/ip6_route.h                   |  2 +
 include/uapi/linux/rtnetlink.h            | 17 ++++++
 net/ipv6/addrconf.c                       |  3 +-
 net/ipv6/ip6_fib.c                        | 19 ++++---
 net/ipv6/ndisc.c                          |  7 ++-
 net/ipv6/route.c                          | 66 +++++++++++++++--------
 8 files changed, 116 insertions(+), 35 deletions(-)

diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/netlink/specs/rt-route.yaml
index 33195db96746..234f502fb35d 100644
--- a/Documentation/netlink/specs/rt-route.yaml
+++ b/Documentation/netlink/specs/rt-route.yaml
@@ -78,6 +78,15 @@ definitions:
       -
         name: rta-used
         type: u32
+  -
+    name: del-reason
+    type: enum
+    name-prefix: rta-del-reason-
+    enum-name: rta-del-reason
+    entries:
+      - unspec
+      - expired
+      - ra-withdrawn
 
 attribute-sets:
   -
@@ -185,6 +194,10 @@ attribute-sets:
         type: u32
         byte-order: big-endian
         display-hint: hex
+      -
+        name: del-reason
+        type: u32
+        enum: del-reason
   -
     name: metrics
     name-prefix: rtax-
@@ -299,6 +312,7 @@ operations:
             - dport
             - nh-id
             - flowlabel
+            - del-reason
       dump:
         request:
           value: 26
@@ -322,3 +336,22 @@ operations:
         request:
           value: 25
           attributes: *all-route-attrs
+    -
+      name: newroute-ntf
+      doc: Notification about a created route.
+      value: 24
+      notify: getroute
+    -
+      name: delroute-ntf
+      doc: Notification about a deleted route.
+      value: 25
+      notify: getroute
+
+mcast-groups:
+  list:
+    -
+      name: rtnlgrp-ipv4-route
+      value: 7
+    -
+      name: rtnlgrp-ipv6-route
+      value: 11
diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index 9cd27e1b9b69..7ca0e2124e79 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -468,7 +468,7 @@ void fib6_clean_all_skip_notify(struct net *net,
 
 int fib6_add(struct fib6_node *root, struct fib6_info *rt,
 	     struct nl_info *info, struct netlink_ext_ack *extack);
-int fib6_del(struct fib6_info *rt, struct nl_info *info);
+int fib6_del(struct fib6_info *rt, struct nl_info *info, u32 del_reason);
 
 static inline
 void rt6_get_prefsrc(const struct rt6_info *rt, struct in6_addr *addr)
@@ -531,7 +531,7 @@ static inline void fib6_rt_update(struct net *net, struct fib6_info *rt,
 }
 #endif
 void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
-		     unsigned int flags);
+		     unsigned int flags, u32 del_reason);
 
 void fib6_age_exceptions(struct fib6_info *rt, struct fib6_gc_args *gc_args,
 			 unsigned long now);
diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
index 09ffe0f13ce7..98f1684fe378 100644
--- a/include/net/ip6_route.h
+++ b/include/net/ip6_route.h
@@ -128,6 +128,8 @@ int ip6_route_add(struct fib6_config *cfg, gfp_t gfp_flags,
 int ip6_ins_rt(struct net *net, struct fib6_info *f6i);
 #if IS_ENABLED(CONFIG_IPV6)
 int ip6_del_rt(struct net *net, struct fib6_info *f6i, bool skip_notify);
+int ip6_del_rt_reason(struct net *net, struct fib6_info *f6i, bool skip_notify,
+		      u32 del_reason);
 #else
 static inline int ip6_del_rt(struct net *net, struct fib6_info *f6i,
 			     bool skip_notify)
diff --git a/include/uapi/linux/rtnetlink.h b/include/uapi/linux/rtnetlink.h
index 27265fd31e5f..fe00e624f3c3 100644
--- a/include/uapi/linux/rtnetlink.h
+++ b/include/uapi/linux/rtnetlink.h
@@ -399,6 +399,7 @@ enum rtattr_type_t {
 	RTA_DPORT,
 	RTA_NH_ID,
 	RTA_FLOWLABEL,
+	RTA_DEL_REASON,
 	__RTA_MAX
 };
 
@@ -407,6 +408,22 @@ enum rtattr_type_t {
 #define RTM_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct rtmsg))))
 #define RTM_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct rtmsg))
 
+/* RTA_DEL_REASON: why the kernel deleted the route. u32.
+ * Emitted only on RTM_DELROUTE notifications, and only when the deletion
+ * path records a cause. Absence means either an older kernel or a
+ * deletion path that does not (yet) record its cause - consumers must
+ * treat "absent" and "unspec" identically. New causes may be appended.
+ * Currently only IPv6 deletion paths record a cause.
+ */
+enum rta_del_reason {
+	RTA_DEL_REASON_UNSPEC,		/* cause not recorded */
+	RTA_DEL_REASON_EXPIRED,		/* RTF_EXPIRES lifetime ran out (GC) */
+	RTA_DEL_REASON_RA_WITHDRAWN,	/* zero-lifetime RA / PIO / RIO */
+	__RTA_DEL_REASON_MAX
+};
+
+#define RTA_DEL_REASON_MAX (__RTA_DEL_REASON_MAX - 1)
+
 /* RTM_MULTIPATH --- array of struct rtnexthop.
  *
  * "struct rtnexthop" describes all necessary nexthop information,
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index f1fe9ede1edb..1ca9d82b5721 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -2874,7 +2874,8 @@ void addrconf_prefix_rcv(struct net_device *dev, u8 *opt, int len, bool sllao)
 		if (rt) {
 			/* Autoconf prefix route */
 			if (valid_lft == 0) {
-				ip6_del_rt(net, rt, false);
+				ip6_del_rt_reason(net, rt, false,
+						  RTA_DEL_REASON_RA_WITHDRAWN);
 				rt = NULL;
 			} else {
 				table = rt->fib6_table;
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index a130cdfaebfb..32b9a00956a0 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -1286,7 +1286,8 @@ static int fib6_add_rt2node(struct fib6_node *fn, struct fib6_info *rt,
 		rcu_assign_pointer(rt->fib6_node, fn);
 		rcu_assign_pointer(*ins, rt);
 		if (!info->skip_notify)
-			inet6_rt_notify(RTM_NEWROUTE, rt, info, nlflags);
+			inet6_rt_notify(RTM_NEWROUTE, rt, info, nlflags,
+					RTA_DEL_REASON_UNSPEC);
 		info->nl_net->ipv6.rt6_stats->fib_rt_entries++;
 
 		if (!(fn->fn_flags & RTN_RTINFO)) {
@@ -1317,7 +1318,8 @@ static int fib6_add_rt2node(struct fib6_node *fn, struct fib6_info *rt,
 		rt->fib6_next = iter->fib6_next;
 		rcu_assign_pointer(*ins, rt);
 		if (!info->skip_notify)
-			inet6_rt_notify(RTM_NEWROUTE, rt, info, NLM_F_REPLACE);
+			inet6_rt_notify(RTM_NEWROUTE, rt, info, NLM_F_REPLACE,
+					RTA_DEL_REASON_UNSPEC);
 		if (!(fn->fn_flags & RTN_RTINFO)) {
 			info->nl_net->ipv6.rt6_stats->fib_route_nodes++;
 			fn->fn_flags |= RTN_RTINFO;
@@ -1966,7 +1968,8 @@ static struct fib6_node *fib6_repair_tree(struct net *net,
 }
 
 static void fib6_del_route(struct fib6_table *table, struct fib6_node *fn,
-			   struct fib6_info __rcu **rtp, struct nl_info *info)
+			   struct fib6_info __rcu **rtp, struct nl_info *info,
+			   u32 del_reason)
 {
 	struct fib6_info *leaf, *replace_rt = NULL;
 	struct fib6_walker *w;
@@ -2055,13 +2058,13 @@ static void fib6_del_route(struct fib6_table *table, struct fib6_node *fn,
 			call_fib6_entry_notifiers_replace(net, replace_rt);
 	}
 	if (!info->skip_notify)
-		inet6_rt_notify(RTM_DELROUTE, rt, info, 0);
+		inet6_rt_notify(RTM_DELROUTE, rt, info, 0, del_reason);
 
 	fib6_info_release(rt);
 }
 
 /* Need to own table->tb6_lock */
-int fib6_del(struct fib6_info *rt, struct nl_info *info)
+int fib6_del(struct fib6_info *rt, struct nl_info *info, u32 del_reason)
 {
 	struct net *net = info->nl_net;
 	struct fib6_info __rcu **rtp;
@@ -2090,7 +2093,7 @@ int fib6_del(struct fib6_info *rt, struct nl_info *info)
 		if (rt == cur) {
 			if (fib6_requires_src(cur))
 				fib6_routes_require_src_dec(info->nl_net);
-			fib6_del_route(table, fn, rtp, info);
+			fib6_del_route(table, fn, rtp, info, del_reason);
 			return 0;
 		}
 		rtp_next = &cur->fib6_next;
@@ -2252,7 +2255,7 @@ static int fib6_clean_node(struct fib6_walker *w)
 		res = c->func(rt, c->arg);
 		if (res == -1) {
 			w->leaf = rt;
-			res = fib6_del(rt, &info);
+			res = fib6_del(rt, &info, RTA_DEL_REASON_UNSPEC);
 			if (res) {
 #if RT6_DEBUG >= 2
 				pr_debug("%s: del failed: rt=%p@%p err=%d\n",
@@ -2400,7 +2403,7 @@ static void fib6_gc_table(struct net *net,
 
 	hlist_for_each_entry_safe(rt, n, &tb6->tb6_gc_hlist, gc_link)
 		if (fib6_age(rt, gc_args) == -1)
-			fib6_del(rt, &info);
+			fib6_del(rt, &info, RTA_DEL_REASON_EXPIRED);
 }
 
 static void fib6_gc_all(struct net *net, struct fib6_gc_args *gc_args)
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index f867ec8d3d90..c3537fc0ec63 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1361,7 +1361,9 @@ static enum skb_drop_reason ndisc_router_discovery(struct sk_buff *skb)
 	defrtr_usr_metric = in6_dev->cnf.ra_defrtr_metric;
 	/* delete the route if lifetime is 0 or if metric needs change */
 	if (rt && (lifetime == 0 || rt->fib6_metric != defrtr_usr_metric)) {
-		ip6_del_rt(net, rt, false);
+		ip6_del_rt_reason(net, rt, false,
+				  lifetime == 0 ? RTA_DEL_REASON_RA_WITHDRAWN :
+						  RTA_DEL_REASON_UNSPEC);
 		rt = NULL;
 	}
 
@@ -1396,7 +1398,8 @@ static enum skb_drop_reason ndisc_router_discovery(struct sk_buff *skb)
 			.nl_net = net,
 		};
 		rt->fib6_flags = (rt->fib6_flags & ~RTF_PREF_MASK) | RTF_PREF(pref);
-		inet6_rt_notify(RTM_NEWROUTE, rt, &nlinfo, NLM_F_REPLACE);
+		inet6_rt_notify(RTM_NEWROUTE, rt, &nlinfo, NLM_F_REPLACE,
+				RTA_DEL_REASON_UNSPEC);
 	}
 
 	if (rt) {
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index a1301334da48..e8ed95dc5665 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -111,7 +111,7 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 			 struct fib6_info *rt, struct dst_entry *dst,
 			 struct in6_addr *dest, struct in6_addr *src,
 			 int iif, int type, u32 portid, u32 seq,
-			 unsigned int flags);
+			 unsigned int flags, u32 del_reason);
 static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
 					   const struct in6_addr *daddr,
 					   const struct in6_addr *saddr);
@@ -1020,7 +1020,7 @@ int rt6_route_rcv(struct net_device *dev, u8 *opt, int len,
 					gwaddr, dev);
 
 	if (rt && !lifetime) {
-		ip6_del_rt(net, rt, false);
+		ip6_del_rt_reason(net, rt, false, RTA_DEL_REASON_RA_WITHDRAWN);
 		rt = NULL;
 	}
 
@@ -3973,7 +3973,8 @@ int ip6_route_add(struct fib6_config *cfg, gfp_t gfp_flags,
 	return err;
 }
 
-static int __ip6_del_rt(struct fib6_info *rt, struct nl_info *info)
+static int __ip6_del_rt(struct fib6_info *rt, struct nl_info *info,
+			u32 del_reason)
 {
 	struct net *net = info->nl_net;
 	struct fib6_table *table;
@@ -3986,7 +3987,7 @@ static int __ip6_del_rt(struct fib6_info *rt, struct nl_info *info)
 
 	table = rt->fib6_table;
 	spin_lock_bh(&table->tb6_lock);
-	err = fib6_del(rt, info);
+	err = fib6_del(rt, info, del_reason);
 	spin_unlock_bh(&table->tb6_lock);
 
 out:
@@ -3994,14 +3995,20 @@ static int __ip6_del_rt(struct fib6_info *rt, struct nl_info *info)
 	return err;
 }
 
-int ip6_del_rt(struct net *net, struct fib6_info *rt, bool skip_notify)
+int ip6_del_rt_reason(struct net *net, struct fib6_info *rt, bool skip_notify,
+		      u32 del_reason)
 {
 	struct nl_info info = {
 		.nl_net = net,
-		.skip_notify = skip_notify
+		.skip_notify = skip_notify,
 	};
 
-	return __ip6_del_rt(rt, &info);
+	return __ip6_del_rt(rt, &info, del_reason);
+}
+
+int ip6_del_rt(struct net *net, struct fib6_info *rt, bool skip_notify)
+{
+	return ip6_del_rt_reason(net, rt, skip_notify, RTA_DEL_REASON_UNSPEC);
 }
 
 static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_config *cfg)
@@ -4028,7 +4035,8 @@ static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_config *cfg)
 
 			if (rt6_fill_node(net, skb, rt, NULL,
 					  NULL, NULL, 0, RTM_DELROUTE,
-					  info->portid, seq, 0) < 0) {
+					  info->portid, seq, 0,
+					  RTA_DEL_REASON_UNSPEC) < 0) {
 				kfree_skb(skb);
 				skb = NULL;
 			} else
@@ -4064,13 +4072,13 @@ static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_config *cfg)
 		list_for_each_entry_safe(sibling, next_sibling,
 					 &rt->fib6_siblings,
 					 fib6_siblings) {
-			err = fib6_del(sibling, info);
+			err = fib6_del(sibling, info, RTA_DEL_REASON_UNSPEC);
 			if (err)
 				goto out_unlock;
 		}
 	}
 
-	err = fib6_del(rt, info);
+	err = fib6_del(rt, info, RTA_DEL_REASON_UNSPEC);
 out_unlock:
 	spin_unlock_bh(&table->tb6_lock);
 out_put:
@@ -4196,7 +4204,8 @@ static int ip6_route_del(struct fib6_config *cfg,
 				if (!fib6_info_hold_safe(rt))
 					continue;
 
-				err =  __ip6_del_rt(rt, &cfg->fc_nlinfo);
+				err = __ip6_del_rt(rt, &cfg->fc_nlinfo,
+						   RTA_DEL_REASON_UNSPEC);
 				break;
 			}
 			if (cfg->fc_nh_id)
@@ -4215,7 +4224,8 @@ static int ip6_route_del(struct fib6_config *cfg,
 
 			/* if gateway was specified only delete the one hop */
 			if (cfg->fc_flags & RTF_GATEWAY)
-				err = __ip6_del_rt(rt, &cfg->fc_nlinfo);
+				err = __ip6_del_rt(rt, &cfg->fc_nlinfo,
+						   RTA_DEL_REASON_UNSPEC);
 			else
 				err = __ip6_del_rt_siblings(rt, cfg);
 			break;
@@ -5381,7 +5391,8 @@ static void ip6_route_mpath_notify(struct fib6_info *rt,
 	}
 
 	if (rt)
-		inet6_rt_notify(RTM_NEWROUTE, rt, info, nlflags);
+		inet6_rt_notify(RTM_NEWROUTE, rt, info, nlflags,
+				RTA_DEL_REASON_UNSPEC);
 
 	rcu_read_unlock();
 }
@@ -5739,6 +5750,7 @@ static size_t rt6_nlmsg_size(struct fib6_info *f6i)
 	       + nla_total_size(sizeof(struct rta_cacheinfo))
 	       + nla_total_size(TCP_CA_NAME_MAX) /* RTAX_CC_ALGO */
 	       + nla_total_size(1) /* RTA_PREF */
+	       + nla_total_size(4) /* RTA_DEL_REASON */
 	       + nexthop_len;
 }
 
@@ -5775,7 +5787,7 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 			 struct fib6_info *rt, struct dst_entry *dst,
 			 struct in6_addr *dest, struct in6_addr *src,
 			 int iif, int type, u32 portid, u32 seq,
-			 unsigned int flags)
+			 unsigned int flags, u32 del_reason)
 {
 	struct rt6_info *rt6 = dst_rt6_info(dst);
 	struct rt6key *rt6_dst, *rt6_src;
@@ -5954,6 +5966,10 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 	if (rtnl_put_cacheinfo(skb, dst, 0, expires, dst ? dst->error : 0) < 0)
 		goto nla_put_failure;
 
+	if (type == RTM_DELROUTE && del_reason != RTA_DEL_REASON_UNSPEC &&
+	    nla_put_u32(skb, RTA_DEL_REASON, del_reason))
+		goto nla_put_failure;
+
 	if (nla_put_u8(skb, RTA_PREF, IPV6_EXTRACT_PREF(rt6_flags)))
 		goto nla_put_failure;
 
@@ -6055,7 +6071,8 @@ static int rt6_nh_dump_exceptions(struct fib6_nh *nh, void *arg)
 					    &rt6_ex->rt6i->dst, NULL, NULL, 0,
 					    RTM_NEWROUTE,
 					    NETLINK_CB(dump->cb->skb).portid,
-					    dump->cb->nlh->nlmsg_seq, w->flags);
+					    dump->cb->nlh->nlmsg_seq, w->flags,
+					    RTA_DEL_REASON_UNSPEC);
 			if (err)
 				return err;
 
@@ -6103,7 +6120,8 @@ int rt6_dump_route(struct fib6_info *rt, void *p_arg, unsigned int skip)
 			if (rt6_fill_node(net, arg->skb, rt, NULL, NULL, NULL,
 					  0, RTM_NEWROUTE,
 					  NETLINK_CB(arg->cb->skb).portid,
-					  arg->cb->nlh->nlmsg_seq, flags)) {
+					  arg->cb->nlh->nlmsg_seq, flags,
+					  RTA_DEL_REASON_UNSPEC)) {
 				return 0;
 			}
 			count++;
@@ -6336,12 +6354,14 @@ static int inet6_rtm_getroute(struct sk_buff *in_skb, struct nlmsghdr *nlh,
 			err = rt6_fill_node(net, skb, from, NULL, NULL, NULL,
 					    iif, RTM_NEWROUTE,
 					    NETLINK_CB(in_skb).portid,
-					    nlh->nlmsg_seq, 0);
+					    nlh->nlmsg_seq, 0,
+					    RTA_DEL_REASON_UNSPEC);
 		else
 			err = rt6_fill_node(net, skb, from, dst, &fl6.daddr,
 					    &fl6.saddr, iif, RTM_NEWROUTE,
 					    NETLINK_CB(in_skb).portid,
-					    nlh->nlmsg_seq, 0);
+					    nlh->nlmsg_seq, 0,
+					    RTA_DEL_REASON_UNSPEC);
 	} else {
 		err = -ENETUNREACH;
 	}
@@ -6358,7 +6378,7 @@ static int inet6_rtm_getroute(struct sk_buff *in_skb, struct nlmsghdr *nlh,
 }
 
 void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
-		     unsigned int nlm_flags)
+		     unsigned int nlm_flags, u32 del_reason)
 {
 	struct net *net = info->nl_net;
 	struct sk_buff *skb;
@@ -6377,7 +6397,8 @@ void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
 		goto errout;
 
 	err = rt6_fill_node(net, skb, rt, NULL, NULL, NULL, 0,
-			    event, info->portid, seq, nlm_flags);
+			    event, info->portid, seq, nlm_flags,
+			    del_reason);
 	if (err < 0) {
 		kfree_skb(skb);
 		/* -EMSGSIZE implies needed space grew under us. */
@@ -6410,7 +6431,8 @@ void fib6_rt_update(struct net *net, struct fib6_info *rt,
 		goto errout;
 
 	err = rt6_fill_node(net, skb, rt, NULL, NULL, NULL, 0,
-			    RTM_NEWROUTE, info->portid, seq, NLM_F_REPLACE);
+			    RTM_NEWROUTE, info->portid, seq, NLM_F_REPLACE,
+			    RTA_DEL_REASON_UNSPEC);
 	if (err < 0) {
 		/* -EMSGSIZE implies BUG in rt6_nlmsg_size() */
 		WARN_ON(err == -EMSGSIZE);
@@ -6463,7 +6485,7 @@ void fib6_info_hw_flags_set(struct net *net, struct fib6_info *f6i,
 	}
 
 	err = rt6_fill_node(net, skb, f6i, NULL, NULL, NULL, 0, RTM_NEWROUTE, 0,
-			    0, 0);
+			    0, 0, RTA_DEL_REASON_UNSPEC);
 	if (err < 0) {
 		/* -EMSGSIZE implies BUG in rt6_nlmsg_size() */
 		WARN_ON(err == -EMSGSIZE);
-- 
2.43.0

