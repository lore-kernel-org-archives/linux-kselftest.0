Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.68.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572577;
	b=ITcYk2rqbwi6dv9CSBmt63xXftwB20Q8fFbDkobjNuxj7HA/+RobGMJrRMxH82VH7eJm
	 ZEOIjT05BU8nHoWSCcjT+tIOjp/EdNz2xLc3KnlKmDfofL7osDPe87N8dmgGcJWZ3lxQM
	 8VTINjd0+p3Y7uuV4f5x/xlLfealjgF1kypI6mf//vNK8bZviuDh9Iarold/1AjZoBVmR
	 juqHZBVbUIAnzwOtGzybnX/yYsQlnUXqF1JIROCOpKMBd5Cvrv0LgQrA6P4VL5xkzFX6s
	 09xvJ7CfMrl0hBs15QZKSDjdCqm00cfpsRkvXZNcD4i8O/41RlbtidG1uvskp9q1PWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572577;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Info-Out:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=aMh7wVLNn5osDzNMZDx0QV5BBB+Pz+NiLpirZBF6xfA=;
	b=a4OE2bOeTc8IfZIGoT51FWIucv7Do0R8CY3j0QWhSj21w96UTreIZj8aT6J8nbXVpMxe
	 KS+ZVFPmZihWQdaff/A9j/84LcEGHZcUv4y/bcV/HGMzglOagEvOa4M6zwCjHzBVlTX0v
	 qjljTegMi2fq0C+1zWwUy/P2wo3FUCJaVP5Pu+lKEBSHE/YjFl4FbgThaWneLSA1RKIYd
	 NB/ZIUS1TqLId3ZZU6vuhiQMMZ9aiQHLXdP6DAlrzxe6vw1qZCv6+BMlwYZhIgzGRajiq
	 bj8mBJ6sJNzEoa9lrrrkrC0S97UntAfTG1YIw5PhJEzIujTaeF/HHwjhcHYEb9PJLSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=IstPGMGc;
	arc=none smtp.remote-ip=57.103.68.221
Received: from outbound.mr.icloud.com (mr-2002l-snip4-8.eps.apple.com [57.103.68.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C2B60A5BEB
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C2B60A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=IstPGMGc
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPS id AA3471800180;
	Fri, 13 Nov 2026 12:22:55 +0000 (UTC)
X-ICL-RepId: 01a1d4dc-63c9-7eec-aaa6-ef1ade63e68e
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794572576; x=1826108576; bh=aMh7wVLNn5osDzNMZDx0QV5BBB+Pz+NiLpirZBF6xfA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=IstPGMGc/pzcQ15Vrx6z+XbJoBmCVGTPItx1yRjz9OkxmbTZKmsJMAk6ODqjR3OG1pVXLLInszZiORDBfwnyrqWIfoMUQkqaHb2rLh+tGoNUvxYhPNxNbQjoaFVkPnTfHNvKnYOARSGMsg5DFr+HM91EUiQ+GUeUajeI0O612aGsuYGCchCn1ulGCWJXoeOrxyMUT4DYRqRiZIdG04i3+7tSU1JG6tNZf+h2r65En8S6J7n8WRa9WLeNIud7WXwmQMLKsiYezOfjcxyui6si0v1M7UdVhgimp8CAtimZc4WQ5w7p5Ot8eDkQjfy/JQMAC3mo5oQYvHLl8PKUlILITQ==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPSA id F3353180019B;
	Fri, 13 Nov 2026 12:22:52 +0000 (UTC)
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
Subject: [PATCH net-next v3 3/3] selftests: net: pmtu: Add IPv6 and asymmetric multipath tests
Date: Fri, 13 Nov 2026 15:22:37 +0300
Message-ID: <20261113122237.88990-4-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113122237.88990-1-deliran@verdict.gg>
References: <20261113122237.88990-1-deliran@verdict.gg>
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
X-Authority-Info-Out: v=2.4 cv=SM/Xx+vH c=1 sm=1 tr=0 ts=6af7011f
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EYaFdmsEC1CjpenOt5ir:22 a=ieB-HjlS9-5fP-wcyLUk:22 a=E8YXmJpeDLvvPdLe3XAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OSBTYWx0ZWRfXwg53/fcw7qaA
 hbnG8fgdytNI26tx+CC2ecs291vcSk0bFfWhpOuWDD8M4eB+dw5aznFM/n/5gzf737wwaKWWhMd
 FdDY0RWkJMiVHd3O3M2q2/vRKIjZFlg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OSBTYWx0ZWRfX89FAKFlemTAV
 PR+hmEb7mDDWZTI0PjouX6ryaZ3bY4rWW3rjLf65Lr5zsKUi3nG10c+/5IuZliqc1QDg1cb5zJM
 3HniM/BEbWwcdE8H3MSyCFoThGSAjUz8Zb84R/TELbxHNqMxGS+x6rmOacuK4YfAQ76FkuvLlvu
 VgOzJ10Ps++d3l1CpT5U0dXOO8I9K8Sww0O2G1hO45Qg7M3IdDGQ/XnM2Fm/LnNAiPnW0Zn6Ku3
 fqSDeGdiWGpuFBQ0fl43wwxO4Af6RKtXvF4Wr3FWNEqxYZMRWffagPvTju49XekXID4vwC1/l0Z
 YrniMpX2EB6yg9XA8wY2CA2OXyWl7vfcDW72+2lTNk9cnEDTLRcDJ1WsutROck=
X-Proofpoint-GUID: qBbd35-q3jY4QO25nrL14s99iF6xgHoT
X-Proofpoint-ORIG-GUID: qBbd35-q3jY4QO25nrL14s99iF6xgHoT
X-JNJ: AAAAAAABwj3sdWXdSgqD8Rl/UtkLBFkWYSo9iuETAFyXPkxZBwiZ7u/SJKGE1w/FruQ80j
 jOpTPXG1FgUOgc2aOG8RB9TTJ3VThqD44cfY3TOrIQGUYVt/kigkZ/DoOyXjABMFu3TbiJ
 i7UKcNoo5JODshYjM+DT3tQ+gvUkM7Wfqr1b+uqQUrx8TY4iXGchLcl0JP7KhJqLdBilmf
 5yzGSZXJzZQm81D1hf+aDBKDwJT30XkXI5UqMs/KNdyRSWIuBIeaq5k6kATlEUlUs9nL6I
 qoHV4CyQEEY/1g5AU1kcsdkUdMYCgrSba8FDfTw2xh8+o8wAlHfa+jGyxueJRNj2X5fb/J
 QbOR5x2kvZZ7CFM5NCUomjpDakqTFS7MYiNe2HCKBcO+lXQghI/IR2rma2ATtRAej6EFo2
 IVXSZPQm/Lf7KYQ09fybtpx8RMdBP05StaFvSCp8GJzMBEkYmu7UdOls3gwoxzcNQZ/l/7
 MyZfQcMnDFCJ13QLMzj1ReR7ix9qJZzdXh74j84pJWHHOrqwTpRbruhUV9+C1A61rc5Gfu
 4ra6itFR4m48kd7vVSlCNoHwOm3VfMMIp9G1aEbpXOH7GlDf//6QXM8mCNSAVuP4tv7lWN
 SW5Z+znI7UrNbFRIGUzYnhUGDQoWcfibuTWzIb4hPX2id5DT6SW2OPZRxLmF37siQTM1Fi
 WvEeLzqyLgb1BOXEjis48rOMG2LKgTs52Bh7Phh8azJOsdYfFDoor3dj32okH2AGY8Kc3O
 40V4Ww0SIBH+FGLEpJdWA8QgO3Dpi8fwp8lnDoIOvWa6YluY3ey2gGE8xHTogIuqal8yPB
 Byxb9vG6JMqCo1V/ChfVXzPTL51g3NjA4jA=

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

Without the preceding fixes the asymmetric tests fail for both families
and the IPv6 multipath test as well, with both legacy nexthops and
nexthop objects.

Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 tools/testing/selftests/net/pmtu.sh | 281 ++++++++++++++++++++++++----
 1 file changed, 243 insertions(+), 38 deletions(-)

diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu.sh
index c7cd271714ef..2bd132991841 100755
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
@@ -994,49 +1014,112 @@ setup_ovs_bridge() {
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
@@ -2377,8 +2460,18 @@ test_pmtu_ipv6_route_change() {
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
@@ -2395,18 +2488,130 @@ test_pmtu_ipv4_mp_exceptions() {
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
+	run_cmd ${ns_a} ${ping_r2} -q -M want -i 0.1 -c 1 -s 1300 "${dst}"
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

