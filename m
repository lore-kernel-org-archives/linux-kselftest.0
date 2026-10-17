Received: from outbound.qs.icloud.com (qs-2001a-snip4-7.eps.apple.com [57.103.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D3A41DDF1
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.87.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792271157; cv=none; b=kYZPjhuw/nSTkNwA+R6GTjqdLOZkXKwkQsSaQAg32IdYt7KFfe2shjWEL5J5BTU/8XSuQiXm0ZDuEiPuT8LpK+OLtSKdd8REWdKByTJJ2HRCCqd3NC9uphjpjx1xNZq70fG2z9Oyz9ixrCzowkkVSriCNVWs+ANplZUFuCNw5CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792271157; c=relaxed/simple;
	bh=U73rza4Tey8bZdHSwdeA6BbhZAaWw0MwZBQiiZPetvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/HnAu9+nAeRw9yp3PSuZuJcHtuPpwi9UxNV9r4+NUA0hJHZM8/o6gHyN6MmlBvBPc5/T+bApfxmgSX0it+zyT/HEeecWbmouS5bo5DxGkPrvolsYIuXXnPYPtf1Y3keNpaq176sL9b8vZz41SB/ov/wRtOb0DMiTD2O9ajWRoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg; spf=pass smtp.mailfrom=verdict.gg; dkim=pass (2048-bit key) header.d=verdict.gg header.i=@verdict.gg header.b=fYh/XPdL; arc=none smtp.client-ip=57.103.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=verdict.gg header.i=@verdict.gg header.b="fYh/XPdL"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-3 (Postfix) with ESMTPS id 70CAD18001D9;
	Sat, 17 Oct 2026 21:05:52 +0000 (UTC)
X-ICL-RepId: 01a14baf-74f6-7096-9275-ed6726ba399f
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQ1OHVwORQFEF0oBTVIPDxRcFFofVgVyBlwKVwRUHxwXXlhVCQodVwJdEVAZGQxVUEsbDlwFS1oVVRcOAkIfUB9MFldDRhgcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKHVcCXRFQGRkMVVBUEVdQC1kCQg9JA1wAWQNADEgLQwBaCkQAVQBAUw5eGUsZXS1BDkAUUBtHQ1AMDFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1792271153; x=1823807153; bh=04Wvdso6J4G6jdyBCnDIpEQVxCfOfUQD28WYC3zRj6o=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=fYh/XPdL5wIJPBr6dKnQGo2BMLerX4H7gQLLi4O1lkqDzAYfqqkZaQkJTzJ47aM+5j4da72pa5UbjflE8aOVA8WMxe0pUPWJvonSF15RAx/goQmafUPapQ4A2dHsSUfNAEKTRbpz4GeoRRloJeAeElJVioLJBnJiFVKhyFmiw3SBxablQeck6yMOOMIo9PtfJl43UC36aGhJqO6HE8+GcTM9Okm0dcmaEIkI61Lr/TtZpr8oobnZ1GX7iCoLW+88/JWoWmBHXqrIeeCF/ZSY8qDgDsE1iq931gjOcpRaJALhtB6aCsKBbkXgDwY6QXTXY9GJPF7SX89y0jRbrcjVNg==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-3 (Postfix) with ESMTPSA id EFC10180023D;
	Sat, 17 Oct 2026 21:05:49 +0000 (UTC)
From: Vladimir Vdovin <deliran@verdict.gg>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Vdovin <deliran@verdict.gg>
Subject: [PATCH net-next 2/2] selftests: net: pmtu: Add IPv6 multipath exceptions test
Date: Sun, 18 Oct 2026 00:05:08 +0300
Message-ID: <20261017210508.71849-3-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017210508.71849-1-deliran@verdict.gg>
References: <20261017210508.71849-1-deliran@verdict.gg>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA4NCBTYWx0ZWRfX3Cn1cEnuDDIY
 iBnc2DiF2NcT5fAYCHQ5bsMFm72mGmgdM37I0RZ5yqIPl/TjTOB9q3Sf6Ea/kJrjU01DWIzqN/f
 KYxwwITtPcpZ6/WRISJemnZ5a60QFs2E52cfUV3yjVc1iJ/rxOOuxlCFfdPFnipXiiMVx0atKHi
 UBkmd6w7f6jIsm4xhIHqcZyCWUiW4gomVz4CssMxwPGpwQy8iOACLgt4mSVTdDVO8XlbksGQ5VV
 4H1LhF2222HCP/YL1kXr2EmcDC8lyMdagMPm0cDSubluF6K+tmwtcsv5TzlydwtRfyY2xMktJ7n
 58VA500fJ0/mItG+ON21AgjRaHtf3UdJOKc63/AoNrGhWNCJwBumcaDUcAOz3o=
X-Proofpoint-GUID: yJFYwdMa7BfxjUcKZQzuLBvzLyJEC7YS
X-Proofpoint-ORIG-GUID: yJFYwdMa7BfxjUcKZQzuLBvzLyJEC7YS
X-Authority-Info-Out: v=2.4 cv=NqjcssdJ c=1 sm=1 tr=0 ts=6ad3e331
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=c9wAbVb4WFjQg88ejdAA:9
X-JNJ: AAAAAAABfdnfbYvpMqP6uj/YOi2rfYgrJLiIwtEEKXTvjOQGBO5cKU46IJusAg8/ebL34fW8kfqNJb3wKn9wv+uiRj3YpC1R47evkE0l62tKeWL2hA1ypu11cc0lw/BLev7nmhHnZ66Qx3sUCBrPMeeejGk+Kfod0ZGFz9WRWjE6+XEq7QOTeYo4KbTzBRhDeVTZNCt4Qel5ZNSwdvqxfel/p3L3dyIwtVa3JG/oHnFCR8Cc/N/ASqMCAeQh4WZyXLMUyLLOko/PNjaIG26QRGvfoJoNGEEAaWN7z9XNsDxzYGpSO0HV4TVibf+ILzJXvek58NeoK1xAuSnA/PmUhXFkTHd7hr6fvtbT0kU8pRofcsPLA56+0ctRsh/3GNRbnRNNvUgakFLUycOl5fbaXdGHgE5tLSB+gpLjW2XCuG1dC1IRDtP2BHddrqV6268lTACh6sEUOIAJUNjEELnUQIVCx3s7W+wICX/9txL/a6F4pu3PWHAIWiWSAVcvl3br7s1ZIJ9LSPy8WWLCCrTWH8XsMqvAEdA6g5dJKKO4KlmxDVsxbEYV4yW0JfNWQBoJJz9Mc670tSjMO3tIvZkCxDq/xbgmDMX3DVKzWMJKx2OIr0Y+jxHhDlmGDHKWr3+uUqpgynlk3+SE59zGDQ+SPhJHLaXWqzUOD61i8mgBgMVaTLW0pjLxIqsSJJJbrxFMtXB0D0rK6kvn5pvt77A+nHpWGyPzeBJtkF8DZiWyRjlRZ9O6SAmJ4oJvcGk3gt8fa4rIMpReSgu9D0e13lC6ohFxCbmpsE0CHm+rRhsLLKvgETk5LtgjsWcB+06Q

Make pmtu_ipv4_mp_exceptions family agnostic and add
pmtu_ipv6_mp_exceptions: one oversized ping over a multipath route
must leave PMTU exceptions on both paths.

Without the preceding fix the IPv6 test fails with both legacy
nexthops and nexthop objects:

  PMTU exception wasn't created after exceeding MTU (veth_A-R2)

Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 tools/testing/selftests/net/pmtu.sh | 162 +++++++++++++++++++++-------
 1 file changed, 124 insertions(+), 38 deletions(-)

diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu.sh
index c7cd271714ef..9ff46708fa03 100755
--- a/tools/testing/selftests/net/pmtu.sh
+++ b/tools/testing/selftests/net/pmtu.sh
@@ -203,6 +203,9 @@
 #	on host A and B on lo reachable via both routers. Host A and B
 #	addresses have multipath routes to each other, b_r1 mtu = 1500.
 #	Check that PMTU exceptions are created for both paths.
+#
+# - pmtu_ipv6_mp_exceptions
+#	Same as above but with IPv6
 
 source lib.sh
 
@@ -272,7 +275,8 @@ tests="
 	list_flush_ipv6_exception	ipv6: list and flush cached exceptions	1
 	pmtu_ipv4_route_change		ipv4: PMTU exception w/route replace	1
 	pmtu_ipv6_route_change		ipv6: PMTU exception w/route replace	1
-	pmtu_ipv4_mp_exceptions		ipv4: PMTU multipath nh exceptions	1"
+	pmtu_ipv4_mp_exceptions		ipv4: PMTU multipath nh exceptions	1
+	pmtu_ipv6_mp_exceptions		ipv6: PMTU multipath nh exceptions	1"
 
 # Addressing and routing for tests with routers: four network segments, with
 # index SEGMENT between 1 and 4, a common prefix (PREFIX4 or PREFIX6) and an
@@ -352,6 +356,9 @@ tunnel6_mask="64"
 host4_a_addr="192.168.99.99"
 host4_b_addr="192.168.88.88"
 
+host6_a_addr="fc00:1000::a"
+host6_b_addr="fc00:1001::b"
+
 dummy6_0_prefix="fc00:1000::"
 dummy6_1_prefix="fc00:1001::"
 dummy6_mask="64"
@@ -994,49 +1001,112 @@ setup_ovs_bridge() {
 }
 
 setup_multipath_new() {
-	# Set up host A with multipath routes to host B host4_b_addr
-	run_cmd ${ns_a} ip addr add ${host4_a_addr} dev lo
-	run_cmd ${ns_a} ip nexthop add id 401 via ${prefix4}.${a_r1}.2 dev veth_A-R1
-	run_cmd ${ns_a} ip nexthop add id 402 via ${prefix4}.${a_r2}.2 dev veth_A-R2
-	run_cmd ${ns_a} ip nexthop add id 403 group 401/402
-	run_cmd ${ns_a} ip route add ${host4_b_addr} src ${host4_a_addr} nhid 403
+	family=${1}
 
-	# Set up host B with multipath routes to host A host4_a_addr
-	run_cmd ${ns_b} ip addr add ${host4_b_addr} dev lo
-	run_cmd ${ns_b} ip nexthop add id 401 via ${prefix4}.${b_r1}.2 dev veth_B-R1
-	run_cmd ${ns_b} ip nexthop add id 402 via ${prefix4}.${b_r2}.2 dev veth_B-R2
-	run_cmd ${ns_b} ip nexthop add id 403 group 401/402
-	run_cmd ${ns_b} ip route add ${host4_a_addr} src ${host4_b_addr} nhid 403
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
+
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
 
-	# Set up host B with multipath routes to host A host4_a_addr
-	run_cmd ${ns_b} ip addr add ${host4_b_addr} dev lo
-	run_cmd ${ns_b} ip route add ${host4_a_addr} \
-			src ${host4_b_addr} \
-			nexthop via ${prefix4}.${b_r1}.2 weight 1 \
-			nexthop via ${prefix4}.${b_r2}.2 weight 1
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
+
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
@@ -2377,8 +2447,18 @@ test_pmtu_ipv6_route_change() {
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
@@ -2395,18 +2475,24 @@ test_pmtu_ipv4_mp_exceptions() {
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
+test_pmtu_ipv6_mp_exceptions() {
+	test_pmtu_ipvX_mp_exceptions 6
+}
+
 usage() {
 	echo
 	echo "$0 [OPTIONS] [TEST]..."
-- 
2.56.0

