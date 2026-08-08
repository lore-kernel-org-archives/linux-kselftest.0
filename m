Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A655830DD2F
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150630; cv=none; b=WPl+4DoJ/5UldZsO2/GcJ3Gwb3hOLDuXJMXm+6q9aXGNBZV83UjR8CEMwAyoHbiGcgQorKqx+3LVnc8Z0oMS96MgoeFZTHpe8OgK9sIxBn+8vmkbnvnsBeJ3Y2eukpn+uR5RmTZ2JiXucdjieeiz7RiLN1587yc4D8/6vISIsfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150630; c=relaxed/simple;
	bh=fWRY/BVInbtKwwxx8kY/fDClI/KPxpsYiPVnvVfMlE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LDGZkB8/SOm34nuj/UsJ9uAayzjC3iyMqf3aCj5vQ0cBTNrcuWPBOweihtnwAI1y+gW0/fi2Lqv19TxltcJ+U8rrFfbAuit8TrZ6fZ2pJvLY6SRJwudyCxh+Qy5pcgZG2CPbXQkOzXYrdozD+IJqQ9iu0Xg76RKbM2wHoluwKuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9KoDqw5; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9KoDqw5"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e58034d05so87943a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786150628; x=1786755428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4jPqOjdoT8ifNwfss2R1qo2V56xomcYJOjozZZx/JE=;
        b=U9KoDqw5J4wJgGrsLhKq9FRq55VXNKEm6/1/YfKqvRQICFRIYcJCD7kz64J97ETbN0
         Nvk9LadtpnADxrjAIItbjo9I8iylUt54+Wl3eHSq/txgBTjcRKv18b+mQpUmwJZPGU3S
         3DGgOxfCnTNWdGW2HAJXt1/d0/AaeyjgormLLDMspM5gWOOoef6EMSpjxdbzvA+y/EDp
         fFwjVx3qA5npfT61N5fjM4nkuOYPv0WLRSLdS9tRvA4eBWsk6Nc0O7/46lk83/TQYtm8
         YILAQB3koOuaii17lhf982BiJMMGeEgemfS+iCiOGQFBLg0Lcg3FEYLkCvjjmjKIp7UI
         woxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786150628; x=1786755428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4jPqOjdoT8ifNwfss2R1qo2V56xomcYJOjozZZx/JE=;
        b=O9+8uTBDcCrQIW9gFXZzN8Z6JrcFAnOiolMoNc/37GuXMDmx4+UseqRKERiVV6tL/1
         SJ1vXTHda+/lxis8wAV8b9KK/ovspXrrCQz7PYoFDMrFDd0wvcLfGvTnxJt/vzx5gCkt
         XhjixnwTyb4gQRlqDlkcZ14m9hKC3UiKdZMeCqYewy1y6RAvxUDQ/9gWIR9KfQA0d8PU
         GZqBCfDXC6dbKkXZuGp8DZMxr65mRqvf5hT9nPTX6i7o+m+nepPr8TyK28M/g3puyw+b
         KqeZoiFWaFUh4HFWSvle0HcrwplgxnYbYa0fQqVh84iviptsMIKAcxmNLw2vxyNPeOuc
         xDrw==
X-Forwarded-Encrypted: i=1; AHgh+RrrbfwZ1Oci6lt32/JeLZbxcfXbwPluMsdZRo1UAV8pLKb2LBM8BX0v9Yjnk4WDAHwrm9NbJ4IUClbn1XwGANc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtWCGJ4sw/2zY+QMDt4gj+HBj2W3JnSSkYXTFZGDZ0KUDPfqYD
	BZyCkO5Dpo7BDDvA9p8x2RsoWgYwf9DEqmeqM1jQ3GfWJ+VauyJHTrER
X-Gm-Gg: AR+sD107By6qvVZWQBSkkX5iEIBXL2jyeUuedlTMxd2iIQLqld5Uv4oEdRBZ6J8R6Vf
	TU17GPDAp/TPFrKWwcrSSNJFC9DJ1lWQVbRpq5uBAejrE7KGgOox8bsN9V8NbpADok1iUi00YRG
	7CM8tml8ZIOTtK7K3FYtPEZhoQaml+mf49bS0oJgts4Hk3EThDt7MMVSZXM02r3RS+fzKljaQlk
	y2yDn9FZQF1nOpA0eQdwMNm1omI7gYkYV3j8kpW5iuoo27FD7zfrJdCqe3JsmnwGPwk2f+XNaNS
	j5BCvUO0ts9p1iFQ7Fc0sfaG3834T5hSUT/oPFDMyGBrzQ6sJdPxFnQoXAVkg2iQugFDLZvITUH
	J0hTKEPOkwKNmt/ziNRAMm5hOrqGUYL5yI5gSAfMaJVX/rMEe3fcZNzyMfidwb3wEg1EuzlllzB
	D5MEWCNYGhKGDE/kFVMzZMJ6C78BBaAh5tcjlWRifQW9kW7sCYIkr4vTlu+FHXJOpreeY54i4Fi
	lt1b9LUKy4EL4gnBSUZhTWxI+NlVvKY8sQS+dO8rdSNxTesDN8=
X-Received: by 2002:a17:90b:270e:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3903bb0cf61mr28884033a91.0.1786150627679;
        Fri, 07 Aug 2026 17:57:07 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:d7e9:6449:7464:1dfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm4205182a91.2.2026.08.07.17.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:57:07 -0700 (PDT)
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
Subject: [PATCH net-next v6 04/10] ipv6: add a deletion reason argument to rt6_fill_node()
Date: Sat,  8 Aug 2026 09:56:36 +0900
Message-ID: <20260808005642.26901-5-sigefriedhyy@gmail.com>
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

Add the deletion reason to rt6_fill_node() so that it can report it to
user space. All callers pass RT_DEL_REASON_UNSPEC for now.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/ipv6/route.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index bb14d7f7bad4..6732e95bf7b3 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -111,7 +111,7 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 			 struct fib6_info *rt, struct dst_entry *dst,
 			 struct in6_addr *dest, struct in6_addr *src,
 			 int iif, int type, u32 portid, u32 seq,
-			 unsigned int flags);
+			 unsigned int flags, enum rt_del_reason del_reason);
 static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
 					   const struct in6_addr *daddr,
 					   const struct in6_addr *saddr);
@@ -4037,7 +4037,8 @@ static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_config *cfg)
 
 			if (rt6_fill_node(net, skb, rt, NULL,
 					  NULL, NULL, 0, RTM_DELROUTE,
-					  info->portid, seq, 0) < 0) {
+					  info->portid, seq, 0,
+					  RT_DEL_REASON_UNSPEC) < 0) {
 				kfree_skb(skb);
 				skb = NULL;
 			} else
@@ -5786,7 +5787,7 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 			 struct fib6_info *rt, struct dst_entry *dst,
 			 struct in6_addr *dest, struct in6_addr *src,
 			 int iif, int type, u32 portid, u32 seq,
-			 unsigned int flags)
+			 unsigned int flags, enum rt_del_reason del_reason)
 {
 	struct rt6_info *rt6 = dst_rt6_info(dst);
 	struct rt6key *rt6_dst, *rt6_src;
@@ -6066,7 +6067,8 @@ static int rt6_nh_dump_exceptions(struct fib6_nh *nh, void *arg)
 					    &rt6_ex->rt6i->dst, NULL, NULL, 0,
 					    RTM_NEWROUTE,
 					    NETLINK_CB(dump->cb->skb).portid,
-					    dump->cb->nlh->nlmsg_seq, w->flags);
+					    dump->cb->nlh->nlmsg_seq, w->flags,
+					    RT_DEL_REASON_UNSPEC);
 			if (err)
 				return err;
 
@@ -6114,7 +6116,8 @@ int rt6_dump_route(struct fib6_info *rt, void *p_arg, unsigned int skip)
 			if (rt6_fill_node(net, arg->skb, rt, NULL, NULL, NULL,
 					  0, RTM_NEWROUTE,
 					  NETLINK_CB(arg->cb->skb).portid,
-					  arg->cb->nlh->nlmsg_seq, flags)) {
+					  arg->cb->nlh->nlmsg_seq, flags,
+					  RT_DEL_REASON_UNSPEC)) {
 				return 0;
 			}
 			count++;
@@ -6347,12 +6350,14 @@ static int inet6_rtm_getroute(struct sk_buff *in_skb, struct nlmsghdr *nlh,
 			err = rt6_fill_node(net, skb, from, NULL, NULL, NULL,
 					    iif, RTM_NEWROUTE,
 					    NETLINK_CB(in_skb).portid,
-					    nlh->nlmsg_seq, 0);
+					    nlh->nlmsg_seq, 0,
+					    RT_DEL_REASON_UNSPEC);
 		else
 			err = rt6_fill_node(net, skb, from, dst, &fl6.daddr,
 					    &fl6.saddr, iif, RTM_NEWROUTE,
 					    NETLINK_CB(in_skb).portid,
-					    nlh->nlmsg_seq, 0);
+					    nlh->nlmsg_seq, 0,
+					    RT_DEL_REASON_UNSPEC);
 	} else {
 		err = -ENETUNREACH;
 	}
@@ -6388,7 +6393,8 @@ void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
 		goto errout;
 
 	err = rt6_fill_node(net, skb, rt, NULL, NULL, NULL, 0,
-			    event, info->portid, seq, nlm_flags);
+			    event, info->portid, seq, nlm_flags,
+			    RT_DEL_REASON_UNSPEC);
 	if (err < 0) {
 		kfree_skb(skb);
 		/* -EMSGSIZE implies needed space grew under us. */
@@ -6421,7 +6427,8 @@ void fib6_rt_update(struct net *net, struct fib6_info *rt,
 		goto errout;
 
 	err = rt6_fill_node(net, skb, rt, NULL, NULL, NULL, 0,
-			    RTM_NEWROUTE, info->portid, seq, NLM_F_REPLACE);
+			    RTM_NEWROUTE, info->portid, seq, NLM_F_REPLACE,
+			    RT_DEL_REASON_UNSPEC);
 	if (err < 0) {
 		/* -EMSGSIZE implies BUG in rt6_nlmsg_size() */
 		WARN_ON(err == -EMSGSIZE);
@@ -6474,7 +6481,7 @@ void fib6_info_hw_flags_set(struct net *net, struct fib6_info *f6i,
 	}
 
 	err = rt6_fill_node(net, skb, f6i, NULL, NULL, NULL, 0, RTM_NEWROUTE, 0,
-			    0, 0);
+			    0, 0, RT_DEL_REASON_UNSPEC);
 	if (err < 0) {
 		/* -EMSGSIZE implies BUG in rt6_nlmsg_size() */
 		WARN_ON(err == -EMSGSIZE);
-- 
2.43.0

