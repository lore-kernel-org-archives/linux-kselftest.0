Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644321C861D
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 01:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785808045; cv=none; b=D3fno7MF4dgBBm+OaE1c3r6kvtTLV3LFbyd9GqZGeUC1IY0EKGA5IdAzcbpZkhlpq38C7tuxpuU4BiNGjv/Oe2bQMqFmVDy6IOelsrRVrs/GX8wSquhIIiN1gUnGtsa+3oOhVmEKVr4YBeuK+R74kRmcG/JnF6vzzRKRIYWe7tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785808045; c=relaxed/simple;
	bh=kbrc5RDVqiSJUz7Yoqe+ack4M4ZHY8xLX4ADtFH1obc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lpHcr3FtvXLs+IU6uV9iWnpsfhHBXEfLY46X+BlrqBtwH0X7FnmKnGHNoIpM+uDOh46MD8BTN9/8hyIbJsmghll1eS4bRx2cJhAhcEBZGlEkDgzSiWW/OxL4/1BRsxWwgCsROehAxIuDpFgS0WrBHC97CBzC4+fl223lNYt93V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXmZoRqm; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXmZoRqm"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e0688b859so1249864b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785808044; x=1786412844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AW3ZoLD4+GjjFhWeUfeqDmpp6KzO7McHCLtQoEvLvdM=;
        b=JXmZoRqm8PXQE6kgEMAd9E/PpCPtKngOKi884nadsWsLH795dMTeEGJGAe0obn6ArN
         gnwx7eI1LF5wi7enAXK8yIWdbpD4mpXsVxOPnqX595QJw6rjfdKeNtbGMcNWppjZBHNL
         4lJkR+V46j7O77yQVpt5VA2pWhS1ajjZGyz2QqrqzVPqliFRZrEKFyyIZmLSmf8+w+ic
         mCdqXnI2je/f/nSuPswnbGQr0EAx8KlGN1zsqsTF1tpx5eBwFqzFw1gcPkMYTHtKN2xK
         LPV0sxUfLPOe92KEklTlfm7iOhD0XNDi5NaoykZHxbkAcsoV1qyeTeI6rLFutjItW2Jz
         IFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785808044; x=1786412844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW3ZoLD4+GjjFhWeUfeqDmpp6KzO7McHCLtQoEvLvdM=;
        b=Dxi9WCGYVov0H4AwwkNp6rRtXSes2S0B8aXmwu4vgluZJWkqh/gua5oPhMMdKRclG2
         sSttkuaOjGUI1ZUPQmsqQvVhmsPZ0N9+phX9Gfo6Nd1Jhte53NZb/6gZjuaHaPMh+nOj
         j68IFcsUAxEaL8bvnTERFSzyNpnrZ2+QLyvDHDFzcYrWKJCTik51LVLUi2Xt2+O9PKJF
         jvLvepO+adLmXzlBxAo3lvY44wxdBrc4YVhUIzo/wb6cOCfzUNWl96HPldYExD3YO4Zg
         2yqwUNgaJFZbHnOiIp0Y71xdlMbglM0HqOOSYaCSnYrxl8gJRrkhMTXrg6T4O3LyjJoT
         K7tw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0Y3lWcHDNJkmebdXqz3ztl4zVXIu5wwl4dGwBduRcvJw9K8BRbT7xmT7b/S/jVgA6ZYuy0Wsk8MjXI5qq/Q8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrP66HAVYp1Jhfnsy3PAwLUkMJ9FUrBpMMX7kao6mFbm5/xOf
	kJHOoROe0a5ScZwNcWN0DsLh39mLjZy72FvWBCnGu4Jz0RD1ht8/Iwp5
X-Gm-Gg: AR+sD10VWgdYQkgAxjQla78yuV4TsmQY7yPyeJi+hUf7CPsD1owBSlnVUYLhTumqJxV
	qTV3vG/nR3/YUVdg5LyiEAlobFk2ai1v6ZF03DnmZE9Z2L7LaerOUqUDC30GjxEJhqGagpzKTGS
	a5h8u+Ee+puvM/Kxr/7kZI6V3Iy5hqr4Ju2oQTBVRiJjWtM126DjcAvjcItB0Ppb9zzfy6yWiIl
	+WQa1RfWKCRTqjnjtk96GZnNJbgCDo4RClp54yMC61SLz9hcy+zlWgLm4bsWuRJ1B1emrqZHwui
	lCxCFPVSj4M2VzXiIJdKtpxXaaEhehcx61ygyo+yWDfrd61rubucJVydEtvU89f/ic/JoIfBtn0
	7PV0eglKq4RtfsWxIH+nI5F/OSo5phM+kORDxd1d2uz8E9EftDF1SQdYyGaZ15elNrTTrMKiQ50
	30uF/B0Gs4A2G39CdfBfx+wOEjwgpTQkxgo75aLS6Z2J7k/BTrjb/5tGKbisReSqwz91Y5fHx0p
	2Q+hxhk387INrM9Tcl2FfKPr4RUUaCX12YZ9cMtUbxG+h1whcM=
X-Received: by 2002:a05:6a00:410b:b0:848:2f71:b659 with SMTP id d2e1a72fcca58-84ee49a597bmr11311750b3a.68.1785808043583;
        Mon, 03 Aug 2026 18:47:23 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:cb1c:934a:3e5f:ef88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7b97sm4410164b3a.43.2026.08.03.18.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 18:47:22 -0700 (PDT)
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
Subject: [PATCH net-next v5 00/10] ipv6: report why a route was deleted in RTM_DELROUTE
Date: Tue,  4 Aug 2026 10:47:04 +0900
Message-ID: <20260804014714.4362-1-sigefriedhyy@gmail.com>
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
RT_DEL_REASON_EXPIRED, and take no action on
RT_DEL_REASON_RA_WITHDRAWN, since that is RFC-compliant behavior.

Patches 1 to 6 add RTA_DEL_REASON and enum rt_del_reason to the
rtnetlink uAPI, thread the reason from the kernel-initiated IPv6
deletion paths down to the RTM_DELROUTE notification, and record the
cause: RT_DEL_REASON_EXPIRED for routes garbage collected after their
RTF_EXPIRES lifetime ran out, and RT_DEL_REASON_RA_WITHDRAWN for
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
absence and RT_DEL_REASON_UNSPEC must be treated identically, which
keeps the door open for attributing more paths (nexthop removal
cascades, device removal) later.

Patch 10 adds selftests covering all three producer paths: a
GC-expired route, and a default route + PIO prefix route + RIO route
advertised and then withdrawn by hand-crafted RAs over a raw ICMPv6
socket (no external RA tool needed), plus a check that user-requested
deletions carry no attribute. The notifications are decoded with YNL,
which also exercises the rt-route spec additions.

Changes since v4:
- Rename the payload values to RT_DEL_REASON_*, so they do not read as
  attribute ids. The attribute id is still RTA_DEL_REASON.
- Document that the reason value space is family-agnostic.
- Drop the skip_notify argument from ip6_del_rt_reason(); all callers
  passed false, and skipping the notification discards the reason.
- Drop the unused !CONFIG_IPV6 stub for ip6_del_rt_reason().

Changes since v3:
- Split the single kernel patch into six, one logical step each, per
  review.
- Use the enum throughout instead of a plain u32.
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
 include/net/ip6_route.h                       |   2 +
 include/uapi/linux/rtnetlink.h                |  22 +++
 net/ipv6/addrconf.c                           |   3 +-
 net/ipv6/ip6_fib.c                            |  14 +-
 net/ipv6/ndisc.c                              |   4 +-
 net/ipv6/route.c                              |  75 ++++++--
 .../testing/selftests/net/lib/py/__init__.py  |   4 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   7 +-
 tools/testing/selftests/net/rtnetlink.py      | 181 +++++++++++++++++-
 11 files changed, 349 insertions(+), 36 deletions(-)

--
2.43.0

