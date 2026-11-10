Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.68.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304836;
	b=fI3bGu+k2gNujHCAP+HG+jZUGweu3XTWSt0UNTacMj5BDmd2ixOzyEAuZ3F1hpPSlx7E
	 41vde8uEUc/Uicn3zHxul74lUR4NQpImT7B7u4o7S6G3EZ7IE6eae1muCv48yt4fuGVXG
	 GRQ4QAvVXIJXn49iEWwLUJSUKhidwISmyu9Mx0VFKOcgOLgfNsaAKT7qdHrV35qW6UxLK
	 nd+9qGPeHbZyvHpTbvR7rjmpIWW8mxtY48lLkU4/wNcqrWiMuWfmxjDwGeFPDCi8Znllc
	 XZcyHX4w1jKvKXIkzr6GKSNtupK3sOCkd9EbUTzal3NthvveNnSXuG84pyxs02sFwrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304836;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:X-JNJ;
	bh=1Cs2n0h6w2Ln3VT0XyxB2uB1yqjzmn9HR/nBfN5kA3s=;
	b=eagXotJTBqm797V1oYecMeV4TjCCve9M6Z3+vJZJfgW3H/V18bgueVZRFnO684/GugLM
	 REOo73F5tbAsL3RfSayJxTALh1GnQDG7+Ce2pTo6gbtKXY2QmEBSdEJad4tDuWmdMdkgb
	 6RulE14ASOj5jz+cTZnQNJaMSq4x+VVvTNehIPg2WJMVzFU33j3Ws9M9NsVDG7h5snmAH
	 NUIdZbvDPrbI2DcyDokuqEconFAbyZGKBPlfRaTcYp9TfNXScDHD0QlRKFqnjUSrYhlMl
	 O7NLWVRFI3SwPR0bfRYciGgafpex+z1Z4N1DNtLUA9vv0J2OAsipOj+ff8qIeTpgBBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=LodZi1K0;
	arc=none smtp.remote-ip=57.103.68.145
Received: from outbound.mr.icloud.com (mr-2002c-snip4-2.eps.apple.com [57.103.68.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F9C60A3802
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F9C60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=LodZi1K0
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with ESMTPS id DBBCF1800154;
	Tue, 10 Nov 2026 10:00:33 +0000 (UTC)
X-ICL-RepId: 01a1c4e6-f92d-73ff-ad41-3f5a00b803a3
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQ1OHVwORQFEF0oBTVIPDxRcFFofVgVyBlwKVwRUHxwXXlhVCQodVwJdEVAZGQxVUEsbDlwFS1oVVRcOAkIfUB9MFldDWhkcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKHVcCXRFQGRkMVVBUEVdQC1kCQg9JAlwHWwtFAEgAQw9fCkEKVQdAUw5eGUsZXS1BDkAUUBtHQ1AMDFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794304835; x=1825840835; bh=1Cs2n0h6w2Ln3VT0XyxB2uB1yqjzmn9HR/nBfN5kA3s=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=LodZi1K0TifBExTHMs3szHhECTGiRUN6/5wsDnRKWKfJvFIG8COT+DmAyR/Dsf31MTGdxhMCU0l5SM9zgnJmsFmkfknEno3a/K/D88W8tM9sOPr5VvSc3dCg0QFc+CoCWmEHogE2qyit9Z4+7G8JbWYJa7vtZQpV8X3c34m1A3ADZzLKRrz6EcZLvdZNYtaiXQ1Meg9t5cXs+CKHhOKu6wi6b9rlNu0k8jxfXoe9HCbP4ZF7/xtN7vRapoxpFZqp8WGMLoO4NLKH9o1zBqW40ULGBNvATIbfwj+QxMr78tUQTIT1lgEy1LNJe2a07u8ltXH4xbQ6kDkEx6ejJJalYg==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with ESMTPSA id EA9AF180015A;
	Tue, 10 Nov 2026 10:00:30 +0000 (UTC)
From: Vladimir Vdovin <deliran@verdict.gg>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Vladimir Vdovin <deliran@verdict.gg>
Subject: [PATCH net-next v2 3/3] selftests: net: pmtu: Add IPv6 and asymmetric multipath tests
Date: Tue, 10 Nov 2026 12:59:03 +0300
Message-ID: <20261110095903.84813-4-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110095903.84813-1-deliran@verdict.gg>
References: <20261110095903.84813-1-deliran@verdict.gg>
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
X-Proofpoint-GUID: SvnHDOP2XVKWZ6OWpORTLjs-dzGsHMEf
X-Proofpoint-ORIG-GUID: SvnHDOP2XVKWZ6OWpORTLjs-dzGsHMEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXyEXgmSfy1l10
 QVN6+KfDvGLCNH8SeMhhsDTXWTOWFbleWJXsR1cIz1bkiBU1YgfOT2NNqgdPbHORwC5ZoToNR9Y
 5wBqBUvEqgY57/X5ojDYkVqvZhUP90G+/PfTFvBVO/oTg3MIIS6rY8xEi3f3gMML6F/2f0CBmSI
 amNdwECE6zLqRodQgCAOgm9He4xyX4sXW1jwLpQEnnO85euWjm+lbmeJzTyMOeoBJvCbKKWznZO
 wzYANpGkuWZc7QaM9ZdmtWGZNolIhro1pksIWyAMY23996ZXiT+jsJl4PPdmbrJPhc0ioDW45BJ
 gHK53yI77EkG8xTIyUNNqaHJ4Z7SBLOBbOp/1CKZGdd8CX7zFswmRuT8FsNy9A=
X-Authority-Info-Out: v=2.4 cv=TLdIilla c=1 sm=1 tr=0 ts=6af2eb42
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0iTdSYv0MckaDtb-3agA:9
X-JNJ: AAAAAAAB5/BCyadAmoGbci3DQos4VZ9MS028e+xWyQwNj0Jfp9oHiOEQwdjnDWPcGYgJmJ
 wZHzcLQeQ2fYZgg3ihd+brq3wAfObDwrwcNX5M8V36AlIeNa10EwNlr0QHBxSUabyJL3+W
 bxV49pyxYAQ6aNSZt9+uXwWiqA3DAP6EJ67TDkE83UXnd3C8ouRczWGwGQuG4LIrHIuMZ/
 vWDlmR+rA7q2ciCKNf3mgR2cAtrrkA+c2gZfNpREy51eWsnnIiOavYTacIF7uITjynZBAp
 s4YCxKcvdhqWr2EqxNUGDz1baKyR1x27msLJk4DVbkrvVbw3itg/UbTwz8USb95dTSYEJa
 JRHMvXhPsLbq0rwJrbrD+1WAz8hUrcKA/Q2EiWsDA4UrkVJ65+UtAPnSoLnuwPMjGSVU34
 GRQOnIBfB54UrOWQmcSHXh6IXO+BeJSOBQphiLA41YowEIW5069XDQcKsNZuBvfgxs08K/
 zDiFdGHHWlld5BfIY6f2sKGOXKoX8WFkB+mtEbcl9nvFSKOmnCp9DqgNSKakgoadwvMDP+
 nO0+9PgM9rzdGuWNV/wL1AqA2Xc4zeompdDt5j8dHB2RkieqOkF2tWPIHaETEVVVBYhY7q
 lKEtZ/Yr/vrpLyFYXNhmL0ac3FjZDbXzBrCSZUKH8Llx3mgEOtlBXjI9ffAldO/WKGuA35
 9ID9og8Uz0AKPIer2tpaa1mwkiW/Luas5+0E8LLC7JNDnCzQTXMRAYSvHpyByi3hu0IjwY
 hudrgFfmhMPzOxf1aN9qQjhP5RtALxRnhTyygwc8Emla2Pv9U+c3rmyA+t9brQ7fN6A0TH
 EDac87DD3SegR0njV4PZ/5JkGePcjpeMFrmim/Q=

Make pmtu_ipv4_mp_exceptions family agnostic and add
pmtu_ipv6_mp_exceptions: one oversized ping over a multipath route
must leave PMTU exceptions on both paths.

Add pmtu_ipv4_mp_asym_exceptions and pmtu_ipv6_mp_asym_exceptions with
an MTU of 1400 behind one router and 1300 behind the other. They pick a
flow through each router (a source address for IPv4, whose multipath
hash covers addresses only, a flow label for IPv6) and check that a
Packet Too Big from the first router is cached on both paths, then
that a flow through the second router lowers the PMTU of both paths.

Without the preceding fix the IPv6 tests fail with both legacy
nexthops and nexthop objects:

  PMTU exception wasn't created after exceeding MTU (veth_A-R2)

Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 tools/testing/selftests/net/pmtu.sh | 276 ++++++++++++++++++++++++----
 1 file changed, 238 insertions(+), 38 deletions(-)

diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu.sh
index c7cd271714ef..6eb79cb76db7 100755
--- a/tools/testing/selftests/net/pmtu.sh
+++ b/tools/testing/selftests/net/pmtu.sh
@@ -203,6 +203,18 @@
 #	on host A and B on lo reachable via both routers. Host A and B
 #	addresses have multipath routes to each other, b_r1 mtu = 1500.
 #	Check that PMTU exceptions are created for both paths.
+#
+# - pmtu_ipv6_mp_exceptions
+#	Same as above but with IPv6
+#
+# - pmtu_ipv4_mp_asym_exceptions
+#	Same topology as pmtu_ipv4_mp_exceptions, with b_r1 mtu = 1400 and
+#	b_r2 mtu = 1300. Pick a flow through each router and check that a
+#	Packet Too Big from R1 is cached on both paths, then that a flow
+#	through R2 lowers the PMTU of both paths
+#
+# - pmtu_ipv6_mp_asym_exceptions
+#	Same as above but with IPv6
 
 source lib.sh
 
@@ -272,7 +284,10 @@ tests="
 	list_flush_ipv6_exception	ipv6: list and flush cached exceptions	1
 	pmtu_ipv4_route_change		ipv4: PMTU exception w/route replace	1
 	pmtu_ipv6_route_change		ipv6: PMTU exception w/route replace	1
-	pmtu_ipv4_mp_exceptions		ipv4: PMTU multipath nh exceptions	1"
+	pmtu_ipv4_mp_exceptions		ipv4: PMTU multipath nh exceptions	1
+	pmtu_ipv6_mp_exceptions		ipv6: PMTU multipath nh exceptions	1
+	pmtu_ipv4_mp_asym_exceptions	ipv4: PMTU multipath nh exceptions, asymmetric MTUs	1
+	pmtu_ipv6_mp_asym_exceptions	ipv6: PMTU multipath nh exceptions, asymmetric MTUs	1"
 
 # Addressing and routing for tests with routers: four network segments, with
 # index SEGMENT between 1 and 4, a common prefix (PREFIX4 or PREFIX6) and an
@@ -350,8 +365,12 @@ tunnel6_b_addr="fd00:2::b"
 tunnel6_mask="64"
 
 host4_a_addr="192.168.99.99"
+host4_a_net="192.168.97"
 host4_b_addr="192.168.88.88"
 
+host6_a_addr="fc00:1000::a"
+host6_b_addr="fc00:1001::b"
+
 dummy6_0_prefix="fc00:1000::"
 dummy6_1_prefix="fc00:1001::"
 dummy6_mask="64"
@@ -994,49 +1013,112 @@ setup_ovs_bridge() {
 }
 
 setup_multipath_new() {
-	# Set up host A with multipath routes to host B host4_b_addr
-	run_cmd ${ns_a} ip addr add ${host4_a_addr} dev lo
-	run_cmd ${ns_a} ip nexthop add id 401 via ${prefix4}.${a_r1}.2 dev veth_A-R1
-	run_cmd ${ns_a} ip nexthop add id 402 via ${prefix4}.${a_r2}.2 dev veth_A-R2
-	run_cmd ${ns_a} ip nexthop add id 403 group 401/402
-	run_cmd ${ns_a} ip route add ${host4_b_addr} src ${host4_a_addr} nhid 403
+	family=${1}
+
+	if [ ${family} -eq 4 ]; then
+		host_a_addr=${host4_a_addr}
+		host_b_addr=${host4_b_addr}
+		nh_a_r1=${prefix4}.${a_r1}.2
+		nh_a_r2=${prefix4}.${a_r2}.2
+		nh_b_r1=${prefix4}.${b_r1}.2
+		nh_b_r2=${prefix4}.${b_r2}.2
+	else
+		host_a_addr=${host6_a_addr}
+		host_b_addr=${host6_b_addr}
+		nh_a_r1=${prefix6}:${a_r1}::2
+		nh_a_r2=${prefix6}:${a_r2}::2
+		nh_b_r1=${prefix6}:${b_r1}::2
+		nh_b_r2=${prefix6}:${b_r2}::2
+	fi
+
+	# Set up host A with multipath routes to host B host_b_addr
+	run_cmd ${ns_a} ip addr add ${host_a_addr} dev lo
+	run_cmd ${ns_a} ip nexthop add id ${family}01 via ${nh_a_r1} dev veth_A-R1
+	run_cmd ${ns_a} ip nexthop add id ${family}02 via ${nh_a_r2} dev veth_A-R2
+	run_cmd ${ns_a} ip nexthop add id ${family}03 group ${family}01/${family}02
+	run_cmd ${ns_a} ip route add ${host_b_addr} src ${host_a_addr} nhid ${family}03
 
-	# Set up host B with multipath routes to host A host4_a_addr
-	run_cmd ${ns_b} ip addr add ${host4_b_addr} dev lo
-	run_cmd ${ns_b} ip nexthop add id 401 via ${prefix4}.${b_r1}.2 dev veth_B-R1
-	run_cmd ${ns_b} ip nexthop add id 402 via ${prefix4}.${b_r2}.2 dev veth_B-R2
-	run_cmd ${ns_b} ip nexthop add id 403 group 401/402
-	run_cmd ${ns_b} ip route add ${host4_a_addr} src ${host4_b_addr} nhid 403
+	# Set up host B with multipath routes to host A host_a_addr
+	run_cmd ${ns_b} ip addr add ${host_b_addr} dev lo
+	run_cmd ${ns_b} ip nexthop add id ${family}01 via ${nh_b_r1} dev veth_B-R1
+	run_cmd ${ns_b} ip nexthop add id ${family}02 via ${nh_b_r2} dev veth_B-R2
+	run_cmd ${ns_b} ip nexthop add id ${family}03 group ${family}01/${family}02
+	run_cmd ${ns_b} ip route add ${host_a_addr} src ${host_b_addr} nhid ${family}03
 }
 
 setup_multipath_old() {
-	# Set up host A with multipath routes to host B host4_b_addr
-	run_cmd ${ns_a} ip addr add ${host4_a_addr} dev lo
-	run_cmd ${ns_a} ip route add ${host4_b_addr} \
-			src ${host4_a_addr} \
-			nexthop via ${prefix4}.${a_r1}.2 weight 1 \
-			nexthop via ${prefix4}.${a_r2}.2 weight 1
+	family=${1}
+
+	if [ ${family} -eq 4 ]; then
+		host_a_addr=${host4_a_addr}
+		host_b_addr=${host4_b_addr}
+		nh_a_r1=${prefix4}.${a_r1}.2
+		nh_a_r2=${prefix4}.${a_r2}.2
+		nh_b_r1=${prefix4}.${b_r1}.2
+		nh_b_r2=${prefix4}.${b_r2}.2
+	else
+		host_a_addr=${host6_a_addr}
+		host_b_addr=${host6_b_addr}
+		nh_a_r1=${prefix6}:${a_r1}::2
+		nh_a_r2=${prefix6}:${a_r2}::2
+		nh_b_r1=${prefix6}:${b_r1}::2
+		nh_b_r2=${prefix6}:${b_r2}::2
+	fi
+
+	# Set up host A with multipath routes to host B host_b_addr
+	run_cmd ${ns_a} ip addr add ${host_a_addr} dev lo
+	run_cmd ${ns_a} ip route add ${host_b_addr} \
+			src ${host_a_addr} \
+			nexthop via ${nh_a_r1} weight 1 \
+			nexthop via ${nh_a_r2} weight 1
 
-	# Set up host B with multipath routes to host A host4_a_addr
-	run_cmd ${ns_b} ip addr add ${host4_b_addr} dev lo
-	run_cmd ${ns_b} ip route add ${host4_a_addr} \
-			src ${host4_b_addr} \
-			nexthop via ${prefix4}.${b_r1}.2 weight 1 \
-			nexthop via ${prefix4}.${b_r2}.2 weight 1
+	# Set up host B with multipath routes to host A host_a_addr
+	run_cmd ${ns_b} ip addr add ${host_b_addr} dev lo
+	run_cmd ${ns_b} ip route add ${host_a_addr} \
+			src ${host_b_addr} \
+			nexthop via ${nh_b_r1} weight 1 \
+			nexthop via ${nh_b_r2} weight 1
 }
 
+
 setup_multipath() {
+	family="$1"
+
+	if [ ${family} -eq 4 ]; then
+		host_a_addr=${host4_a_addr}
+		host_b_addr=${host4_b_addr}
+		nh_r1_a=${prefix4}.${a_r1}.1
+		nh_r1_b=${prefix4}.${b_r1}.1
+		nh_r2_a=${prefix4}.${a_r2}.1
+		nh_r2_b=${prefix4}.${b_r2}.1
+	else
+		host_a_addr=${host6_a_addr}
+		host_b_addr=${host6_b_addr}
+		nh_r1_a=${prefix6}:${a_r1}::1
+		nh_r1_b=${prefix6}:${b_r1}::1
+		nh_r2_a=${prefix6}:${a_r2}::1
+		nh_r2_b=${prefix6}:${b_r2}::1
+	fi
+
 	if [ "$USE_NH" = "yes" ]; then
-		setup_multipath_new
+		setup_multipath_new ${family}
 	else
-		setup_multipath_old
+		setup_multipath_old ${family}
 	fi
 
 	# Set up routers with routes to dummies
-	run_cmd ${ns_r1} ip route add ${host4_a_addr} via ${prefix4}.${a_r1}.1
-	run_cmd ${ns_r2} ip route add ${host4_a_addr} via ${prefix4}.${a_r2}.1
-	run_cmd ${ns_r1} ip route add ${host4_b_addr} via ${prefix4}.${b_r1}.1
-	run_cmd ${ns_r2} ip route add ${host4_b_addr} via ${prefix4}.${b_r2}.1
+	run_cmd ${ns_r1} ip route add ${host_a_addr} via ${nh_r1_a}
+	run_cmd ${ns_r2} ip route add ${host_a_addr} via ${nh_r2_a}
+	run_cmd ${ns_r1} ip route add ${host_b_addr} via ${nh_r1_b}
+	run_cmd ${ns_r2} ip route add ${host_b_addr} via ${nh_r2_b}
+}
+
+setup_multipath4() {
+	setup_multipath 4
+}
+
+setup_multipath6() {
+	setup_multipath 6
 }
 
 setup() {
@@ -2377,8 +2459,18 @@ test_pmtu_ipv6_route_change() {
 	test_pmtu_ipvX_route_change 6
 }
 
-test_pmtu_ipv4_mp_exceptions() {
-	setup namespaces routing multipath || return $ksft_skip
+test_pmtu_ipvX_mp_exceptions() {
+	family=${1}
+
+	if [ ${family} -eq 4 ]; then
+		ping=ping
+		dst="${host4_b_addr}"
+	else
+		ping=${ping6}
+		dst="${host6_b_addr}"
+	fi
+
+	setup namespaces routing multipath${family} || return $ksft_skip
 
 	trace "${ns_a}"  veth_A-R1    "${ns_r1}" veth_R1-A \
 	      "${ns_r1}" veth_R1-B    "${ns_b}"  veth_B-R1 \
@@ -2395,18 +2487,126 @@ test_pmtu_ipv4_mp_exceptions() {
 	mtu "${ns_r2}" veth_R2-A 2000
 	mtu "${ns_r2}" veth_R2-B 1500
 	mtu "${ns_b}"  veth_B-R2 1500
-
 	# Ping and expect two nexthop exceptions for two routes
-	run_cmd ${ns_a} ping -q -M want -i 0.1 -c 1 -s 1800 "${host4_b_addr}"
+	run_cmd ${ns_a} ${ping} -q -M want -i 0.1 -c 1 -s 1800 "${dst}"
 
 	# Check that exceptions have been created with the correct PMTU
-	pmtu_a_R1="$(route_get_dst_pmtu_from_exception "${ns_a}" "${host4_b_addr}" oif veth_A-R1)"
-	pmtu_a_R2="$(route_get_dst_pmtu_from_exception "${ns_a}" "${host4_b_addr}" oif veth_A-R2)"
-
+	pmtu_a_R1="$(route_get_dst_pmtu_from_exception "${ns_a}" "${dst}" oif veth_A-R1)"
+	pmtu_a_R2="$(route_get_dst_pmtu_from_exception "${ns_a}" "${dst}" oif veth_A-R2)"
 	check_pmtu_value "1500" "${pmtu_a_R1}" "exceeding MTU (veth_A-R1)" || return 1
 	check_pmtu_value "1500" "${pmtu_a_R2}" "exceeding MTU (veth_A-R2)" || return 1
 }
 
+test_pmtu_ipv4_mp_exceptions() {
+	test_pmtu_ipvX_mp_exceptions 4
+}
+
+# Find a flow from host A to ${2} that goes out through ${3}: a source
+# address out of ${host4_a_net}, added to lo as needed, since the IPv4
+# multipath hash covers addresses only, or an IPv6 flow label for a packet
+# sent from ${host6_a_addr}
+mp_flow_via() {
+	family="${1}"
+	dst="${2}"
+	oif="${3}"
+
+	for i in $(seq 1 32); do
+		if [ ${family} -eq 4 ]; then
+			flow="${host4_a_net}.${i}"
+			${ns_a} ip addr add ${flow}/32 dev lo 2>/dev/null
+			out="$(${ns_a} ip route get ${dst} from ${flow} 2>/dev/null)"
+		else
+			flow="${i}"
+			out="$(${ns_a} ip route get ${dst} from ${host6_a_addr} \
+				ipproto 58 flowlabel ${flow} 2>/dev/null)"
+		fi
+		case "${out}" in
+		*" dev ${oif} "*)
+			echo "${flow}"
+			return 0
+			;;
+		esac
+	done
+
+	return 1
+}
+
+test_pmtu_ipvX_mp_asym_exceptions() {
+	family=${1}
+
+	if [ ${family} -eq 4 ]; then
+		ping=ping
+		dst="${host4_b_addr}"
+	else
+		ping=${ping6}
+		dst="${host6_b_addr}"
+	fi
+
+	setup namespaces routing multipath${family} || return $ksft_skip
+
+	trace "${ns_a}"  veth_A-R1    "${ns_r1}" veth_R1-A \
+	      "${ns_r1}" veth_R1-B    "${ns_b}"  veth_B-R1 \
+	      "${ns_a}"  veth_A-R2    "${ns_r2}" veth_R2-A \
+	      "${ns_r2}" veth_R2-B    "${ns_b}"  veth_B-R2
+
+	if [ ${family} -eq 4 ]; then
+		# Routes back to the source addresses mp_flow_via() picks
+		run_cmd ${ns_r1} ip route add ${host4_a_net}.0/24 via ${prefix4}.${a_r1}.2
+		run_cmd ${ns_r2} ip route add ${host4_a_net}.0/24 via ${prefix4}.${a_r2}.2
+	fi
+
+	# Set up initial MTU values: 1400 behind R1, 1300 behind R2
+	mtu "${ns_a}"  veth_A-R1 2000
+	mtu "${ns_r1}" veth_R1-A 2000
+	mtu "${ns_r1}" veth_R1-B 1400
+	mtu "${ns_b}"  veth_B-R1 1400
+
+	mtu "${ns_a}"  veth_A-R2 2000
+	mtu "${ns_r2}" veth_R2-A 2000
+	mtu "${ns_r2}" veth_R2-B 1300
+	mtu "${ns_b}"  veth_B-R2 1300
+
+	flow_r1="$(mp_flow_via ${family} ${dst} veth_A-R1)" || {
+		err "  no flow through veth_A-R1 found"; return 1; }
+	flow_r2="$(mp_flow_via ${family} ${dst} veth_A-R2)" || {
+		err "  no flow through veth_A-R2 found"; return 1; }
+	if [ ${family} -eq 4 ]; then
+		ping_r1="${ping} -I ${flow_r1}"
+		ping_r2="${ping} -I ${flow_r2}"
+	else
+		ping_r1="${ping} -I ${host6_a_addr} -F ${flow_r1}"
+		ping_r2="${ping} -I ${host6_a_addr} -F ${flow_r2}"
+	fi
+
+	# A Packet Too Big from R1 is cached on both paths
+	run_cmd ${ns_a} ${ping_r1} -q -M want -i 0.1 -c 1 -s 1800 "${dst}"
+
+	pmtu_a_R1="$(route_get_dst_pmtu_from_exception "${ns_a}" "${dst}" oif veth_A-R1)"
+	pmtu_a_R2="$(route_get_dst_pmtu_from_exception "${ns_a}" "${dst}" oif veth_A-R2)"
+	check_pmtu_value "1400" "${pmtu_a_R1}" "exceeding MTU via R1 (veth_A-R1)" || return 1
+	check_pmtu_value "1400" "${pmtu_a_R2}" "exceeding MTU via R1 (veth_A-R2)" || return 1
+
+	# The lower MTU behind R2 lowers the PMTU of both paths
+	run_cmd ${ns_a} ${ping_r2} -q -M want -i 0.1 -c 1 -s 1350 "${dst}"
+
+	pmtu_a_R1="$(route_get_dst_pmtu_from_exception "${ns_a}" "${dst}" oif veth_A-R1)"
+	pmtu_a_R2="$(route_get_dst_pmtu_from_exception "${ns_a}" "${dst}" oif veth_A-R2)"
+	check_pmtu_value "1300" "${pmtu_a_R1}" "exceeding MTU via R2 (veth_A-R1)" || return 1
+	check_pmtu_value "1300" "${pmtu_a_R2}" "exceeding MTU via R2 (veth_A-R2)" || return 1
+}
+
+test_pmtu_ipv4_mp_asym_exceptions() {
+	test_pmtu_ipvX_mp_asym_exceptions 4
+}
+
+test_pmtu_ipv6_mp_asym_exceptions() {
+	test_pmtu_ipvX_mp_asym_exceptions 6
+}
+
+test_pmtu_ipv6_mp_exceptions() {
+	test_pmtu_ipvX_mp_exceptions 6
+}
+
 usage() {
 	echo
 	echo "$0 [OPTIONS] [TEST]..."
-- 
2.56.0

