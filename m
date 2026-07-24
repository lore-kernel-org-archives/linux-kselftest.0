Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58BD21CC71
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 00:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852800; cv=none; b=Vv+H5inHXs4jPOzaSD/J+ckUVdahfcsDe991xKGqdAgW4k6eohxiRPhkBKc8tl/yi+c0QfdYxp0OgicMdgXCQN+1C5IU5nJk8TcvCsRzw3DaSm/4GJtZFWU/ciWIY6yH0iLDSj1JhjcdT+cKV4S8ytYM+A+Nh0gALvmWCRST0pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852800; c=relaxed/simple;
	bh=KIVpzT9wOQFHG+sSpDIvd2GVpZjtNqhMLAGif8qMV+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dZc4OQS4UclE1FW3RPLwjk8q6K11Ll9i7SDAwDN2CKN9baXFJQmZ0GRU2pUHwHCPs3+ZWUy95D7Jn9GBRYgT91is99CPHQk+LCYeHeV7buw3j5q8b87MHcAXvedrDt/WV8xhPr6QD9pDty5/FMr6zFDZiipxORIANf3aSzI//XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCuCZmE2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCuCZmE2"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so16817545ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 17:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784852798; x=1785457598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m+HpqHEAi7vWM2swsP4GBgJNk6Df4HhLGtu1xw++rRI=;
        b=JCuCZmE2CTiegE+68IdOSxlmYTcDZAYCg/D4Um4dvTa2qm1iSfmL1iYEgwZnQ636iP
         fSnhlBRs5HNKQeDwYtn55o1nxX2aYJ/4bEBgxIp1k4FtZNAUPxAbO6XvWxl9GyWgped+
         mR25LwLUGoXAZH1qbZq4ob5qu5Fq4QnININdRTGsxADzuuqGmN5DnjPjPnzOXqRhd/38
         EcDWnwc7/9mtmqLex9V1ifbrQ8FXATYHgBQFU5vEEjKqs53rb3R5E2ky47mEUgJ61yQ4
         vZtjtQ0U+tt7kEMk+/v6fQKwMX0hy+B9pNqD0rRYj0kQcTWDVPiu1DwyZsmX7s6SSm91
         Cd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784852798; x=1785457598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m+HpqHEAi7vWM2swsP4GBgJNk6Df4HhLGtu1xw++rRI=;
        b=ArZJM96DPIztsHbNcA7QkGNnrsrTHA3vhGK4Re2OG0Ez4NIpov1JtfBCeOMK/JmyNQ
         r/HkdMce8/hDhQQYLTgpDkuBywztgPkREFn+PqaE+RInHRh1fnmzj5Hl14SAeEYnw0fI
         xBJhcN1kIWHanXZCcq/KSfwtBRNO1F3b5ktM15duFAByKR8FR1IP3T5S15RfYgx5eKb2
         f2iDPT8/o1bLm9oyDZSWzRLHCa+TLigxeTDvVKq8hgDXDq6tY3hytfmgduymmEQjreuv
         9fmBl06yKVH+ctH+JrNPqRik6EWST0pIepjq1qYqbOUphidbdsLCs5w1e08KwuuHUyO/
         5HtQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwwAdODkHBQaoZeEIIACY2AFxHT6qGgP2V2HMsfi9Sh++Fr3HDl6PhAPIaV2TNuuz06l0BbK7KUx3LG453600=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaaHwC6G/bhuy8b8/fSWg4YDKXY4X8UPXVas/Lk56lJNBe4T5/
	tRh9ymwPjltddpgM9kI6V7hEja7CmKtkQI1YweBFSS43SkaXLWBCP6KL
X-Gm-Gg: AR+sD11KG6Ou64NNcjaydBEzq7RwT5wXo/bNvHbqS97gNwK6gMkFYAGJap6wbMY9Gd5
	4oe308A+z3bD2LC5VCw210G+J1sCADU4msjyd5wQ4e/98paw63QTJO1OSNlvxPbYIt6idYYhz73
	0ostrCdhSyfxKHjlTz5akeTyH4c3qTLFJ5NH+/0l429WBq/FMt1foQUKLBITRN2KTf6NiIKyeUg
	wF1L3zFRnVQE5JzUzjlE/vExigRrdD8YlAayW9SPFfbBr+v+lGSCI3XmQvKLIubqYoU3uszZJEO
	Xm8XtJRodug3hp/RfMj/WX1+XFGVQoDyAAigqoWcMhzMhTaepkLQ5kHq6UqtpAD6IulQLhdiPQ0
	10O8SeQTWB22jnnJRGAZke/hMEgroYArjswTVLRj9FaUZDjouwAUh0CyWazVTR/UaZY7MkEnQK+
	waeKf10Mm7mBNgSTzktOhC1pRAgQ==
X-Received: by 2002:a17:902:da8d:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2cfa71d92cfmr61518295ad.19.1784852798121;
        Thu, 23 Jul 2026 17:26:38 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76cfsm42343205ad.20.2026.07.23.17.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 17:26:37 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Subject: [PATCH net-next v5 0/3] net: nexthop: per-nexthop UDP dst port for
 fdb (VXLAN) nexthops
Date: Fri, 24 Jul 2026 00:26:15 +0000
Message-Id: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACexYmoC/23NQW7CMBAF0Ksgr5kqGTuO6ar3qFiMkwm4AgfZr
 hWEcveawCKqsvya+e8/ROTgOIrP3UMEzi660ZfQ7HeiO5M/Mbi+ZIEV6qqtEayCPF3Iw9BbuI0
 hgTLaWqwbJqtF6d0CD25azG/hOYHnKYnj6xJ/7Q936Uk+f88upjHcl/mMS+O91G4sZYQKhrKHb
 AY2uv06XcldPrrxuvhZrgSstwRZhANRRY2S1Br6L6i1ILcEVQSlWRL2vTEk18I8z38zKJfdUgE
 AAA==
X-Change-ID: 20260712-b4-vxlan-fdb-port-486bb215eab6
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784852797; l=10759;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=KIVpzT9wOQFHG+sSpDIvd2GVpZjtNqhMLAGif8qMV+Y=;
 b=hWVYSwcHLOiCK8d6pHu0jsbRQ40UFDtzr5EODn8t3yduzBvrwY3a8H8o9+9KgU81p93GZF4Tk
 AFRHAhCfItPA1v3dAPszSF20MkwUVPEyGbaY295bLo0/1mQuVwHuiBf
X-Developer-Key: i=jack4it@gmail.com; a=ed25519;
 pk=x8xh2Md9yNDil0xBOA9WA/oqC3O4Eg4rdlIul4YUktU=

FDB nexthops let a VXLAN fdb entry point at a group of remote VTEPs, with the
kernel flow-hashing across the group (commit 1274e1cc4226 ("vxlan: ecmp support
for mac fdb entries")).  Each leg carries its own remote IP, but the UDP
destination port is always taken from the VXLAN device (vxlan->cfg.dst_port)
and cannot be set per leg.

This series adds an optional per-nexthop UDP destination port for fdb nexthops,
so a group's legs can share a remote IP and differ only in UDP port.

Motivation

The deployment runs an overlay in which each tenant's traffic is terminated by
a "forwarder": a pod that hosts the VXLAN VTEP, decapsulates the tenant's
overlay, and relays it to and from that tenant's workload.  Forwarders for many
different tenants are packed onto the same receiver node behind one
mesh-routable underlay IP, and are demultiplexed purely by UDP destination
port.  The host does a stateless outer-UDP demux by port; it never terminates
the tunnel:

  receiver node -- one mesh-routable underlay IP (NodeIP_A)
  +----------------------------------------------------+
  |  host netns: stateless outer-UDP demux by dst port |
  |              (host does NOT terminate the tunnel)  |
  |                                                    |
  |     dst :40000        dst :40001        dst :40002 |
  |         |                 |                 |      |
  |   +-----v----+      +-----v----+      +-----v----+ |
  |   | pod0 ns  |      | pod1 ns  |      | pod2 ns  | |
  |   | vxlan    |      | vxlan    |      | vxlan    | |
  |   | VTEP     |      | VTEP     |      | VTEP     | |
  |   | decap    |      | decap    |      | decap    | |
  |   +----------+      +----------+      +----------+ |
  +----------------------------------------------------+
  (up to ~10 forwarder pods packed per node)

The packed pods are unrelated: each belongs to a different tenant on its own
VXLAN VNI, so the per-pod UDP port is node-level demux, not an HA construct.
The host, which only demuxes outer UDP, never has to reason about tenancy.

A single forwarder is made highly available by running replicas.  The replicas
of one forwarder share a single anycast overlay identity: one inner MAC and IP.
Clients address that one identity, and a sender spreads flows across the live
replicas with an fdb nexthop group.  Failover is transparent: a dead replica is
just dropped from the group, with no client re-resolution or route change.  The
single identity is deliberate; the endpoint is consumed one layer up as a
single stable address, so giving each replica its own address would push
multi-address handling and health-checking up into that consumer.

Anti-affinity keeps the two replicas of one HA set on different nodes, so a
group's legs land on distinct node IPs.  But each leg is still reachable only
at (node IP, that pod's UDP port), so within one group the legs differ in IP
*and* port.  A group can already carry a distinct IP per leg, but it takes the
UDP port from the device (a single value), so it cannot send each leg to its
own port.  That is the gap this series closes.

Zooming into one forwarder pod, there is nothing for the host to load-balance:
the tunnel terminates on a vxlan device inside the pod's own netns, and the pod
reaches its tenant through a separate NIC:

  one forwarder pod -- its own netns, tenant VNI X
  +-------------------------------------------------+
  |                                                 |
  |   on/off-ramp NIC   <--- customer data plane    |
  |   |   on-ramp (ingress) / off-ramp (egress)     |
  |   |   inner packet                              |
  |   vxlan (VTEP)   encap / decap for VNI X,       |
  |   |              listens on this pod's UDP port |
  |   |   outer VXLAN UDP                           |
  |   eth0 (underlay)   NodeIP:port                 |
  |   |   to peer VTEPs over the                    |
  |   v   mesh underlay                             |
  |                                                 |
  +-------------------------------------------------+

Existing mechanisms do not fit this shape:

  - L3 multipath in the overlay needs each leg to be a distinct routable
    nexthop with its own address.  Since an HA set is a single anycast address
    by design, there are no distinct per-leg addresses to route over; the fdb
    nexthop group bridging to that shared MAC is what load-balances.
  - Host-side fan-out (XDP / TC / SO_REUSEPORT) assumes a shared host datapath
    that is not there.  SO_REUSEPORT balances sockets within one netns, but the
    receivers are in different netns (in fact different tenants).  An XDP/TC
    fan-out would require the host to terminate the tunnel and re-dispatch
    inner traffic across netns and VNI boundaries, i.e. become a VTEP, which
    puts the host into the tenant datapath and largely duplicates what an fdb
    nexthop group already does.
  - Demuxing on VNI instead of port (one shared 4789 socket, multiple vxlan
    devices differing only in VNI, moved into each pod's netns) works when the
    co-located pods have different VNIs.  It does not help two same-VNI HA sets
    on one node: their outer headers are identical, so the host would again
    have to terminate the tunnel to tell them apart.  It also costs packing
    density: with one shared underlay IP, VNI demux allows at most one VTEP per
    (VNI, node), so N same-VNI HA sets of two replicas need 2N nodes, whereas a
    per-pod port fits them on two nodes with anti-affinity preserved.

This series adds the attribute:

  - Patch 1 adds a netlink attribute NHA_DST_PORT (__be16, mirroring NDA_PORT),
    stored in struct nh_info and echoed back on dump.  It is only accepted
    together with NHA_FDB and NHA_GATEWAY.  Control-plane only; datapath
    behaviour is unchanged.
  - Patch 2 wires it into the VXLAN datapath: vxlan_fdb_nh_path_select() sets
    rdst->remote_port to the selected leg's port.  vxlan_xmit_one() already
    prefers rdst->remote_port when non-zero and otherwise falls back to the
    device port, so nexthops without a port are unaffected (backward
    compatible).
  - Patch 3 extends the fdb nexthop selftests.

On the uAPI: this does not add a new datapath concept.  A single fdb entry
already carries a per-destination UDP port (NDA_PORT), and vxlan_xmit_one()
already prefers rdst->remote_port when set.  NHA_DST_PORT is the nexthop analog
of that existing attribute: control-plane only, no datapath change, and
backward compatible (a leg with no port falls back to the device port as
today).  It sits at the nexthop level rather than under NHA_ENCAP because fdb
nexthops do not use the NHA_ENCAP / LWT infrastructure.

Example:

  ip nexthop add id 1  via 192.0.2.10 fdb dst_port 4789
  ip nexthop add id 2  via 192.0.2.10 fdb dst_port 5789
  ip nexthop add id 10 group 1/2 fdb
  bridge fdb add 00:11:22:33:44:55 dev vxlan0 nhid 10

Both legs share gateway 192.0.2.10 and differ only in UDP port; the kernel
hashes flows across them.

Testing: kernel and iproute2 built on net-next.  The fdb nexthop cases in
fib_nexthops.sh pass, and the datapath test in test_vxlan_nh.sh confirms a
per-nexthop port is used on the wire in place of the device default.  The
series is bisectable: patches 1 and 2 each build individually.

A matching iproute2 change adds the `dst_port` keyword to `ip nexthop`; it
will be posted to the iproute2 list alongside this series.

Changes in v5:
- selftests: wrap lines over 80 columns in fib_nexthops.sh and
  test_vxlan_nh.sh to satisfy the netdev checkpatch check; no functional
  change (patch 3).
- Collect Reviewed-by tags from Ido Schimmel and David Ahern (all patches).

Changes in v4:
- Rename NHA_FDB_PORT to the generic NHA_DST_PORT (struct field nh_dst_port,
  nh_info.dst_port, iproute2 keyword dst_port).  Review noted "fdb port" is
  too specific and can be confused with a bridge port; the attribute is now
  named generically while validation stays fdb-only (Ido Schimmel, David
  Ahern).
- selftests: split the dst_port cases out of ipv4_fdb_grp_fcnal() /
  ipv6_fdb_grp_fcnal() into dedicated ipv4_fdb_port_fcnal() /
  ipv6_fdb_port_fcnal() tests, and require iproute2 dst_port support in
  test_vxlan_nh.sh (Ido Schimmel).

Changes in v3 (all addressing Ido Schimmel's review):
- patch 1: type NHA_FDB_PORT with NLA_POLICY_MIN(NLA_BE16, 1) so the
  attribute is big-endian and a zero port is rejected by the policy.
- patch 1: reserve the NHA_FDB_PORT dump size based on nh_info->fdb_port
  instead of fdb_nh, so only nexthops that carry a port account for it.
- patch 2: fix the nexthop_path_fdb_result() continuation-line alignment
  and drop the redundant fdb_port NULL check; its only caller always passes
  a valid pointer.
- patch 3: fold the control-plane checks into ipv4_fdb_grp_fcnal() and
  ipv6_fdb_grp_fcnal() in fib_nexthops.sh rather than a standalone script,
  and add datapath coverage to test_vxlan_nh.sh.

Changes in v2:
- Expand the cover letter with the deployment model and the
  addressing-vs-load-balancing distinction that motivates the attribute, as
  requested (Ido Schimmel).
- Reword the problem statement: the UDP port is underlay demux (addressing),
  not what distinguishes otherwise-interchangeable load-balancing targets.
- Drop the speculative NHA_FDB_VNI follow-up note; there is no use case for a
  per-leg VNI in an fdb nexthop group.
- No functional change to the patches.

v4: https://lore.kernel.org/netdev/20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com/
v3: https://lore.kernel.org/netdev/20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com/
v2: https://lore.kernel.org/netdev/20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com/
v1: https://lore.kernel.org/netdev/20260712191218.236-1-jack4it@gmail.com/

Signed-off-by: Jack Ma <jack4it@gmail.com>
---
Jack Ma (3):
      net: nexthop: add NHA_DST_PORT for fdb nexthops
      vxlan: honor per-nexthop fdb destination port
      selftests: net: add coverage for fdb nexthop dst_port

 include/net/nexthop.h                        |  6 +-
 include/net/vxlan.h                          |  5 +-
 include/uapi/linux/nexthop.h                 |  3 +
 net/ipv4/nexthop.c                           | 20 ++++++-
 tools/testing/selftests/net/fib_nexthops.sh  | 83 ++++++++++++++++++++++++++++
 tools/testing/selftests/net/test_vxlan_nh.sh | 40 +++++++++++++-
 6 files changed, 152 insertions(+), 5 deletions(-)
---
base-commit: f6f3b36c15ed44de1fbb44e645e4fae8c4a4453e
change-id: 20260712-b4-vxlan-fdb-port-486bb215eab6

Best regards,
--  
Jack Ma <jack4it@gmail.com>

