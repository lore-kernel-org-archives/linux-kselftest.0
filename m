Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28824DCF6
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 01:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785808057; cv=none; b=SEJU+y2t0DXvUCdWey++xUnbaEPVUdsBfdQbe+iMP/x3peKcm0/9BGFiZF9LksVWXKfZiAw18owkx4dpgaZxzlgiul9SJe+1VS1hBHoUyuADh6gdB6jg+Nd7LZc1s4opC6bVkBNFq5vN2LfxdzBQQTzPl15EkA5VJZ90S5CKrb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785808057; c=relaxed/simple;
	bh=+mZYjK+JXE9ujqKx417c17D23v3zCE7WwDdMjT9YGc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=COMEB1tLKY9ncYDrXJ03TFWNx9htty3aPCdCxIXlPlNbVfSExGUudHSf7aN4AcoWeVmPkEpqiV4lHvipP1FXTzAr4QdW5Wu1pJG1YkXrdDLko7CNPomxB7aOQILcoFk7yPkrIl91MAT0hqbHHpJTgf65N4ptPa+76rE789KRs1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkmkM7O/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkmkM7O/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848761b5897so2722258b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 18:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785808055; x=1786412855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72G3fgPcIbW4iriADusE+rK+oWTd09ySnxnQjK9hjw0=;
        b=FkmkM7O/nTkMBe9k7QLXx48ft/EcOR+n+qzUwO2p/eQAkbMQoJ0OucnKfE7KeX9lEx
         gpyGn4MLr58k9jM11jqQJx99Vrytb4taNwQPpLIGaiSQlxKDlM6hpy46/zPtk0BHryB2
         PaqBu5+TMEvDtp+BaW2M3XAjmEhC4VAVaa/r77hSh+98QRCRtV1oVKwTwu0vKH3Lzpjd
         Uc4vCylRwxQdcHf348lURV4Emjvb5yuv7Yy0paUptLrjkFcUkBGsktwpGjWhJ2Odja5/
         egZrAznrtp5JijJqMA7A0d7mS3LtnosRF9OV7eGq9utD7Ald7GMjLhOXYL/QyD56ZGV/
         oEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785808055; x=1786412855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72G3fgPcIbW4iriADusE+rK+oWTd09ySnxnQjK9hjw0=;
        b=plIkMz0r8BTgHitbW76aUyHmZRIo9uq9pPmNqGZm8oY2LEs3G4Dti1zf4OX1ApdSIX
         bO4JwvtZsgrfXxvd8Op0homu4v0igTREAcMhuUI+NNq0xxu2O/1T7ocY843HIjtrphXW
         vjFtoNZE7ft4P6dntwHmznYGpFdMtumgG1rR8LJ1FRaocGWD6BH/imedmR8FF3JSOVXw
         lrAFqY4SoUcLSYEkpbs/0IhedFCjCCEQKlk+TW2DpRDezcdhCLfnAtsh2yyTg+o/MnZZ
         DWHcAV4ZiLEig7XAOD3oYuaA67NiN88eXsBykagSETKlehC508rLZnAIsln1mC5F710H
         CHkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj9VoMJB/eBrGUxfODYTzDI0cz3kYUQpbJ38JOIbaH0MUYLEnhFemvZ9WFgMUlrXiiW0xXqhyMr5wFIJG/02w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9eJ1+hL/c8MB37sd9WLN6p7h7yZq9grc4+R0UdWnBp0eBShMi
	NypgteFvk4nilTqyJmY/+UoxxDa1rNCoRSBOIBK+X9AEzVZROEkeCe10
X-Gm-Gg: AR+sD11AhQwuj/uHQAGb0AGUIQfJ83AMfzeWpoPzHtJnrimWjJGxCn3sjQa0SlBvdot
	kFUPR3Rog5kvJOD/MfA9XDd8lUIZj6WwENiZ5xRUfYAlfalmTUKfsaa6HLMJieJcLZ3a+ztJCaf
	moBumgepT5g/TL2xO2QHx3ILeKwNQ6Ey42mGtROXHhwXO3mLhyje0kzRVGRBysocYZ9sj0YiKq6
	tDxDoJ1KRWwqCODssH7PYpBgq/zDKipcnGS3d8zFPkLPAYG9BZawInjqdk7I+XGnA5KiACp5g1l
	hZt8XvD9YvBH+U2k+BbUSu2VFP8pxrwmFsDX0Nj29VtA9cqzr37xF4GPWqXITMBdfJFUAKqQUzH
	1+aX/k+RVUbKM/zXHXXpsHXOOAa80111njqo3PxA04nyg0BDRPO/+msaRBnjWnV1dQbUvZyN+h+
	hCyQJGH+7bRsTXFJrxI25V1E3RxRlFxnBGb2JKl3lt4kmv6K4q0SGxUMRF0CcvNw4rWSLaeqJba
	+1PLbi16uKXro0n4q3T/M4WZ+e+w2QFetZRfR/rn9O07TRdJjI=
X-Received: by 2002:a05:6a00:1911:b0:847:9745:2f8f with SMTP id d2e1a72fcca58-84ee47b6541mr10898898b3a.18.1785808055205;
        Mon, 03 Aug 2026 18:47:35 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:cb1c:934a:3e5f:ef88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7b97sm4410164b3a.43.2026.08.03.18.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 18:47:34 -0700 (PDT)
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
	Nimrod Oren <noren@nvidia.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v5 02/10] ipv6: propagate the route deletion reason to fib6_del_route()
Date: Tue,  4 Aug 2026 10:47:06 +0900
Message-ID: <20260804014714.4362-3-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804014714.4362-1-sigefriedhyy@gmail.com>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
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

