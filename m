Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9120730E82E
	for <linux-kselftest@vger.kernel.org>; Sat, 25 Jul 2026 03:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949151; cv=none; b=lib8I3r1dK8fZZ8zGR85Q0g08yGsS7G6m1qAH8IkfaZ683HefW+bYxrGZu/I4wr6eIcDT6iUES/TU7kSv+Aojt9/2utv+DH+UkU6o/+IdIbw2Ykt8i4AyWlKiNwrMwdjQKyB5fpL8LyXxJOxBGXBQujvdNEtS7T/uI2FUxQ3QyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949151; c=relaxed/simple;
	bh=vsYifGke6lnY4KN8BmHH/Raq4kUbLLKlKIiC4+ggoeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOtZ4LldzIi9n7kDYsvHuEabm3qTGXQVCtvFkMlgZkPl/Z4oZ5vnvGV+LDJkgy0q4g6PPN1RR+4Mri+/xkJZ1Ezf0Pr5NRTrYIu6j0UKZFo4Ll93SeNfFeWYAVByMfxs4AKzJ82qFitLR7JUEAIEIlytVFzUSHaLbHBT5sUtoZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAFKYY1I; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAFKYY1I"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacf197759so15468875ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 20:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949141; x=1785553941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMDNaLVs/3tHgNJc8HBi+uc/gjyAWEQ4BpGD5ItSc8c=;
        b=GAFKYY1IZm8M8XQKU+32CGsNuAaWgBXt3l/Y4iO0fMzuEbnODJu8O8nvBBkb8puxTv
         PdWZPutbtELHh0DBclBbZtH8XAj5v4RArnjACfL1EvlmMff8MYZhBj33cYfhn4ZiFg6+
         iAAKKGyHsIHaKAVtWF8ngGrCeCU3GgXal9Y0L3i15545pzJ4heTUdMwNjsc+TiWPVm+o
         JlOzkAIjn2rW7JVhOwhNf/gEzk7ANu9LYc3OQK53xpXGTn8Pg+lNYiDMyL6c6Cn8FHB2
         avZoRX6e9l4BGnBKuMWLD2DiWPZzdsZw70oJ+SVPzGGjhXfR4yDA2j6bc59ZopOgP2s9
         76vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949141; x=1785553941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMDNaLVs/3tHgNJc8HBi+uc/gjyAWEQ4BpGD5ItSc8c=;
        b=kkDKwDD1eoYlJ+0G+SvpE6vvgOldMdBpa9dFbFznIvUnn6AzUoVbnCeTnH5PjI+Aoe
         FRCiBzJgeA0MOj10tL9taqP7wKktzyItr04mGYcx9LrKG+54fXSFjsMJEgdEU/vvV/Mk
         8RWqkixSxDY2fpaTNiLODnwpCGn+v7cFaJEcs4PfgNmsRmpsDpKOyrjqPISQXpmAViFF
         Khyo7hpba7Tc+KskFQgg5TGzl/+u4qWc35TWFxqO8OCYS36VL0HacjWg7hA363EDMewk
         qYNBY0o353UEuGUztR7MXL5PTscEaZwpMXmn80kJQHUjKSHfLiSuBairI/LOB1Fna0Gb
         jGzw==
X-Forwarded-Encrypted: i=1; AHgh+RrWWf+UydNnRu6tRIaTtuW6lF1v2oWAdf+SgZGCxhH/KdvunHGQWEk2FsPxYj2TIcjSpq7HfFZlQxcG2VFzaUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0hZ+pGgbEiuUXzXrKhTu4ZyW75i34I0PgYQREgc48vHMbgwH5
	I+NTfrR6oM10sd4Vcudala1U5irLKLu7H9w4e6ntPAzEQYIljyWrjmWz
X-Gm-Gg: AR+sD12QWLks1uJlBfdC/wn3xuSy3uGV/jejG7rGZS6Gp5v8OSdgR9u8Vym9RLQmky8
	2VVMu1EcnBhZD7x79H8/nimTCRHTiyd8BSnxcckgOTRgMlK9i0hYk9IcvlB26v27FbdGRfBrfMD
	W9IToj3c1IjDKJSkJ7syBO8AAKxCvDjYQ9BdgZWB7XTbvBAleDeTv89IBMin2yRb7XmQpcmeAxu
	v1uNSbRla4QYNZF+PtwKYZJj2JMqDIJAXXQ3F4H5sU6qVjzxIi/OvARiFD8cO2TNIwBNKCtfdCa
	OFq/gKlGVoEoXIUc/U75usF1ZKRQk1OcEu4f6gyL/MgAgW9HBpfnTIutnpRwIFS7SHVzIBito7t
	n77UFFciPCt997X5IujnbAWS0VEItZIVcG4zxR3QLxa5dTmp+DYCwIrYUwtaS/addHLCJYkjGoo
	FObGIoOgD8Dkz3+Ouo4tvHZweBR5R0Vjbivy+aQRvGTNvrNRtRAlGrE9AUbW7tA0mU
X-Received: by 2002:a17:902:f608:b0:2ca:6d87:cda0 with SMTP id d9443c01a7336-2cfde795552mr9149185ad.6.1784949140575;
        Fri, 24 Jul 2026 20:12:20 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:a005:2f41:ab3d:c011])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e26e9sm3610265ad.23.2026.07.24.20.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:12:19 -0700 (PDT)
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
Subject: [PATCH net-next v3 0/2] ipv6: report why a route was deleted in RTM_DELROUTE
Date: Sat, 25 Jul 2026 12:12:12 +0900
Message-ID: <20260725031214.43059-1-sigefriedhyy@gmail.com>
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

Patch 1 adds RTA_DEL_REASON (u32) to RTM_DELROUTE notifications and
records the cause in the kernel-initiated IPv6 deletion paths:
RTA_DEL_REASON_EXPIRED for routes garbage collected after their
RTF_EXPIRES lifetime ran out, and RTA_DEL_REASON_RA_WITHDRAWN for
default routes, prefix routes and RFC 4191 route information routes
withdrawn by Router Advertisements. The rt-route Netlink spec is
extended with the attribute, the route notifications and their
multicast groups.

Only kernel-initiated deletions that user space cannot otherwise
explain are attributed. User-requested deletions are self-explanatory
to the requester, so they carry no reason; the UAPI documents that
absence and RTA_DEL_REASON_UNSPEC must be treated identically, which
keeps the door open for attributing more paths (nexthop removal
cascades, device removal) later.

Patch 2 adds selftests covering all three producer paths: a GC-expired
route, and a default route + PIO prefix route + RIO route advertised
and then withdrawn by hand-crafted RAs over a raw ICMPv6 socket (no
external RA tool needed), plus a check that user-requested deletions
carry no attribute. The notifications are decoded with YNL, which also
exercises the rt-route spec additions.

Changes since v2:
- Fix the patch 1 commit message, which still said u8.
- Keep del-reason out of the newroute and delroute request attribute
  lists in the rt-route spec, since the kernel rejects it in requests.

Changes since v1:
- Expand the motivation with the Android use case, per review request.
- Widen RTA_DEL_REASON from u8 to u32, per Netlink uAPI convention.
- Convert dict_keys to a set before the set difference in the
  selftest, for clarity.

Yuyang Huang (2):
  ipv6: report why a route was deleted in RTM_DELROUTE
  selftests: net: verify RTA_DEL_REASON on route deletion

 Documentation/netlink/specs/rt-route.yaml     |  67 ++++++-
 include/net/ip6_fib.h                         |   4 +-
 include/net/ip6_route.h                       |   2 +
 include/uapi/linux/rtnetlink.h                |  17 ++
 net/ipv6/addrconf.c                           |   3 +-
 net/ipv6/ip6_fib.c                            |  19 +-
 net/ipv6/ndisc.c                              |   7 +-
 net/ipv6/route.c                              |  66 ++++---
 .../testing/selftests/net/lib/py/__init__.py  |   4 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   7 +-
 tools/testing/selftests/net/rtnetlink.py      | 181 +++++++++++++++++-
 11 files changed, 335 insertions(+), 42 deletions(-)

--
2.43.0

