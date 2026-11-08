Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141299;
	b=O1SK6eFPuLXqF9nVlnO4v9N3XJN4zaQ21SSjmE+FZpz+IB2j/67LcTKWJqmcK9gGOQfi
	 OJ7IityoTHlLR5zL96H6tMJt80fAhe1QCzxrG3bvzrlwzWdLks0Du4y86nFr6ha3ggdor
	 DJyGvdc1Aa75sUAl33rAfCrFvyivxaPWHJySei7uDv2myiGSsmU3quihbIzEK+/vOmRDF
	 rFKpFoGmEddwXo9asFATRdUOlY3yirK0WLuaJgx6zgRbRdEeThuxIWQDeLJDcuoKB7OMj
	 mIf4QWxajdkX2YlUXqLyJvqDTh4maHvEsVbkqtzwkCummqDAjUpfGe0YwiXTp2gXOQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xE34lCDj3tD4OLIkuagWu74qxloXaSwXylITaFd2xWA=;
	b=RtKT1uyil7ZMD9Muy99ib3HdscRe6WHUyMNfUoDCTrRJyO3ehuYLxn/5nw9nDpo75xAl
	 XbO5cjUEDSY+ZR1jM1pi2S7UCyAJz7Nf153afC9gMJX7x5cUxiiEriPHv+CHz2L0hCAjl
	 RYsdlnrQW8X1hwidj4K/VuW8LYb2/v/mKwEjZRvPn9NBWvPLnBjKX9s9rHvVfj/dT3EJ4
	 H8G8BnsB2f7ei/AGsAFotKQy8xDJBtmaRTNOenlHKlANjhLue3oXRJkjEZ1tUm/VaSxFN
	 XBZiycu1fMt39/uf7JNu/9ujRKoF8ltvrPSc5yox68faH1JvYxUw+TLkcKe0QTMZ0LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAKKXfoP;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB61606A31C
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 12:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAKKXfoP
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b33a08df33so181407b3.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 04:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794141298; x=1794746098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xE34lCDj3tD4OLIkuagWu74qxloXaSwXylITaFd2xWA=;
        b=jAKKXfoPgwDfrWgmlUCHR05zOcpcjckYTtmGfX7ayfB/5C+GIanIyX9wGeL3cgbEVG
         zniRTwdTjpaXmHnuNaPSG1BEOGCBf9mIsehjAev+9cZeMlXHjAVvA8l4SYl1DMC3PIdQ
         uG9SDxFNT+7C3oxG+6loJn5q6Zp9MW5ZTomzUybQJy3Ca0jR7B+4ODYr8/pG8UhePQ0a
         oNKtc0VmmSRESf61m9rEQOECS4Fxcw9Ebywa6bdhemscWpW+hm/T6qr5f0fvtCDy5C1J
         wrbKOH5NFYMFysQSMAxTceDH9kmM2La8o11B6HtZf5nOASA3DvDEZy9HOSp1vbBhCuZX
         sVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794141298; x=1794746098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xE34lCDj3tD4OLIkuagWu74qxloXaSwXylITaFd2xWA=;
        b=0f6+DzDCrdzUQch8Mj88jA3BTLFAUs0yY0EJuBV0j0oQz4gbueZaV3baEToxSlfOS/
         KIoJCYFLGUYYodM31mkQhxQpRJ7UzkFNOIocbyz1r4kn/WoZri7R2Fc/afEa9XAbt7NI
         d+hWjavW4zo+JyUDVR/BnbC5TZasd+pj2FPdvCqglgYe0WEqn5VMbGTvx2mhNhuiGRX0
         5sG8oB5R+hELJqDQ/eFx19cQHsCKdSY8SJZFAuxIJc4SjGA6KrYcmrJLdzZye3r2SpE+
         WuN6hdiLtQT1pSemo1Fh30qJFTBsY2OnZ/TtSZuT5+sFFYMOIdMvTH8Ett1m76z0DLKo
         jJHg==
X-Forwarded-Encrypted: i=1; AL+hErFhP0M/bck0pMqOQPiRIhvGk2WmUWl1r10IO8ldlNBnwFdbMdrw2TieqGkXV0pUYIJ3LmA2oRqG0EatebqoC1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MW+PQ3w3W1UeMdI6vaWUV35NN+1QoxMcKpkzSAmSNlCygiK/8
	vHBKcotwLu6uJVAjn287P47Vi4oAxYjYwbQD0pSp1z3Uipk0LyxEWf8Z
X-Gm-Gg: AYBFou1cUwZ7oBc+fOV1uXe1+8KbdEf0fkXdQQHzQwzmzssiOR0ZAvdXZb5DlqIwyyy
	CIQGSON9jmU0KHtKs1ZTbrUWy5FT7rYp6816dU4yMQDaKVSJujpUynSEj6r45rlcmPGCGdGbagm
	ij14UUuP4Z672byfvgLLWxr/zb4ys/87XXAyOm+OyihJAJ4DKQMb7e0DnYarKkY15UszJ437wzR
	kmCqnrBJN48j3+AbgC1JEOkhOAlax3KPg17F6O63RJE/VQ/NHlukyIeKHKG9kchHhiDD+0m2rUG
	+IwTVXWy2oHBg5mgHlykkCdoUNFdksmqhKQR8tjk2Ed0Sanf65OMxR7WKTq3ieQyazOLWJ4bcjc
	UdRFXJTnKeIiGqrYMu3pXCVXzYoLQFCQco7Cgd+FFb6LSWT/X4K0E4HBNdVh7S8XFjnU2icbCSl
	YtAHYrNgKaQBrd8krN4Bqaj6VVQ5NKGtCnzgbHRhjwDHftine5XjWZGw8clmkyiSM/xi5xdwtrA
	5XB5WgCkYdrvY6rQeKlBIujc9URV4rHyy5Ba+p21+CYbwVey/0tRtl5O3Wz1aGExYFwqFtzil3n
	GLJWIsolNd7Mgpp0MX1SS68humk/4BB69Qj9NmMSLJFijQ==
X-Received: by 2002:a05:690c:113:b0:8b0:bc8e:9d75 with SMTP id 00721157ae682-8b36ca4f943mr8643087b3.22.1794141297553;
        Sun, 08 Nov 2026 04:34:57 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36be7d88dsm13475627b3.39.2026.11.08.04.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:34:56 -0800 (PST)
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
	Shuah Khan <shuah@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Paul Blakey <paulb@nvidia.com>,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 2/2] selftests/net/openvswitch: check that a failed set keeps the features
Date: Sun,  8 Nov 2026 07:34:24 -0500
Message-ID: <20261108123424.2825403-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108123424.2825403-1-houminxi@gmail.com>
References: <20261108123424.2825403-1-houminxi@gmail.com>
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
and a test that uses it.

The test clears the features of a fresh datapath, sets the dispatch bit
with a valid pid list, then sends a set that would set the same bit with
an empty per-cpu-pids. The request has to fail with EINVAL, and the
datapath has to keep reporting the features it had. A second round
covers the other direction: with the recirc bit set, a failing request
that would drop it has to leave it in place.

That round needs CONFIG_NET_TC_SKB_EXT. The selftest config fragment did
not select it, so a kernel built from the fragment rejected the recirc
bit with EOPNOTSUPP and the round could not run. Select the key and the
classful action support it depends on, and skip the test with the
kselftest skip code when the kernel still reports EOPNOTSUPP. Any other
failure of that request fails the test rather than skipping it.

set-dp sends the features it is given. When --features is left out it
sends the features the datapath reports, so a request that only changes
the pid list does not clear the other bits.

Both rounds fail without the fix in the previous patch, which reports
the features the failed request asked for instead of the old ones.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../testing/selftests/net/openvswitch/config  |  2 +
 .../selftests/net/openvswitch/openvswitch.sh  | 67 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 53 +++++++++++++++
 3 files changed, 122 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
index 15685d242813..d93eac0f08f7 100644
--- a/tools/testing/selftests/net/openvswitch/config
+++ b/tools/testing/selftests/net/openvswitch/config
@@ -2,6 +2,8 @@ CONFIG_GENEVE=m
 CONFIG_INET_DIAG=y
 CONFIG_IP_SCTP=y
 CONFIG_IPV6=y
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_TC_SKB_EXT=y
 CONFIG_NETFILTER=y
 CONFIG_NETFILTER_ADVANCED=y
 CONFIG_NET_IPGRE=m
diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 21444657a040..e2aba1e40d55 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -24,6 +24,7 @@ tests="
 	nat_connect_v4				ip4-nat-xon: Basic ipv4 tcp connection via NAT
 	nat_related_v4				ip4-nat-related: ICMP related matches work with SNAT
 	netlink_checks				ovsnl: validate netlink attrs and settings
+	dp_features				ovsdp: keep the set features
 	upcall_interfaces			ovs: test the upcall interfaces
 	tunnel_metadata				ovs: test extraction of tunnel metadata
 	drop_reason				drop: test drop reasons are emitted
@@ -1409,6 +1410,72 @@ test_netlink_checks () {
 	return 0
 }
 
+test_dp_features() {
+	dp_features_check() {
+		python3 $ovs_base/ovs-dpctl.py show "$1" |
+			grep -q "features: 0x$2\$"
+	}
+
+	dp_features_set() {
+		python3 $ovs_base/ovs-dpctl.py set-dp "$@"
+	}
+
+	sbx_add "test_dp_features" || return $?
+	ovs_add_dp "test_dp_features" dpfeat || return 1
+
+	# 8 is OVS_DP_F_DISPATCH_UPCALL_PER_CPU, the bit that makes the
+	# kernel read per-cpu-pids.
+	info "clear the datapath features"
+	ovs_sbx "test_dp_features" dp_features_set dpfeat --features 0 \
+	    || return 1
+	ovs_sbx "test_dp_features" dp_features_check dpfeat 0 \
+	    || { info "features were not cleared"; return 1; }
+
+	info "a set with the dispatch bit and pids is accepted"
+	ovs_sbx "test_dp_features" dp_features_set dpfeat --features 8 \
+	    --per-cpu-pids 1,2 || return 1
+	ovs_sbx "test_dp_features" dp_features_check dpfeat 8 \
+	    || { info "the accepted set was not applied"; return 1; }
+
+	ovs_sbx "test_dp_features" dp_features_set dpfeat --features 0 \
+	    || return 1
+
+	info "a set with an empty per-cpu-pids is rejected"
+	ovs_sbx "test_dp_features" dp_features_set dpfeat --features 8 \
+	    --per-cpu-pids "" &> /dev/null
+	[ $? -eq 22 ] \
+	    || { info "the empty per-cpu-pids set did not fail with EINVAL"; \
+		 return 1; }
+
+	info "the rejected set keeps the features it had"
+	ovs_sbx "test_dp_features" dp_features_check dpfeat 0 \
+	    || { info "the rejected set was recorded"; return 1; }
+
+	# 4 is OVS_DP_F_TC_RECIRC_SHARING, which the kernel only accepts when
+	# the tc skb extension is compiled in. A rejected set that drops the
+	# bit must leave the key alone, so the features have to stay as they
+	# were.
+	ovs_sbx "test_dp_features" dp_features_set dpfeat --features 4 \
+	    &> /dev/null
+	rc=$?
+	if [ $rc -eq 95 ]; then
+		info "tc skb extension is not compiled in, skipping recirc"
+		return $ksft_skip
+	elif [ $rc -ne 0 ]; then
+		info "the recirc set failed with $rc"
+		return 1
+	fi
+	info "a rejected set does not drop the recirc bit"
+	ovs_sbx "test_dp_features" dp_features_set dpfeat --features 8 \
+	    --per-cpu-pids "" &> /dev/null
+	[ $? -eq 22 ] \
+	    || { info "the clearing set did not fail with EINVAL"; return 1; }
+	ovs_sbx "test_dp_features" dp_features_check dpfeat 4 \
+	    || { info "the rejected set dropped the recirc bit"; return 1; }
+
+	return 0
+}
+
 test_upcall_interfaces() {
 	sbx_add "test_upcall_interfaces" || return 1
 
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 1615843c225e..1b02d383e49e 100644
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
@@ -3057,6 +3092,24 @@ def main(argv):
             ovspk.upcall_handler(ovsflow)
     elif hasattr(args, "deldp"):
         ovsdp.destroy(args.deldp)
+    elif hasattr(args, "setdp"):
+        rep = ovsdp.info(args.setdp, 0)
+        if rep is None:
+            print("DP '%s' not found." % args.setdp)
+            return 1
+        pids = None
+        if args.per_cpu_pids is not None:
+            pids = [int(x) for x in args.per_cpu_pids.split(",")
+                    if x != ""]
+        features = args.features
+        if features is None:
+            features = rep.get_attr("OVS_DP_ATTR_USER_FEATURES")
+        try:
+            ovsdp.set(args.setdp, rep["dpifindex"], features, pids)
+        except NetlinkError as ne:
+            print("set failed: %s" % ne)
+            return ne.code
+        print("DP '%s' updated" % args.setdp)
     elif hasattr(args, "addif"):
         rep = ovsdp.info(args.dpname, 0)
         if rep is None:
-- 
2.56.0

