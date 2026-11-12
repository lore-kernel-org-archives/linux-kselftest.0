Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475775;
	b=tpYZg4S7hCyVgR04p2SYGQHtNat/E9xzSpTiYuokf+9wQimoxDzYKNVTWZEI5Q3NXuvv
	 oBZzpv7JNNzB7LGOVaqGjQlSLO+kMyvPEONaUT0iCNbpfrJ4X/4lIOMAIH4y+Ul6HlbmD
	 T7E9grR5iP31Wp3j/QDqbbVkaxAw6NuXFcfjahyI96Q38pTUQy0UXG1CBefOVcEoTBTk0
	 PojP2D55RaDUY721P9S7YHBfMH+IwJOOP7gsD0B+p9RLHuqPLftXHY6KFH7ukaMAh8/sN
	 UZU6NLgX8lAt0+jVPUILy1nK/bZoz5ra57odMzOTpn91iOyfwhDbslh3l+RDVyKfpxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475775;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=lZEPpRigEsECphAD+ph6tUiiDbCdsnvX3CVokYbFeE0=;
	b=WFOK3byLHCKV5BCS9JsT15iyblnkOIq3V+i9yFy3ewTxlan7iPbnC4skH82ylDYqNbhU
	 5Aox6CVrMfxuB3fChd1RHJBbRnue4qNhCAw1DfRFZsC+hd02MaCnLKNndrGA0w6NffM4N
	 sdMNZYPfgqhgZvhksgUdWt1AU52VUh20Esl/fj3br3+PPXleuYvQVu1TfeRQwX8T+0Ppq
	 DFWZb7fmxkw2z6bzf23hFo4Z4FeUzskvEMRS9jfxd6s51aiMI85eIysEkHgGpVqAvt5EN
	 q5qPakVVOojD2FpgDCICUkivJPukdA1s3scOBVSnJ/zLTWvkLJH/zpl+6fOz6gOltig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YSzWV+ny;
	arc=none smtp.remote-ip=91.218.175.223
Received: from mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20935606A32E
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 09:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20935606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YSzWV+ny
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BjA3n/sOgSIOyN/7seRAxSwbfgEA28VZeR5jo1CKPqY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794475772; v=1; x=1795080572;
 b=YSzWV+nyi/WuIJBuppxtFhRibcI94F+Spoa3rCrtDDMLrbOrk0C0fnwxfynwwSX4FWE8JUtP
 mVRRppRJcbCoevjJQURPTg9q8xzaM17jdoF2/FhVDvKa6Qznqwy8JnQFOAtLDDP+pK0PRY3uq7X
 K2qzhwBQNOacN78IpBpOptzc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 08258022e496e0c7;
	Thu, 12 Nov 2026 09:29:32 +0000
X-Mizu-Trace-ID: 08258022e496e0c7
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 12 Nov 2026 17:28:00 +0800
Subject: [PATCH net-next v3 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
In-Reply-To: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

Add an End.X flavor scenario to srv6_end_flavors_test.sh that applies
the same PSP policies as the End scenario, alone and combined with
NEXT-C-SID, with every node bound through its adjacency (e.g. 4>2 for
rt-4 towards rt-2, 2>h towards the host), and exercise it with the
existing host connectivity tests.

Teach the policy and endpoint helpers about <nodeid:op:act> elements:
__get_srv6_rtcfg_act() extracts the action, the __get_*_func()
helpers pick the Function for the action, __get_act_cfg() derives the
End.X next hop, and build_csid()/get_rt_sid() keep the adjacency so
it is encoded into the C-SIDs (e.g. fcbb:0:34a9:: is End.X on rt-3
towards rt-4).

There is no need to re-check the ip command capability as it already
supports setting PSP flavor with End.X.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
I didn't add `host_srv6_end_flv_consumed_srh_tests()` for End.X because
the extra policy insertion does not work with the End.X policy. The packet
resolves the destination via the next hop directly, rather than doing a
re-lookup in table 90.
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 254 ++++++++++++++++-----
 1 file changed, 203 insertions(+), 51 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 374b43661c28..5b1b13586df0 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -5,7 +5,7 @@
 # author: Paolo Lungaroni <paolo.lungaroni@uniroma2.it>
 #
 # This script is designed to test the support for "flavors" in the SRv6 End
-# behavior.
+# and End.X behaviors.
 #
 # Flavors defined in RFC8986 [1] represent additional operations that can modify
 # or extend the existing SRv6 End, End.X and End.T behaviors. For the sake of
@@ -16,10 +16,10 @@
 #
 # The End, End.X, and End.T behaviors can support these flavors either
 # individually or in combinations.
-# Currently in this selftest we consider the PSP flavor for the SRv6 End
-# behavior, both alone and combined with the NEXT-C-SID flavor defined in
-# RFC9800 [2]. However, it is possible to extend the script as soon as other
-# flavors will be supported in the kernel.
+# Currently in this selftest we consider the PSP flavor for the SRv6 End and
+# End.X behaviors, both alone and combined with the NEXT-C-SID flavor defined
+# in RFC9800 [2]. However, it is possible to extend the script as soon as
+# other flavors will be supported in the kernel.
 #
 # The purpose of the PSP flavor consists in instructing the penultimate node
 # listed in the SRv6 policy to remove (i.e. pop) the SRH from the IPv6 header.
@@ -125,12 +125,14 @@
 # configured in the Local SID table:
 #
 #   Local SID table for SRv6 router rt-x
-#   +---------------------------------------------------------------------+
-#   |fcff:x::e is associated with the SRv6 End behavior                   |
-#   |fcff:x::ef1 is associated with the SRv6 End behavior with PSP flavor |
-#   |fcbb:0:xpyy::/48 is associated with the SRv6 behavior and flavors    |
-#   |   given by the Function yy, and with parameter p of the behavior    |
-#   +---------------------------------------------------------------------+
+#   +-----------------------------------------------------------------------+
+#   |fcff:x::e is associated with the SRv6 End behavior                     |
+#   |fcff:x::a is associated with the SRv6 End.X behavior                   |
+#   |fcff:x::ef1 is associated with the SRv6 End behavior with PSP flavor   |
+#   |fcff:x::af1 is associated with the SRv6 End.X behavior with PSP flavor |
+#   |fcbb:0:xpyy::/48 is associated with the SRv6 behavior and flavors      |
+#   |   given by the Function yy, and with parameter p of the behavior      |
+#   +-----------------------------------------------------------------------+
 #
 # The fcff::/16 prefix is reserved by the operator for the SIDs. Reachability of
 # SIDs is ensured by proper configuration of the IPv6 operator's network and
@@ -153,10 +155,14 @@
 #   +----------+----------+--------------------+
 #   | e9       | End      | NEXT-C-SID and PSP |
 #   +----------+----------+--------------------+
+#   | a9       | End.X    | NEXT-C-SID and PSP |
+#   +----------+----------+--------------------+
 #
 # For example, fcbb:0:40e9:20e9:: is a C-SID container carrying the C-SID of
 # rt-4 followed by the C-SID of rt-2, both with the NEXT-C-SID and PSP flavors.
 #
+# fcbb:0:34a9:: is End.X on rt-3, adjacency to rt-4, with NEXT-C-SID and PSP
+# flavors.
 #
 # SRv6 Policies
 # =============
@@ -339,12 +345,12 @@ readonly LOCATOR_SERVICE=fcff
 readonly END_FUNC=000e
 readonly END_PSP_FUNC=0ef1
 readonly END_CSID_PSP_FUNC=e9
+readonly ENDX_FUNC=000a
+readonly ENDX_PSP_FUNC=0af1
+readonly ENDX_CSID_PSP_FUNC=a9
 
 readonly LCBLOCK_ADDR=fcbb:0
 readonly LCBLOCK_BLEN=32
-# do not add ':' as separator. The Locator-Node is followed by the parameter
-# of the behavior, 0 for End.
-readonly LCNODE_FMT="%x0"
 readonly LCNODE_BLEN=4
 readonly LCNODEFUNC_BLEN=16
 
@@ -531,14 +537,34 @@ get_network_prefix()
 	echo "${IPv6_RT_NETWORK}:${p}:${q}"
 }
 
-# Given the description of a router <id:op> as an input, the function returns
-# the <id> token which represents the ID of the router.
-# i.e. input: "12:psp"
-#      output: "12"
+# Given the description of a router <id:op:act> as an input, the function
+# returns its <id> field with the <op> and <act> fields dropped. From each
+# element of the list, the ">" together with the following router ID or
+# "h" (the adjacency) is dropped as well.
+# i.e. input: "12:psp", output: "12"
+#      input: "1,2:psp", output: "1,2"
+#      input: "1>2:psp", output: "1"
+#      input: "1>2,2>3:psp", output: "1,2"
+#      input: "2>h:psp:End.X", output: "2"
 __get_srv6_rtcfg_id()
 {
 	local element="$1"
 
+	echo "${element}" | sed 's/:.*//; s/>[1234h]//g'
+}
+
+# Given the description of a router <id:op:act> as an input, the function
+# returns its <id> field with the <op> and <act> fields dropped. Unlike
+# __get_srv6_rtcfg_id(), the ">" and the following router ID or "h" are
+# kept in each element. The callers that need the adjacency use this variant,
+# e.g. to encode it into a C-SID or to derive the End.X next hop.
+# i.e. input: "1,2:psp", output: "1,2"
+#      input: "1>2,2>3:psp", output: "1>2,2>3"
+#      input: "4>2,2>h:psp:End.X", output: "4>2,2>h"
+__get_srv6_rtcfg_all_id()
+{
+	local element="$1"
+
 	echo "${element}" | cut -d':' -f1
 }
 
@@ -559,20 +585,95 @@ __get_srv6_rtcfg_op()
 		xargs | sed 's/ /,/g'
 }
 
+# Given the description of a router <id:op:act> as an input, the function
+# returns the <act> token which represents the action(e.g. Action End or
+# End.X) configured for the node. Return End by default if not supplied.
+# i.e. input: "3>4:noflv:End.X", output: "End.X"
+__get_srv6_rtcfg_act()
+{
+	local element="$1"
+
+	echo "${element}" | cut -d':' -f3 | sed -e 's/^$/End/'
+}
+
+__get_noflv_func()
+{
+	local act="$1"
+
+	case "${act}" in
+	"End")
+		echo "${END_FUNC}" ;;
+	"End.X")
+		echo "${ENDX_FUNC}" ;;
+	esac
+}
+
+__get_psp_func()
+{
+	local act="$1"
+
+	case "${act}" in
+	"End")
+		echo "${END_PSP_FUNC}" ;;
+	"End.X")
+		echo "${ENDX_PSP_FUNC}" ;;
+	esac
+}
+
+__get_csid_psp_func()
+{
+	local act="$1"
+
+	case "${act}" in
+	"End")
+		echo "${END_CSID_PSP_FUNC}" ;;
+	"End.X")
+		echo "${ENDX_CSID_PSP_FUNC}" ;;
+	esac
+}
+
+# Given the encapsulation action, current route and next hop as input, the
+# function will return the action specific configuration.
+# i.e. input: "End.X 2 h", output: "End.X nh6 cafe::2"
+#      input: "End.X 4 2", output: "End.X nh6 fcf0:0:2:4::2"
+__get_act_cfg()
+{
+	local act="$1"
+	local rt="$2"
+	local neigh="$3"
+	local net_prefix nh
+
+	case "${act}" in
+	"End")
+		echo "End" ;;
+	"End.X")
+		if [ "${neigh}" == "h" ]; then
+			net_prefix="${IPv6_HS_NETWORK}"
+			nh="${rt}"
+		else
+			net_prefix="$(get_network_prefix "${rt}" "${neigh}")"
+			nh="${neigh}"
+		fi
+		echo "End.X nh6 ${net_prefix}::${nh}" ;;
+	esac
+}
+
 # Return the C-SID of a router: the Locator-Node (4 bits), i.e. the ID of the
 # router, followed by the parameter of the behavior (4 bits, 0) and the
 # Function (8 bits).
 # args:
 #  $1 - router
 #  $2 - Function (e.g. "e9")
-# e.g. input: "4" "e9"
-#      output: "40e9"
+# e.g. input: "4" "e9", output: "40e9"
+#      input: "4>2" "a9", output: "42a9"
 build_csid()
 {
 	local nodeid="$1"
 	local func="$2"
 
-	printf "${LCNODE_FMT}%s" "${nodeid}" "${func}"
+	nodeid=$(echo "${nodeid}" | sed 's/>//; s/h/0/')
+	[[ ${#nodeid} -eq 1 ]] && mid=0 || mid=""
+	printf "%s%s%s" "${nodeid}" "$mid" "${func}"
 }
 
 # Return the C-SID container with the C-SIDs of the routers listed in a
@@ -580,8 +681,8 @@ build_csid()
 # args:
 #  $1 - <nodeid> of the element: a comma-separated list of routers
 #  $2 - Function (e.g. "e9")
-# e.g. input: "4,2" "e9"
-#      output: "fcbb:0:40e9:20e9::"
+# e.g. input: "4,2" "e9", output: "fcbb:0:40e9:20e9::"
+#      input: "4>2,2>1" "e9", output: "fcbb:0:42e9:21e9::"
 build_csid_container()
 {
 	local nodeids="$1"
@@ -713,10 +814,10 @@ op_has_next_csid()
 #  $1 - router
 #  $2 - operation <op> of the element (e.g. "next-csid,psp")
 #  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
-# e.g. input: "4" "psp" "0ef1"
-#      output: "fcff:4::0ef1"
-#      input: "4" "next-csid,psp" "e9"
-#      output: "fcbb:0:40e9::/48"
+# e.g. input: "4" "psp" "0ef1", output: "fcff:4::0ef1"
+#      input: "4>2" "psp" "0af1", output: "fcff:4::0af1"
+#      input: "4" "next-csid,psp" "e9", output: "fcbb:0:40e9::/48"
+#      input: "4>2" "next-csid,psp" "a9", output: "fcbb:0:42a9::/48"
 get_rt_sid()
 {
 	local rt="$1"
@@ -730,6 +831,7 @@ get_rt_sid()
 		return
 	fi
 
+	rt=$(echo "${rt}" | sed 's/>.*//')
 	echo "${LOCATOR_SERVICE}:${rt}::${func}"
 }
 
@@ -765,26 +867,34 @@ setup_rt_endpoint()
 
 # Add an SRv6 Endpoint behavior to each router of a Policy element <nodeid:op>.
 # args:
-#  $1 - <nodeid> of the element: one router, or a comma-separated list
+#  $1 - <nodeid:op:act> element
 #  $2 - operation <op> of the element (e.g. "next-csid,psp")
 #  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
-#  $4 - SRv6 Endpoint behavior and flavors (e.g. "End flavors psp")
-# e.g. input: "4,2" "next-csid,psp" "e9"
-#             "End flavors next-csid,psp lblen 32 nflen 16"
+#  $4 - flavor configuration of the behavior, without the action
+#       (e.g. "flavors psp")
+# e.g. input: "4,2:next-csid,psp" "next-csid,psp" "e9"
+#             "flavors next-csid,psp lblen 32 nflen 16"
 #      result: the behavior is added on rt-4, bound to fcbb:0:40e9::/48, and
 #              on rt-2, bound to fcbb:0:20e9::/48
 setup_rt_endpoints()
 {
-	local node="$1"
+	local nodeid="$1"
 	local op_type="$2"
 	local func="$3"
 	local behavior_cfg="$4"
+	local nodes node next_node
+	local act act_cfg
 	local sid
 	local rt
 
-	for rt in $(echo "${node}" | sed 's/,/ /g'); do
-		sid="$(get_rt_sid "${rt}" "${op_type}" "${func}")"
-		setup_rt_endpoint "${rt}" "${sid}" "${behavior_cfg}"
+	nodes="$(__get_srv6_rtcfg_all_id "${nodeid}")"
+	act="$(__get_srv6_rtcfg_act "${nodeid}")"
+	for node in $(echo "${nodes}" | sed 's/,/ /g'); do
+		rt=$(echo "${node}" | cut -d'>' -f1)
+		next_node=$(echo "${node}" | cut -d'>' -f2)
+		act_cfg="$(__get_act_cfg "${act}" "${rt}" "${next_node}")"
+		sid="$(get_rt_sid "${node}" "${op_type}" "${func}")"
+		setup_rt_endpoint "${rt}" "${sid}" "${act_cfg} ${behavior_cfg}"
 	done
 }
 
@@ -824,7 +934,8 @@ setup_rt_host_proxy()
 #       cafe::x:yy on the loopback of the host (e.g. 2:e9)
 #  $2 - SRv6 router configured for enforcing the SRv6 Policy
 #  $3 - compact way to represent a list of SRv6 routers with their operations
-#       (i.e. behaviors) that each of them needs to perform. Every <nodeid:op>
+#       (i.e. behaviors) that each of them needs to perform. Every
+#       <nodeid:op:act>
 #       element constructs a SID that is associated with the behavior <op> on
 #       the <nodeid> node. The list of such elements forms an SRv6 Policy.
 #       For "next-csid,psp", <nodeid> is a comma-separated list of node IDs.
@@ -841,34 +952,38 @@ __setup_rt_policy()
 	local container
 	local function
 	local op_type
+	local nodes
 	local node
+	local act
 	local n
 
 	in_nsname="$(get_rtname "${encap_rt}")"
 
 	for n in ${policy_rts}; do
 		node="$(__get_srv6_rtcfg_id "${n}")"
+		nodes="$(__get_srv6_rtcfg_all_id "${n}")"
 		op_type="$(__get_srv6_rtcfg_op "${n}")"
+		act="$(__get_srv6_rtcfg_act "${n}")"
 
 		case "${op_type}" in
 		"noflv")
-			policy="${policy}${LOCATOR_SERVICE}:${node}::${END_FUNC},"
-			function="${END_FUNC}"
-			behavior_cfg="End"
+			function="$(__get_noflv_func "${act}")"
+			policy="${policy}${LOCATOR_SERVICE}:${node}::${function},"
+			behavior_cfg=""
 			;;
 
 		"psp")
-			policy="${policy}${LOCATOR_SERVICE}:${node}::${END_PSP_FUNC},"
-			function="${END_PSP_FUNC}"
-			behavior_cfg="End flavors psp"
+			function="$(__get_psp_func "${act}")"
+			policy="${policy}${LOCATOR_SERVICE}:${node}::${function},"
+			behavior_cfg="flavors psp"
 			;;
 
 		"next-csid,psp")
-			container="$(build_csid_container "${node}" \
-				"${END_CSID_PSP_FUNC}")"
+			function="$(__get_csid_psp_func "${act}")"
+			container="$(build_csid_container "${nodes}" \
+				"${function}")"
 			policy="${policy}${container},"
-			function="${END_CSID_PSP_FUNC}"
-			behavior_cfg="End flavors next-csid,psp ${CSID_CFG}"
+			behavior_cfg="flavors next-csid,psp ${CSID_CFG}"
 			;;
 
 		*)
@@ -877,7 +992,7 @@ __setup_rt_policy()
 		esac
 
 		# add SRv6 Endpoint behavior to the selected routers
-		setup_rt_endpoints "${node}" \
+		setup_rt_endpoints "${n}" \
 			"${op_type}" "${function}" "${behavior_cfg}"
 	done
 
@@ -1049,6 +1164,29 @@ setup_end_flv_psp()
 	SETUP_ERR=0
 }
 
+setup_endx_flv_psp()
+{
+	SETUP_ERR=1
+
+	setup_hs_lo_addr 1 1 "${ENDX_CSID_PSP_FUNC}"
+	setup_hs_lo_addr 2 2 "${ENDX_CSID_PSP_FUNC}"
+
+	setup_rt_host_proxy 1 2 "${ENDX_CSID_PSP_FUNC}"
+	setup_rt_host_proxy 2 1 "${ENDX_CSID_PSP_FUNC}"
+
+
+	# The same SRv6 policies with setup_end_flv_psp except using End.X
+	setup_rt_policy_ipv6 2 1 "3>4:noflv:End.X 4>2:psp:End.X 2>h:psp:End.X"
+	setup_rt_policy_ipv6 1 2 "1>h:psp:End.X"
+
+	setup_rt_policy_ipv6 "2:${ENDX_CSID_PSP_FUNC}" 1 \
+		"3>4:next-csid,psp:End.X 4>2,2>h:next-csid,psp:End.X"
+	setup_rt_policy_ipv6 "1:${ENDX_CSID_PSP_FUNC}" 2 \
+		"4>3,3>1,1>h:next-csid,psp:End.X"
+
+	SETUP_ERR=0
+}
+
 check_rt_connectivity()
 {
 	local rtsrc="$1"
@@ -1155,7 +1293,9 @@ host2gateway_tests()
 
 host_srv6_end_flv_psp_tests()
 {
-	log_section "SRv6 connectivity test hosts (h1 <-> h2, PSP flavor)"
+	local act=${1:-"End"}
+
+	log_section "SRv6 connectivity test hosts (h1 <-> h2, ${act} PSP flavor)"
 
 	check_and_log_hs_connectivity 1 2
 	check_and_log_hs_connectivity 2 1
@@ -1163,10 +1303,14 @@ host_srv6_end_flv_psp_tests()
 
 host_srv6_end_flv_next_csid_psp_tests()
 {
-	log_section "SRv6 connectivity test hosts (h1 <-> h2, NEXT-C-SID,PSP)"
+	local act=${1:-"End"}
+	local csid_psp_func
 
-	check_and_log_hs_lo_addr_connectivity 1 2 "${END_CSID_PSP_FUNC}"
-	check_and_log_hs_lo_addr_connectivity 2 1 "${END_CSID_PSP_FUNC}"
+	log_section "SRv6 connectivity test hosts (h1 <-> h2, ${act} NEXT-C-SID,PSP)"
+
+	csid_psp_func="$(__get_csid_psp_func "${act}")"
+	check_and_log_hs_lo_addr_connectivity 1 2 "${csid_psp_func}"
+	check_and_log_hs_lo_addr_connectivity 2 1 "${csid_psp_func}"
 }
 
 # On a router, add a route for a SID with seg6 encap in inline mode. The packets
@@ -1479,4 +1623,12 @@ host_srv6_end_flv_next_csid_psp_tests
 host_srv6_end_flv_consumed_srh_tests
 defer_scope_pop
 
+defer_scope_push
+set -e
+setup_endx_flv_psp
+set +e
+host_srv6_end_flv_psp_tests "End.X"
+host_srv6_end_flv_next_csid_psp_tests "End.X"
+defer_scope_pop
+
 print_log_test_results

-- 
2.56.0

