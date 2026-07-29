Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F747D464
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 12:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326903; cv=none; b=rnGR3CIHw4YJ3AQs2Jx0bNxuIeaAJiLL0asNeSj5veFdFuyIrK+BfciEBYAQ69nNFCcwbQpOAyAFkl/iJEsnwbhzLiCdgzBVMrdqOBNlTpnT0Km//GYx3ABXVG2fplYAyVEU1noPtCxtHSvYctb8cjc+sG9PgFDAlPMzoDPyTo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326903; c=relaxed/simple;
	bh=j/YFlm+6KiqZ96WUYZ2v4lXl72N/2VjdREl7Xf5spFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUfl4o+slcsxz2r2sWZFetlL6D5idCCCrIe/99jTtFx7WGpb6NfXB7gsSzI+qd89NcJhLXHp6+RvOPga/8qs9eMwny71C3IrVk+JK2KdI/p/jNeK8SiXKzj/3Pg1yGJ5FL45obAAlNvS9U5MMGiCeWSBWyp9tZXr3mEQOc4i1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErJCqMiw; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErJCqMiw"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e0688b859so472193b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 05:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326901; x=1785931701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MQfNB1rogDS/50XyM99qlPBLLPAS0y2naXnL1l+SNM=;
        b=ErJCqMiw4Egbyl/FB56BdqZok9ho5jpq3X1n7kvs5p3v70hrQc/AaBXfZRJZRIATdB
         7Jzi6uwQGvYstgo/rQU0iDy/hBXgeKdGirplQx9bCwCTrBFEYtu4IM4LlO5iGtvATXWl
         CyENpq0/cwQB/x583cfug4FKalxiioCxLnD9v+7dypDfpdh7WZE2fEKmNuvDY+JGBaO/
         HNXkrHKpViiZZQ25KfeLVEde8+B/vUu9jixGb6PIhxTWP5RFF9cac5qxJEXq66Wp8mOR
         Ri12D3Q887AwUzNpHgnwmkTJFmWfis46GUVyBP59VWikcpLo7jltmz/UPAoz12h5f+6D
         0+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326901; x=1785931701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MQfNB1rogDS/50XyM99qlPBLLPAS0y2naXnL1l+SNM=;
        b=hS+zeSWOMNsb/Dp8FqtYwayLfSE5VLh+HipTxP2JAA0Bi2500SMHf0zr1j1z1SLjaM
         AEvr7phD1k2A9LR9fkPAFXm0pq7fnRlwp6qzaaY4PBf0iNj/khtyTnG3hkdc7K1EG10M
         jggZ/ONqPb7n60+GvJTZNOMNES+BGtbvr0ZpQ+T2D17Ebb3Mqa+iSq71yRicccaEg4U+
         3XVMbf8UcbQAMb5GP0Kx15vpt+l3aH1wG4mj5wXuymuym77f0PqCs4LQns+OYek/gNtM
         cH96tgLe2ET2PZ7/vAOdEwnsoSwsHxNQvXBunxjQzTo6oI4hnauB7vZvKeFnQswITrJH
         IIlg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Ad00gR9uJMdZyuIAaa1DrrbyAAbDqjMgEdDBehXO+1ATDatydW16kDha00lxLw1F2w0021S97DvvcoEkRO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9O9byeCfy7LZN97PC5MW4SqnytWHw8eUUq6nHUzQnjy528g8
	VbVH+g14gJzQKHFhCf2QH45LVdrKZ1oRejkNrGaHCeQqeglSrThISbme
X-Gm-Gg: AR+sD13LZMcT2j1YsIeJNOyk+z2scwf0E98MZkwEZK0yv51kBcCPEpWMMvM8miku9mA
	Ww17YTrSev81MyMznni6zgF0+601BmYiZPAPRaReNTaW6ophXGoD1aXaZ10/i8Dr41vaJymDPbV
	fCH+W0zf+VaA49GflYGYvtJ58gdBZm4t50nr9JyG6cn3JN9Zs0SudykZjtiZyigSmiox7AGC0is
	slNseGbPDLIwaxHJj5HRhxU7p/vUQVwH6Sk9FPYTwHO3Ezl+HeSAVrn4hu97JxAZVopM80oUixL
	FomJk5/nluC47vM51eKsUrNoTUn+yEWCRdoDLutKzKl1jURIqM6ahqannCq1Psv8Dg6znpJSc8r
	46rDhRvlaRecAP4jPt1sqbBbnwR91LoAvksjLzpJQotdYGVYtcBOxuNclwnjUDm6mGRkYXitjDS
	wqZe7xmxSdFepeIn/ctxHm23vL0iyD6Y8hhS+iSL2WS4CfX2yoG/2Jh06jUjLaF4RGtMUHUwUCe
	3zGCzn3yehlYfs/Vs91a9b569WKlCplrOBh4Q==
X-Received: by 2002:a05:6a00:1390:b0:848:82f0:679a with SMTP id d2e1a72fcca58-84e9335980emr7165149b3a.52.1785326901090;
        Wed, 29 Jul 2026 05:08:21 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:c705:d3b3:a6d9:8512])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0300ac2sm1263482b3a.35.2026.07.29.05.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:08:19 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
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
Subject: [PATCH net-next v4 06/10] ipv6: add inet6_rt_del_notify()
Date: Wed, 29 Jul 2026 21:07:35 +0900
Message-ID: <20260729120739.47880-7-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729120739.47880-1-sigefriedhyy@gmail.com>
References: <20260729120739.47880-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the body of inet6_rt_notify() to __inet6_rt_notify() and give it
the deletion reason. inet6_rt_notify() keeps its prototype, so the
route addition path does not change.

Add inet6_rt_del_notify() and call it from fib6_del_route().
RTA_DEL_REASON now reaches user space on RTM_DELROUTE for routes the
kernel deleted on its own.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 include/net/ip6_fib.h |  2 ++
 net/ipv6/ip6_fib.c    |  2 +-
 net/ipv6/route.c      | 20 ++++++++++++++++----
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index c57980671f28..c6dc23a42c11 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -533,6 +533,8 @@ static inline void fib6_rt_update(struct net *net, struct fib6_info *rt,
 #endif
 void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
 		     unsigned int flags);
+void inet6_rt_del_notify(struct fib6_info *rt, struct nl_info *info,
+			 enum rta_del_reason del_reason);
 
 void fib6_age_exceptions(struct fib6_info *rt, struct fib6_gc_args *gc_args,
 			 unsigned long now);
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index d77c61f53155..159db10a846c 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -2056,7 +2056,7 @@ static void fib6_del_route(struct fib6_table *table, struct fib6_node *fn,
 			call_fib6_entry_notifiers_replace(net, replace_rt);
 	}
 	if (!info->skip_notify)
-		inet6_rt_notify(RTM_DELROUTE, rt, info, 0);
+		inet6_rt_del_notify(rt, info, del_reason);
 
 	fib6_info_release(rt);
 }
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index b67c8a31ccd6..304879c6e7e5 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -6376,8 +6376,9 @@ static int inet6_rtm_getroute(struct sk_buff *in_skb, struct nlmsghdr *nlh,
 	return err;
 }
 
-void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
-		     unsigned int nlm_flags)
+static void __inet6_rt_notify(int event, struct fib6_info *rt,
+			      struct nl_info *info, unsigned int nlm_flags,
+			      enum rta_del_reason del_reason)
 {
 	struct net *net = info->nl_net;
 	struct sk_buff *skb;
@@ -6396,8 +6397,7 @@ void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
 		goto errout;
 
 	err = rt6_fill_node(net, skb, rt, NULL, NULL, NULL, 0,
-			    event, info->portid, seq, nlm_flags,
-			    RTA_DEL_REASON_UNSPEC);
+			    event, info->portid, seq, nlm_flags, del_reason);
 	if (err < 0) {
 		kfree_skb(skb);
 		/* -EMSGSIZE implies needed space grew under us. */
@@ -6418,6 +6418,18 @@ void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
 	rtnl_set_sk_err(net, RTNLGRP_IPV6_ROUTE, err);
 }
 
+void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
+		     unsigned int nlm_flags)
+{
+	__inet6_rt_notify(event, rt, info, nlm_flags, RTA_DEL_REASON_UNSPEC);
+}
+
+void inet6_rt_del_notify(struct fib6_info *rt, struct nl_info *info,
+			 enum rta_del_reason del_reason)
+{
+	__inet6_rt_notify(RTM_DELROUTE, rt, info, 0, del_reason);
+}
+
 void fib6_rt_update(struct net *net, struct fib6_info *rt,
 		    struct nl_info *info)
 {
-- 
2.43.0

