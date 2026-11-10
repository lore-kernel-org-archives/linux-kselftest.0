Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332840;
	b=fnje4//PupHp5cJJYppwjF1QNdOdhUibk0POLaJNF5/RJWujo2ikn4jakcsLtQf5+JRg
	 fcQI608lD02scjSRLF4noBY/GnFl/PXFV0AnfXiOVFpElXB8vW5YaoxvalG6gL7Tyu3Je
	 +FsQPwHbyf2xGA7p52GilGAjQ3ahEd2iIpcKvGthsiNateBOOH0gBLPaYhyFIW6vVdvFE
	 cfHRc9I0GU3S0Pwb/xYJBJo+wd0sPK/PPOApVp8ytJRSUz+3V2g2ItHCajcrxXrKtfUt8
	 7ipXS7kd6z3ztINyvBZmEqwbHNMR+nkUqvJd4wiwHOal2sx++F4GBJa0ZrNxdUCgUmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R/VVIrZF33zZNNLK4F0UO/Zo9290InoyHrFWxhianmE=;
	b=Ovg13uOiqQw0KYGltHTPgX9U25ALW5e3eK4VLuWr5k2Aero4WkP7Skj6lPTTr5WBgeY4
	 kiGRPGlKFqLKTrsZ0il3w7c2dIIOcgIOZbXS4eytigO1ftiUqSKLxs12W2UmqSea/V35y
	 aMJxxKVX5Bgl4ISk5ki9FRUaQsR82VZT1uqHgsD4TnRHZ63hExCWSDQ789cuDyVC3Fmzm
	 lhuj7phvw/djcnaBXAUFeEdEkl5eFdtfFU9TZsPlQtVbpQcruxzRBtnfsgy+Zr/9sDC55
	 aJ2zCv+hm7bkAAeQvNcztLiyeDc/wPkgGNzooJ/uwib7xJ4jIJ8IjdoTMZaehpt22QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaE73fgn;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF1606A327
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43FF1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaE73fgn
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-499f20c7054so1119330fac.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 09:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332839; x=1794937639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/VVIrZF33zZNNLK4F0UO/Zo9290InoyHrFWxhianmE=;
        b=gaE73fgnAlZD9KkO9sZ6NryD0ZsN4hskEm5BizeCw1X6QVgp+0/i6xHIKvGwV9ecY0
         O5uCACHUxgqVitQNb4EAtVmkcsnvqKRA4o2rbJg6GCfcMdRtvO0V54NkdpmKezs5I5yU
         W7bAIUqtX/PNjKdVPPlYGoUdnj5j0CHDY/a4DnS84wkouXyZhjifZz2WtZricIQqDNY/
         FoqtQ9wli+eDjqOyMJpMjBqRfSSSNHYOuOGIoDvwMP+qhNL4fSQB/sieq5endjugEjRo
         FwRDzryX9YEQLIuzR6Ox5UUNMxj2UYZhlfBc0LTDJVQHQ17FwtxF64q1/6M9QuHaStED
         ThTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332839; x=1794937639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/VVIrZF33zZNNLK4F0UO/Zo9290InoyHrFWxhianmE=;
        b=e03yhUIxmVOxzHgHbCvqm+k6ysKRlSv9MvKse6SIn221s+/SAHGDrE/SUHPH/KXa4z
         IjOfOOb5aS1P9brbkiEcQTWrVlNIn29uaOenNH03dHdQchE87QDA4cT1xC/IieNUAO6m
         Vt2TIrs+DTUcJ78HIBPobdjUk7LxNkA7YtpTUJjx6cWd3FozdRS+3My6hPP5dzML36wr
         OiiZrqGCjGrscxTJLl6O/RXCkgcjhF5NzjvaEaTJj5S+uQI6R/DFCyVLnCsh+n8YILjU
         Ypk04mzyRJlwz/eC0hWTVa9JSEbsxRdE6/vkFC2J0jNZWOKwvDh5AEAeAqTJIYk1X8pA
         y9sQ==
X-Forwarded-Encrypted: i=1; AL+hErGbUNSTi587W8bVwDVx00jBtMCa7tcAWKtLXzpeeA5boUZ9iTjri05PnRdLbvQSdZFqV+W3su8YUhWFJ2lNPBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i9HU/Rmq8hp3h0UZZnwR4ETv/xaFWmjk4De4mIow13Bs8/YKf
	NDYgLfTuHWgmnSxMjYeIMFNbzJ1iQiQLKRc+CgeUuevs3eMd9kPvqR9E
X-Gm-Gg: AYBFou3QVS+7NjwNQZ/uejYXlqaIn/BBOc4TYtnML3jngbWy21Rq/95ZG9KKUGxL4Bh
	pobMkJFpqQXaY0J/78+SWceuuKlVVBtMXXRtD3VHXmUbHBY/7AS1WyNfXbH0JaJ4swpl/dZLq6B
	MLt0zLYKbtrqiaXkWeSbazA7HGtvVuLpgwofS3uoIDTTZDhBgUN5OAqdrDpk2+gFJ91PJEqFxPg
	yPqni8EkgSvLZA8cCYhg8DTeBdhxsulmifumkr7AsXNiN0SizlNCzpmQEtY6P8c/iwpXpMkAGOY
	1YcJHLBqRhQX8jDgwXHjz8U341JvSF57dRBK7fYC/x03/xefAaSmCYbYG+AbBAdc8cAXROzyVa/
	tlvOBfgmnaIVoAl6L5diCiI/0PEivhOVmr6oSBMGFO00VKpOwTi8DwtmDxSEm4ntZ1wHootPTFK
	eYScshk8ZTIRfPu/QgimpeE7K7bzAEwg+rcOotbEPE5tqaiSUkCz04HILtNs5HMKce36Y9Ad2B1
	51OOEgW2Jdyw1VJAw2CKedO8d7BddRqfZfiDfWrzW1vRGimu1B40MD+8pixIq//q1l1tuGzEHPH
	6TXkQ0tcisgKrS2ULr1qHXOhUNRjPLM40mJ4ody2AFSU0w==
X-Received: by 2002:a05:6808:159f:b0:4d6:90f3:74a1 with SMTP id 5614622812f47-5683ccd209amr2548440b6e.44.1794332839046;
        Tue, 10 Nov 2026 09:47:19 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f2faf5sm2667315b6e.13.2026.11.10.09.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:47:18 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Paul Blakey <paulb@nvidia.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Shuah Khan <shuah@kernel.org>,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 2/2] selftests/net/openvswitch: check that a failed set keeps the features
Date: Tue, 10 Nov 2026 12:46:51 -0500
Message-ID: <20261110174651.972936-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110174651.972936-1-houminxi@gmail.com>
References: <20261110174651.972936-1-houminxi@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a set-dp command to ovs-dpctl for the kernel's datapath SET command,
and two tests that use it.

The first test clears the features of a fresh datapath, sets the dispatch
bit with a valid pid list, and then sends a set that would set the same
bit with an empty per-cpu-pids. The request has to fail with EINVAL and
the datapath has to keep reporting the features it had. It then sends
OVS_DP_CMD_NEW for that name from an outdated client, which makes the
kernel drop the features, and checks that a further set still works.

The second test does the same for the recirc bit. A datapath can only
hold that bit when the tc skb extension is compiled in, so the test
prints the reason and skips when the kernel answers EOPNOTSUPP, and any
other failure of that request fails the test. CONFIG_NET_TC_SKB_EXT
depends on CONFIG_NET_CLS_ACT and both sit under CONFIG_NET_SCHED, so the
selftest config fragment selects all three.

The two set rounds fail without the fix in the previous patch. The
rejected set then leaves the datapath reporting 0x8 where it reported
0x0, and 0x8 where it reported 0x4 in the recirc test. The reference
count itself is not visible from user space, so the outdated client
rounds only show that those paths run and that a datapath keeps working
across them.

set-dp sends the features it is given. When --features is left out it
sends the features the datapath reports, and it refuses to send the
request when the datapath reports none. A pid list that is not a list of
numbers is reported as such, and empty entries are dropped.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../testing/selftests/net/openvswitch/config  |   3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 126 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  60 +++++++++
 3 files changed, 189 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
index 15685d242813..38fa1477b7cd 100644
--- a/tools/testing/selftests/net/openvswitch/config
+++ b/tools/testing/selftests/net/openvswitch/config
@@ -2,10 +2,13 @@ CONFIG_GENEVE=m
 CONFIG_INET_DIAG=y
 CONFIG_IP_SCTP=y
 CONFIG_IPV6=y
+CONFIG_NET_CLS_ACT=y
 CONFIG_NETFILTER=y
 CONFIG_NETFILTER_ADVANCED=y
 CONFIG_NET_IPGRE=m
 CONFIG_NET_IPGRE_DEMUX=m
+CONFIG_NET_SCHED=y
+CONFIG_NET_TC_SKB_EXT=y
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_OVS=y
 CONFIG_NF_CT_PROTO_SCTP=y
diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 21444657a040..d22f4f535beb 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -24,6 +24,8 @@ tests="
 	nat_connect_v4				ip4-nat-xon: Basic ipv4 tcp connection via NAT
 	nat_related_v4				ip4-nat-related: ICMP related matches work with SNAT
 	netlink_checks				ovsnl: validate netlink attrs and settings
+	dp_features				ovsdp: rejected set keeps bits
+	dp_features_recirc			ovsdp: recirc survives rejection
 	upcall_interfaces			ovs: test the upcall interfaces
 	tunnel_metadata				ovs: test extraction of tunnel metadata
 	drop_reason				drop: test drop reasons are emitted
@@ -1409,6 +1411,130 @@ test_netlink_checks () {
 	return 0
 }
 
+ovs_dp_features_set() {
+	python3 $ovs_base/ovs-dpctl.py set-dp "$@"
+}
+
+ovs_dp_features_check() {
+	python3 $ovs_base/ovs-dpctl.py show "$1" |
+		grep -q "features: 0x$2\$"
+}
+
+# The number of an errno outside the base list differs by architecture.
+# EINVAL is in the base list and is 22 everywhere.
+ovs_errno() {
+	python3 -c "import errno; print(errno.$1)"
+}
+
+# dp_features test
+# - a set with the dispatch bit and pids is accepted and reported back
+# - a set with an empty per-cpu-pids is rejected with EINVAL and leaves
+#   the features as they were
+# - an outdated new request drops the features, and sets work afterwards
+test_dp_features() {
+	local t="test_dp_features"
+	local dp="dpfeat0"
+
+	sbx_add "$t" || return $?
+	ovs_add_dp "$t" "$dp" || return 1
+
+	info "clear the datapath features"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 || return 1
+	ovs_sbx "$t" ovs_dp_features_check "$dp" 0 \
+	    || { info "features were not cleared"; return 1; }
+
+	# 8 is OVS_DP_F_DISPATCH_UPCALL_PER_CPU, the bit that makes the
+	# kernel read per-cpu-pids.
+	info "a set with the dispatch bit and pids is accepted"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids 1,2 || return 1
+	ovs_sbx "$t" ovs_dp_features_check "$dp" 8 \
+	    || { info "the accepted set was not applied"; return 1; }
+
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 || return 1
+
+	# ovs-dpctl sends the empty list as an attribute with no payload,
+	# which is what the kernel rejects.
+	info "a set with an empty per-cpu-pids is rejected"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids "" &> /dev/null
+	[ $? -eq 22 ] \
+	    || { info "the empty per-cpu-pids set did not fail with EINVAL"; \
+		 return 1; }
+
+	info "the rejected set keeps the features it had"
+	ovs_sbx "$t" ovs_dp_features_check "$dp" 0 \
+	    || { info "the rejected set was recorded"; return 1; }
+
+	# An outdated client that asks for an existing datapath again makes
+	# the kernel drop its features. The datapath keeps working.
+	info "an outdated new request drops the features"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 || return 1
+	ovs_sbx "$t" python3 $ovs_base/ovs-dpctl.py add-dp "$dp" -V 1:0 \
+	    &> /dev/null
+	ovs_sbx "$t" ovs_dp_features_check "$dp" 0 \
+	    || { info "the outdated new request did not drop the features"; \
+		 return 1; }
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    || { info "the datapath stopped accepting sets"; return 1; }
+	ovs_sbx "$t" ovs_dp_features_check "$dp" 8 \
+	    || { info "the reset datapath took no features"; return 1; }
+
+	return 0
+}
+
+# dp_features_recirc test
+# - a datapath that holds the recirc bit keeps it across a rejected set
+# - an outdated new request drops the features
+# - the bit needs CONFIG_NET_TC_SKB_EXT, so the test skips without it
+test_dp_features_recirc() {
+	local t="test_dp_features_recirc"
+	local dp="dpfeat1"
+
+	sbx_add "$t" || return $?
+	ovs_add_dp "$t" "$dp" || return 1
+
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 || return 1
+
+	# 4 is OVS_DP_F_TC_RECIRC_SHARING. The kernel takes the bit only when
+	# the tc skb extension is compiled in.
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 4 &> /dev/null
+	rc=$?
+	if [ $rc -ne 0 ]; then
+		eopnotsupp=$(ovs_errno EOPNOTSUPP)
+		if [ -n "$eopnotsupp" ] && [ $rc -eq "$eopnotsupp" ]; then
+			# Say it on stdout: a skip that only reaches debug.log
+			# leaves CI with a pass and no sign of the missing
+			# coverage.
+			printf "# tc skb extension is not compiled in," \
+			       "skipping recirc\n"
+			ovs_exit_sig
+			return $ksft_skip
+		fi
+		info "the recirc set failed with $rc"
+		return 1
+	fi
+	ovs_sbx "$t" ovs_dp_features_check "$dp" 4 \
+	    || { info "the accepted recirc set was not applied"; return 1; }
+
+	info "the rejected set keeps the recirc bit"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids "" &> /dev/null
+	[ $? -eq 22 ] \
+	    || { info "the rejected set did not fail with EINVAL"; return 1; }
+	ovs_sbx "$t" ovs_dp_features_check "$dp" 4 \
+	    || { info "the rejected set dropped the recirc bit"; return 1; }
+
+	info "an outdated new request drops the features"
+	ovs_sbx "$t" python3 $ovs_base/ovs-dpctl.py add-dp "$dp" -V 1:4 \
+	    &> /dev/null
+	ovs_sbx "$t" ovs_dp_features_check "$dp" 0 \
+	    || { info "the outdated new request did not drop the features"; \
+		 return 1; }
+
+	return 0
+}
+
 test_upcall_interfaces() {
 	sbx_add "test_upcall_interfaces" || return 1
 
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 1615843c225e..e7e9d8bedf97 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -2301,6 +2301,24 @@ class OvsDatapath(GenericNetlinkSocket):
 
         return reply
 
+    def set(self, dpname, ifindex=0, features=None, per_cpu_pids=None):
+        msg = OvsDatapath.dp_cmd_msg()
+        msg["cmd"] = OVS_DP_CMD_SET
+        msg["version"] = OVS_DATAPATH_VERSION
+        msg["reserved"] = 0
+        msg["dpifindex"] = ifindex
+        msg["attrs"].append(["OVS_DP_ATTR_NAME", dpname])
+        if features is not None:
+            msg["attrs"].append(["OVS_DP_ATTR_USER_FEATURES", features])
+        if per_cpu_pids is not None:
+            msg["attrs"].append(["OVS_DP_ATTR_PER_CPU_PIDS", per_cpu_pids])
+
+        reply = self.nlm_request(
+            msg, msg_type=self.prid, msg_flags=NLM_F_REQUEST | NLM_F_ACK
+        )
+
+        return reply[0]
+
     def create(
         self, dpname, shouldUpcall=False, versionStr=None, p=OvsPacket()
     ):
@@ -2961,6 +2979,23 @@ def main(argv):
     deldpcmd = subparsers.add_parser("del-dp")
     deldpcmd.add_argument("deldp", help="Datapath Name")
 
+    setdpcmd = subparsers.add_parser("set-dp")
+    setdpcmd.add_argument("setdp", help="Datapath Name")
+    setdpcmd.add_argument(
+        "-f",
+        "--features",
+        type=lambda x: int(x, 0),
+        default=None,
+        help="Datapath user features, defaults to the current value",
+    )
+    setdpcmd.add_argument(
+        "-p",
+        "--per-cpu-pids",
+        type=str,
+        default=None,
+        help="Comma separated upcall pids, an empty string sends none",
+    )
+
     addifcmd = subparsers.add_parser("add-if")
     addifcmd.add_argument("dpname", help="Datapath Name")
     addifcmd.add_argument("addif", help="Interface name for adding")
@@ -3057,6 +3092,31 @@ def main(argv):
             ovspk.upcall_handler(ovsflow)
     elif hasattr(args, "deldp"):
         ovsdp.destroy(args.deldp)
+    elif hasattr(args, "setdp"):
+        rep = ovsdp.info(args.setdp, 0)
+        if rep is None:
+            print(f"DP '{args.setdp}' not found.")
+            return 1
+        pids = None
+        if args.per_cpu_pids is not None:
+            try:
+                pids = [int(x) for x in args.per_cpu_pids.split(",")
+                        if x != ""]
+            except ValueError:
+                print(f"invalid per-cpu-pids: {args.per_cpu_pids}")
+                return 1
+        features = args.features
+        if features is None:
+            features = rep.get_attr("OVS_DP_ATTR_USER_FEATURES")
+            if features is None:
+                print(f"DP '{args.setdp}' does not report its features")
+                return 1
+        try:
+            ovsdp.set(args.setdp, rep["dpifindex"], features, pids)
+        except NetlinkError as ne:
+            print(f"set failed: {ne.args[1]}")
+            return ne.code
+        print(f"DP '{args.setdp}' updated")
     elif hasattr(args, "addif"):
         rep = ovsdp.info(args.dpname, 0)
         if rep is None:
-- 
2.56.0

