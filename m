Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7232E73E
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150644; cv=none; b=EcXZohJMPzzkFa64pwmb9fxXQRAfEk2FQbzGSSnUp4oEtZjMQHGKrdq54p4F9KfojS5WbfndEdO0tib0/igtctwetM0rcn/Z9+JpBX0y737ihGY+zU4/8s3j7QGlYCeZAWxloNhfE5PP51BUG76VFrAPoaud2qBv3JMSMuWTFOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150644; c=relaxed/simple;
	bh=B7TewygujZnaDoAvFCdYw3/qv+UCkSEJvMuQcq5Qjm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJr3yhXkNj8qzgPmT/JQcuIEM8QYrox2VXzXwxQNEioOplCf7yVmz6IngiKcZ5WDVQ7BX8ea3psOHh1YpO2GfwuTNWeaaGyis29ANbDpwLQnfd2uhm+t9ETME9bAOi5J+87yHzqtJlUaOu8hVcs3736ygaN7GDYrI2uADOf8Yxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auylG6Ts; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auylG6Ts"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso1344595ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786150642; x=1786755442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gzb9FT9wUkGMcUEIoMcEc4INRD8xMXaz2c0lYN6UOZs=;
        b=auylG6Ts5PHtDVCNxO+NEniCxMYwPWfPjBTM2A7jVmRXGQOIEUW9BJ7b/c7ktYAOmP
         VS+kr6heR5f2bYeEsHlmCmjmi7jmrfEcYkFb2Ua8hhJeOBVQVxbaqa5x/Vxk1VJODSyW
         Q2u3+c0Di5bOJtYmvOLOzKxjCsb2neRweVZZec+vYou7+9jcP/CUMMQcqM/gvU4bciJM
         dpxmet/odXmct0ibSpgn8eixzEDMBTwiWHICAcu5qRjU8E7/XlLhLQj9ACCbt7t3oaxw
         gPO7IPp0EKmEkvX0fde3h4Db2h/MIJGt2gyAJLmwMZi5a0UJdmrlA5hrY2z+TFVvUTxZ
         7EXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786150642; x=1786755442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gzb9FT9wUkGMcUEIoMcEc4INRD8xMXaz2c0lYN6UOZs=;
        b=YAOvoYk/UDzJwpfjN7z2+EipvJCHXdPKCbRrRoYggM/D9AZ/nQnNq0+L4mCgume3JI
         iAN4JMo5Q3YGzv5+vGsEs1mOrxcO22KShMnhuro+aSDuyQHdIpZOfNNW7NOOlUjgRRcb
         aokMZYiXhxX2f2nhTrIDX0Nw3geCONrUfSPSmel0zKOhtfDfkK8JiMKRKjfmkRARD1H2
         bN12MryvLXS/renQnuaLtRoEeBkGKihjuTxxh/CLS7l1Y7bQJCYnUmZP+i/m1lxHVOu7
         nE8uvX2fYWK0LZRJz+br8+lwIK9oALB7YFC4H7Qq4GFQnPZdw/5LJxg89RJ6UuH3D70r
         /nhw==
X-Forwarded-Encrypted: i=1; AHgh+Rru7EuqTHMTsp3dOvxbVjeSglwkaHEp1wmZkxipadkG0LbsVl77En6QZAqZTZRX/w3VxCub4Vp4NHVA2uffiqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvzhESggmK4/mjh4PCt8l665GM9mclPWMnfYOTLxi8Swl4Hm3X
	npRC0ahC9YweDjg7bU+SAm5QoijBnxVstIp/FgCzlEFJngLSO/aXvbih
X-Gm-Gg: AR+sD12VyB+ovkBKcPjvGWCDg/+wU1wV0krJEI7fs/8X7XcMwpTvBuuPSo3XeWOhXG1
	Gi1/0e9qX7R+e5cqycLDLZMKE+WbE+0tflQUaCtKMv1wKAvBcltGqo/X0h3nV6d1GenHDLRC16T
	IaobQbHL1oCo31H8Pml1VF5SWMeAsqLQ9rnAnQ2QYFmrchADCikwenh5YlKYAthi2zFWDEz+6hq
	K91W0Q1qnLK3n2bGD+8NR3NH2spf2NdDd297T2tYBGoR3uam/cvpeAcz8lnmsug9PrANcAoYoBX
	7A6tRPTVZe9bjwNbQntfZ3V6vgbvoO0UpL3UUN0xd7kdgb38IPiwBaU7N+qNXGSegz6BYOzmij/
	NBjhUvCjJbZJAlSPG8db8M9yXX9MbTepigrROL7w/gaGyxNulwXbrZB+tAla5CutcU1wujEpqmo
	fpN4buR60GVkSTAlzKagaogPL1yoS/jA2vpVUxyPcI2jMgGc2Mufg5XP8DF47DOmWj33/bjmcXF
	3k46WWrS+k2zzWMSR9EPzdi9Vsm1RBvnR5vOYLh6SlH3raTj88=
X-Received: by 2002:a17:90b:4c45:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-392822b7b78mr3257943a91.8.1786150641757;
        Fri, 07 Aug 2026 17:57:21 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:d7e9:6449:7464:1dfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm4205182a91.2.2026.08.07.17.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:57:21 -0700 (PDT)
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
Subject: [PATCH net-next v6 07/10] netlink: specs: rt-route: add route notifications
Date: Sat,  8 Aug 2026 09:56:39 +0900
Message-ID: <20260808005642.26901-8-sigefriedhyy@gmail.com>
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

Declare the RTM_NEWROUTE and RTM_DELROUTE notifications and the route
multicast groups, so that generated clients can subscribe to route
changes. Both notifications reuse the getroute reply attributes.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-route.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/netlink/specs/rt-route.yaml
index 33195db96746..62b215614210 100644
--- a/Documentation/netlink/specs/rt-route.yaml
+++ b/Documentation/netlink/specs/rt-route.yaml
@@ -322,3 +322,22 @@ operations:
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
-- 
2.43.0

