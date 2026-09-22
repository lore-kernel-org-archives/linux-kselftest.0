Received: from mta1.migadu.com (out-132.mta1.migadu.com [95.215.58.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89903528447
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067345; cv=none; b=lBcuQMCWL+7yR0sNN3ghUHMx2DX5x4Ss7EKrPGGcKn/Ey4tQHeCEuRAVVXQikZ505SHMR8fBLXSzhvOqjRHLiq/RLHUtxSbS9eiXl9+kG/ziZdV5moW6+uoTZG9A9znEmixqsitgEec0ReNVplV3W1Prod4FHnYQLy9fCzc1Wds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067345; c=relaxed/simple;
	bh=9S/WJv5Rt2cdity4AXgyXkjGtrAC7glb1fuugeDEndY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNpKAK6l8OJVkm89WxcE+/89fOEUAUqt1AByIAVZQppX0UUULfC9QQxdwiV3lA5ULHNJppslivGLUvHRujontj8dRB55ZsBW44BJOkyX7kp1hiV0Dg+tFm/A4PwjgVa7orCmyaxqFxNgqj/SjHmJu5upxuUAhIRV8cg1z/5aBK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O3Tow/d1; arc=none smtp.client-ip=95.215.58.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O3Tow/d1"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9S/WJv5Rt2cdity4AXgyXkjGtrAC7glb1fuugeDEndY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790067341; v=1; x=1790672141;
 b=O3Tow/d1XCGCBR2TdjQ/H58iqMxdOun/VDcu/C2TdZOha/udM8n7sYKGKczJv1E6FWGuuSTw
 Tnu6N8oaBNrWp5+CkS1OnF42E+o00rS1Lm/3i7E/HUs7HLehfwBXPNnYVKk/uJuIKPUy71LTAN/
 yQ1fKP2Oq59AH5Vd7mDTtuEY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ef8445d551e51785;
	Tue, 22 Sep 2026 08:55:41 +0000
X-Mizu-Trace-ID: ef8445d551e51785
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 22 Sep 2026 16:54:47 +0800
Subject: [PATCH net-next 5/5] selftests: seg6: add End.X PSP selftest
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-srv6_flavors_endx-v1-5-4d01c05c47b7@kylinos.cn>
References: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
In-Reply-To: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

The current selftest only exercises End with PSP. Add a new test that
uses End.X on the PSP path so the kernel's End.X flavor handling is
validated end to end.

Extend __setup_rt_policy() to parse End.X action field from the
router description, allowing entries like:
  4:psp:End.X,4,2
  3:psp:End.X,3,1

Since SETUP_ERR is not set in one setup function, and the middle test may
set ret to 1, we also need to check ret before setting the result as SKIP.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 83 ++++++++++++++++++++--
 1 file changed, 78 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 52731983b4cc..e130d0d71b3d 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -194,8 +194,8 @@
 # after the IPv6 header. At this point, the packet with IPv6 DA=cafe::1 is sent
 # to the destination, i.e. hs-1.
 
-# Kselftest framework requirement - SKIP code is 4.
-readonly ksft_skip=4
+# shellcheck source=lib.sh
+source lib.sh
 
 readonly RDMSUFF="$(mktemp -u XXXXXXXX)"
 readonly DUMMY_DEVNAME="dum0"
@@ -345,7 +345,7 @@ cleanup()
 	# check whether the setup phase was completed successfully or not. In
 	# case of an error during the setup phase of the testing environment,
 	# the selftest is considered as "skipped".
-	if [ "${SETUP_ERR}" -ne 0 ]; then
+	if [ "${SETUP_ERR}" -ne 0 ] && [ "$ret" -ne "$ksft_fail" ]; then
 		echo "SKIP: Setting up the testing environment failed"
 		exit "${ksft_skip}"
 	fi
@@ -414,6 +414,36 @@ __get_srv6_rtcfg_op()
 		xargs | sed 's/ /,/g'
 }
 
+# Given the description of a router <id:op:act> as an input, the function
+# returns the <act> token which represents the action (e.g. End, End.X,
+# End.T behavior with or without route table, out interface) configured
+# for the node.
+#
+# Support End, End.X at present. When omit, return default End behavior.
+# i.e. input: "1:psp:End.X,1,3"
+#      output: "End.X nh6 fcf0:0:1:3::3 oif veth-rt-1-3"
+__get_srv6_rtcfg_act()
+{
+	local element="$1"
+	local net_prefix
+	local acts
+	local out
+
+	acts="$(echo "${element}" | cut -d':' -f3)"
+	act="$(echo "${acts}" | cut -d',' -f1)"
+	act="${act:-"End"}"
+
+	rt="$(echo "${acts}" | cut -d',' -f2)"
+	neigh="$(echo "${acts}" | cut -d',' -f3)"
+
+	if [ "$act" == "End" ]; then
+		echo "End"
+	elif [ "$act" == "End.X" ]; then
+		net_prefix="$(get_network_prefix "${rt}" "${neigh}")"
+		echo "End.X nh6 ${net_prefix}::${neigh} oif veth-rt-${rt}-${neigh}"
+	fi
+}
+
 # Setup the basic networking for the routers
 setup_rt_networking()
 {
@@ -514,6 +544,7 @@ __setup_rt_policy()
 	local function
 	local fullsid
 	local op_type
+	local action
 	local node
 	local n
 
@@ -522,19 +553,20 @@ __setup_rt_policy()
 	for n in ${policy_rts}; do
 		node="$(__get_srv6_rtcfg_id "${n}")"
 		op_type="$(__get_srv6_rtcfg_op "${n}")"
+		action="$(__get_srv6_rtcfg_act "${n}")"
 		rt_nsname="$(get_rtname "${node}")"
 
 		case "${op_type}" in
 		"noflv")
 			policy="${policy}${LOCATOR_SERVICE}:${node}::${END_FUNC},"
 			function="${END_FUNC}"
-			behavior_cfg="End"
+			behavior_cfg="${action}"
 			;;
 
 		"psp")
 			policy="${policy}${LOCATOR_SERVICE}:${node}::${END_PSP_FUNC},"
 			function="${END_PSP_FUNC}"
-			behavior_cfg="End flavors psp"
+			behavior_cfg="${action} flavors psp"
 			;;
 
 		*)
@@ -729,6 +761,30 @@ cleanup_end_flv_psp()
 	cleanup_rt_policy_ipv6 1 2 "1:psp"
 }
 
+setup_endx_flv_psp()
+{
+	# Direction hs-1 -> hs-2 (End.X PSP flavor)
+	# SID List=fcff:3::e,fcff:4::ef1,cafe::2
+	#  - rt-1 (SRv6 H.Insert policy)
+	#  - rt-3 (SRv6 End behavior)
+	#  - rt-4 (SRv6 End.X flavor PSP with SL=1)
+	#  - rt-2 (Route to hs-2 via nh and oif)
+	#
+	# Direction hs-2 -> hs-1 (End.X PSP flavor)
+	# SID List=fcff:3::ef1,cafe::1
+	#  - rt-2 (SRv6 H.Insert policy)
+	#  - rt-3 (SRv6 End.X flavor PSP with SL=1)
+	#  - rt-1 (Route to hs-1 via nh and oif)
+	setup_rt_policy_ipv6 2 1 "3:noflv:End 4:psp:End.X,4,2"
+	setup_rt_policy_ipv6 1 2 "3:psp:End.X,3,1"
+}
+
+cleanup_endx_flv_psp()
+{
+	cleanup_rt_policy_ipv6 2 1 "3:noflv 4:psp"
+	cleanup_rt_policy_ipv6 1 2 "3:psp"
+}
+
 check_rt_connectivity()
 {
 	local rtsrc="$1"
@@ -835,6 +891,22 @@ host_srv6_end_flv_psp_tests()
 	cleanup_end_flv_psp
 }
 
+host_srv6_endx_flv_psp_tests()
+{
+	set -e
+	SETUP_ERR=1
+	setup_endx_flv_psp
+	SETUP_ERR=0
+	set +e
+
+	log_section "SRv6 connectivity test hosts (h1 <-> h2, End.X flavor PSP)"
+
+	check_and_log_hs_connectivity 1 2
+	check_and_log_hs_connectivity 2 1
+
+	cleanup_endx_flv_psp
+}
+
 test_iproute2_supp_or_ksft_skip()
 {
 	local flavor="$1"
@@ -936,5 +1008,6 @@ set +e
 router_tests
 host2gateway_tests
 host_srv6_end_flv_psp_tests
+host_srv6_endx_flv_psp_tests
 
 print_log_test_results

-- 
2.55.0

