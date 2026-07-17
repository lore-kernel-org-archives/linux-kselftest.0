Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8713C2774
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270738; cv=none; b=ib4zCd1eav8E30qWfQMRnOZYTQITuNwyBnWmNor2NOn21WTMXsS3H+6jANXdL3evEc6quszwb2NKDBqyFA/JNN1F2zrizCLchNgflT2rnB9n7CPxGB9uv9Dkm0Z6+/tD39IufNpBahPTWhPy8ZtbsYT+5BqDu8RN5CbewScwDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270738; c=relaxed/simple;
	bh=XV+2XAF3qZwZEC4mK31FVYhlhvi/kl5+IWlE+lpxhnM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C49oWh8uc5gf3fd7CBwW0PyzH4PCCkyPTJAE1HELf1mRUQNCbfnDoF60TRD1ahTevjkNe2F0B47lcUxoit33klHhTNniiWwY3iamahYpItGTpQVjn4f5sZgadpOioYRLI8frTO+4GpHGwE/JeBRh7+iOPld2sfhMFu12YsftiGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwFGcJXM; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwFGcJXM"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8484f229529so2973218b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 23:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270725; x=1784875525; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EXn6QRqS4jvu8jHBhezi/8Kt9KeA/fpoSnIUV3/hZg0=;
        b=ZwFGcJXMFqO4gVH1jRE5PUI9c42JhEsQ3OrnThGHZI2QZP6yky/VPqeGB5tNdy8CwH
         duVC/b5btefSR/rgnzT66VW80F2ApJBXW7cWwQ9BKZF+8dF1VBU5VZioycWkIB2QsVxM
         o3G+6p7PpztNGH/XJvRffGeOMoGakXyRErbMNNvgPD54citYBVibnaRiPNhSJNQXWuP/
         TB3MVhbnZxuIjTvqhgxFuVaJ4zdZ3B09kEpUH/6n1UU2CL0fH2eCVjWKKNZIki54YMPk
         zHSoI0nWO+ucSF1UlqJz9ZOoeHIpH4SsiXh69zIaL+h+0C/Er6oProRwDeprEF7eTKrU
         1Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270725; x=1784875525;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EXn6QRqS4jvu8jHBhezi/8Kt9KeA/fpoSnIUV3/hZg0=;
        b=GY1mMbKg/C56XtrnSk3Yp/SeQvOfV0nsAHgFsE/N0TWJmfncLcAyuSB0abPAzbp/87
         ODZBpBZPj9ICD6wtFFVSMuHalUz6l1cBjIn2d3BQ2IQbJZKP7OXr7SYDBAVmcxA9ubHw
         hVeWTco4FW/GSta+R9PpGlhC5vqztypxx+XGcT2SQr/bzOdX/PVMDZeIx89IDuFJBX8/
         +9EnCXt0siatmoSX1nxoeF7jIvQqB6MiXidDAXcqcYudRemsVTAauNvtNbbmXKm5y4f3
         xhr0AcvAQnyOOGa7hfvO3b5mBCsXEf3IXtCxUejsl+hKIjOVkgeDVeDVAsi1WIHpKwok
         H4wQ==
X-Forwarded-Encrypted: i=1; AHgh+RozQV5ogTdjnG6TCy93rJrKOZtOP6akg9yRoCk2OI7tW+aZJT7dokpstg3ULmgZzyhVGL4ip399Sb6fX8MeFj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZMiTDHWalEFdvLxevj622wnh4o77nAXMCUJtRyx/XZhpSyyf
	3R4eF453oCpcPZtkvDkJ2VqVbb9Mrd470obI0WQE4SrO5aO4EaDq9Mny
X-Gm-Gg: AfdE7cn9l8YSPgks6Z88POikWQIWTZJObnuwKPuDAnrZmZORB20q1kOJYPhyfc6xnXY
	YD8+YqGU6h8Shuc7H8yUuOVPDhj/CtcKL6+rW4pGhqdL5ch8K0a7n7/AbIOHRONDASXG57+lN9R
	Mhvstrl7ea9VHwQdcv3dDaJjK5iI3RDLehPF4UBJFbp4ACD6mo/qggUGmFV3TCsvedQO64ApzUM
	k4DSA14n+hrynZA7w6dNXjhiq2ZgzVpcow/15y5H7LxsrMCr/W6NycBjuK610BeubUcQnjyMCFC
	KFh/X2JxKLv7TI+xO5w+53dWEh6WcWxYfDyx6R8oyztJNNDHOrc1WypHnpJ/Jw7mefTEcKgF4xz
	kjtMj9ATRf2Lc6hAKgBmWTk37ZhOCWOPbRXNG03rN3S5DHmGAOBkTVrTP5Jmf4USa5va/PG7l1i
	r3mMS6+NUV0e1cxAJAkUo9DJeMbQ==
X-Received: by 2002:a05:6a00:1bcb:b0:848:34ad:3d3b with SMTP id d2e1a72fcca58-84c292276camr1360014b3a.14.1784270725004;
        Thu, 16 Jul 2026 23:45:25 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2ad8855fsm430531b3a.12.2026.07.16.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:45:24 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Subject: [PATCH net-next v2 0/3] net: nexthop: per-nexthop UDP dst port for
 fdb (VXLAN) nexthops
Date: Fri, 17 Jul 2026 06:45:15 +0000
Message-Id: <20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHvPWWoC/yWM0QqDMAwAf0XyvIAGV2W/MvbQaJyREaXtpCD++
 7rt8TjuDogSVCLcqgOC7Bp1tQJ0qWCYvT0FdSwMVJOru4aQW9zzyxtOI+O2hoRt75ipuYpnB6X
 bgkyaf887mCQ0yQkefxPfvMiQvks4zw8bvjRefwAAAA==
X-Change-ID: 20260712-b4-vxlan-fdb-port-486bb215eab6
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784270724; l=8892;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=XV+2XAF3qZwZEC4mK31FVYhlhvi/kl5+IWlE+lpxhnM=;
 b=bR4XPfyD6uoVI1JckB+yRWEcYH9SIM/TubaeggEIDLWlxaic+6ueiPAjVniQlFOJjG4JSAvGx
 SnIWQuYzc4cB0CcerdPBMX73Nnv9nMrZ9WgFbTnn6QJWc95qWqzkBpL
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
  - Patch 3 adds a selftest.

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

Testing: kernel and iproute2 built on net-next.  The control-plane selftest
passes (6/6) and a datapath test (two netns, tcpdump on the underlay) confirms
outer traffic is hashed across both UDP ports.  The series is bisectable:
patches 1 and 2 each build individually.

A matching iproute2 change (the `ip nexthop ... fdb port N` keyword) is posted
separately to the iproute2 list.

Changes in v2:
- Expand the cover letter with the deployment model and the
  addressing-vs-load-balancing distinction that motivates the attribute, as
  requested (Ido Schimmel).
- Reword the problem statement: the UDP port is underlay demux (addressing),
  not what distinguishes otherwise-interchangeable load-balancing targets.
- Drop the speculative NHA_FDB_VNI follow-up note; there is no use case for a
  per-leg VNI in an fdb nexthop group.
- No functional change to the patches.

v1: https://lore.kernel.org/netdev/20260712191218.236-1-jack4it@gmail.com/

Signed-off-by: Jack Ma <jack4it@gmail.com>
---
Jack Ma (3):
      net: nexthop: add NHA_FDB_PORT for fdb nexthops
      vxlan: honor per-nexthop fdb destination port
      selftests: net: add coverage for fdb nexthop dst port

 include/net/nexthop.h                              |  7 +-
 include/net/vxlan.h                                |  5 +-
 include/uapi/linux/nexthop.h                       |  3 +
 net/ipv4/nexthop.c                                 | 20 +++++-
 tools/testing/selftests/net/Makefile               |  1 +
 .../testing/selftests/net/fib_nexthops_fdb_port.sh | 78 ++++++++++++++++++++++
 6 files changed, 111 insertions(+), 3 deletions(-)
---
base-commit: f6f3b36c15ed44de1fbb44e645e4fae8c4a4453e
change-id: 20260712-b4-vxlan-fdb-port-486bb215eab6

Best regards,
--  
Jack Ma <jack4it@gmail.com>

