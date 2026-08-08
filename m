Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ADD2D7D3A
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150612; cv=none; b=ljZhPKbE9sCB0tuSSK/JF5UUECWZ1eI3NLapYCn4Kk8S7PDzHa0seZJH5ThBRKz8wW67+CoIzp/2QB+5iHuZ5cTGx2c7AqukSBa9sGedGht3wca/UhtTLEvLsCbyi+YDHSic5X++9c+sIBBc++uPjnJGwQOYVeP/X5Mh3o0TWMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150612; c=relaxed/simple;
	bh=oNnQBavscS80u+UGpKtOOXlgpHIrXWtpeSHj9v4Btqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I0Il1okoLPGsZozNHYvTxl9qJxlMdOfXJVMpaD16HM9OXiG+Tk+7ba07GMWujtb2F9sDthnlpITO4zKgQUrcag+8Wwxb0tGBvrYGIR+LTP80CPNNS1vYeQnpVCq3+qU6Yt17gbReHbTTyoLoGBYTw3+hlbvqQSrQB6yfCE4Fa78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+k+1WVl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+k+1WVl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso1342775ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786150610; x=1786755410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OywlotrISI28ogrb/o9BX8gY76dmE+zXz3yzUBYvHik=;
        b=I+k+1WVlsRJYaWf4BzahCsbdgkQ02CBWtzvorZax+Di17U6cTWAtOdS8Fd03SlPLk/
         osPG1sxbLQSu/AER8YKWR9UKbL04e2EnHgc60YQptZO2M2/PFnrlhq5o53/q9kxomfSJ
         IcLTbKDIW82DiI5yjt4jt89xB1T56c/BIo15gdUEBAwZA42n+4cGAD21K/97EDUhpWuE
         qJYSsYeFtGgYJtpoDovuebSk6bXDPVIjwlxzUcpdWTx5LBpKLhcfUDCw7xbGIkGshC4O
         guRgi/5lZPXA7hEvqOQzrcsfqOlpvFKlufl8bZJU3aAsw1ZvrTLtMk8nP3czi5hStrDl
         TrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786150610; x=1786755410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OywlotrISI28ogrb/o9BX8gY76dmE+zXz3yzUBYvHik=;
        b=FpY5qWaWZFZjTPhd0zxXQQWnsIUBaDlQj8mYiNSI7nIapN5OwMLF4JpcIyhEmUvFqk
         2U7IQC/7B4pE9UwXcTtRbctnWTUFoOTH4fBA3bAA/CtHS/CpCzLZ3IAXS296r1ii3U1A
         wHV3U2aHtzR2V2l3Ulwjq77XimE4cMt4hnCF98MODPTpHolbpRJK2jmHqx+3ldoR1BUj
         4uN4IMmUXy7an4Wq8semOAlwAsB+HyfOcoUDTT41fgVJTELsiJ8UrJb9xSF84V7q0dsH
         VNMet/jFe9z+h4n50RITokGeuRYATXAK2NUuqf8HocTQF2iUkiYszX3npjX7KwwQaYtm
         nE4g==
X-Forwarded-Encrypted: i=1; AHgh+RrMlcm2atIobEtFyw21fHP42V5A+drLDgUrCUiwjXudHeSRoMvTP+Yeyj/YIRbumft9mI47qfHthXiF1UJISso=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPJtP1Uc/dRtJxppt2g21dBeA2qZFDgezKG5CFt/qdmoL/yuaH
	J/CcZFL2OAF34fVtkNkS5A7kSZWBE2lxAfn8bbDyZKT5xQ+NRZ5AT/9y
X-Gm-Gg: AR+sD12DhGd3aaOT4Vbdibq9hwJ1Rb4t6v3mvSx8OPaoitE/BLXtclFoHlDiqPFBX+A
	uoJz1hiOHWxPTm76+yLM1Cu1pGwOvtTJ2JZc6/nzIRZe0Sz1uEPdguxBOfP+vLxslC1dLkop4tB
	d9/wxCRO83XkbaweXo/2fRIjkC7Frd9QCrBX6vHxxX1GpvrXZJNzxFHX3EgD/pl41NWBT4pIGdJ
	tbGDUFvMjdbzIPvmihIqREfv3k5c/Vexm7uN4nCs+W0DVdYs7FHPaGqNuzhGRsvojyRQmF9yJBY
	HPuDrw17bqS+0jaVUVhiTenJSIPML6Yyjbm2hID3Y76oYJoCU7rl8m1O+119wh/cLOpOVKK/TXs
	8nGqECibM+D896n+fZ/4kncvxl0+58uyw1usFQagrMYENDbgKh55RVRTnb9fgrwRout4eJ3nbQ/
	TzdSrK/UzKah/mZrYQIbjmnVtI1wSrwKJXmlXZuwkRwTyoU7N/l60slfZDyB/7UoWA+tPCfu1le
	JvzeLjazOiE8pOQSy+AqCNukF05iOPSvKwsi6YE3xItVP0e7v0=
X-Received: by 2002:a17:90b:2548:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-39282428edbmr3688900a91.17.1786150610006;
        Fri, 07 Aug 2026 17:56:50 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:d7e9:6449:7464:1dfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm4205182a91.2.2026.08.07.17.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:56:49 -0700 (PDT)
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
Subject: [PATCH net-next v6 00/10] ipv6: report why a route was deleted in RTM_DELROUTE
Date: Sat,  8 Aug 2026 09:56:32 +0900
Message-ID: <20260808005642.26901-1-sigefriedhyy@gmail.com>
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

Changes since v5:
- Declare ip6_del_rt_reason() outside the CONFIG_IPV6 guard, next to
  ip6_ins_rt(), since only IPv6 code calls it.
- Document in the UAPI that the attribute is notification-only and
  rejected in requests.
- Document the del-reason attribute and its enum entries in the
  rt-route spec, instead of a YAML comment on the newroute request.
- Close the selftest sockets with defer(), and describe the real
  reason the RA send is retried.

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

 Documentation/netlink/specs/rt-route.yaml     |  85 +++++++-
 include/net/ip6_fib.h                         |   5 +-
 include/net/ip6_route.h                       |   2 +
 include/uapi/linux/rtnetlink.h                |  25 +++
 net/ipv6/addrconf.c                           |   3 +-
 net/ipv6/ip6_fib.c                            |  14 +-
 net/ipv6/ndisc.c                              |   4 +-
 net/ipv6/route.c                              |  75 +++++--
 .../testing/selftests/net/lib/py/__init__.py  |   4 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   7 +-
 tools/testing/selftests/net/rtnetlink.py      | 187 +++++++++++++++++-
 11 files changed, 375 insertions(+), 36 deletions(-)

-- 
2.43.0

