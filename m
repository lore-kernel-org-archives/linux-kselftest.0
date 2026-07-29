Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453B447CA91
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 12:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326869; cv=none; b=UgX5gD0r+TZ2WNtYN8Qjx3XxZ2s/Bxe2S390sKUZx9rRTJXQgJpnWsJ4zVUwTqJdaFbEd7pi9Zuj2ouVRdiDRWCOocIOD/NmyjZIn7XHtudxao8hJDiZpv8YSiFd8l4vkeP2fmI2JYg1tXWFoU0jeyb7E2KVtGaJnqRq42ap3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326869; c=relaxed/simple;
	bh=1ocjhJQ4YR6loSHfD11tU+2n0I1/gvP1phUW14nRsmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBCoQlKmKYnhlDjXH87NgaYOcucdUuPmhL74L6DHkz0n1x27nlkczBEmCqtEWGYT79xnsqf5zcCDQu9YsmTLDJJAvURKM12+/wm4sqIQvy74sO3VWB2vHHGDsa5YLe+SGlkWV2DEUZzMTx5nVR0OelpqgJqo4JyBGj2aF43kS2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUe7Z824; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUe7Z824"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84a2dcede83so1115029b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 05:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326866; x=1785931666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6F7Cl+xzwU5k8qKeEsxvsT3nbhhtpTMYmK8UEmNLZ8=;
        b=QUe7Z8248REA4Vo4qyMG8p2HET1Qa1imbFjuLADrCQC+xgjbHkhOUM+s2XkaaGYYeR
         qC8Sgl+BXZvj01NMvCKIMGodRCJ8Akr3MfHsIGH5IVicRHPvt9MkXUus6guyfd3Vk66L
         cWXKQvtibDgFXesO8aaaMiY74LG+umcOhrYGZxRDo//WA4t5CNkDNRElC5fcKzq9BFwP
         18mZzvGge2DPYtejLg2FAHeZJ/8r9LRfJAdORm8YKVDrFbK8qReZeDYuRNXpT06XQoPa
         aQaMkEemY3vY73uYIncDqHAIaFNvbFVeGurnNyfxF31aHWa30cR4CnIL1sV4IZZJl2Oh
         S9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326866; x=1785931666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6F7Cl+xzwU5k8qKeEsxvsT3nbhhtpTMYmK8UEmNLZ8=;
        b=MfQxREU1HlBFJb5yyUDZM4omW/9eN+9Gz66LiwfuWmeUYfdWDqjp+sfLNjx5/KJx4+
         8iZrjHzMADaBPp6BT9qwRFuOW8Mn3U8vbncIuVdqJpxMYSt28pozZLusj7XfWKJizlmY
         TOWcqy5JGC7jiMmnS76D4/fQbNFG6RdcsPZIC7yKzXll3114NkiH65AYKF0ASR4DFuM0
         tu5XM91+LGm6GztcrUZhZoKw0hd5oks9ia2zr3Q2MvlmfMS9Rfpa7oCo1FpUhHVkJ7+P
         y5t024ByIqJ8TIsK7tkTBd87xs0Z/fDRcJHA22vs4Vra/Gzmug8q91f4coyl1FaeEaQ7
         BqOg==
X-Forwarded-Encrypted: i=1; AHgh+RpSuU7WQisxY9AioiQC0JavxZYT3dMQ47W1mV4RsuibJWnXvgjHEKKuxkwgZwbe8YiiThTdbpMsb3u9ZOT37tA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxulf0P0pdTB66hzJnDcLmvkg5Zb9AvW8uXG5sz/NKDQJ83AiK0
	Qpvx2qla05SnFpVjkQVNlBbnR/J6fe0ZhE3RYCgjO6TmYm+1STxVP3cq
X-Gm-Gg: AR+sD131TNBINk7UaLOfswgNCxvMpy2G7YbgNPqSKpVuBSEfnWguPQ7QXGNePY6ZioN
	jDHBtQY4P+nvJT0O80g7ULUsy4a/DfspGLTFzMzAteADod9M+rBaXJ43nysIvcwfgHY07OW5ORS
	YTVzusfEtNhaqTBfoycAol2woN2vLaVyOzBLo8r+iZz0bkdZ1a1zg++XMlLHpKwxxHMVe6BUuhL
	CE7cOUR1G5JIs/eiOh+N4xihk+xHLXvqPtQZOP1t7JIoDEtsn9oGJ4MiKmCfMPAMEdDRh3MDyav
	WIt8xcrH0N4vDwrcVQU1bkscjZ939MHt61O7nIlekLA2zI4oPp9LFy9NsmSYiUYv30I4J/foF4k
	jgxiRz9Wa/9yZg+jH1SRTM5jFou3ejxjz5NCmpmPMvip0ATyS7kWuUTx7F/sJ+TFjH2iBStJqvt
	ZYpjjpWFpQ8Ni5SvX3xZ/mmlfDTlbq7Lm7eTMtV6HHrm2d8DWYSyyhpQDh7lE/Tc3/Td7yD3XvK
	cjcoboObHYQRydCaMSWvwBoJpCmNEypF7Rszg==
X-Received: by 2002:a05:6a00:4c8d:b0:847:8250:2b2b with SMTP id d2e1a72fcca58-84e93348ac6mr6806468b3a.52.1785326866327;
        Wed, 29 Jul 2026 05:07:46 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:c705:d3b3:a6d9:8512])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0300ac2sm1263482b3a.35.2026.07.29.05.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:07:45 -0700 (PDT)
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
Subject: [PATCH net-next v4 00/10] ipv6: report why a route was deleted in RTM_DELROUTE
Date: Wed, 29 Jul 2026 21:07:29 +0900
Message-ID: <20260729120739.47880-1-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the kernel deletes an IPv6 route on its own, the RTM_DELROUTE
notification does not say why. User space cannot tell a route that
expired from one the router explicitly withdrew, yet the two call for
different reactions: an expired RA route means the router failed to
refresh it in time, which points at a misconfigured or unreliable
router and may warrant action such as disabling IPv6 on that network,
while a zero-lifetime withdrawal is normal, RFC-compliant operation.

This is a general problem for any consumer device running Linux,
especially on Wi-Fi networks, where multicast delivery is not
guaranteed (e.g. frames can be lost around DTIM for clients in power
save mode). The motivating case is Android: the userspace NetworkStack
process listens on RTMGRP_IPV6_ROUTE and today treats any loss of the
IPv6 default route as "router lost". To avoid the device repeatedly
gaining and losing IPv6 connectivity on a badly configured network,
when it detects the device is on a dual-stack network with working
IPv4 connectivity, it defensively clears accept_ra_defrtr and restarts
IPv6, so user space apps stop using broken global IPv6 connectivity
while link-local IPv6 keeps working. That reaction is wrong if the
route was withdrawn by a zero-lifetime RA (some ISPs do this
intentionally for reconfiguration) - with accept_ra_defrtr off, IPv6
never recovers once the router advertises again. It is the right
reaction if the route genuinely expired, since the router failed to
refresh it in time.

Fixing this in user space is not practical: RTM_NEWROUTE carries the
initial route lifetime (in rta_cacheinfo), but the kernel does not
resend it when a later RA refreshes the lifetime. So distinguishing
the cause of an RTM_DELROUTE from user space would mean opening a raw
socket, listening to RAs, and tracking lifetimes independently,
duplicating logic the kernel already has. Sending RTM_NEWROUTE on
every RA lifetime refresh was also considered, but that would be
spammy and is technically wrong, since a lifetime update does not add
a new route.

This series proposes RTA_DEL_REASON instead: it tells user space why
the route was deleted so it can react accordingly. In the Android
case, NetworkStack would defensively disable global IPv6 only on
RTA_DEL_REASON_EXPIRED, and take no action on
RTA_DEL_REASON_RA_WITHDRAWN, since that is RFC-compliant behavior.

Patches 1 to 6 add RTA_DEL_REASON and enum rta_del_reason to the
rtnetlink uAPI, thread the reason from the kernel-initiated IPv6
deletion paths down to the RTM_DELROUTE notification, and record the
cause: RTA_DEL_REASON_EXPIRED for routes garbage collected after their
RTF_EXPIRES lifetime ran out, and RTA_DEL_REASON_RA_WITHDRAWN for
default routes, prefix routes and RFC 4191 route information routes
withdrawn by Router Advertisements. Patches 1 to 5 are no-ops on the
wire; the attribute first appears in patch 6. The route addition path
is not touched.

Patches 7 to 9 extend the rt-route Netlink spec with the route
notifications and their multicast groups, split the newroute and
delroute request attribute lists out of the shared getroute reply
list, and add the new attribute and its enum.

Only kernel-initiated deletions that user space cannot otherwise
explain are attributed. User-requested deletions are self-explanatory
to the requester, so they carry no reason; the UAPI documents that
absence and RTA_DEL_REASON_UNSPEC must be treated identically, which
keeps the door open for attributing more paths (nexthop removal
cascades, device removal) later.

Patch 10 adds selftests covering all three producer paths: a
GC-expired route, and a default route + PIO prefix route + RIO route
advertised and then withdrawn by hand-crafted RAs over a raw ICMPv6
socket (no external RA tool needed), plus a check that user-requested
deletions carry no attribute. The notifications are decoded with YNL,
which also exercises the rt-route spec additions.

Changes since v3:
- Split the single kernel patch into six, one logical step each, per
  review.
- Use enum rta_del_reason throughout instead of a plain u32.
- Add inet6_rt_del_notify() and call it from fib6_del_route(), so the
  route addition path is unchanged.
- Move the route notifications and their multicast groups to their own
  spec patch.
- Split the newroute and delroute request attribute lists out of the
  getroute reply list in a separate spec patch, so the attribute
  addition is a one-line diff.

Changes since v2:
- Fix the patch 1 commit message, which still said u8.
- Keep del-reason out of the newroute and delroute request attribute
  lists in the rt-route spec, since the kernel rejects it in requests.

Changes since v1:
- Expand the motivation with the Android use case, per review request.
- Widen RTA_DEL_REASON from u8 to u32, per Netlink uAPI convention.
- Convert dict_keys to a set before the set difference in the
  selftest, for clarity.

Yuyang Huang (10):
  ipv6: add ip6_del_rt_reason()
  ipv6: propagate the route deletion reason to fib6_del_route()
  ipv6: record the reason for kernel-initiated route deletions
  ipv6: add a deletion reason argument to rt6_fill_node()
  ipv6: expose the route deletion reason in RTM_DELROUTE
  ipv6: add inet6_rt_del_notify()
  netlink: specs: rt-route: add route notifications
  netlink: specs: rt-route: split out the request attribute list
  netlink: specs: rt-route: add the route deletion reason
  selftests: net: verify RTA_DEL_REASON on route deletion

 Documentation/netlink/specs/rt-route.yaml     |  68 ++++++-
 include/net/ip6_fib.h                         |   5 +-
 include/net/ip6_route.h                       |   9 +
 include/uapi/linux/rtnetlink.h                |  17 ++
 net/ipv6/addrconf.c                           |   3 +-
 net/ipv6/ip6_fib.c                            |  14 +-
 net/ipv6/ndisc.c                              |   4 +-
 net/ipv6/route.c                              |  75 ++++++--
 .../testing/selftests/net/lib/py/__init__.py  |   4 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   7 +-
 tools/testing/selftests/net/rtnetlink.py      | 181 +++++++++++++++++-
 11 files changed, 350 insertions(+), 37 deletions(-)

--
2.43.0

