Received: from mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5AF49B5C3
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539974; cv=none; b=g6SuO4p4TyoUzMUKZrgVKUtTYHqQKPL/j8+ImFpGpEi6i/icbDvYztwzFsPk7DU317VGv/9QxQMgChDkU3HCYuUMdiWEGRawzJYOnla3IhfgmIKJJBc9SM12Rm2tXvCY6AWIXRNU1wtYGimmwp1KpLUVrr3VUAOcD7HYkDAW0cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539974; c=relaxed/simple;
	bh=W4YQdGnf2k0cUQ/QdfHuq4iLGQ0/RL+GbH8R3ThCLsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3V7Ub6EvQbdpswQo6lpexlCaAgbzSGGH0R0JBYrWN6A8rIZKNIK6B3gyzdOzZbH42tJF776o8TGV8OgUhTbYLmz4lFH5TmX6+tptA7rU0wB2t9T5wc290+AFcp2QdllGG4w+qiZQSQIQ7jPIoRrHjee8lpNxyXLao9Av2qsP7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lfqt6a1n; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lfqt6a1n"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W4YQdGnf2k0cUQ/QdfHuq4iLGQ0/RL+GbH8R3ThCLsw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791539970; v=1; x=1792144770;
 b=lfqt6a1nqDO9qVUpDqhdy0vV0vFelsKE943jI6mjcRGXDVDgY6L9X2PNu+xRTDGW1tKw7L8O
 bklb7hA5fblhcfflZSrFRiQSCtUMvT0qeibVK1zdzljOekycl9hyFquIKzjuGjAWzJYurpheKuY
 Sdi5M3fWH9TQCkDdgIvorkl8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id d21b8d44aaaeb638;
	Fri, 09 Oct 2026 09:59:30 +0000
X-Mizu-Trace-ID: d21b8d44aaaeb638
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Fri, 09 Oct 2026 17:58:41 +0800
Subject: [PATCH net-next v2 5/5] selftests: seg6: add End.X PSP selftest
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-srv6_flavors_endx-v2-5-56ac7f838f41@kylinos.cn>
References: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
In-Reply-To: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
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

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 77 +++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index a57e92541a04..4ba93ace8656 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -397,6 +397,36 @@ __get_srv6_rtcfg_op()
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
@@ -497,6 +527,7 @@ __setup_rt_policy()
 	local function
 	local fullsid
 	local op_type
+	local action
 	local node
 	local n
 
@@ -505,19 +536,20 @@ __setup_rt_policy()
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
@@ -713,6 +745,30 @@ cleanup_end_flv_psp()
 	cleanup_rt_policy_ipv6 1 2 "1:psp"
 }
 
+setup_endx_flv_psp()
+{
+	# Direction hs-1 -> hs-2 (End.X PSP flavor)
+	# SID List=fcff:3::e,fcff:4::ef1,cafe::2
+	#  - rt-1 (SRv6 H.Insert policy)
+	#  - rt-3 (SRv6 End behavior)
+	#  - rt-4 (SRv6 End.X flavor PSP with SL=1, route to rt-2 via nh/oif)
+	#  - rt-2 (Route to hs-2 with same subnet)
+	#
+	# Direction hs-2 -> hs-1 (End.X PSP flavor)
+	# SID List=fcff:3::ef1,cafe::1
+	#  - rt-2 (SRv6 H.Insert policy)
+	#  - rt-3 (SRv6 End.X flavor PSP with SL=1, route to rt-1 via nh/oif)
+	#  - rt-1 (Route to hs-1 with same subnet)
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
@@ -819,6 +875,22 @@ host_srv6_end_flv_psp_tests()
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
@@ -920,5 +992,6 @@ set +e
 router_tests
 host2gateway_tests
 host_srv6_end_flv_psp_tests
+host_srv6_endx_flv_psp_tests
 
 print_log_test_results

-- 
2.55.0

