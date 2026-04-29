Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C499379960
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777475896; cv=none; b=ORjNKG1h+YJ/zd/SL3kckT31q2dmUuwIjJkCQvZtdBY6mokT0fdYiPVVJJq11KSlYrQb6X1nW+0m5tumnC19Ieu1ujZN348s+ye8ETxXjWURZKJd+NkgbjwqddSQWQm1y0N3h/gXC2e2BazbgyAM+/mjR2gkdh/vsZyAuMHhRRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777475896; c=relaxed/simple;
	bh=SCCuZca09OdAS3knl33zqAdII8RwnJ+xs+WR0FRDVV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVc6iPHTNM6txG3o8nGT0/h9+A1bjUG+zjZdEaW0ughpvAaLVsm44mFxYdlnc5uJJ43P/v+k1TqU8ApBm7VsbiCv9ZDTAxAa5oUcdbPwGNIG/xAy/nxPYAtg6vVFjSJHyZEPmUJ5pA+64AiFxl+S4P9UHih5epinxegzerAiVN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso105948645e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 08:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777475891; x=1778080691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hJJfrQeEaqhpRK/hzlkX5+ypxVhHeghBlozgM+ehlX8=;
        b=FzfiD9wrJAeJ6OhQXgGrNbDYXBBpVALWxWXZZ4FWxgeY22gELpSU/YVQZJg3l1Kw29
         9cHOqWhIuXJAUxxP24fZmvDZn0BKKIxQhT6KcrybIpMv7bqc7Bvpz9ol5BSZlm3C171g
         lqgZdPnKlFkTHQY1GHpPijuE+HQuZ/R2hRjgoDDYcz3sWG3DQqbOwnu7flZaymdilFNP
         NeLsTU3+/74ZD4IikJtkEMvc1DeQz5wMgMcHFog2Rjtyyd1X/ZRyUJLb48YVeGdxvvBA
         0pbiaxHkR3n/rUMSRGaCTa9rO/LHAxfThp4drYkm7a7wymNGEQWU5IGmG77LEkpzxn+R
         9/SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tB9V9la7t5KvnEszwBqOyZA+87OaASKgUcXo8i1hcBZ1LEQ4NHdAzd0JhGcRpnp0wjeNjXHTDidtuHr2YjTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoyBO5FAfC+4/yadf74anizDjEdDUkgNp8/8eUg5RiPgtLenpL
	R68zv6z2mBJyxh4UtZP6C+b3Elm/2Thl1mu0RnB9k0lemKRxJckKB4Nm
X-Gm-Gg: AeBDietu+j0lV38lE89ngo1wOMhSqUlr7EqGEuIYCqfkRD5OWUwrXocXrzNK4xadHkS
	KSQVbBnxdr+hewzYBzEBnFQuA1meG7N9In1Awjckf0ZDTNQzO55gunG7JsCT5PSqMv3cB8TKeEx
	wu3+8AD1KnkgIJ2EZWtif4/1ekxtxOtkE50MsZPYoWUU9wXv5RXK1SzJjBt29P0hQA8aWKIT7gQ
	fi2qRGKN4s3biGYQknYZ5LwWuA5FcQ93MWVQ27GEoJUleid77L83950B3FQ79KT3kb8VSMZRcap
	qiAuoFVVf6TOtGhmOHnXgKeIIrk7LDw2OclaixKHvYilS4c4juxPWOllMfUinGUDUwb8phpXgxh
	aZcmigYBlhWHXpqhemC75Ue7ypcopnhl5UtybunQFXEoZF8yQBFWynuFK6awxB0CIRNWeNIbob5
	fArScxIB6u5dkKRkn5wmd/779gkEh796BH6p1p64aH3ZjLJMe3WH1Yh6/B/5LngFXeIEMusw==
X-Received: by 2002:a05:600c:4fcd:b0:488:a916:14a8 with SMTP id 5b1f17b1804b1-48a77af0507mr126951365e9.10.1777475890388;
        Wed, 29 Apr 2026 08:18:10 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2d3811sm32358165e9.3.2026.04.29.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:18:09 -0700 (PDT)
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
Subject: [PATCH net 2/2] selftests: openvswitch: add tests for tunnel vport refcounting
Date: Wed, 29 Apr 2026 17:16:37 +0200
Message-ID: <20260429151756.4157670-3-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429151756.4157670-1-i.maximets@ovn.org>
References: <20260429151756.4157670-1-i.maximets@ovn.org>
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
 .../selftests/net/openvswitch/ovs-dpctl.py    | 10 ++---
 2 files changed, 42 insertions(+), 5 deletions(-)

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
index 848f61fdcee09..196813f476434 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -2069,7 +2069,7 @@ class OvsVport(GenericNetlinkSocket):
         elif vport_type == "internal":
             return OvsVport.OVS_VPORT_TYPE_INTERNAL
         elif vport_type == "gre":
-            return OvsVport.OVS_VPORT_TYPE_INTERNAL
+            return OvsVport.OVS_VPORT_TYPE_GRE
         elif vport_type == "vxlan":
             return OvsVport.OVS_VPORT_TYPE_VXLAN
         elif vport_type == "geneve":
@@ -2131,7 +2131,7 @@ class OvsVport(GenericNetlinkSocket):
                 if not lwt:
                     vportopt = OvsVport.ovs_vport_msg.vportopts()
                     vportopt["attrs"].append(
-                        ["OVS_TUNNEL_ATTR_DST_PORT", socket.htons(dport)]
+                        ["OVS_TUNNEL_ATTR_DST_PORT", dport]
                     )
                     msg["attrs"].append(
                         ["OVS_VPORT_ATTR_OPTIONS", vportopt]
@@ -2563,7 +2563,7 @@ def print_ovsdp_full(dp_lookup_rep, ifindex, ndb=NDB(), vpl=OvsVport()):
             if vpo:
                 dpo = vpo.get_attr("OVS_TUNNEL_ATTR_DST_PORT")
                 if dpo:
-                    opts += " tnl-dport:%s" % socket.ntohs(dpo)
+                    opts += " tnl-dport:%s" % dpo
             print(
                 "  port %d: %s (%s%s)"
                 % (
@@ -2632,7 +2632,7 @@ def main(argv):
         "--ptype",
         type=str,
         default="netdev",
-        choices=["netdev", "internal", "geneve", "vxlan"],
+        choices=["netdev", "internal", "gre", "geneve", "vxlan"],
         help="Interface type (default netdev)",
     )
     addifcmd.add_argument(
@@ -2645,7 +2645,7 @@ def main(argv):
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

