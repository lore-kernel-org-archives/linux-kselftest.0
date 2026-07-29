Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D047D459
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326885; cv=none; b=VHtp8nkC3TqTAn8AAqeM5n5Wk6kG8L4ZhkPq8ZXWng+lbKBHIsubesvQGl6uC8Idt+/bYX6xsbY562CBOZcso7kiUaXJ5uiTAZfLeDmSVYXp5fD7k62DYl6jKdiQxyUIWN2wz+9q9q6uVKHuWBz7TH9SnuEJsscfjRg2cFuxrs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326885; c=relaxed/simple;
	bh=sELrnQ2yMBL8rHoMgZ51jkox5afN/YK+bJqWLG9PKdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMyNDWrFiNci5otknOOikPX3Eca6XFnQNmCNygU5jRzU20FrJ34juZZUMyH+UNDeXloc0o6YQL1WuQfKZR+diMIR3JSQVaJnRyC6GInZReY1MdL5TGqqGia3LdEb1o/zvyHQMf5njUicW5g8nxzYMdfFm+0QGJig88UNwymqXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKAORy6i; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKAORy6i"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1270918b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326883; x=1785931683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gu3aSZvtpbBhakJ45baaB5YSjEDUrp+D3QUTuf9uivo=;
        b=QKAORy6idMlUPwwEuIQ7n8PpNJocujHCL3Ec0aj0N/yyes+ThEhf66ra+3YXtbR192
         A2RBG0phLFcmpm0Vun+vnNZmZbV6PsFMy+L+rrs1MB0WaZ8XV20ta/WLwtCWtwNXKHDD
         MPK7I/vfcHpHDNSPQwsYqqj+60C1qU5UN4XO/z6fn75tFFZ6bmmb0TWL51wiWD1jxohk
         POVKkwWwErPIYhaffexkeZ8gL88P9nnbxmvJOZdvgceQSrfHJOxbNL50emPj5qdceYRT
         28UfOB2oaXQamaV8Lhd2E3eKzQmpLxmFhKjXaQVLJ/M1WJ9Ce/S/RjXo+a9LHxbxvW6m
         jZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326883; x=1785931683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gu3aSZvtpbBhakJ45baaB5YSjEDUrp+D3QUTuf9uivo=;
        b=pOgTYsk1EtDf+zXA7HU/nyiUywMNvnP0p1FRl4UDkB7swc2hB77H6Jy9Bkd5K9FXal
         CHem3uLBvR66AYNmnYoEr1bZP5SZZuox2vo++Ilp6ThIVnI4BwOMIHu+Up2IcO2HtpGB
         25CFWDmXzVhA4l6BgQG42lw2IsjNRJ/wqQjCdpc0wEyD3gWXY7gMIOHxK+cFDKq7nefp
         epWyBXHtKGVSlRU9xMJSyscCuvkECre3gPnRyO6Q8npsqyQwgq2TjtQE4mhHIKWQlcsN
         RaPq5obLc7lffLku49JPB2/iR0PaFpMSH8XkZXJfmE9q7YS8mjQj1xc4GT3KNpA+zCsk
         aLuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiKJcPnTx8VvGuXFPBX5tRj8YWHS0OVla0tS1DDD1nGyCJyTfHJwVxCFuVv1il0UugqDfpQPAM073PKViP+wA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIe9MdVYmhFu9PDAWItCf112ZLlEsYwKZJ497Ag6i8rGIPZbr4
	76Xmi7ZY3jxc0KylQvU+d5IfM6U/jCqoJhqOyGLKHMEWQljq22pbm3Kg
X-Gm-Gg: AR+sD11IXPOHBiJ7uAojKZBg236oh7kWTBnze3BfiseiLJIP3v7aLyrpmVtmzCl/1R+
	x9ukGHHFx1QnzQYE+vetluu/bJMJnrNDWm8J58a0CvNLaI09Nmjn3QGScvbDkKdGiqweDlIPs+7
	b8atA4xKukTJZyru0IttuqJyQFRxrLYVM3GDXXfh+nTJGod2Veq/rDLjUSWQz2lrUZuKhF+gG4o
	GEWvopkVgSYJrG0yT8HB4Wb4mPXpjBjq+ZKMUGz1fCgliJ2fB2Qnm7irymuTfRLClNMGcILI0Dy
	B0xsWjg993y1iD8C8GexvYJu+nV5lUadriaFxNfvvtSNRtwiKxfpflIY0nhtxiDRQBw6vNmRCG6
	lnRJFVK2CSK5cXKZVuGfQhpV/b4ml+vXNZ5XBxFKJbvUnUD0P2nXeEW6NjUF+zARL9bCbZZAdDe
	KClx/8ULrUwGvppoyVxWaqmKJZPima6bTJjtvw76sfExxlxKMpe4AGkMUo3FHzYAb+cwEyUetM2
	aMsir/gBJaDbTqpvhgOE2OxbZ+YNz9lh9fGgSezR5z3XwPq
X-Received: by 2002:a05:6a00:14d0:b0:848:2f77:e2e4 with SMTP id d2e1a72fcca58-84e933abff7mr7112261b3a.77.1785326883391;
        Wed, 29 Jul 2026 05:08:03 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:c705:d3b3:a6d9:8512])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0300ac2sm1263482b3a.35.2026.07.29.05.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:08:01 -0700 (PDT)
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
Subject: [PATCH net-next v4 03/10] ipv6: record the reason for kernel-initiated route deletions
Date: Wed, 29 Jul 2026 21:07:32 +0900
Message-ID: <20260729120739.47880-4-sigefriedhyy@gmail.com>
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

Record why the kernel deletes an IPv6 route on its own:

- RTA_DEL_REASON_EXPIRED for routes reaped by the FIB6 garbage
  collector after their RTF_EXPIRES lifetime ran out.
- RTA_DEL_REASON_RA_WITHDRAWN for default routes, prefix routes and
  RFC 4191 route information routes withdrawn by a zero-lifetime
  Router Advertisement.

Deleting a default route because its metric changed is not a
withdrawal, so it keeps RTA_DEL_REASON_UNSPEC.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 net/ipv6/addrconf.c | 3 ++-
 net/ipv6/ip6_fib.c  | 2 +-
 net/ipv6/ndisc.c    | 4 +++-
 net/ipv6/route.c    | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

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
index b6e3bdd20cd0..d77c61f53155 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -2402,7 +2402,7 @@ static void fib6_gc_table(struct net *net,
 
 	hlist_for_each_entry_safe(rt, n, &tb6->tb6_gc_hlist, gc_link)
 		if (fib6_age(rt, gc_args) == -1)
-			fib6_del(rt, &info, RTA_DEL_REASON_UNSPEC);
+			fib6_del(rt, &info, RTA_DEL_REASON_EXPIRED);
 }
 
 static void fib6_gc_all(struct net *net, struct fib6_gc_args *gc_args)
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index f867ec8d3d90..713db9089d5e 100644
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
 
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 7574c385105f..d2b9f9a899cf 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1020,7 +1020,7 @@ int rt6_route_rcv(struct net_device *dev, u8 *opt, int len,
 					gwaddr, dev);
 
 	if (rt && !lifetime) {
-		ip6_del_rt(net, rt, false);
+		ip6_del_rt_reason(net, rt, false, RTA_DEL_REASON_RA_WITHDRAWN);
 		rt = NULL;
 	}
 
-- 
2.43.0

