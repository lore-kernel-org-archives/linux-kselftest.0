Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794051273;
	b=gy9OGPt1zLff/9TIHghELEk8sRSUlt6TripF6f4KCLTAAWb4w7FvbrTPY3k2UsvOuIwr
	 9G+CEGUIuNfCSj4QOs5hqPuHbjNkhVsRwR2+MW39An7FlcYwV0cbr7E65rOofBq9ZZQ/J
	 /Te2nyryIlAGXDL6eo01BHu5sDPD4I9B7bfibsUSICEYx+1qwZE0dnPQLqGWOvE8J55H8
	 Dnpx7rfNfbtIG757ZI1/Q8t/93U9QiK4VVZcOl4edkSY2uSuJ0MGEaOvbJApEnxDEMook
	 E9xZA/jmSmofeWeLwcOZBqAcdSMaJ5zDu+VOsIrkSatB7qqpBHJ5fDBKINjzmt1bF7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xIY44+mjGY+xOcsWd37ASHjx8uxdUiIESwC6jPT3OSI=;
	b=ylTcQjfF9MWv+SDxnwHfjTEov+dv9uX4gTUUGSkIQ1byGRrtgwMSKn5zAwDvQ962xg7a
	 tMSiH/d0SxccJ1D6xMi9KYgT9nsaTebNrzQthqzXoH5181pElFraBSFdkdRJEzT1ZPBc+
	 Yq15RORKXRD4a/JL7T5VHAGJE6tY8eydu+h/AUJ6jxvWyXB2jjlS9qb5F7r9qDrJpZ4Gs
	 Y8PNiCEcnKbyJoChyteevZtUeBJpwMHiTwhr9j4lYTFhUfV9crnzchMeQRF77pjRs1G/x
	 sbjo9ZTwpGKxoftHNBYW7CWaFD1l6JVBtCDkym6yCxRI0kY7KdYcCd92QRPeCo9Klgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3gt4c2t;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2D606A331
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 11:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C2D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3gt4c2t
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b30477a320so10064447b3.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 03:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794051272; x=1794656072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIY44+mjGY+xOcsWd37ASHjx8uxdUiIESwC6jPT3OSI=;
        b=D3gt4c2tTnEkafeUs26vaLp616Qdc5J2iKnzxu9UV005j4N9NNVJexYZOibyFEm5tN
         FoJtX/FPAssSJX08KZ9DMAw9O/yllgM0Q73CO0ovTmfY3oeI8hLHga8H7fISWjUSGp1h
         zX0dndqwgMfxp+y0ROuNGVGZJW2pybSSaGgix4zftTMBO9t5FWsyMLytY8G0wVxr/3on
         mqS9WI/ukUWhtAk8HRrHYL7fJOY/0WZRuDmpbuz2h3Xp7dyQ9pLg2jPe45j6to3grJda
         pMzqfP4GRNE/PUpHnDNd9MfE6kv2Ll5zGauuXXH00ruCYNCAe1Xhxf/0BA45A/5N3U27
         2MSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794051273; x=1794656073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xIY44+mjGY+xOcsWd37ASHjx8uxdUiIESwC6jPT3OSI=;
        b=CLog5Vmg3YT0QXZHxOjECJ7kUr2/zQ4VuaDSp7bKhrC5lU2WfTFvUV8Edr29sx44NC
         tcd480CcI8xHcCFHGWGhzs4GRA57g12ez6pCGXGxvvdgG4inRBJQ2leHXwcMcWkHSLNS
         FPr+Fi0xzXnQiTWM88WrDorSmoDPJAps2ylBNf2FMiWPGjdcZtlhUA9yEqHf29yulfSd
         XBFb1mBlewwzQizUb9E1ImyljczM/DIpG/t0N54DN+EYBbgYaOIPrEJKU0N8gqzaSQg7
         eTgQWARlK7mLm1VrzumQxWp93JzLiRexqTIlVapOAv6o+uRTxlZVQNjoNooDF9eb6lG9
         HtDQ==
X-Forwarded-Encrypted: i=1; AL+hErFh0NmyofFvnnCc3XQYXR/KonxSeAFbmzA7h6YADJz9cvcBnLD+D+CxiQgYJu9GFCa0So+LFD7e2uYqJd7TL04=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LAOUsp8KO/KmOgmlFvIGoNu5Urg28I/TUlFexkuXhk+ktVb/T
	GEuGA5CPcSeoxHiYGuzj0Or+yxkH0IlnSnKO8QpmeM6sXxto8S0bCYHL
X-Gm-Gg: AYBFou3+uzm1dP0DRAfxNSbxu0brB3v2ILUpKxBEguRjJsu+h3YoOzQhLBdYi9UahDZ
	cO8WdjnrwvMvKu/DfaXNdjNbgNlQjeBS3mwZfzOxTWg6bmGybYTexvcS4TcK54JXbcEgOUnKGHS
	1vg9fqjip5v/TArbD0LZkE2Ija/uPGZPASgMmROUOofvMVij1uBE0mhmhsPFt2zB4yquFONbFJs
	rhSAxvoZUr2qvC40qVjln+0fKygTe6uWQuIT28Q38W3MwiAEjjgVH+/f7aRak/uzWNHL7iWBAKI
	oEfBJafP3D2PY1mmXyiwwaIIaQcIlMHDaQAGT6LnNjf2bMhx9nwWw3+W//13F5ED3XTlv/gVpF5
	IgdyZgWbnI4Lz4dUrs3CwM/CyMtCs1k7kIJGt0gxTqeSvJpxFaKpNb2IuLDh8ffB6H7EJDXpa3z
	P8CprnsKoMyaz/6XGTdh/pVFi9zonJJRKRupUY+CrMF1vKxhoTn7TR9wtEtIHj6gEYzqYO6Kf9x
	xVyZzqWrIwJwHNPS2zBvEM/9Z73Y/4vVReqRXP9iKmzR2TJAkZVl/iAUD1S2LPH9/JyA0odUsTN
	Q2cmCo0j26F7YIgyoRY6iuw6
X-Received: by 2002:a05:690c:6e8d:b0:8b1:567c:e7b2 with SMTP id 00721157ae682-8b34199c05emr25006407b3.39.1794051272608;
        Sat, 07 Nov 2026 03:34:32 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f2d5dsm40084597b3.2.2026.11.07.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:34:31 -0800 (PST)
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
Subject: [PATCH net v1 2/2] selftests/net/openvswitch: check that a failed set keeps the features
Date: Sat,  7 Nov 2026 06:34:03 -0500
Message-ID: <20261107113403.797779-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107113403.797779-1-houminxi@gmail.com>
References: <20261107113403.797779-1-houminxi@gmail.com>
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
that would drop it has to leave it in place. That case needs
CONFIG_NET_TC_SKB_EXT and is skipped without it.

Both rounds fail without the fix in the previous patch, which reports
the features the failed request asked for instead of the old ones.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 64 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 50 +++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 21444657a040..f26c01a17b49 100755
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
@@ -1409,6 +1410,69 @@ test_netlink_checks () {
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
+	# 4 is OVS_DP_F_TC_RECIRC_SHARING, which only exists when the tc skb
+	# extension is compiled in. A rejected set that drops the bit must
+	# leave the key alone, so the features have to stay as they were.
+	ovs_sbx "test_dp_features" dp_features_set dpfeat --features 4 \
+	    &> /dev/null
+	if [ $? -eq 0 ]; then
+		info "a rejected set does not drop the recirc bit"
+		ovs_sbx "test_dp_features" dp_features_set dpfeat --features 8 \
+		    --per-cpu-pids "" &> /dev/null
+		[ $? -eq 22 ] \
+		    || { info "the clearing set did not fail with EINVAL"; \
+			 return 1; }
+		ovs_sbx "test_dp_features" dp_features_check dpfeat 4 \
+		    || { info "the rejected set dropped the recirc bit"; \
+			 return 1; }
+	else
+		info "tc skb extension is not available, skipping recirc"
+	fi
+
+	return 0
+}
+
 test_upcall_interfaces() {
 	sbx_add "test_upcall_interfaces" || return 1
 
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 1615843c225e..be41ec72faf2 100644
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
+        help="Datapath user features",
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
@@ -3057,6 +3092,21 @@ def main(argv):
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
+        try:
+            ovsdp.set(args.setdp, rep["dpifindex"], args.features, pids)
+        except NetlinkError as ne:
+            print("set failed: %s" % ne)
+            return ne.code
+        print("DP '%s' updated" % args.setdp)
     elif hasattr(args, "addif"):
         rep = ovsdp.info(args.dpname, 0)
         if rep is None:
-- 
2.56.0

