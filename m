Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7994630ACE6
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150624; cv=none; b=SI+c4n66tZi4PX5nmD0G4R4o1I7PuHp2FGvdycug5PqY6cS4ZECLgT/YFM3ix5P2ZrpFkOUXXBs4fcRQGYccd9aVKjTURFU5KGVXMh5j6zRxL/PYvh/sS4M5Anbmpuq5IleqVIbKqYvbMlqNFbXYyqcXCe1q3GAEuVV9k9GS2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150624; c=relaxed/simple;
	bh=XQJawEmB4ChsklAv/eN7LUVOMlZahRxCMEiqQmik0xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZK41rYOZN8R/vHXh9oesyO6MSPzf5Cr3WA/7hYnpef/Nj8AY4eSCsNBq5EH8HiUgXUt3u8cco/Y9u4cJqaob+64sIJ0vr/nPj+t5GzDoGFhwyw5hhn5TGwEnTRZ80pmevRpXosKPR5PtTX0gKTbwHgP5v5PxZNfm20+7tWpb9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6PU/HIz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6PU/HIz"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381b831d535so168662a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786150623; x=1786755423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1uuKJgg5m2EeiKe39lLJSMZdROY6ZIIFzIHwqt463s=;
        b=j6PU/HIzDFLyEw5cXWhHi9Qt4wDjYCK4cBi1CbnYLtgy+aIEPa1T9UzqZi2Uw2V16h
         Nu+lfPQdKCL2zPPKbF6s7qq3jx54+bUzeI+QlCDBEI3aDXYKlVxZi5RDPdKsr4KWy3ZX
         DfPzsWxGt36AtmtuvY2wpq42GDtEw6vscsbhH2eL1gOE9qcjBis7jEkRVmrz12wVVBOd
         0N7Fo7n2PSx7fCZmBgRNHfFvj5r6yWgP/FC9X/clETAo2fI1ChTMxjqh08jehHrImIR2
         oCO6bR4AQlxHNmqvNhjdWCY1sEkWs+ZeiAjYDR+4lGRqqzF7lRMmJY8eogubTsrF8F6d
         Uw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786150623; x=1786755423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1uuKJgg5m2EeiKe39lLJSMZdROY6ZIIFzIHwqt463s=;
        b=OF1CXaCQK+G8cXw0XRXgskUjL3tOJ1KvQzxdV/kVRS9SE77DzmJWEmzOxpKChWCJB/
         rIQTXbW2fPxEtIMYHOOHAO+sAgu+2wIu4MRhzbYK1Ym3e44V9ayT4lffrk/fq3cMnH94
         MLZ+kKcC4kt80npNdnHrgJdQKI47dl02bRwrf0Q2L3gsrcJ+BtA3Ev5H5PFyPWyHjlEa
         OYqFqf2iuzubHKT++4jbopgwsiVT84QDOhzSaM8qJAQQpDOdjVTF4xYmmUE4xFU2QQF+
         aeNL0Kwa1aQtmENnXN47eOOAAqP8bSle6TJs2uEu7ylQm+TBONY1GLaHPsfPvKsT0Iaa
         rtOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHqBntvCiKBII33wf+XluHMO8ez3CMkxDnPxiIVw6Xlt2REDMtdwsCJn9ixw7IJNKg+FdGOcpHufpVoHOt0MA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTmQKUWUOHto8vWa35bQnb0gFkXLN+RGo4f/3RvtLuPk2GlRUh
	eNYbIz87f620dAVs8VJv4QC6kuSgnPUBFQ9L96nHlREEXAeleIedtvUs
X-Gm-Gg: AR+sD100cq+eDTDBQmZX9EVHZV9qoaB58BagyR3ul6UjJBsSWu02B3Odp0XXoQnUYkF
	PsKrYJuPZ67qZ3qLJfzIMRVirQuhkwX92dpvfKF0GpFkWUH4fsEMZxrm0cKVazz1ppF03nUSiq/
	eJgO9t2yPBTrNx8XAGZsqzd5feig8NNEEj6X8oryb6AWu/DmDXq5DnHsj+Klii5Yr86HhWPH8zK
	SCKZkw08CZv5c8Chk+5B8nyzsMnlBoQbn7AvWKfi8HxS8RMKCsIsTvSBQFeY6StWnzUuyT3v+vQ
	0jM9kUIvV1XkGaw6EQeScR6hMoG4ECBvuCgcGn0awmqrJhuhzvc7jS1657MRxQAn8c7Q3zLa/xF
	djzhqLP4LLfH4RCBUG8v/YI1gKHWvHH1iZpCYAJe1euLMxfevCUESK05u7SvmkCs8W/d5IU1z+L
	FI5QRwyg9N6MNMbs7ZfM+PE5EOXEZI2KtrflUPF7+M4sWjIOamIgb4EXGnvyIKf7WvaEQM/rm2O
	FZEa+REK1sTX441g66vzptH+zVcB2nmhKGuZxrw7vkjiK8yI9Q=
X-Received: by 2002:a17:90b:2dc7:b0:380:fead:448d with SMTP id 98e67ed59e1d1-392620e6e25mr8963187a91.13.1786150622906;
        Fri, 07 Aug 2026 17:57:02 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:d7e9:6449:7464:1dfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm4205182a91.2.2026.08.07.17.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:57:02 -0700 (PDT)
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
Subject: [PATCH net-next v6 03/10] ipv6: record the reason for kernel-initiated route deletions
Date: Sat,  8 Aug 2026 09:56:35 +0900
Message-ID: <20260808005642.26901-4-sigefriedhyy@gmail.com>
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

Record why the kernel deletes an IPv6 route on its own:

- RT_DEL_REASON_EXPIRED for routes reaped by the FIB6 garbage
  collector after their RTF_EXPIRES lifetime ran out.
- RT_DEL_REASON_RA_WITHDRAWN for default routes, prefix routes and
  RFC 4191 route information routes withdrawn by a zero-lifetime
  Router Advertisement.

Deleting a default route because its metric changed is not a
withdrawal, so it keeps RT_DEL_REASON_UNSPEC.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
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

