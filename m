Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.86.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943921;
	b=E0Evqg0SOoakJLyUgxZ4m+Ty4icQTwW/P2XR5MMLnSWo8+r3KfZYMBxnXibAprWhYs9P
	 2P+FfjQ4r+xh9O874/WIkJI48zvXjVm63/wdBicIRX8eI2hMewOQt83wgKtvOdU8VOi6N
	 l6st4WIwEPychP5Ge+fvfIgGjwIhzqu4H3m93h/VLr/m8WelvIi5OFZ5LICAuLIev2QlU
	 RpNkykHZYN1HKlh3SpApsWpAjLzDqT5RTvR/1IcbrBA7OSW42K1CPeRui4eptdA2h1CE5
	 wHdHQzfFyHa43lrZ/67gobp6vICZohHUxx5E27tznaX6MXN2RxpjlIZt+kkLLqXLU5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943921;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Info-Out:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=Zf3DEiDrYLSWdQMuyfOR5jxu0qZzhEBdR5Lv+JQEePU=;
	b=s4Iho9t7QBjJ+xRjKCLTUuAD0fXZeFLTjyRNs7afavosqfG1+GsU441dSMQaUSZXWXsh
	 AuCPVFB/ANdyc2JpEgOKjhDk5zVGIu9fEM2ipzZKhTufVVtrMWechP/a+Acea0camakCe
	 VBIgJ5cmBThx7S9E5h5XoMtJdibYlMbiU/LiWmtmVpjLYvgn92PONy+dnys7ZGujbfD3M
	 OXDgj1FRTXK+4knybq4EMgo8rq1qNQF9gzWbUfym2cX8+FUShMXzJbqwbUoNZTnppWhtV
	 T/vvkZsIzIi+bNOciFrJRC6NTkYlebgxAdmgo3e0Sw+qZREXqW2VnWllO3OCSF84dLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b="G9Lnf/x5";
	arc=none smtp.remote-ip=57.103.86.249
Received: from outbound.qs.icloud.com (qs-2005l-snip4-8.eps.apple.com [57.103.86.249])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E11606A884
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E11606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=G9Lnf/x5
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPS id 5C0FC3000153;
	Tue, 17 Nov 2026 19:31:57 +0000 (UTC)
X-ICL-RepId: 01a1eafe-9cf1-7fdc-b462-d5ea6762e77f
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794943919; x=1826479919; bh=Zf3DEiDrYLSWdQMuyfOR5jxu0qZzhEBdR5Lv+JQEePU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=G9Lnf/x5HNyvgMjHFonFnOHiKhLynq+UI4YvjeALzLP9JwtXe6MT/3DYrgd/A8RUc2/80m3oHrrdXqiuVqyhSWA5uyqWXEjY9zh7T84EYRJUWyXEIidBTE3ibVexutVxQBA3ab1JPcHjyxPiPSJRPrKOCop7z92+Y8W5dQPXiTZ+yWuPae8/zZbLFnbPT2/5s6pWL1u6X9MbXaDDR2De9IUL4dzmv7P0CoTV1RePZjWEMjOUp79oIeIhIkDBY3d3B8TiAH7gOTpFrPzVYlQs4zYBwpUuIWlZXz6jm4SoV6kY8vSolnY1C1/M6dKkBRYY7jIAGrhKGLwQFz7K2S06Zw==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPSA id C30DA3000175;
	Tue, 17 Nov 2026 19:31:54 +0000 (UTC)
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
Subject: [PATCH net-next v4 3/3] selftests: net: pmtu: Add IPv6 and asymmetric multipath tests
Date: Tue, 17 Nov 2026 22:31:41 +0300
Message-ID: <20261117193141.27004-4-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117193141.27004-1-deliran@verdict.gg>
References: <20261117193141.27004-1-deliran@verdict.gg>
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
X-Authority-Info-Out: v=2.4 cv=Hu972kTS c=1 sm=1 tr=0 ts=6afcabae
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Yl5iA8-PW_Y7gXrYGfMA:9
X-Proofpoint-ORIG-GUID: FaJPhwiorwm1mqDMHK4eojKFgT5gfri8
X-Proofpoint-GUID: FaJPhwiorwm1mqDMHK4eojKFgT5gfri8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NyBTYWx0ZWRfX/kNf1AjxHrjV
 0hiwoCDSkG7lRVrtrtRLkWP9yaY11uQg4YK/bTTA5ATKzlESxJpIJT2byqxTg2v5cWPHYC9CqXn
 KBpnZBLVOja8LerHhyHK2wE6qfIkgFY+bpKvrKWYkkeJMRw04TsgfL8/HXm1LcpC5BBYvMzdYs3
 ubpoVyObdk2kti7Dbimw1f1XnKmVOC0GnhI2L8O9DTVeR+FSTgsmRo7uO/mH1qPLt+v1Jo8ic1J
 MsdQcHSP7fbGhIZgtlmfV77qirugJtWH6Ux2fToycJpjeMyCs2z5DX183V33Dg1nLf4F9m1GlRk
 cYbGUFPU6cXoxNlY3RCCITQPoQGC+nzDn+hs6G6EmcHZx+wzJvoaPrMXq4rer8=
X-JNJ: AAAAAAABblxZlUDIzIe93Ky/qzvpkZC9NPbV4Rzr313W9Osksb/TrAbSjCXyrwCJ2ynWrC
 vohsVWF4Xot/pJT0LOumPuv8ZLFhN1P+dqIUi7ZW8IXSwlaFw8vhPSg8F4rVQAevWEVpNZ
 gCLG3R8S3rzAQ9CIYWDPkAv4mer51voHJr2Rzr+cd4HPmsWSeNl7ltQ5dL8ipeOwqyd9Md
 yGLWZQBBvRl2D+QaSuCdv0PtqBPFqt7m1bQLI/M88VTA5atUyG6HOZiZ4hEXsX/nzswzRe
 bnaofDgnJ1TNAIrCIZbW5unNQgQ/2223Hnk3tiEXzvBmW5jaFUE0ec0+O43CVPrHAWaLp9
 PXta1Ul/1p1rSMRarGWOwnw1sdPJe1zJIu1wy9e0zCQx7+uqVHsVGyTIKP/JALYQYb41bS
 5Qh4+cw3GoyB+3ZErwvI8MPDcGL21XV7X5ZTHyR9ieotevPSsdgAxsUDMAcy1rdEfRbPGx
 4fat8leLv6RiUx/Q3A59RZ+GpLiZOjrx0QBzO5PuMbBKQLQ++RSmc0D2gdO1yItqCnnKm0
 tZZGaaxNoEkP3hjEUQd5zYfuuTy2RmicmTi5tF8RRyHLxp4nFtuZtMLdOAyt2Uod4dGaia
 Qr2IPEoENNuo7/F6Vy56F/h50fzy6DVKKoRvdIHIMywNF2Pg9SIw1bGDkM2yI9fXMH7/8J
 HLhoWp4D8zmXlFdWa/p/xawSHb/a0oiRR8ndnTFPXmSlFYF/QnKmgJYHeK014tdXJoehne
 blLXMnaxe0m8YM6ev/tg76WNQpNPrMGCWnt4wGoS0Oy9jiP6FJu+p0UoQhc7lA1/z+Rr8L
 VsuprydkQHAH4Vzr0T+sDdu4bU7YnqpDTO4zdyH7G0z6ZKTxul2a

Make pmtu_ipv4_mp_exceptions family agnostic and add
pmtu_ipv6_mp_exceptions: one oversized ping over a multipath route must
leave PMTU exceptions on both paths.

Add pmtu_ipv4_mp_asym_exceptions and pmtu_ipv6_mp_asym_exceptions with
an MTU of 1400 behind one router, and 1350 on the link to the other
router with 1300 behind it. They pick a flow through each router (a
source address for IPv4, whose multipath hash covers addresses only, a
flow label for IPv6) and check that a Packet Too Big from the first
router is cached on its path only, as the second one can't carry 1400,
then that a flow through the second router lowers the PMTU of both
paths.

Host A pings with ICMP sockets. With a raw socket a Packet Too Big is
handled a second time, by rawv6_err(), looked up without the interface
it came in on, and could land the exception on the other path and pass
the IPv6 tests without the fix.

Without the preceding fixes the asymmetric tests fail for both families
and the IPv6 multipath test as well, with both legacy nexthops and
nexthop objects.

Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 tools/testing/selftests/net/pmtu.sh | 290 ++++++++++++++++++++++++----
 1 file changed, 252 insertions(+), 38 deletions(-)

diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu.sh
index c7cd271714ef..df0d8f75be20 100755
--- a/tools/testing/selftests/net/pmtu.sh
+++ b/tools/testing/selftests/net/pmtu.sh
@@ -203,6 +203,19 @@
 #	on host A and B on lo reachable via both routers. Host A and B
 #	addresses have multipath routes to each other, b_r1 mtu = 1500.
 #	Check that PMTU exceptions are created for both paths.
+#
+# - pmtu_ipv6_mp_exceptions
+#	Same as above but with IPv6
+#
+# - pmtu_ipv4_mp_asym_exceptions
+#	Same topology as pmtu_ipv4_mp_exceptions, with b_r1 mtu = 1400,
+#	a_r2 mtu = 1350 and b_r2 mtu = 1300. Pick a flow through each router
+#	and check that a Packet Too Big from R1 creates a PMTU exception on
+#	the path via R1 only, as the path via R2 can't carry 1400, then that
+#	a flow through R2 lowers the PMTU of both paths
+#
+# - pmtu_ipv6_mp_asym_exceptions
+#	Same as above but with IPv6
 
 source lib.sh
 
@@ -272,7 +285,10 @@ tests="
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
@@ -350,8 +366,12 @@ tunnel6_b_addr="fd00:2::b"
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
@@ -994,49 +1014,121 @@ setup_ovs_bridge() {
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
+		nodad=""
+		nh_a_r1=${prefix4}.${a_r1}.2
+		nh_a_r2=${prefix4}.${a_r2}.2
+		nh_b_r1=${prefix4}.${b_r1}.2
+		nh_b_r2=${prefix4}.${b_r2}.2
+	else
+		host_a_addr=${host6_a_addr}
+		host_b_addr=${host6_b_addr}
+		nodad="nodad"
+		nh_a_r1=${prefix6}:${a_r1}::2
+		nh_a_r2=${prefix6}:${a_r2}::2
+		nh_b_r1=${prefix6}:${b_r1}::2
+		nh_b_r2=${prefix6}:${b_r2}::2
+	fi
+
+	# Set up host A with multipath routes to host B host_b_addr
+	run_cmd ${ns_a} ip addr add ${host_a_addr} dev lo ${nodad}
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
+	run_cmd ${ns_b} ip addr add ${host_b_addr} dev lo ${nodad}
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
+		nodad=""
+		nh_a_r1=${prefix4}.${a_r1}.2
+		nh_a_r2=${prefix4}.${a_r2}.2
+		nh_b_r1=${prefix4}.${b_r1}.2
+		nh_b_r2=${prefix4}.${b_r2}.2
+	else
+		host_a_addr=${host6_a_addr}
+		host_b_addr=${host6_b_addr}
+		nodad="nodad"
+		nh_a_r1=${prefix6}:${a_r1}::2
+		nh_a_r2=${prefix6}:${a_r2}::2
+		nh_b_r1=${prefix6}:${b_r1}::2
+		nh_b_r2=${prefix6}:${b_r2}::2
+	fi
+
+	# Set up host A with multipath routes to host B host_b_addr
+	run_cmd ${ns_a} ip addr add ${host_a_addr} dev lo ${nodad}
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
+	run_cmd ${ns_b} ip addr add ${host_b_addr} dev lo ${nodad}
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
+
+	# Ping with ICMP sockets, the sysctl covers IPv6 too: a raw socket gets
+	# a Packet Too Big a second time, through rawv6_err(), looked up without
+	# the interface it came in on, and may cache it on the other path
+	${ns_a} sysctl -q -w net.ipv4.ping_group_range="0 2147483647"
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
@@ -2377,8 +2469,18 @@ test_pmtu_ipv6_route_change() {
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
@@ -2395,18 +2497,130 @@ test_pmtu_ipv4_mp_exceptions() {
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
+# multipath hash covers addresses only, or an IPv6 flow label, in hex as
+# both ip and ping take it, for a packet sent from ${host6_a_addr}
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
+			flow="$(printf "0x%x" ${i})"
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
+		run_cmd ${ns_r1} ip route add ${host4_a_net}.0/24 via ${prefix4}.${a_r1}.1
+		run_cmd ${ns_r2} ip route add ${host4_a_net}.0/24 via ${prefix4}.${a_r2}.1
+	else
+		${ns_a} ip route get ${dst} ipproto 58 flowlabel 0x1 >/dev/null 2>&1 || {
+			err "  ip route get flowlabel not supported"; return $ksft_skip; }
+	fi
+
+	# Set up initial MTU values: 1400 behind R1, 1350 to R2, 1300 behind R2
+	mtu "${ns_a}"  veth_A-R1 2000
+	mtu "${ns_r1}" veth_R1-A 2000
+	mtu "${ns_r1}" veth_R1-B 1400
+	mtu "${ns_b}"  veth_B-R1 1400
+
+	mtu "${ns_a}"  veth_A-R2 1350
+	mtu "${ns_r2}" veth_R2-A 1350
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
+	# A Packet Too Big from R1 is cached on the path via R1, not on the
+	# path via R2, whose link can't carry 1400
+	run_cmd ${ns_a} ${ping_r1} -q -M want -i 0.1 -c 1 -s 1800 "${dst}"
+
+	pmtu_a_R1="$(route_get_dst_pmtu_from_exception "${ns_a}" "${dst}" oif veth_A-R1)"
+	pmtu_a_R2="$(route_get_dst_pmtu_from_exception "${ns_a}" "${dst}" oif veth_A-R2)"
+	check_pmtu_value "1400" "${pmtu_a_R1}" "exceeding MTU via R1 (veth_A-R1)" || return 1
+	check_pmtu_value "" "${pmtu_a_R2}" "exceeding MTU via R1 (veth_A-R2)" || return 1
+
+	# The lower MTU behind R2 lowers the PMTU of both paths
+	run_cmd ${ns_a} ${ping_r2} -q -M want -i 0.1 -c 1 -s 1280 "${dst}"
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

