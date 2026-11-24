Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.84.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534665;
	b=hwzJcAHkWDHB+JBoJjWbCzzz1rv1o7TGuTA5FDLT+pa8STmu3rlshctKzfIvQggamNKV
	 jKN/rZ4VZ7xkE9o5pI1PprWlrsH3N0NV5XpZaPWAlCMRgEVDl7p2oDC23lPhLuT5LOnak
	 zjPOxjUVir+zLqOHMR4t+qfn7Quj2MOsd/jkuC8sBGKUK6V8fUDbs0TfZ3EB01uZZGgxc
	 qf1c0ig6Y1jp4NRX+TqjPYoUbmnYvv75LkyKZ6i0C8OYartsHnNviuJb7zZ6yYiSSGNUV
	 jK5zxVlC0dIFSlQ491k08/FdEcHzG9bhLrJVINLDnDtppGl6kNddtvYoUWWpjdecZiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534665;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Info-Out:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=BmUU93uhr5OsPAnEIhNQgL1kE5fNwW5hzTfoPEFRphw=;
	b=I0LTjGkca3SVt09jUwYoBAL8xG11Ppw1KhhVi9ISjfDDN/1vTFXunjO3TCJVSRV0Hr+b
	 9msJxyN32udqZuBR84U7NVumV+/AuCKj9M1QjGCl4vNoG60zfOM25Hf3ao4I69X8pJN79
	 2A0JpMLfCQZMv1I0tbQC9sy6chf98xNVQctzRJBHuGa5oOgtMlO6nL+rfkUPKgG/i13kD
	 2yF5a13jq6W29i4hH7hQf2fdQsf4pdbmqTHGxeX1XxDwp6Pa8ZAOwR+hR6/mbZ51GsoHf
	 Rf6OMeI40ucHv3t/4PPb3p8aYKbE/88wse8uNEhCNHMOouKHfF/L4iVo+C0rDl08bCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=Hvw5pVnx;
	arc=none smtp.remote-ip=57.103.84.231
Received: from outbound.qs.icloud.com (qs-2007j-snip4-11.eps.apple.com [57.103.84.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD8D606A682
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 15:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD8D606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=Hvw5pVnx
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-9 (Postfix) with ESMTPS id 2752D18002BC;
	Tue, 24 Nov 2026 15:37:43 +0000 (UTC)
X-ICL-RepId: 01a20e34-ade2-714c-809d-5fbc2ff6bde9
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1795534663; x=1827070663; bh=BmUU93uhr5OsPAnEIhNQgL1kE5fNwW5hzTfoPEFRphw=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Hvw5pVnxAC+O6k5JcJQuMYXHGcDdGPH1PC2DxiiRMVpWAFaWXj+bW2pgOPSpJ1TKdSdlGne3NTy7pn6K0YJ3rnONHyY+hQipHF9uyzbNa8OM5gAfFty68BWINJ5t1SFrjPy7c3QB9Dh5UkRy+Rs4AETtMQVhkr99+1RQFZMHbyZEY8YzGqtBIeyUkRX95yc3gE59RCOfSti9gsw3WtokmDIlfDSNRyL7uet+iBeFBnmVGqXv67MrkE9G4NuHpD8GmAqTrQgXCN3Xs/gWucMwtVCk4o3yqKi6ZNOvnFqTi4osyonnw1977WxcPo6NWXg+GU+XCCOoi8tVELGY8HKQ6Q==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-9 (Postfix) with ESMTPSA id 26A8518002A8;
	Tue, 24 Nov 2026 15:37:41 +0000 (UTC)
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
	linux-kselftest@vger.kernel.org,
	Vladimir Vdovin <deliran@verdict.gg>
Subject: [PATCH net-next 2/2] selftests: net: pmtu: Add a multipath test with paths of different MTU
Date: Tue, 24 Nov 2026 18:37:30 +0300
Message-ID: <20261124153730.56549-3-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124153730.56549-1-deliran@verdict.gg>
References: <20261124153730.56549-1-deliran@verdict.gg>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MSBTYWx0ZWRfX2bMOWvnmVPrP
 HIxpvaGDrfMjxdlCAvG2P0K2PHeuT+THL8sTsqD5xlLaiZlhSfNqd2QOV78Bhcj/bfXywaqM4jK
 rdEE0ImJNa3FRCy/OwcTqtu37FYWAcY=
X-Authority-Info-Out: v=2.4 cv=PYZqFShd c=1 sm=1 tr=0 ts=6b05af47
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HxOO8S7qDNDRVQTpMkN7:22 a=1-P0SRgB0hgiDeu8hSP7:22 a=W74Lhd9-C7prWGa38HQA:9
X-Proofpoint-GUID: BUejfQcTUNiKPssilSLA_do0t2B1yxcm
X-Proofpoint-ORIG-GUID: BUejfQcTUNiKPssilSLA_do0t2B1yxcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MSBTYWx0ZWRfXypqbsGHB+jab
 i5T9W+vpY3vdCb2JOFUilmlRJwfIba2fDVDUA/65rQ0Pm8IPTAel/cekDwTeR3DdS4c2bpEA7n+
 RamoNyv6IWqOOo5TPkfaMqWoKrPR7dD1j837qXaC+FnYnGs/aBpSIrp+91a1+sA2iI4jEzXV1bs
 7cb0fOsMjyNbznMVMlUkudjeKSCddNp0vXrb+XW83WskwpCUPjvvSKURXenl3OMkKMrA0ytsZXx
 pJSNKDVi3YLzS9debOt62faMsA6xulAPo+kEmBB381ynji/jtxSqfBBqoM42B8zvr9QlUsVi1qa
 jRCOE/Mw0SREBO/dLDMitGVJShw4ijA/HwYTz+JyrkMtNa+lCm/WZ1sRsuOTZg=
X-JNJ: AAAAAAABUR1p02ohqzzoZgrJ5V/iVr9Pvv7cQg/bY+CmgjOrBfNpC0LKrIfjcrTHmwzIlS
 qIHqwoY3/M9lc4NxhRjWeB9ixontFMW06SCTIkVLcdUl8Z9zySUARLzBkvfifzqVBYBx7X
 FrcoMOwQkPj4L0YP/nlKpN1kHmiIVSfNZhQoHbwPjwNQuXt8yoY85jbnsiUmY5vfYZCEN8
 +hnE7LIHLaMkRvVorqenuDw2/ML2jJEOqW09U0/GX53RkU9Z+QkT8TqbqYchFBqSnCsMS8
 +Xebo2FpBcZzyCIP1huJp/Erz/oUGxXtIXU7flkoAzE+wHIwGdjPlDIp3NpY6VqwSOeoXR
 nPA/PtgLDy8/Ubuds3TC2vyucBudOQiKoJwHupI3ECIUsXkTdHkwhi1jInsfKPx+W+Tv+e
 Pe7VqGGOlSHEWrxidmZTbMzvNeIuZk1hzWpa1ndh+5ktGpVTAopxPbm3QEfleSIjDIz1cQ
 ZxtvXNG+CzjXLTTPfhO7RhP15TM8LfkH57MPLp0+gyFcBB4DwuYKmYDonfOPFVwNTd8gv1
 sL4RgWv64/4j/aOGZhMRAsGBHU/VpIZzFSAe37IFYrj/+wYLhGCo6JRIxjl6oASPSGMoBf
 mHKxVsbUMmPnl3Ns/ReCs/wnyEvoejkgWKh6h0Vl/1CBpt8eJBW+a16jqtT6zKTOtKzH/e
 wi+SGA0Dfv4y1om9lJnsj5My5QJzoHj0+YLuQ8ohFiokBvRlQU6bFZ89dR6UBA8W8HJMlo
 inoDVIipu+2X1BaAV4t2U1o9FOrWU7XpwCXTnneK/Zix9tc6yiVYtSgfqsaFJGCt2N+eeM
 b47pIOwNaqCdlIzGMqd5bTD/Cl3x1BZOGg==

Add pmtu_ipv4_mp_asym_exceptions: the topology of pmtu_ipv4_mp_exceptions
with an MTU of 1400 behind one router, and 1350 on the link to the other
router with 1300 behind it. Pick a flow through each router, a source
address as the IPv4 multipath hash covers addresses only by default, and
check that a Fragmentation Needed from the first router is cached on its
path only, as the second one can't carry 1400, then that a flow through
the second router lowers the PMTU of both paths.

Without the preceding patch the test fails with both legacy nexthops and
nexthop objects.

Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 tools/testing/selftests/net/pmtu.sh | 74 ++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu.sh
index c7cd271714ef..a5d602a453c9 100755
--- a/tools/testing/selftests/net/pmtu.sh
+++ b/tools/testing/selftests/net/pmtu.sh
@@ -203,6 +203,13 @@
 #	on host A and B on lo reachable via both routers. Host A and B
 #	addresses have multipath routes to each other, b_r1 mtu = 1500.
 #	Check that PMTU exceptions are created for both paths.
+#
+# - pmtu_ipv4_mp_asym_exceptions
+#	Same topology as pmtu_ipv4_mp_exceptions, with b_r1 mtu = 1400,
+#	a_r2 mtu = 1350 and b_r2 mtu = 1300. Pick a flow through each router
+#	and check that a Fragmentation Needed from R1 creates a PMTU
+#	exception on the path via R1 only, as the path via R2 can't carry
+#	1400, then that a flow through R2 lowers the PMTU of both paths
 
 source lib.sh
 
@@ -272,7 +279,8 @@ tests="
 	list_flush_ipv6_exception	ipv6: list and flush cached exceptions	1
 	pmtu_ipv4_route_change		ipv4: PMTU exception w/route replace	1
 	pmtu_ipv6_route_change		ipv6: PMTU exception w/route replace	1
-	pmtu_ipv4_mp_exceptions		ipv4: PMTU multipath nh exceptions	1"
+	pmtu_ipv4_mp_exceptions		ipv4: PMTU multipath nh exceptions	1
+	pmtu_ipv4_mp_asym_exceptions	ipv4: PMTU multipath exceptions, asym MTU	1"
 
 # Addressing and routing for tests with routers: four network segments, with
 # index SEGMENT between 1 and 4, a common prefix (PREFIX4 or PREFIX6) and an
@@ -350,6 +358,7 @@ tunnel6_b_addr="fd00:2::b"
 tunnel6_mask="64"
 
 host4_a_addr="192.168.99.99"
+host4_a_net="192.168.97"
 host4_b_addr="192.168.88.88"
 
 dummy6_0_prefix="fc00:1000::"
@@ -2407,6 +2416,69 @@ test_pmtu_ipv4_mp_exceptions() {
 	check_pmtu_value "1500" "${pmtu_a_R2}" "exceeding MTU (veth_A-R2)" || return 1
 }
 
+# Pick a source address out of ${host4_a_net} for a flow from host A to
+# ${1} through ${2}: the IPv4 multipath hash covers addresses only by
+# default
+mp_flow_via() {
+	dst="${1}"
+	oif="${2}"
+
+	for i in $(seq 1 32); do
+		flow="${host4_a_net}.${i}"
+		${ns_a} ip route get ${dst} from ${flow} |
+			grep -q " dev ${oif} " && echo "${flow}" && return
+	done
+
+	return 1
+}
+
+test_pmtu_ipv4_mp_asym_exceptions() {
+	setup namespaces routing multipath || return $ksft_skip
+
+	trace "${ns_a}"  veth_A-R1    "${ns_r1}" veth_R1-A \
+	      "${ns_r1}" veth_R1-B    "${ns_b}"  veth_B-R1 \
+	      "${ns_a}"  veth_A-R2    "${ns_r2}" veth_R2-A \
+	      "${ns_r2}" veth_R2-B    "${ns_b}"  veth_B-R2
+
+	# Source addresses for mp_flow_via(), with routes back to them
+	run_cmd ${ns_a} ip route add local ${host4_a_net}.0/24 dev lo
+	run_cmd ${ns_r1} ip route add ${host4_a_net}.0/24 via ${prefix4}.${a_r1}.1
+	run_cmd ${ns_r2} ip route add ${host4_a_net}.0/24 via ${prefix4}.${a_r2}.1
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
+	flow_r1="$(mp_flow_via ${host4_b_addr} veth_A-R1)" || {
+		err "  no flow through veth_A-R1 found"; return 1; }
+	flow_r2="$(mp_flow_via ${host4_b_addr} veth_A-R2)" || {
+		err "  no flow through veth_A-R2 found"; return 1; }
+
+	# A Fragmentation Needed from R1 is cached on the path via R1, not on
+	# the path via R2, whose link can't carry 1400
+	run_cmd ${ns_a} ping -I ${flow_r1} -q -M want -i 0.1 -c 1 -s 1800 "${host4_b_addr}"
+
+	pmtu_a_R1="$(route_get_dst_pmtu_from_exception "${ns_a}" "${host4_b_addr}" oif veth_A-R1)"
+	pmtu_a_R2="$(route_get_dst_pmtu_from_exception "${ns_a}" "${host4_b_addr}" oif veth_A-R2)"
+	check_pmtu_value "1400" "${pmtu_a_R1}" "exceeding MTU via R1 (veth_A-R1)" || return 1
+	check_pmtu_value "" "${pmtu_a_R2}" "exceeding MTU via R1 (veth_A-R2)" || return 1
+
+	# The lower MTU behind R2 lowers the PMTU of both paths
+	run_cmd ${ns_a} ping -I ${flow_r2} -q -M want -i 0.1 -c 1 -s 1280 "${host4_b_addr}"
+
+	pmtu_a_R1="$(route_get_dst_pmtu_from_exception "${ns_a}" "${host4_b_addr}" oif veth_A-R1)"
+	pmtu_a_R2="$(route_get_dst_pmtu_from_exception "${ns_a}" "${host4_b_addr}" oif veth_A-R2)"
+	check_pmtu_value "1300" "${pmtu_a_R1}" "exceeding MTU via R2 (veth_A-R1)" || return 1
+	check_pmtu_value "1300" "${pmtu_a_R2}" "exceeding MTU via R2 (veth_A-R2)" || return 1
+}
+
 usage() {
 	echo
 	echo "$0 [OPTIONS] [TEST]..."
-- 
2.56.0

