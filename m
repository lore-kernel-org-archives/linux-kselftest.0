Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F12407CDA
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 22:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673002; cv=none; b=g2ZyxvWfUcVvanHFRCDIgMTPn8Gx15lHLRw0ENb2l9OOwTbVX1FBclFpiGeUTq9n7MLq2ehTzu45evIdw03qjSODJePB6B119t7YXE6oWEU5Piu/rP5m01i6SEhO1t3Q408MlzgNyd/S6L9c8k3BidqNHMbFqP0sOO5Y38/UXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673002; c=relaxed/simple;
	bh=D9NurwyUFbGWMbKlHj+9i6HJ2ATSyj+IKIZBM2bUat8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sF34FWC48Ifct//g8IW4IRIpyCqHw13jmj7v+ztRLT+749YFqjcwZQD6Q1OakBnNiIXt+trsDUazeMFiVtcIN+Wt9izqouXJjmcSWC8WSUqUv6cr5apWrVgwSu3loiKIFLEjEzY8Kr93vpCbfSL1odZxrrPcnWNuvbHZfXbWalE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn5K6815; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn5K6815"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cae1a3a744so89407375ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784673000; x=1785277800; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QbMn5Z4a2l9VpopLhe2VTS41gXOWMkzs9TeH6RwYfDE=;
        b=Gn5K68158X3seCVbVCfYdbnlogz42IB+fPtC8t7iXPj0sbxq9V7//LqYegF6tPIsE4
         dBILkJQY3f2iAo1TQTe8nl1hdvSit8XlKcfX2g2CyYXU0XpaB+vRBzPK83WL1FEk1fmG
         qcqenSGWjESM+X55an9/q1NHUD0oB92ykDMW3qO9Cu5VJKPTblESQxBm1AwSu7t+HdAn
         QjhD1NUSjwLb6ObJgLBwnx0HS3Yz9K0ev+id8CCQFac1/22bhhCQvHwu3ACTXDVA7mXC
         dvteuYYjcpzG6c0M3EcAUapv/nvrJcRyDkdL3utSqZOKVjLiagCi7yRElMEJS+oSng/I
         +D0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673000; x=1785277800;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QbMn5Z4a2l9VpopLhe2VTS41gXOWMkzs9TeH6RwYfDE=;
        b=ddobOuZcR1FIH0xDhZxj9tSdFW0QJ4YEmQhuOfeLeA1uDJKd0WBeKVZA3Gx/+A+rSO
         qWUhxxqdxf7eZUMLeMccx5RNgsH17i0ySLaSSyg1QW45Djt44cUV/tZ1HpbVLIe8S66C
         ZRSFPjbDQah12OBRjoRQrJyKB13M4yDU03Vu/J9GqpkzwyxVq7r8XIpBaTODbQuYVIjo
         Bq3KNjov40+emm41u9ks7kthQe3FAsGT3GX9BoDSNWToruU1CsoaYwIqqwK/LsFLBoJ2
         dZJ95R7CiudVuehuTRjhE6980NX0NGxTpj6abLH5diBpVhBrgZWxtvIwcKazrIE47c3N
         6y/w==
X-Forwarded-Encrypted: i=1; AHgh+RpeMWai5UIqktNZTql2U+28qFRK2y2xZ7Rf9+nzKsyC7Dt+4cDNvorJnDjqJHgYD3Ych/vGDXYEGh8KjMTc/Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAdqk6O8Lmulr0NtMtEh0HM6zdDPiqMRH2R2jICVQWnhfjVUY6
	H1SidCDD3jfW34VZWzrstkP3AqZOpfz0yFTcwpgss+R6NfIH5GK54bwh
X-Gm-Gg: AR+sD12GHMgcawwFjvwVkqgYPCQCmdoFc18dElkM5erfn1OaIafGYrFt9bbWNvKsffW
	PA/NkbW3lGdiUMOR5ebM/CMR2ANnJ43gUnmo5g216VFaSvICAF+5rrp31OkvsOMVGxVpbJiFFVg
	Xq85FYqZBOrgPwfWquujlb3decncqTxVUhLz6cWR6eVDU9qm1Gh5KW6iH6B7wO+x0X99fRsCmv9
	KlGl3BXMr0C68fQi1XquuceMTkqlucPN0dwTOAhfdTRVjotSX6njIW8qsOa9HXGApa4GzLIKa+P
	RsJajvyO9SKyZcUsdtXWnS+oTUlC6cjJmcLUaQmJ5iDRNvm4nowb38V4tAVuQ1dYgbTuvZVGKy+
	xxzo5Xi26DbOGa1yBXFI+Q2VZUVXHPL/XlOD84DTloTP8pccfXhW8zu4DOkldmoZu+Jgi0Os1Gr
	xai02yRMBH+meyEtQ=
X-Received: by 2002:a17:903:37cf:b0:2cc:5fae:cc56 with SMTP id d9443c01a7336-2cf3495ffe4mr219809785ad.27.1784673000217;
        Tue, 21 Jul 2026 15:30:00 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efde5cfsm3787685ad.31.2026.07.21.15.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:29:59 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Subject: [PATCH net-next v3 0/3] net: nexthop: per-nexthop UDP dst port for
 fdb (VXLAN) nexthops
Date: Tue, 21 Jul 2026 22:29:49 +0000
Message-Id: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN3yX2oC/22NQQ6CMBREr0L+2m+gYiGuvIdh0cIv1EBL2tpgC
 He3oEuXk5k3bwVPTpOHW7aCo6i9tiaFyymDdhCmJ9RdysByxvOqYChLjMsoDKpO4mxdwLLmUrL
 iSkJySNzsSOnl+HyAoYCGlgDNt/Ev+aQ27Jf7dtA+WPc+9JEdxM9U/TFFhjmq5GNUK6p5de8no
 cdzaydotm37AL4G4tTOAAAA
X-Change-ID: 20260712-b4-vxlan-fdb-port-486bb215eab6
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784672999; l=9722;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=D9NurwyUFbGWMbKlHj+9i6HJ2ATSyj+IKIZBM2bUat8=;
 b=YemkG/DTuZQvhoAGruTAQY3ws3gAChcdb6l8bU+57EpVobseWzEoOkNTIbfWgTWseqlT1w/OE
 NUEYBeezcOqCifxxKln5HPKWYvglsc5EEhfi1vvnMSvZ8NgHKOn+G2z
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

  - Patch 1 adds a netlink attribute NHA_FDB_PORT (__be16, mirroring NDA_PORT),
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
already prefers rdst->remote_port when set.  NHA_FDB_PORT is the nexthop analog
of that existing attribute: control-plane only, no datapath change, and
backward compatible (a leg with no port falls back to the device port as
today).  It sits at the nexthop level rather than under NHA_ENCAP because fdb
nexthops do not use the NHA_ENCAP / LWT infrastructure.

Example:

  ip nexthop add id 1  via 192.0.2.10 fdb port 4789
  ip nexthop add id 2  via 192.0.2.10 fdb port 5789
  ip nexthop add id 10 group 1/2 fdb
  bridge fdb add 00:11:22:33:44:55 dev vxlan0 nhid 10

Both legs share gateway 192.0.2.10 and differ only in UDP port; the kernel
hashes flows across them.

Testing: kernel and iproute2 built on net-next.  The fdb nexthop cases in
fib_nexthops.sh pass, and the datapath test in test_vxlan_nh.sh confirms a
per-nexthop port is used on the wire in place of the device default.  The
series is bisectable: patches 1 and 2 each build individually.

A matching iproute2 change (the `ip nexthop ... fdb port N` keyword) is posted
separately to the iproute2 list.

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

v2: https://lore.kernel.org/netdev/20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com/
v1: https://lore.kernel.org/netdev/20260712191218.236-1-jack4it@gmail.com/

Signed-off-by: Jack Ma <jack4it@gmail.com>
---
Jack Ma (3):
      net: nexthop: add NHA_FDB_PORT for fdb nexthops
      vxlan: honor per-nexthop fdb destination port
      selftests: net: add coverage for fdb nexthop dst port

 include/net/nexthop.h                        |  6 ++-
 include/net/vxlan.h                          |  5 ++-
 include/uapi/linux/nexthop.h                 |  3 ++
 net/ipv4/nexthop.c                           | 20 +++++++++-
 tools/testing/selftests/net/fib_nexthops.sh  | 59 ++++++++++++++++++++++++++++
 tools/testing/selftests/net/test_vxlan_nh.sh | 31 +++++++++++++++
 6 files changed, 121 insertions(+), 3 deletions(-)
---
base-commit: f6f3b36c15ed44de1fbb44e645e4fae8c4a4453e
change-id: 20260712-b4-vxlan-fdb-port-486bb215eab6

Best regards,
--  
Jack Ma <jack4it@gmail.com>

