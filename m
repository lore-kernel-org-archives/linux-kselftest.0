Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096591;
	b=WEYY+jnFSV3egNcsp6dDhFSXOeGZfaJNL5WMxf+Tkli6PN4zZeBXvQZKg4uVgxrlG+vn
	 1EsnOpGtaHQlMp5ebPyH/o6RqifL88P8nT8IoRS1/EVWY80gLxaB2z1jHWJRtnI9vFHSV
	 en7Gk3QHdvZvgHjIbXZv70orIlpxm46t6a42hLqIjxMlXtns5gifEE9gdLDzyELjaxf3P
	 TMd6yizWIWgC92m7p3vWst6hOE3m7MsezmopOIc99Wwt7pLltQgkXlCebBDfbY0lfh3Ht
	 PpO7gscWsdnqmqAy46CU8ElZTfLeZuUnNSq8klUFLqOnULenmUbwZO+2lP0w5jEtd1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096591;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=eHsaY2eNR06+wzZlglWBPuU0lbZICJPVeeLWMLfgFG8=;
	b=G/Zc9pOezzjgGQ1CnZ1Mwr94keA2xYMj8cZhkMBCFX7Xl3GaTV629EpdH3FXHndxqg/D
	 1CuUznr+I5ep895cJQzhI6VWPDWmktFPX2yNPGVYELMD0747B+dr3+uBwdBLwY5+hJizp
	 n2BHKw9tuMuPl2VNHzPDPlidmvaqmaDPWZtLt0LsTz5Jpu+fA0dYDwi7zW6dBKoAo2boj
	 tJZpeOLBF7RzcMTPtjsiM3pppBUwgzsz4vFSnjPa7ryUAwHshei+3gm5ZBu/ylFsWngnB
	 ofD2yzp+WViSYgAogmx3M2NBP22UWYJqre5IjNn7iEaFSisMTpPh0wISu39FSR1MECw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i1cjlE54;
	arc=none smtp.remote-ip=95.215.58.158
Received: from mta1.migadu.com (out-158.mta1.migadu.com [95.215.58.158])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825DB606A32F
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 825DB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i1cjlE54
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gMlYp2e5CiDshsDPntL7s2lX8v5NumaGRh4FagDshpM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795096588; v=1; x=1795701388;
 b=i1cjlE54+vyq/AWMcQa2sDCjUCQCe4XqsXWpwj68ZeBxUMOUsrYBOsqLMaBIaRRdj0g7hlX3
 N5w3KfzKb8l3svleBMVv5RiRptxqq2K7kUnmGCHisX/lrhQv0DCqDxoO1ApFo8irHJ5ttoPhvCW
 V4lsEISlduLjrRDaCePRL8Bk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id eef130882743d3fc;
	Thu, 19 Nov 2026 13:56:28 +0000
X-Mizu-Trace-ID: eef130882743d3fc
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 19 Nov 2026 21:55:21 +0800
Subject: [PATCH net-next v4 5/5] selftests: seg6: add PSP flavor testing
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
Message-Id: <20261119-srv6_flavors_endx-v4-5-284cdb484eee@kylinos.cn>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
In-Reply-To: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
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
rt-4 towards rt-2, 2>h towards the host).

Teach the policy helpers about <nodeid:op:act> elements:
  - __get_srv6_node/adjacent_id return the node and adjacent id
  - __get_srv6_rtcfg_act() extracts the action
  - __get_srv6_act_cfg() derives the End.X next hop
  - __get_func() picks the correct function
  - build_csid()/get_rt_sid() encode the adjacency into the C-SIDs
    (e.g. fcbb:0:34a9:: is End.X on rt-3 towards rt-4).

Reuse the existing psp and next-csid,psp helpers, and add a new
consumed-SRH test that inserts the extra SRH on the ingress router,
since the End.X policy forces the next hop.

Extend test_kernel_supp_or_ksft_skip() to check kernel support for
End.X psp, iproute2 already supports the PSP flavor with End.X.

Add the packet path to each test section so the route taken by the
traffic is clear.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 354 +++++++++++++++++----
 1 file changed, 298 insertions(+), 56 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 9d6b7de648da..d7fdc4e19da9 100755
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
@@ -127,7 +127,11 @@
 #   Local SID table for SRv6 router rt-x
 #   +---------------------------------------------------------------------+
 #   |fcff:x::e is associated with the SRv6 End behavior                   |
+#   |fcff:x::y00a is associated with the SRv6 End.X behavior, with        |
+#   |   adjacency to rt-y, towards the host the 0 stays.                  |
 #   |fcff:x::ef1 is associated with the SRv6 End behavior with PSP flavor |
+#   |fcff:x::yaf1 is associated with the SRv6 End.X behavior with PSP     |
+#   |   flavor, with adjacency to rt-y, towards the host the 0 stays.     |
 #   |fcbb:0:xpyy::/48 is associated with the SRv6 behavior and flavors    |
 #   |   given by the Function yy, and with parameter p of the behavior    |
 #   +---------------------------------------------------------------------+
@@ -153,10 +157,14 @@
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
@@ -184,6 +192,7 @@
 # handled by rt-1 which applies the following SRv6 Policy:
 #
 #   i.a) IPv6 traffic, SID List=fcff:3::e,fcff:4::ef1,fcff:2::ef1,cafe::2
+#        Path: hs-1 -> rt-1 -> rt-3 -> rt-4 -> rt-2 -> hs-2
 #
 # Router rt-1 is configured to enforce the Policy (i.a) through the SRv6
 # H.Insert behavior which pushes the SRH after the existing IPv6 header. This
@@ -216,6 +225,7 @@
 # applies the following SRv6 Policy:
 #
 #   i.b) IPv6 traffic, SID List=fcff:1::ef1,cafe::1
+#        Path: hs-2 -> rt-2 -> rt-1 -> hs-1
 #
 # Router rt-2 is configured to enforce the Policy (i.b) through the SRv6
 # H.Insert behavior which pushes the SRH after the existing IPv6 header. This
@@ -241,7 +251,9 @@
 # cafe::1:e9 (i.d):
 #
 #   i.c) IPv6 traffic, SID List=fcbb:0:30e9::,fcbb:0:40e9:20e9::,cafe::2:e9
+#        Path: hs-1 -> rt-1 -> rt-3 -> rt-4 -> rt-2 -> hs-2
 #   i.d) IPv6 traffic, SID List=fcbb:0:40e9:30e9:10e9::,cafe::1:e9
+#        Path: hs-2 -> rt-2 -> rt-4 -> rt-3 -> rt-1 -> hs-1
 #
 # In the Policy (i.c), rt-3 receives a zero Argument with SL=2 and applies the
 # "standard" End processing. rt-4 receives a non-zero Argument with SL=1: it
@@ -298,15 +310,20 @@
 #    instead of the Policy's SRH:
 #      IPv6 DA=cafe::2 | extra SRH, SL=0 | Payload
 #
+#    Path: hs-1 -> rt-1 -> rt-3 -> rt-4 [ -> rt-3 ] -> rt-2 -> hs-2
+#
 # The extra SRH reaches hs-2, which skips it as its SL is 0. The other
 # Policies work in the same way:
 #
 #   (i.b) hs-2 -> hs-1: on the packets with DA=fcff:1::ef1, rt-2 inserts the
 #         extra SRH with SID List=fcff:3::e,fcff:1::ef1, and rt-3 consumes it.
+#         Path: hs-2 -> rt-2 [ -> rt-3 ] -> rt-1 -> hs-1
 #   (i.c) hs-1 -> hs-2: on the packets with DA=fcbb:0:20e9::, rt-4 inserts the
 #         extra SRH with SID List=fcff:3::e,fcbb:0:20e9::, and rt-3 consumes it.
+#         Path: hs-1 -> rt-1 -> rt-3 -> rt-4 [ -> rt-3 ] -> rt-2 -> hs-2
 #   (i.d) hs-2 -> hs-1: on the packets with DA=fcbb:0:10e9::, rt-3 inserts the
 #         extra SRH with SID List=fcff:4::e,fcbb:0:10e9::, and rt-4 consumes it.
+#         Path: hs-2 -> rt-2 -> rt-4 -> rt-3 [ -> rt-4 ] -> rt-1 -> hs-1
 #
 # The Policy (i.b) has no router between rt-2 and rt-1. For this reason, rt-2
 # applies the Policy, inserts the extra SRH and sends the packet to rt-3:
@@ -324,7 +341,24 @@
 # fcff:2::ef1 for the Policy (i.a)).
 # These tests need ip6tables with the srh match, and they are skipped without
 # it.
-
+#
+# The End.X policy has forced next hop, so we insert the extra SRH on the
+# ingress router instead. e.g
+#
+#   (i.a) hs-1 -> hs-2: on the packets with DA=fcff:3::400a, rt-1 inserts the
+#         extra SRH with SID List=fcff:4::e,fcff:3::400a, and rt-4 consumes it.
+#         Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2
+#   (i.b) hs-2 -> hs-1: on the packets with DA=fcff:1::0af1, rt-2 inserts the
+#         extra SRH with SID List=fcff:3::e,fcff:1::0af1, and rt-3 consumes it.
+#         Path: hs-2 -> rt-2 [ -> rt-3 ] -> rt-1 -> hs-1
+#   (i.c) hs-1 -> hs-2: on the packets with DA=fcbb:0:34a9::, rt-1 inserts the
+#         extra SRH with SID List=fcff:4::e,fcbb:0:34a9::, and rt-4 consumes it.
+#         Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2
+#   (i.d) hs-2 -> hs-1: on the packets with DA=fcbb:0:43a9:31a9:10a9::, rt-2
+#         inserts the extra SRH with SID List=fcff:3::e,fcbb:0:43a9:31a9:10a9::,
+#         and rt-3 consumes it.
+#         Path: hs-2 -> rt-2 [ -> rt-3 ] -> rt-4 -> rt-3 -> rt-1 -> hs-1
+#
 # shellcheck source=lib.sh
 source lib.sh
 
@@ -335,16 +369,17 @@ readonly LOCALSID_TABLE_ID=90
 readonly IPv6_RT_NETWORK=fcf0:0
 readonly IPv6_HS_NETWORK=cafe
 readonly IPv6_TESTS_ADDR=2001:db8::1
+readonly IPv6_TESTS_NH6=2001:db8::2
 readonly LOCATOR_SERVICE=fcff
 readonly END_FUNC=000e
 readonly END_PSP_FUNC=0ef1
 readonly END_CSID_PSP_FUNC=e9
+readonly ENDX_FUNC=00a
+readonly ENDX_PSP_FUNC=af1
+readonly ENDX_CSID_PSP_FUNC=a9
 
 readonly LCBLOCK_ADDR=fcbb:0
 readonly LCBLOCK_BLEN=32
-# do not add ':' as separator. The Locator-Node is followed by the parameter
-# of the behavior, 0 for End.
-readonly LCNODE_FMT="%x0"
 readonly LCNODE_BLEN=4
 readonly LCNODEFUNC_BLEN=16
 
@@ -535,10 +570,12 @@ get_network_prefix()
 	echo "${IPv6_RT_NETWORK}:${p}:${q}"
 }
 
-# Given the description of a router <id:op> as an input, the function returns
-# the <id> token which represents the ID of the router.
-# i.e. input: "12:psp"
-#      output: "12"
+# Given the description of a router <id:op:act> as an input, the function
+# returns its <id> field with the <op> and <act> fields dropped.
+# i.e. input: "12:psp", output: "12"
+#      input: "1,2:psp", output: "1,2"
+#      input: "1>2:psp", output: "1>2"
+#      input: "1>2,2>3:psp:End.", output: "1>2,2>3"
 __get_srv6_rtcfg_id()
 {
 	local element="$1"
@@ -546,6 +583,32 @@ __get_srv6_rtcfg_id()
 	echo "${element}" | cut -d':' -f1
 }
 
+# Given the description of a router as an input, the function returns its
+# id with the ">" and the adjacent route id dropped.
+# i.e. input: "1", output: "1"
+#      input: "1>2", output: "1"
+__get_srv6_node_id()
+{
+	local element="$1"
+
+	echo "${element}" | cut -d'>' -f1
+}
+
+# Given the description of a router as an input, the function returns its
+# adjacent route id, or 0 if a host adjacent.
+# i.e. input: "1", output: ""
+#      input: "1>2", output: "2"
+#      input: "1>h", output: "0"
+__get_srv6_adjacent_id()
+{
+	local adjacent="${1#*>}"
+
+	[[ "${adjacent}" == "${1}" ]] && return
+	[[ "${adjacent}" == "h" ]] && adjacent=0
+
+	echo "${adjacent}"
+}
+
 # Given the description of a router <id:op> as an input, the function returns
 # the <op> token which represents the operation (e.g. End behavior with or
 # without flavors) configured for the node.
@@ -563,20 +626,83 @@ __get_srv6_rtcfg_op()
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
+# Given the encapsulation action, current route and next hop as input, the
+# function will return the action specific configuration.
+# i.e. input: "End.X 2 0", output: "End.X nh6 cafe::2"
+#      input: "End.X 4 2", output: "End.X nh6 fcf0:0:2:4::2"
+__get_srv6_act_cfg()
+{
+	local act="$1"
+	local rt="$2"
+	local neigh="$3"
+	local net_prefix
+	local nh
+
+	case "${act}" in
+	"End")
+		echo "End" ;;
+	"End.X")
+		if [ "${neigh}" == "0" ]; then
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
+__get_func()
+{
+	local act_opt="$1"
+
+	case "${act_opt}" in
+	"End noflv")
+		echo "${END_FUNC}" ;;
+	"End psp")
+		echo "${END_PSP_FUNC}" ;;
+	"End next-csid,psp")
+		echo "${END_CSID_PSP_FUNC}" ;;
+	"End.X noflv")
+		echo "${ENDX_FUNC}" ;;
+	"End.X psp")
+		echo "${ENDX_PSP_FUNC}" ;;
+	"End.X next-csid,psp")
+		echo "${ENDX_CSID_PSP_FUNC}" ;;
+	esac
+}
+
 # Return the C-SID of a router: the Locator-Node (4 bits), i.e. the ID of the
-# router, followed by the parameter of the behavior (4 bits, 0) and the
-# Function (8 bits).
+# router, followed by the parameter of the behavior (the adjacent router for
+# End.X, and 0 for End and towards the host, 4 bits) and the Function (8 bits).
 # args:
-#  $1 - router
+#  $1 - router with or without adjacent router (e.g. "4", "4>2")
 #  $2 - Function (e.g. "e9")
-# e.g. input: "4" "e9"
-#      output: "40e9"
+# e.g. input: "4" "e9", output: "40e9"
+#      input: "4>2" "a9", output: "42a9"
 build_csid()
 {
 	local nodeid="$1"
 	local func="$2"
+	local node
+	local adj
 
-	printf "${LCNODE_FMT}%s" "${nodeid}" "${func}"
+	node="$(__get_srv6_node_id "${nodeid}")"
+	adj="$(__get_srv6_adjacent_id "${nodeid}")"
+	adj=${adj:-0}
+	printf "%s%s%s" "${node}" "${adj}" "${func}"
 }
 
 # Return the C-SID container with the C-SIDs of the routers listed in a
@@ -584,8 +710,8 @@ build_csid()
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
@@ -717,24 +843,31 @@ op_has_next_csid()
 #  $1 - router
 #  $2 - operation <op> of the element (e.g. "next-csid,psp")
 #  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
-# e.g. input: "4" "psp" "0ef1"
-#      output: "fcff:4::0ef1"
-#      input: "4" "next-csid,psp" "e9"
-#      output: "fcbb:0:40e9::/48"
+# e.g. input: "4" "noflv" "e", output: "fcff:4::e"
+#      input: "4>2" "noflv" "a", output: "fcff:4::2a"
+#      input: "4" "psp" "0ef1", output: "fcff:4::0ef1"
+#      input: "4>2" "psp" "af1", output: "fcff:4::2af1"
+#      input: "4" "next-csid,psp" "e9", output: "fcbb:0:40e9::/48"
+#      input: "4>2" "next-csid,psp" "a9", output: "fcbb:0:42a9::/48"
 get_rt_sid()
 {
 	local rt="$1"
 	local op_type="$2"
 	local func="$3"
 	local csid
+	local node
+	local adj
 
 	if op_has_next_csid "${op_type}"; then
 		csid="$(build_csid "${rt}" "${func}")"
 		echo "${LCBLOCK_ADDR}:${csid}::/${LCBLOCK_NODEFUNC_BLEN}"
-		return
+	elif echo "${rt}" | grep -q ">"; then
+		node="$(__get_srv6_node_id "${rt}")"
+		adj="$(__get_srv6_adjacent_id "${rt}")"
+		echo "${LOCATOR_SERVICE}:${node}::${adj}${func}"
+	else
+		echo "${LOCATOR_SERVICE}:${rt}::${func}"
 	fi
-
-	echo "${LOCATOR_SERVICE}:${rt}::${func}"
 }
 
 # Add an SRv6 Endpoint behavior to a router, bound to a SID. Nothing is added
@@ -771,24 +904,33 @@ setup_rt_endpoint()
 # args:
 #  $1 - <nodeid> of the element: one router, or a comma-separated list
 #  $2 - operation <op> of the element (e.g. "next-csid,psp")
-#  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
-#  $4 - SRv6 Endpoint behavior and flavors (e.g. "End flavors psp")
-# e.g. input: "4,2" "next-csid,psp" "e9"
-#             "End flavors next-csid,psp lblen 32 nflen 16"
+#  $3 - <act> of the element (e.g. "End" or "End.X")
+#  $4 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
+#  $5 - flavor configuration of the behavior, without the action
+#       (e.g. "flavors psp")
+# e.g. input: "4,2" "next-csid,psp" "End" "e9"
+#             "flavors next-csid,psp lblen 32 nflen 16"
 #      result: the behavior is added on rt-4, bound to fcbb:0:40e9::/48, and
 #              on rt-2, bound to fcbb:0:20e9::/48
 setup_rt_endpoints()
 {
 	local node="$1"
 	local op_type="$2"
-	local func="$3"
-	local behavior_cfg="$4"
+	local act="$3"
+	local func="$4"
+	local behavior_cfg="$5"
+	local act_cfg
 	local sid
+	local adj
 	local rt
+	local n
 
 	for rt in $(echo "${node}" | sed 's/,/ /g'); do
+		n="$(__get_srv6_node_id "${rt}")"
+		adj="$(__get_srv6_adjacent_id "${rt}")"
 		sid="$(get_rt_sid "${rt}" "${op_type}" "${func}")"
-		setup_rt_endpoint "${rt}" "${sid}" "${behavior_cfg}"
+		act_cfg="$(__get_srv6_act_cfg "${act}" "${n}" "${adj}")"
+		setup_rt_endpoint "${n}" "${sid}" "${act_cfg} ${behavior_cfg}"
 	done
 }
 
@@ -801,12 +943,15 @@ setup_rt_endpoints()
 #       cafe::x:yy on the loopback of the host (e.g. 2:e9)
 #  $2 - SRv6 router configured for enforcing the SRv6 Policy
 #  $3 - compact way to represent a list of SRv6 routers with their operations
-#       (i.e. behaviors) that each of them needs to perform. Every <nodeid:op>
+#       (i.e. behaviors) that each of them needs to perform. Every
+#       <nodeid:op:act>
 #       element constructs a SID that is associated with the behavior <op> on
 #       the <nodeid> node. The list of such elements forms an SRv6 Policy.
 #       For "next-csid,psp", <nodeid> is a comma-separated list of node IDs.
 #       The element constructs a C-SID container with the C-SIDs of these
 #       nodes, e.g. "4,2:next-csid,psp" gives fcbb:0:40e9:20e9::.
+#       For End.X action, the <nodeid> has ">" with the adjacency, "h" for
+#       the host, and the <act> with "End.X" field.
 __setup_rt_policy()
 {
 	local dst="$1"
@@ -819,33 +964,44 @@ __setup_rt_policy()
 	local function
 	local op_type
 	local node
+	local act
+	local sid
 	local n
 
 	in_nsname="$(get_rtname "${encap_rt}")"
 
 	for n in ${policy_rts}; do
+		# Abort if policy format is incorrect:
+		# 1. "1>h:psp" that has ">" but not "End.X"
+		# 2. "1:psp:End.X" that has "End.X" but no ">"
+		if [[ "${n}" == *">"* && "${n}" != *"End.X"* ]] || \
+			[[ "${n}" != *">"* && "${n}" == *"End.X"* ]]; then
+			echo "Incorrect operation format: ${n}" && false
+		fi
+
 		node="$(__get_srv6_rtcfg_id "${n}")"
 		op_type="$(__get_srv6_rtcfg_op "${n}")"
+		act="$(__get_srv6_rtcfg_act "${n}")"
+		function="$(__get_func "${act} ${op_type}")"
 
 		case "${op_type}" in
 		"noflv")
-			policy="${policy}${LOCATOR_SERVICE}:${node}::${END_FUNC},"
-			function="${END_FUNC}"
-			behavior_cfg="End"
+			sid="$(get_rt_sid "${node}" "${op_type}" "${function}")"
+			policy="${policy}${sid},"
+			behavior_cfg=""
 			;;
 
 		"psp")
-			policy="${policy}${LOCATOR_SERVICE}:${node}::${END_PSP_FUNC},"
-			function="${END_PSP_FUNC}"
-			behavior_cfg="End flavors psp"
+			sid="$(get_rt_sid "${node}" "${op_type}" "${function}")"
+			policy="${policy}${sid},"
+			behavior_cfg="flavors psp"
 			;;
 
 		"next-csid,psp")
 			container="$(build_csid_container "${node}" \
-				"${END_CSID_PSP_FUNC}")"
+				"${function}")"
 			policy="${policy}${container},"
-			function="${END_CSID_PSP_FUNC}"
-			behavior_cfg="End flavors next-csid,psp ${CSID_CFG}"
+			behavior_cfg="flavors next-csid,psp ${CSID_CFG}"
 			;;
 
 		*)
@@ -854,8 +1010,8 @@ __setup_rt_policy()
 		esac
 
 		# add SRv6 Endpoint behavior to the selected routers
-		setup_rt_endpoints "${node}" \
-			"${op_type}" "${function}" "${behavior_cfg}"
+		setup_rt_endpoints "${node}" "${op_type}" "${act}" \
+			"${function}" "${behavior_cfg}"
 	done
 
 	# we need to remove the trailing comma to avoid inserting an empty
@@ -1031,6 +1187,25 @@ setup_end_flv_psp()
 	SETUP_ERR=0
 }
 
+setup_endx_flv_psp()
+{
+	SETUP_ERR=1
+
+	setup_hs_lo_addr 1 1 "${ENDX_CSID_PSP_FUNC}"
+	setup_hs_lo_addr 2 2 "${ENDX_CSID_PSP_FUNC}"
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
@@ -1137,7 +1312,9 @@ host2gateway_tests()
 
 host_srv6_end_flv_psp_tests()
 {
-	log_section "SRv6 connectivity test hosts (h1 <-> h2, PSP flavor)"
+	local act=${1:-"End"}
+
+	log_section "SRv6 connectivity test hosts (h1 <-> h2, ${act} PSP flavor)"
 
 	check_and_log_hs_connectivity 1 2
 	check_and_log_hs_connectivity 2 1
@@ -1145,10 +1322,14 @@ host_srv6_end_flv_psp_tests()
 
 host_srv6_end_flv_next_csid_psp_tests()
 {
-	log_section "SRv6 connectivity test hosts (h1 <-> h2, NEXT-C-SID,PSP)"
+	local act=${1:-"End"}
+	local csid_psp_func
 
-	check_and_log_hs_lo_addr_connectivity 1 2 "${END_CSID_PSP_FUNC}"
-	check_and_log_hs_lo_addr_connectivity 2 1 "${END_CSID_PSP_FUNC}"
+	log_section "SRv6 connectivity test hosts (h1 <-> h2, ${act} NEXT-C-SID,PSP)"
+
+	csid_psp_func="$(__get_func "${act} next-csid,psp")"
+	check_and_log_hs_lo_addr_connectivity 1 2 "${csid_psp_func}"
+	check_and_log_hs_lo_addr_connectivity 2 1 "${csid_psp_func}"
 }
 
 # On a router, add a route for a SID with seg6 encap in inline mode. The packets
@@ -1299,7 +1480,7 @@ host_srv6_end_flv_consumed_srh_tests()
 	local sid
 
 	log_section \
-		"SRv6 connectivity test hosts (h1 <-> h2, PSP with a consumed SRH)"
+		"SRv6 connectivity test hosts (h1 <-> h2, End PSP with a consumed SRH)"
 
 	if ! ${HAS_SRH_MATCH}; then
 		echo "SKIP: ip6tables srh match not available"
@@ -1326,6 +1507,38 @@ host_srv6_end_flv_consumed_srh_tests()
 	set_hs_seg6_enabled 0
 }
 
+host_srv6_endx_flv_consumed_srh_tests()
+{
+	local sid
+
+	log_section \
+		"SRv6 connectivity test hosts (h1 <-> h2, End.X PSP with a consumed SRH)"
+
+	if ! ${HAS_SRH_MATCH}; then
+		echo "SKIP: ip6tables srh match not available"
+	fi
+
+	set_hs_seg6_enabled 1
+
+	# Policy (i.a): rt-1 inserts the extra SRH consumed by rt-4
+	sid="${LOCATOR_SERVICE}:3::4${ENDX_FUNC}"
+	check_and_log_consumed_srh 1 "${sid}" 4 1 2
+
+	# Policy (i.b): rt-2 inserts the extra SRH consumed by rt-3
+	sid="${LOCATOR_SERVICE}:1::0${ENDX_PSP_FUNC}"
+	check_and_log_consumed_srh 2 "${sid}" 3 2 1
+
+	# Policy (i.c): rt-1 inserts the extra SRH consumed by rt-4
+	sid="$(build_csid_container "3>4" "${ENDX_CSID_PSP_FUNC}")"
+	check_and_log_consumed_srh 1 "${sid}" 4 1 2 "${ENDX_CSID_PSP_FUNC}"
+
+	# Policy (i.d): rt-2 inserts the extra SRH consumed by rt-3
+	sid="$(build_csid_container "4>3,3>1,1>h" "${ENDX_CSID_PSP_FUNC}")"
+	check_and_log_consumed_srh 2 "${sid}" 3 2 1 "${ENDX_CSID_PSP_FUNC}"
+
+	set_hs_seg6_enabled 0
+}
+
 test_iproute2_supp_or_ksft_skip()
 {
 	local flavor="$1"
@@ -1336,12 +1549,19 @@ test_iproute2_supp_or_ksft_skip()
 	fi
 }
 
+# exit directly if End action not supported, otherwise return 1
 test_kernel_supp_or_ksft_skip()
 {
-	local flavor="$1"
+	local action="$1"
+	local flavor="$2"
 	local test_netns
+	local policy=()
 
 	test_netns="kflv-$(mktemp -u XXXXXXXX)"
+	policy=(action "${action}" flavors "${flavor}")
+	if [ "$action" == "End.X" ]; then
+		policy+=(nh6 "${IPv6_TESTS_NH6}")
+	fi
 
 	if ! ip netns add "${test_netns}"; then
 		echo "SKIP: Cannot set up netns to test kernel support for flavors"
@@ -1366,10 +1586,15 @@ test_kernel_supp_or_ksft_skip()
 
 	if ! ip -netns "${test_netns}" -6 route \
 		add "${IPv6_TESTS_ADDR}" encap seg6local \
-		action End flavors "${flavor}" dev "${DUMMY_DEVNAME}"; then
-		echo "SKIP: ${flavor} flavor not supported in kernel"
+		"${policy[@]}" dev "${DUMMY_DEVNAME}"; then
+		echo "SKIP: ${action} flavor ${flavor} not supported in kernel"
 
 		ip netns del "${test_netns}"
+
+		if [ "$action" != "End" ]; then
+			return 1
+		fi
+
 		exit "${ksft_skip}"
 	fi
 
@@ -1433,6 +1658,18 @@ test_end_flv()
 	defer_scope_pop
 }
 
+test_endx_flv()
+{
+	defer_scope_push
+	set -e
+	setup_endx_flv_psp
+	set +e
+	host_srv6_end_flv_psp_tests "End.X"
+	host_srv6_end_flv_next_csid_psp_tests "End.X"
+	host_srv6_endx_flv_consumed_srh_tests
+	defer_scope_pop
+}
+
 if [ "$(id -u)" -ne 0 ]; then
 	echo "SKIP: Need root privileges"
 	exit "${ksft_skip}"
@@ -1452,7 +1689,7 @@ test_dummy_dev_or_ksft_skip
 # NEXT-C-SID is not checked: every kernel and iproute2 version that
 # supports PSP also supports NEXT-C-SID.
 test_iproute2_supp_or_ksft_skip psp
-test_kernel_supp_or_ksft_skip psp
+test_kernel_supp_or_ksft_skip End psp
 check_srh_match_support
 
 set -e
@@ -1465,4 +1702,9 @@ router_tests
 host2gateway_tests
 
 test_end_flv
+
+if test_kernel_supp_or_ksft_skip End.X psp; then
+	test_endx_flv
+fi
+
 print_log_test_results

-- 
2.56.0

