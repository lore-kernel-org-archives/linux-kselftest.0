Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DC824DCF6
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 01:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785808063; cv=none; b=QnBAqSuKTSKnCjdXk4xXfaoVda+N05BhTS7uZrwgCWujaC63XYsRCiS8ZMvwH0gXqwM3dnaSPbvmgWSmEVDtrrjgSeplH6zINUFx7Rv4QfyLCsWkR3o0ogIUUjLLjIeAeV2YY5gl/f9+7YCC+QRD788hXxveU3mHlwLVV5ZtIiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785808063; c=relaxed/simple;
	bh=g04qQoyUb5HCdV4/wu+1kAFaWTUGCfq/B4BYuQgdtio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjZGdHP3Wk7/exNJ31Cs9uVy84ma6pifURXnzogvNrvWmZox3pmDjgF0JI55NP5yQ8IbYZpfAm4KbCNOSCG3Ujrkuhtl5oGWMG6SB/DUDoIuTS1ysoQJQsVjVloNyjJc8MAYguPPsrNonePans8HIRdAo3AJ3VJmHKvurYQ3trc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZkQR0TO; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZkQR0TO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso4340328b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 18:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785808061; x=1786412861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpWfveSHmhLndp7WyhzOeHb/aYZ1oeXtiQXrHkx1fpg=;
        b=iZkQR0TOD245IX44X6nk5zuKBRFgvedZVkS3dlArpzqOxIy9y+XdvENcy6MynxhJVz
         8XndwW/mcdQWMSnkRP2WlQcxasxtHDJ0Y6dXKCMI73ad3bOAejIyTt7tP5kspG/N5Pl3
         /pmAkczMj3Jd3Oowv6VRvVKXBgbGGDjHOl3O3KJkxdOV8oESxofZlum6PeG8+9W4mtHU
         rk6Xyo9UsSlRmbXdsGXNdo0FjLoiYuwkC1JeGtzTYcpsSQX0GmV9yO7cs7ews1QJfgoJ
         BxQX/2CUivRx9EyDiLC0zADfzhREPPOVof10MZnlbOfMg83sCBO4QqGZRqZcVPA4rHKu
         hfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785808061; x=1786412861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpWfveSHmhLndp7WyhzOeHb/aYZ1oeXtiQXrHkx1fpg=;
        b=cEtr6WX8AfQnAwDpE1k8pwmHIo2rUMyVXrpPB2B8bW8Ue3GlXJ11B9rGcZiiOPCEaK
         jO0com6pIEXELWcCxpUuT5Q/fBKluLV5kaRUofqcvZqlfRoLERjOjcFyHqa0jLR5OWBX
         NWL5RYcPzP82WhnZN+aKJFQoaUqKjV+2EEOfIg0JRebbywjoN5REtrPu5TQIncxWWkJE
         Lh/Wis5Hqb+uZBopSiM/tkH8FxqWyyl5DcMg9f5ScF5GGnzIKAGB9IaXe3O4HIm2EPMO
         bkR+0WaNdROx9/JapOWthNn0hzE5xe0KeJfneOGMGB6t+/P77YlHb4dd6gyHKzxLqyuL
         lYqA==
X-Forwarded-Encrypted: i=1; AHgh+RrzZKPy+f7eMHiNb6UJ2sPG6h8ekPve45bzdZtkLAd0lRipHIKsLz+EmYyUCtzziZAtV0nNc4WnpjTnnf5uoUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAY5XdA6KBBv56cSl7UbEIgmVlKht1EOUFjxFBPGwS8XrWEOzz
	E0Wpd98ojJuH8oBLQD6qpMyhkkr0ru4E3kttyJL05BIw0zK/ociCgnyn
X-Gm-Gg: AR+sD12suMO/bmGA1OsTAeZ8WkCcklhX+L6MhZIfxEWSgecqMLn2mzKCMDR3gwMCe08
	AuWXDvXDjHt1Xn3GyXJErMAn4yHxtcCTbfneQSOS+9wITzQ8y4SIZtmSBAai2fyTAN3LIL6yL2C
	5IeSeDmBxZSqFZnQBfk1tXvnI2Otcu+hFIn7E2Q9W4ZpTXDT2mzkPAHOowr/u+NjodHSVf3cqzo
	+4xxLWZqZg6aEj+AuCicOfl0Bdsv/Esv7FlbucwsQsGpF2RIuxEcUxyaS73kDALZr3vtBJaUPey
	LMj6WJEgmCWIZ67mxijCyX4umGNiscQk8MqC/bYphJgLgL/PH1iKnWaLMb8oOUJ0Ilntp1YGsYj
	71hwrREoPAHJZoc7w1P4/0ID8lIxg6uRrPo8+b/RKrZHU/Kz7cyQ1oZcTyclXwUByhwY6z7dln1
	WNWzRMHBNYZpFHiAX29B2LQCLLLRK0g8qu7voA8YruRy/HDZ9W09LI4jX9/VuxRw4v1t31QllVg
	hTdUo3fdeA8uAdeQgKftzZqa+R6Ji1O28DCkVNN+tZf/fC+tZg=
X-Received: by 2002:a05:6a00:4518:b0:848:637a:4cb0 with SMTP id d2e1a72fcca58-84ee49ac188mr10538511b3a.60.1785808061205;
        Mon, 03 Aug 2026 18:47:41 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:cb1c:934a:3e5f:ef88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7b97sm4410164b3a.43.2026.08.03.18.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 18:47:40 -0700 (PDT)
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
Subject: [PATCH net-next v5 03/10] ipv6: record the reason for kernel-initiated route deletions
Date: Tue,  4 Aug 2026 10:47:07 +0900
Message-ID: <20260804014714.4362-4-sigefriedhyy@gmail.com>
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

Record why the kernel deletes an IPv6 route on its own:

- RT_DEL_REASON_EXPIRED for routes reaped by the FIB6 garbage
  collector after their RTF_EXPIRES lifetime ran out.
- RT_DEL_REASON_RA_WITHDRAWN for default routes, prefix routes and
  RFC 4191 route information routes withdrawn by a zero-lifetime
  Router Advertisement.

Deleting a default route because its metric changed is not a
withdrawal, so it keeps RT_DEL_REASON_UNSPEC.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 net/ipv6/addrconf.c | 3 ++-
 net/ipv6/ip6_fib.c  | 2 +-
 net/ipv6/ndisc.c    | 4 +++-
 net/ipv6/route.c    | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index f6fa2715b450..9d89be7e0544 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -2874,7 +2874,8 @@ void addrconf_prefix_rcv(struct net_device *dev, u8 *opt, int len, bool sllao)
 		if (rt) {
 			/* Autoconf prefix route */
 			if (valid_lft == 0) {
-				ip6_del_rt(net, rt, false);
+				ip6_del_rt_reason(net, rt,
+						  RT_DEL_REASON_RA_WITHDRAWN);
 				rt = NULL;
 			} else {
 				table = rt->fib6_table;
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index 1f6f6f33ded1..f8a9ec7fa616 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -2403,7 +2403,7 @@ static void fib6_gc_table(struct net *net,
 
 	hlist_for_each_entry_safe(rt, n, &tb6->tb6_gc_hlist, gc_link)
 		if (fib6_age(rt, gc_args) == -1)
-			fib6_del(rt, &info, RT_DEL_REASON_UNSPEC);
+			fib6_del(rt, &info, RT_DEL_REASON_EXPIRED);
 }
 
 static void fib6_gc_all(struct net *net, struct fib6_gc_args *gc_args)
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index fe36b3f51285..1111c4ebc61d 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1361,7 +1361,9 @@ static enum skb_drop_reason ndisc_router_discovery(struct sk_buff *skb)
 	defrtr_usr_metric = in6_dev->cnf.ra_defrtr_metric;
 	/* delete the route if lifetime is 0 or if metric needs change */
 	if (rt && (lifetime == 0 || rt->fib6_metric != defrtr_usr_metric)) {
-		ip6_del_rt(net, rt, false);
+		ip6_del_rt_reason(net, rt,
+				  lifetime == 0 ? RT_DEL_REASON_RA_WITHDRAWN :
+						  RT_DEL_REASON_UNSPEC);
 		rt = NULL;
 	}
 
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 252f1825a199..bb14d7f7bad4 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1020,7 +1020,7 @@ int rt6_route_rcv(struct net_device *dev, u8 *opt, int len,
 					gwaddr, dev);
 
 	if (rt && !lifetime) {
-		ip6_del_rt(net, rt, false);
+		ip6_del_rt_reason(net, rt, RT_DEL_REASON_RA_WITHDRAWN);
 		rt = NULL;
 	}
 
-- 
2.43.0

