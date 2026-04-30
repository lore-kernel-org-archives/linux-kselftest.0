Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA6A3C553A
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 23:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777592354; cv=none; b=O0b3Ef/wkw+apwx0ENmKyAvbzvu3AoENlks23lrNR0b+2Ah5iEvMCLzoyKxKwSxQsFnLUjudsFHCN1Jd3vlrFjaLUvUzNJURCq5JkBodNU09yLd3QVQ5HOSSMkpFht9gojDKB+ShbL9TcZ4inQ1XCCZAH1rS56m+/HPjR0uiwsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777592354; c=relaxed/simple;
	bh=xa+90cajr5mMWrTYdZcEISHBJqeKrEmHV2IcV7+g/Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFTGGaU/Ruq/6VmUeKomHzqJRKBJhOORIoPzeo80SM8a1jv+xuYUGfNc1o9WISoRbyX0LItfWKTUudhuNje/10617vrZrv14ZmTHgGnx9vZIZyGXbD3K/5xZlYo/S/EILvH4Cromx6euBYnoeL8WfpH50FGEai/1THjmIqaCcUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-50e5eb0fabaso14516151cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 16:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777592352; x=1778197152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L9p6ZBs3o3Fa+hheEbjqBW5O3NwkqJypwl5eyCvle18=;
        b=Bpm48g7DpMUrBrSDRiOzyO40tfFadxyr+j+ddjcNgzMMMR9CT7nzz3lWjXRVDhayg8
         pxuco6CHALwrT1CmihuDPoo1XoQAYKBaKIr8zW5GF2TVmdrGtjaeCGzM/WBSPZwkFKHZ
         G64A6URWUOT8ID6k3N5Tc4TvHmFxHlv1JNTbn3uBvWQJ+Z3dWqmWchqVlDuCoLg37CQf
         heu+0ffQimk5CTJJIwdsQLIShO6dxadzYsnd9+jogVEiTVG3ceZZeRx4zxZsVfbpAVxE
         FqgnVTeCxfAs6TRy+JuBCuH90G8hH40xdHQace/9zUk23eH5TAZd7F6OE2ZK7QwNDGvf
         ZP1g==
X-Forwarded-Encrypted: i=1; AFNElJ/51Ql9HLhMagqFvrJFMrzsszgICKEQy+uktmHEzrk2KK5soOvKMrmQvZE/M06d6SllDunr2Vy7FFJlCLSk2EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEFVzRM8mkiimAqrTwbiiuliAgd2fyxKw4Hduqa6BI2Mr98V1F
	r5467ET97LTCaB1nY10ZqLxLR3jTW8JmMnfIDYdu7JHHbcU7u2p9ukK8
X-Gm-Gg: AeBDieutlNpDIQDSTd/GSuIlqzoFD471kBqWHrczcgZU8iQ6EhMjJ2QdCqO9Yzx46gz
	ygQDFWvnvRlR7aM3bCyJ8Wu3E074TNZVkJ7wrBUQcOGU7FLRUtFzB2SaZlLGCpCfiKZLaRyCgXE
	vQCDk9KF6KiNQsnyed3Rx2a0PFJCWaloexuFPOKzzlivKdKniLMNBg8MoljbAGRghK7u4XP7gp/
	D4+MUzEs/aKFEipAm2zh700TU/rzY68uZnotcI88iQPGKIAOfqiL/q2DEUb3X0n5CYlkojD6Aaa
	U0IgO37ICaRRdyM0Zbw0m/WRwJSrUU1vFCQeQ1LZ/cAY0rHkwtxdpRhuDllbrMho7GpbrT98AiY
	LdmH8I9dfJUyCKa/b7xygXcxEQTfLgVI0PShtTNVmUrOw6rSrLhg/y6oz0zmt8nLyRxuE60w4Qu
	RaH2vsBD85hP7oZQR1lucXBmFHasSX0aVUIK+fGrDpEbTTgemgER29sLtMuhqRJRHPtYJ2Xw==
X-Received: by 2002:a05:622a:1b19:b0:50d:b33d:bc6b with SMTP id d75a77b69052e-5102ab1f495mr75917351cf.20.1777592351818;
        Thu, 30 Apr 2026 16:39:11 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040934199sm221cf.13.2026.04.30.16.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:39:11 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuan Tan <tanyuan98@outlook.com>,
	Yang Yang <n05ec@lzu.edu.cn>,
	dev@openvswitch.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net v2 2/2] selftests: openvswitch: add tests for tunnel vport refcounting
Date: Fri,  1 May 2026 01:38:38 +0200
Message-ID: <20260430233848.440994-3-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430233848.440994-1-i.maximets@ovn.org>
References: <20260430233848.440994-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were a few issues found with the tunnel vport types around the
vport destruction code.  Add some basic tests, so at least we know that
they can be properly added and removed without obvious issues.

The test creates OVS datapath, adds a non-LWT tunnel port, makes sure
they are created, and then removes the datapath and waits for all the
ports to be gone.

The dpctl script had a few bugs in the none-lwt tunnel creation code,
so fixing them as well to make the testing possible:
- The type of the --lwt option changed in order to properly disable it.
- Removed byte order conversion for the port numbers, as the value
  supposed to be in the host order.
- Added missing 'gre' choice for the tunnel type.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 37 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 19 +++++++---
 2 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index b327d3061ed53..3cdd953f68132 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -26,6 +26,7 @@ tests="
 	netlink_checks				ovsnl: validate netlink attrs and settings
 	upcall_interfaces			ovs: test the upcall interfaces
 	tunnel_metadata				ovs: test extraction of tunnel metadata
+	tunnel_refcount				ovs: test tunnel vport reference cleanup
 	drop_reason				drop: test drop reasons are emitted
 	psample					psample: Sampling packets with psample"
 
@@ -830,6 +831,42 @@ test_tunnel_metadata() {
 	return 0
 }
 
+test_tunnel_refcount() {
+	sbxname="test_tunnel_refcount"
+	sbx_add "${sbxname}" || return 1
+
+	ovs_sbx "${sbxname}" ip netns add trefns || return 1
+	on_exit "ovs_sbx ${sbxname} ip netns del trefns"
+
+	for tun_type in gre vxlan geneve; do
+		info "testing ${tun_type} tunnel vport refcount"
+
+		ovs_sbx "${sbxname}" ip netns exec trefns \
+			python3 $ovs_base/ovs-dpctl.py \
+			add-dp dp-${tun_type} || return 1
+
+		ovs_sbx "${sbxname}" ip netns exec trefns \
+			python3 $ovs_base/ovs-dpctl.py \
+			add-if --no-lwt -t ${tun_type} \
+			dp-${tun_type} ovs-${tun_type}0 || return 1
+
+		ovs_wait ip -netns trefns link show \
+			ovs-${tun_type}0 >/dev/null 2>&1 || return 1
+
+		info "deleting dp - may hang if reference counting is broken"
+		ovs_sbx "${sbxname}" ip netns exec trefns \
+			python3 $ovs_base/ovs-dpctl.py \
+			del-dp dp-${tun_type} &
+
+		dev_removed() {
+			! ip -netns trefns link show "$1" >/dev/null 2>&1
+		}
+		ovs_wait dev_removed dp-${tun_type} || return 1
+		ovs_wait dev_removed ovs-${tun_type}0 || return 1
+	done
+	return 0
+}
+
 run_test() {
 	(
 	tname="$1"
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 848f61fdcee09..bbe35e2718d26 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -11,7 +11,6 @@ import logging
 import math
 import multiprocessing
 import re
-import socket
 import struct
 import sys
 import time
@@ -2069,7 +2068,7 @@ class OvsVport(GenericNetlinkSocket):
         elif vport_type == "internal":
             return OvsVport.OVS_VPORT_TYPE_INTERNAL
         elif vport_type == "gre":
-            return OvsVport.OVS_VPORT_TYPE_INTERNAL
+            return OvsVport.OVS_VPORT_TYPE_GRE
         elif vport_type == "vxlan":
             return OvsVport.OVS_VPORT_TYPE_VXLAN
         elif vport_type == "geneve":
@@ -2121,6 +2120,7 @@ class OvsVport(GenericNetlinkSocket):
         )
 
         TUNNEL_DEFAULTS = [("geneve", 6081),
+                           ("gre", 0),
                            ("vxlan", 4789)]
 
         for tnl in TUNNEL_DEFAULTS:
@@ -2129,9 +2129,13 @@ class OvsVport(GenericNetlinkSocket):
                     dport = tnl[1]
 
                 if not lwt:
+                    if tnl[0] == "gre":
+                        # GRE tunnels have no options.
+                        break
+
                     vportopt = OvsVport.ovs_vport_msg.vportopts()
                     vportopt["attrs"].append(
-                        ["OVS_TUNNEL_ATTR_DST_PORT", socket.htons(dport)]
+                        ["OVS_TUNNEL_ATTR_DST_PORT", dport]
                     )
                     msg["attrs"].append(
                         ["OVS_VPORT_ATTR_OPTIONS", vportopt]
@@ -2145,6 +2149,9 @@ class OvsVport(GenericNetlinkSocket):
                                  geneve_port=dport,
                                  geneve_collect_metadata=True,
                                  geneve_udp_zero_csum6_rx=1)
+                    elif tnl[0] == "gre":
+                        ipr.link("add", ifname=vport_ifname, kind="gretap",
+                                 gre_collect_metadata=True)
                     elif tnl[0] == "vxlan":
                         ipr.link("add", ifname=vport_ifname, kind=tnl[0],
                                  vxlan_learning=0, vxlan_collect_metadata=1,
@@ -2563,7 +2570,7 @@ def print_ovsdp_full(dp_lookup_rep, ifindex, ndb=NDB(), vpl=OvsVport()):
             if vpo:
                 dpo = vpo.get_attr("OVS_TUNNEL_ATTR_DST_PORT")
                 if dpo:
-                    opts += " tnl-dport:%s" % socket.ntohs(dpo)
+                    opts += " tnl-dport:%s" % dpo
             print(
                 "  port %d: %s (%s%s)"
                 % (
@@ -2632,7 +2639,7 @@ def main(argv):
         "--ptype",
         type=str,
         default="netdev",
-        choices=["netdev", "internal", "geneve", "vxlan"],
+        choices=["netdev", "internal", "gre", "geneve", "vxlan"],
         help="Interface type (default netdev)",
     )
     addifcmd.add_argument(
@@ -2645,7 +2652,7 @@ def main(argv):
     addifcmd.add_argument(
         "-l",
         "--lwt",
-        type=bool,
+        action=argparse.BooleanOptionalAction,
         default=True,
         help="Use LWT infrastructure instead of vport (default true)."
     )
-- 
2.53.0

