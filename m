Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E5230F7EB
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150620; cv=none; b=mM6HfufgJXdeVrMdWNcsu69XqmGFXUWwO2HwoXdP3mc4GCQUQfCKWiVFTNuHzCqwNc1vH4rWDBB/N41uf90k+ghlrq+x/Ds3BVfZumMQ8MvW5p+kIZ8EakHcuZ1XD5mPw1nPXyo8sAm2mrU885gtSTB3b/zhSyapdjLDY8lNpOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150620; c=relaxed/simple;
	bh=eDekLLYByroITr1rMhqofXBMmLLYfB4zAqqbAkLak+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBxbQ9o3cO063RYta9nUvWSuWEa9efvH84SXBp3tvMprcTYJ4IWYtOAKHF8bR1zw+Vdy1670kVDejZiFhOqDVQCZed9XZCZgWvflAHg2nYTneqo3KFw560MKwHJOmwCZ+0957gUP61JIyRU57QguL+JOAdpZVI1qL0h/23+x/k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+LAb85g; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+LAb85g"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so70737a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786150618; x=1786755418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ij8oLdr5f8WCpH02C6+OkwbiSDXNanhbn2uEY7BaFik=;
        b=c+LAb85gXOdwu5DdP0RJqrqxEOJPs4KeZZLqLsMXWiMquTpDoP7Vv/XayqOw9FuRZs
         BbOYj+MvyCI0Pepi1sNAV2eKxeQjVJ73aHCWAcqbzmZDTpFqo0xvwmTIAetnIXQdmb+y
         vvjp1C5c5PsMJ65tIjna8m+4bOvn10TtkjefCtIroZiEnZpPckM58sdbRHQ7f80f3heu
         ZOmWdDhTSteDEHCHBXGlSngOj4ECXAKtNCorYKu974BHXBGPW/ULgwffPDYF7Kdeu+5L
         xMyWxo0M5E+aPYdBVbFwAXnanFgYuzVx4r1D/Xw007Tr9jBgI/OlmahXLZe2XHjmgpCE
         Pe1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786150618; x=1786755418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij8oLdr5f8WCpH02C6+OkwbiSDXNanhbn2uEY7BaFik=;
        b=NwSb3jWPYR7Lmr4+NUv7jnwlMvYZHEXCuXB+pEz03rjdiuyyqVuLKeWR5cPMu+azM2
         jknhYbxcCGL7jdS5IUUCo4qaanJOyWhTcHrO4gZ3ZdY1ZSBElqbDB1wNgaov5PrhdWgB
         JAKuRNZC4p6ciKVvLknnuIiiK+aleXr5R2ZrC4csHGXqhEj0x1IE3E/UdfYPiHSRVmrB
         i2joTMZ2ki2n/Hz9e9Qg1K76fv0nLX7vOFG3LFsQ/RXLPtny4djwmc1QgrqO6Xm/p0QO
         8T84qvKgsuDqpqzlWhsXFYHC1l2AY8ZCIpY4Q4/yGvH/D+jkAYlxEZkmmm06eD4M7J5i
         cbGA==
X-Forwarded-Encrypted: i=1; AHgh+RqgjsEjF1zmRyGdDWpE+KCSVb1PNd82yZsTiwGBuJMzEMbReFjyvUD7QvxcrP11o+fzpsZPIpGQmG6xv3hKPoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI9ppWFL4j1sr89o3I/yY/apPQiyO65inQtAKFs/vFN73agdLJ
	IxXz9Z59NWOqEBeC0E7ocfGLgAFrCUvOaUdk2N9of2LEO3FfY69bzImd
X-Gm-Gg: AR+sD11daNn10+Mpp13bKIAfepniL3UI/0S6Oaq8pv3yPU5QPtmV+h83KU95gyWgJSB
	aKTXRWRSU2R/fM+xs0ZaWv1JQFQvfu+QUI3UuPsXJ41xH1pO6G0D/MOBJE+RRoykChAK1LEgbIc
	FiUfINHPv3mAjqeN5ZW3IDFcCb8UYwn558wcXfefPkLVHNLYQOqcniEtY9rIUpjanhD3+v8q60v
	16SgFbb1hm6hsBULR1ukcTM2rekbtKqnnXN0ESqpWMfR8U9zz1+PFXCDXeqYpqBTnDpv6LlIk4z
	KHJ2EwSLmyyDsjjxlsjKcB/YodXju2uabCe4BUDG4ZLPDy71vyyEGYAEc7jU1YynOb0YnYrlnDu
	9lapU9XXSGbo1aKC9B9t+s/D2FkStflth+rGiDeOYVHZVsgxACCWpNKXBUO8ZXUHJjmi/0VPe2r
	eTycbxr4yqJveFi54G0IJXqtlKw6truXDnl8KyN9+zSq7Nh1Z1H19d9G2ixmG+dh++2DuFd5TtN
	tGsl3CkYKHAdMVHSWVV7uMoPhaJ3Umx2nh8iUIvCdylVir+qaM=
X-Received: by 2002:a17:90b:1a92:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-392823bfc0emr3258449a91.13.1786150618020;
        Fri, 07 Aug 2026 17:56:58 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:d7e9:6449:7464:1dfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm4205182a91.2.2026.08.07.17.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:56:57 -0700 (PDT)
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
Subject: [PATCH net-next v6 02/10] ipv6: propagate the route deletion reason to fib6_del_route()
Date: Sat,  8 Aug 2026 09:56:34 +0900
Message-ID: <20260808005642.26901-3-sigefriedhyy@gmail.com>
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

Pass the deletion reason from ip6_del_rt_reason() down through
__ip6_del_rt(), fib6_del() and into fib6_del_route(). All existing
callers pass RT_DEL_REASON_UNSPEC.

fib6_del_route() ignores the reason until the notification path learns
to report it.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 include/net/ip6_fib.h |  3 ++-
 net/ipv6/ip6_fib.c    | 12 +++++++-----
 net/ipv6/route.c      | 19 +++++++++++--------
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index 9cd27e1b9b69..0ba5d3c56543 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -468,7 +468,8 @@ void fib6_clean_all_skip_notify(struct net *net,
 
 int fib6_add(struct fib6_node *root, struct fib6_info *rt,
 	     struct nl_info *info, struct netlink_ext_ack *extack);
-int fib6_del(struct fib6_info *rt, struct nl_info *info);
+int fib6_del(struct fib6_info *rt, struct nl_info *info,
+	     enum rt_del_reason del_reason);
 
 static inline
 void rt6_get_prefsrc(const struct rt6_info *rt, struct in6_addr *addr)
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e9fc692d4f3b..1f6f6f33ded1 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -1967,7 +1967,8 @@ static struct fib6_node *fib6_repair_tree(struct net *net,
 }
 
 static void fib6_del_route(struct fib6_table *table, struct fib6_node *fn,
-			   struct fib6_info __rcu **rtp, struct nl_info *info)
+			   struct fib6_info __rcu **rtp, struct nl_info *info,
+			   enum rt_del_reason del_reason)
 {
 	struct fib6_info *leaf, *replace_rt = NULL;
 	struct fib6_walker *w;
@@ -2062,7 +2063,8 @@ static void fib6_del_route(struct fib6_table *table, struct fib6_node *fn,
 }
 
 /* Need to own table->tb6_lock */
-int fib6_del(struct fib6_info *rt, struct nl_info *info)
+int fib6_del(struct fib6_info *rt, struct nl_info *info,
+	     enum rt_del_reason del_reason)
 {
 	struct net *net = info->nl_net;
 	struct fib6_info __rcu **rtp;
@@ -2091,7 +2093,7 @@ int fib6_del(struct fib6_info *rt, struct nl_info *info)
 		if (rt == cur) {
 			if (fib6_requires_src(cur))
 				fib6_routes_require_src_dec(info->nl_net);
-			fib6_del_route(table, fn, rtp, info);
+			fib6_del_route(table, fn, rtp, info, del_reason);
 			return 0;
 		}
 		rtp_next = &cur->fib6_next;
@@ -2253,7 +2255,7 @@ static int fib6_clean_node(struct fib6_walker *w)
 		res = c->func(rt, c->arg);
 		if (res == -1) {
 			w->leaf = rt;
-			res = fib6_del(rt, &info);
+			res = fib6_del(rt, &info, RT_DEL_REASON_UNSPEC);
 			if (res) {
 #if RT6_DEBUG >= 2
 				pr_debug("%s: del failed: rt=%p@%p err=%d\n",
@@ -2401,7 +2403,7 @@ static void fib6_gc_table(struct net *net,
 
 	hlist_for_each_entry_safe(rt, n, &tb6->tb6_gc_hlist, gc_link)
 		if (fib6_age(rt, gc_args) == -1)
-			fib6_del(rt, &info);
+			fib6_del(rt, &info, RT_DEL_REASON_UNSPEC);
 }
 
 static void fib6_gc_all(struct net *net, struct fib6_gc_args *gc_args)
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index ca374b056f5a..252f1825a199 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -3973,7 +3973,8 @@ int ip6_route_add(struct fib6_config *cfg, gfp_t gfp_flags,
 	return err;
 }
 
-static int __ip6_del_rt(struct fib6_info *rt, struct nl_info *info)
+static int __ip6_del_rt(struct fib6_info *rt, struct nl_info *info,
+			enum rt_del_reason del_reason)
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
@@ -4001,7 +4002,7 @@ int ip6_del_rt(struct net *net, struct fib6_info *rt, bool skip_notify)
 		.skip_notify = skip_notify
 	};
 
-	return __ip6_del_rt(rt, &info);
+	return __ip6_del_rt(rt, &info, RT_DEL_REASON_UNSPEC);
 }
 
 int ip6_del_rt_reason(struct net *net, struct fib6_info *rt,
@@ -4009,7 +4010,7 @@ int ip6_del_rt_reason(struct net *net, struct fib6_info *rt,
 {
 	struct nl_info info = { .nl_net = net };
 
-	return __ip6_del_rt(rt, &info);
+	return __ip6_del_rt(rt, &info, del_reason);
 }
 
 static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_config *cfg)
@@ -4072,13 +4073,13 @@ static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_config *cfg)
 		list_for_each_entry_safe(sibling, next_sibling,
 					 &rt->fib6_siblings,
 					 fib6_siblings) {
-			err = fib6_del(sibling, info);
+			err = fib6_del(sibling, info, RT_DEL_REASON_UNSPEC);
 			if (err)
 				goto out_unlock;
 		}
 	}
 
-	err = fib6_del(rt, info);
+	err = fib6_del(rt, info, RT_DEL_REASON_UNSPEC);
 out_unlock:
 	spin_unlock_bh(&table->tb6_lock);
 out_put:
@@ -4204,7 +4205,8 @@ static int ip6_route_del(struct fib6_config *cfg,
 				if (!fib6_info_hold_safe(rt))
 					continue;
 
-				err =  __ip6_del_rt(rt, &cfg->fc_nlinfo);
+				err = __ip6_del_rt(rt, &cfg->fc_nlinfo,
+						   RT_DEL_REASON_UNSPEC);
 				break;
 			}
 			if (cfg->fc_nh_id)
@@ -4223,7 +4225,8 @@ static int ip6_route_del(struct fib6_config *cfg,
 
 			/* if gateway was specified only delete the one hop */
 			if (cfg->fc_flags & RTF_GATEWAY)
-				err = __ip6_del_rt(rt, &cfg->fc_nlinfo);
+				err = __ip6_del_rt(rt, &cfg->fc_nlinfo,
+						   RT_DEL_REASON_UNSPEC);
 			else
 				err = __ip6_del_rt_siblings(rt, cfg);
 			break;
-- 
2.43.0

