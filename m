Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC623C4FA
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783883794; cv=none; b=Zl4zOuYS0mJQ3lcTcmfxks+u1Pqh5mwwSoS/+oFG+xOPF0EtekG+esjo0Fl7Kg8pyBWsgTayqz8dnF14moEqX0H71OKQcwmmYjnxVWGWnRDUzyUFyvYY0u0ZObk+1WPjmCIg6PdvNpuKn4+jG7ENYLZPx4O8xd/CXLiKVmC9Vrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783883794; c=relaxed/simple;
	bh=DJBwYwVsgPOCiwKIL01/cm5VStqL4G3HoUtXiwz6cU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/K7yolOe7EFfFjPS9HAeOezaWKt5Je7gR+sBPj87AhKPIeYYqeF+x4+UvFHtYNo9FAIRX9jucIw9pgz+GqrPifoppVX46xqqmt662ikcpaJAHmROiKO82xCS0PpDWPSDaAR32Emqjl8fiHVacVKg8qWLGeOoAaVSxhdKZziJ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkG6TpMY; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkG6TpMY"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2059622b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 12:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783883791; x=1784488591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BoTRrCxFYKoh3zbhLA1zriCt6azN6tlIA/01b51ap1g=;
        b=nkG6TpMY07QNHuIvuj0q4UwtABK+Igie10MFBDXmM1I/8XiVk0oYFGlT5fXxmsELtM
         oqmBoeVvShqTNkDVQDtWRcaBaKgmKm94jc2eWWd6WvDCs6qmMxdKALElZLEyvuXhF5NJ
         kJWHFK4BuFYexJgFL/CoIVx3WmoIoT5vfjx9WKOq2TRAogAWZ1XdwYJRRCWTF8gYibR4
         Sf4XSz9u/0d5ewc9daWgIdRRQXoB7nFZWvp0OhtLfjO0+zIuYMU7eWTcP9gsxZIQ4ivf
         UBb+aZFQQGLm5clHWZFIWACTwCZf0zIOqVqb8f/JzTCIBorn07rDwrrNRwrUllRQ9Hq6
         XWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783883791; x=1784488591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoTRrCxFYKoh3zbhLA1zriCt6azN6tlIA/01b51ap1g=;
        b=seL+e6Ks0asrlxGEYzwVadP8d9X5sk/TLeGPnkhKfQgUfWJXPdyvq5UUXPfS909uTD
         LcYQE5tVSBE7lefDpkFKD6x81W/SRm4hGL5ZgNAO65HDq+kfrcCVbumub5Ift09YXrgE
         r3taH44AMTfFI/bB9hJnEkcirwscHCFIfyvDRbSQ/FZxYlvtj9dm3JcAN+mI3n97DkCr
         KQknq6lZS9xxkOheHlEYTwb+KWG4aFUf9v/bTrzm8+BcJIWagAxM28n/8E6jNQNVFqFy
         d4LO2iRFta6HSeaBl8VcyLZmrQXtfJbD34Mg+iv18Tto3ZBbnxrtDKncApGYYGXQGnR2
         7wdg==
X-Forwarded-Encrypted: i=1; AHgh+Rrv3ZbNDV6CVYUO3ibtr5CWsOWIHcpfcFvOBCGJ/rEVEZnkuOS0iRUs2Asl9MeKFyBHbtJl3zETp+MPcg4bbu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoq99Cy0EcQy+6j/dzrtkIf6v6SBay13xMEcbiH7i1xE1tv5hh
	7OESCvJmK3bQdZhbb1a28BueK6CDGft5v8DrNRv9/OPfMucs+st6OMEe
X-Gm-Gg: AfdE7clpgFzFwwa6YRJLhRb3W5rm1f6XfqZ79jpHx64Oib/7J3rHNfxL9jUAy2kFiuH
	c8bwofLtHusZTfeyC2vVfjUBJowRzx91inCEKAO/QTpvWUII0o7cCiixx47GpobF82iD7s8fmgA
	nQB2Z+9uGO/SWOUfIpYhHDt10J+J8bN0wPyDEEXj6RgljMePFL+ydhq+BP7NCch0j2o0FXTWCeO
	AIMOy1HXi1CVfraF8b0k7yaaUacVXzg3FP//wlWLJ4sQ29eKGsR3Gm+xt3z1HWfssSshfhG0mkD
	szq08ksTBveh4rS0N9PpdH5FPXAogyes+wiLptaPHFLf9pnC9eLAaOt7kT8jCJEOwJ4awrT/b4G
	X2ZZjGukpQdDRsX+hxTaNWP1b6EuVkcnKw0ZEHkJUbzMOTlRFRghLhruHZcPbr34W7gYwwemsSz
	cqZyqOSD7PgLBwT5B60Fd6uKXq1iCnusnerDy9K7qtJ/1xDzqZCqz3qY6H
X-Received: by 2002:a05:6a00:4605:b0:845:e440:d0ca with SMTP id d2e1a72fcca58-8488963a140mr6089737b3a.8.1783883791030;
        Sun, 12 Jul 2026 12:16:31 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.redmond.corp.microsoft.com ([70.37.26.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm13079371b3a.60.2026.07.12.12.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 12:16:30 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
To: netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>
Cc: Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Ma <jack4it@gmail.com>
Subject: [PATCH net-next 0/3] net: nexthop: per-nexthop UDP dst port for fdb (VXLAN) nexthops
Date: Sun, 12 Jul 2026 19:12:15 +0000
Message-ID: <20260712191218.236-1-jack4it@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FDB nexthops let a VXLAN fdb entry point at a group of remote VTEPs, with the
kernel flow-hashing across the group (commit 1274e1cc4226 ("vxlan: ecmp support
for mac fdb entries")).  Each leg carries its own remote IP, but the UDP
destination port is always taken from the VXLAN device (vxlan->cfg.dst_port)
and cannot be set per leg.

Some deployments pack several receivers behind a single underlay IP and tell
them apart by UDP destination port.  To spread flows across such receivers they
need a nexthop group whose legs share the remote IP but differ in UDP port,
which is not currently expressible.

This series adds an optional per-nexthop UDP destination port for fdb nexthops:

  - Patch 1 adds a netlink attribute NHA_FDB_PORT (__be16, mirroring NDA_PORT),
    stored in struct nh_info and echoed back on dump.  It is
    only accepted together with NHA_FDB and NHA_GATEWAY.  Control-plane only;
    datapath behaviour is unchanged.
  - Patch 2 wires it into the VXLAN datapath: vxlan_fdb_nh_path_select() sets
    rdst->remote_port to the selected leg's port.  vxlan_xmit_one() already
    prefers rdst->remote_port when non-zero and otherwise falls back to the
    device port, so nexthops without a port are unaffected (backward
    compatible).
  - Patch 3 adds a selftest.

Example:

  ip nexthop add id 1  via 192.0.2.10 fdb port 4789
  ip nexthop add id 2  via 192.0.2.10 fdb port 5789
  ip nexthop add id 10 group 1/2 fdb
  bridge fdb add 00:11:22:33:44:55 dev vxlan0 nhid 10

Both legs share gateway 192.0.2.10 and differ only in UDP port; the kernel
hashes flows across them.

Testing: kernel and iproute2 built on net-next.  The control-plane selftest
passes (6/6) and a datapath test (two netns, tcpdump on the underlay) confirms
outer traffic is hashed across both UDP ports.  The series is bisectable:
patches 1 and 2 each build individually.

Note: remote_vni has the same per-leg limitation and could be exposed the same
way (e.g. NHA_FDB_VNI); left as a follow-up to keep this series focused.
Naming NHA_FDB_PORT vs a generic NHA_PORT is open to discussion -- VXLAN is the
only fdb-nexthop consumer today.

A matching iproute2 change (the `ip nexthop ... fdb port N` keyword) is posted
separately to the iproute2 list.

Jack Ma (3):
  net: nexthop: add NHA_FDB_PORT for fdb nexthops
  vxlan: honor per-nexthop fdb destination port
  selftests: net: add coverage for fdb nexthop dst port

 include/net/nexthop.h                         |  7 +-
 include/net/vxlan.h                           |  5 +-
 include/uapi/linux/nexthop.h                  |  3 +
 net/ipv4/nexthop.c                            | 20 ++++-
 tools/testing/selftests/net/Makefile          |  1 +
 .../selftests/net/fib_nexthops_fdb_port.sh    | 78 +++++++++++++++++++
 6 files changed, 111 insertions(+), 3 deletions(-)
 create mode 100755 tools/testing/selftests/net/fib_nexthops_fdb_port.sh


base-commit: f6f3b36c15ed44de1fbb44e645e4fae8c4a4453e
-- 
2.43.0

