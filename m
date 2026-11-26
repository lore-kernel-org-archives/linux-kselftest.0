Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674494;
	b=WYsi4pzAI66qCDUao3CwVu7bYfJ21KaUgrs3zd0dEOhgjBTSSnooTr1ahp3a0ET2rYV5
	 EgrAFkRC+UeIdflK2xexpvo27ZsWxYSB0ML+AQ4uokUbCzlYOKCnKkiNxQCoJQLKyOre7
	 T16jU06qYHRaUzeVFNASKBByllJPm+NOtzBrEjOFNMwS2550zty4TMpDgCPgS8LsOF1En
	 a94nFXnkwelQymgEiC2stKIeSjSZxIXte5BYpMa5rs8UQYqTytAFNYcEWWTqpxPSmwWaV
	 XS/Z0no6l+P9kWzMlB+Nw573c8FoHnAuuE68pC8Hyjncbcaxg5uwqxbrxk3VVCfyOKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674494;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=hz8od8OpBfNlDA/qE+jGxZT81udOAeg1SH8x/HkVXWo=;
	b=jrp8UsHJXcIryz4xG7o6Wz2KZqSyADdGUhOmzVi8GEbh7rGrg7jcP0qAiISL/75NTmhd
	 lF+WncC24eE6RnXb552MrFvrw8lG2xB2EfLrJdFJkDI61LWXa65JSjy8/b7iSG9Et0XpT
	 vDkX6ZV3m1MGQ446W70kalxxJfoqHQgaR7345piiuAlBBhJT1TdCymPlQI5AiP0jcuC79
	 TomIMT1cyq46CT0A7M0cSOtvRuMP2o2395TU6HxjUder+D6wxjOqj43lzm99CBGSjuByR
	 Q/kJRtKEIhgYGAmaJroxibkAixBXRZjoLwA5vLLq9RoEkruq4parMYf/ryFudlDwgWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZIYY3Gsq;
	arc=none smtp.remote-ip=95.215.58.233
Received: from mta1.migadu.com (out-233.mta1.migadu.com [95.215.58.233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17CC606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 06:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F17CC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZIYY3Gsq
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4Oj6/YoVja5PWNwBfFI1k3FkGd04IET0u9ABmsWgKGE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795674490; v=1; x=1796279290;
 b=ZIYY3Gsq9jI36N0oOKPkUYXsgJywzumpnUy1olk7BSftRkC3BnAKWawbrsZebz9CP+fAIvyT
 WmhRUWA8crxaTk9YnWTjOhu0y3L7xba8aBQBmq1hG3Y6yfABNh1LSEOh+I/I4v5+RkgPBSSL8+p
 l0lCNCySXmQ1lcjgJvFxbtkc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id c0659718d3a6734c;
	Thu, 26 Nov 2026 06:28:10 +0000
X-Mizu-Trace-ID: c0659718d3a6734c
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 26 Nov 2026 14:27:27 +0800
Subject: [PATCH net-next v5 5/5] selftests: seg6: add PSP flavor testing
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
Message-Id: <20261126-srv6_flavors_endx-v5-5-4d8232eec404@kylinos.cn>
References: <20261126-srv6_flavors_endx-v5-0-4d8232eec404@kylinos.cn>
In-Reply-To: <20261126-srv6_flavors_endx-v5-0-4d8232eec404@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

Add an End.X flavor scenario to srv6_end_flavors_test.sh that applies
the same PSP policies as the End scenario, alone and combined with
NEXT-C-SID, with every node bound through its adjacency (e.g. 4>2 for
rt-4 towards rt-2, 2>h towards the host).

Teach the policy helpers about <nodeid:op:act> elements:
  - __get_srv6_node_id() and __get_srv6_adjacent_id() return the node
    and adjacent id
  - __get_srv6_rtcfg_act() extracts the action
  - __get_srv6_act_cfg() derives the End.X next hop (nh6)
  - __get_srv6_param() takes the behavior parameter (adjacency for
    End.X, 0 for End)
  - __get_srv6_func() picks the Function for an <act> <op> pair
  - build_csid()/get_rt_sid() encode the parameter and adjacency into
    the SIDs (e.g. fcbb:0:34a9:: is End.X on rt-3 towards rt-4)
  - __check_srv6_rtcfg() validates each element node against the
    behavior with a per-act regular expression

Reuse the existing psp and next-csid,psp helpers for End.X, and add a
consumed-SRH test that inserts the extra SRH on the ingress router,
since the End.X policy forces the next hop.

Install unreachable routes in table 90 for the next SID of each End.X
hop under test, so that a broken End.X that falls back to End fails the
lookup while a working End.X still forwards via nh6.

Extend test_kernel_supp_or_ksft_skip() to probe End.X psp as well as
End psp. Failures after a successful probe no longer abort the run, and
when End.X psp is missing the scenario is skipped through
log_test_skipped() so it still appears in the summary. iproute2 already
supports the PSP flavor with End.X.

Add the packet path to each test section so the route taken by the
traffic is clear.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---

Hi Andrea, The changelog line is getting extremely long. Please let me
know if you'd like me to split this into smaller pieces. Thanks a lot
for your kind review.
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 560 +++++++++++++++++----
 1 file changed, 476 insertions(+), 84 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 9d6b7de648da..ab26233d9e2a 100755
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
+# other flavors are supported in the kernel.
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
@@ -140,11 +144,12 @@
 # containers and it is used as their Locator-Block.
 # A C-SID (16 bits) is written as xpyy, where:
 #  - x is the Locator-Node (4 bits), i.e. the ID of the router;
-#  - p is a parameter of the behavior (4 bits), 0 for End, which has none;
+#  - p is a parameter of the behavior (4 bits), 0 for End, the adjacent router
+#    for End.X (0 towards the host);
 #  - yy is the Function (8 bits). Its first digit selects the SRv6 behavior
-#    (e for End, as in fcff:x::e). Its second digit is the set of flavors, as
-#    a bit mask: 1 for PSP, 2 for USP, 4 for USD and 8 for NEXT-C-SID (as the
-#    f1 of fcff:x::ef1 for PSP).
+#    (e for End, as in fcff:x::e; a for End.X, as in fcff:x::y00a). Its second
+#    digit is the set of flavors, as a bit mask: 1 for PSP, 2 for USP, 4 for
+#    USD and 8 for NEXT-C-SID (as the f1 of fcff:x::ef1 for PSP).
 # In the terms of RFC9800 [2], p and yy together are the Function of the C-SID
 # (12 bits), and p is not part of the Argument:
 #
@@ -153,10 +158,14 @@
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
@@ -184,6 +193,7 @@
 # handled by rt-1 which applies the following SRv6 Policy:
 #
 #   i.a) IPv6 traffic, SID List=fcff:3::e,fcff:4::ef1,fcff:2::ef1,cafe::2
+#        Path: hs-1 -> rt-1 -> rt-3 -> rt-4 -> rt-2 -> hs-2
 #
 # Router rt-1 is configured to enforce the Policy (i.a) through the SRv6
 # H.Insert behavior which pushes the SRH after the existing IPv6 header. This
@@ -216,6 +226,7 @@
 # applies the following SRv6 Policy:
 #
 #   i.b) IPv6 traffic, SID List=fcff:1::ef1,cafe::1
+#        Path: hs-2 -> rt-2 -> rt-1 -> hs-1
 #
 # Router rt-2 is configured to enforce the Policy (i.b) through the SRv6
 # H.Insert behavior which pushes the SRH after the existing IPv6 header. This
@@ -241,7 +252,9 @@
 # cafe::1:e9 (i.d):
 #
 #   i.c) IPv6 traffic, SID List=fcbb:0:30e9::,fcbb:0:40e9:20e9::,cafe::2:e9
+#        Path: hs-1 -> rt-1 -> rt-3 -> rt-4 -> rt-2 -> hs-2
 #   i.d) IPv6 traffic, SID List=fcbb:0:40e9:30e9:10e9::,cafe::1:e9
+#        Path: hs-2 -> rt-2 -> rt-4 -> rt-3 -> rt-1 -> hs-1
 #
 # In the Policy (i.c), rt-3 receives a zero Argument with SL=2 and applies the
 # "standard" End processing. rt-4 receives a non-zero Argument with SL=1: it
@@ -258,6 +271,9 @@
 # are tested first. This way, each ping checks a single Policy with the
 # NEXT-C-SID flavor, and a failure points directly to that Policy.
 #
+# The End.X scenario reuses the same paths, with every node bound through its
+# adjacency and the Functions 00a, af1, and a9 in place of 000e, 0ef1, and e9.
+#
 # The hosts drop the packets that carry an SRH (seg6_enabled is set to 0 on
 # the hosts). The loopback address of a host is reached only through the
 # router connected to that host: the ping succeeds only if the SRH is removed
@@ -298,15 +314,20 @@
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
@@ -324,7 +345,24 @@
 # fcff:2::ef1 for the Policy (i.a)).
 # These tests need ip6tables with the srh match, and they are skipped without
 # it.
-
+#
+# The End.X policy has a forced next hop, so we insert the extra SRH on the
+# ingress router instead. For example:
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
 
@@ -335,16 +373,17 @@ readonly LOCALSID_TABLE_ID=90
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
 
@@ -365,6 +404,8 @@ SETUP_ERR=1
 
 # set by check_srh_match_support
 HAS_SRH_MATCH=false
+# set by the End.X kernel support probe
+HAS_ENDX_PSP=false
 
 ret=${ksft_skip}
 nsuccess=0
@@ -535,10 +576,12 @@ get_network_prefix()
 	echo "${IPv6_RT_NETWORK}:${p}:${q}"
 }
 
-# Given the description of a router <id:op> as an input, the function returns
-# the <id> token which represents the ID of the router.
-# i.e. input: "12:psp"
-#      output: "12"
+# Given the description of a router <id:op:act> as an input, the function
+# returns its <id> field with the <op> and <act> fields dropped.
+# i.e. input: "12:psp", output: "12"
+#      input: "1,2:next-csid,psp", output: "1,2"
+#      input: "1>2:psp:End.X", output: "1>2"
+#      input: "1>2,2>3:next-csid,psp:End.X", output: "1>2,2>3"
 __get_srv6_rtcfg_id()
 {
 	local element="$1"
@@ -546,10 +589,32 @@ __get_srv6_rtcfg_id()
 	echo "${element}" | cut -d':' -f1
 }
 
-# Given the description of a router <id:op> as an input, the function returns
-# the <op> token which represents the operation (e.g. End behavior with or
-# without flavors) configured for the node.
+# Given the description of a router as an input, the function returns its
+# id with the ">" and the adjacent router id dropped.
+# i.e. input: "1", output: "1"
+#      input: "1>2", output: "1"
+__get_srv6_node_id()
+{
+	local element="$1"
 
+	echo "${element}" | cut -d'>' -f1
+}
+
+# Given the description of a router as an input, the function returns its
+# adjacent router id, or 0 if the adjacency is a host.
+# i.e. input: "1", output: ""
+#      input: "1>2", output: "2"
+#      input: "1>h", output: "0"
+__get_srv6_adjacent_id()
+{
+	local element="$1"
+
+	echo "${element}" | cut -s -d'>' -f2 | sed 's/h/0/'
+}
+
+# Given the description of a router <id:op:act> as an input, the function
+# returns the <op> token which represents the operation (e.g. End behavior
+# with or without flavors) configured for the node.
 # Note that when the operation represents an End behavior with a list of
 # flavors, the output is the ordered version of that list.
 # i.e. input: "5:usp,psp,usd"
@@ -563,40 +628,128 @@ __get_srv6_rtcfg_op()
 		xargs | sed 's/ /,/g'
 }
 
+# Given the description of a router <id:op:act> as an input, the function
+# returns the <act> token which represents the action (e.g. End or End.X)
+# configured for the node. Returns End by default if not supplied.
+# i.e. input: "3>4:noflv:End.X", output: "End.X"
+__get_srv6_rtcfg_act()
+{
+	local element="$1"
+
+	echo "${element}" | cut -d':' -f3 | sed -e 's/^$/End/'
+}
+
+# Given the encapsulation action, current router and next hop as input, the
+# function will return the action-specific configuration.
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
+# Get the parameter from behavior.
+# End: 0, End.X: the adjacent router (0 for the host)
+# i.e. input: "End" "2", output: "0"
+#      input: "End.X" "4>2", output: "2"
+__get_srv6_param()
+{
+	local act="$1"
+	local node="$2"
+
+	case "${act}" in
+	"End.X")
+		__get_srv6_adjacent_id "${node}"
+		;;
+	*)
+		echo 0
+		;;
+	esac
+}
+
+# Return the Function for a given "<act> <op>" pair
+# (e.g. "End.X psp" -> af1).
+__get_srv6_func()
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
+# End.X, 0 for End and for End.X towards the host, 4 bits) and the Function
+# (8 bits).
 # args:
 #  $1 - router
-#  $2 - Function (e.g. "e9")
-# e.g. input: "4" "e9"
-#      output: "40e9"
+#  $2 - parameter of the behavior
+#  $3 - Function (e.g. "e9")
+# e.g. input: "4" "0" "e9", output: "40e9"
+#      input: "4" "2" "a9", output: "42a9"
 build_csid()
 {
-	local nodeid="$1"
-	local func="$2"
+	local rt="$1"
+	local param="$2"
+	local func="$3"
 
-	printf "${LCNODE_FMT}%s" "${nodeid}" "${func}"
+	printf "%s%s%s" "${rt}" "${param}" "${func}"
 }
 
 # Return the C-SID container with the C-SIDs of the routers listed in a
 # "next-csid,<flavors>" element, in the same order.
 # args:
 #  $1 - <nodeid> of the element: a comma-separated list of routers
-#  $2 - Function (e.g. "e9")
-# e.g. input: "4,2" "e9"
-#      output: "fcbb:0:40e9:20e9::"
+#  $2 - <act> of the element
+#  $3 - Function (e.g. "e9")
+# e.g. input: "4,2" "End" "e9", output: "fcbb:0:40e9:20e9::"
+#      input: "4>2,2>h" "End.X" "a9", output: "fcbb:0:42a9:20a9::"
 build_csid_container()
 {
 	local nodeids="$1"
-	local func="$2"
+	local act="$2"
+	local func="$3"
 	local csids=''
 	local nodes
+	local param
 	local node
+	local rt
 
 	nodes="$(echo "${nodeids}" | sed 's/,/ /g')"
 	for node in ${nodes}; do
-		csids="${csids}:$(build_csid "${node}" "${func}")"
+		rt="$(__get_srv6_node_id "${node}")"
+		param="$(__get_srv6_param "${act}" "${node}")"
+		csids="${csids}:$(build_csid "${rt}" "${param}" "${func}")"
 	done
 
 	echo "${LCBLOCK_ADDR}${csids}::"
@@ -662,7 +815,7 @@ setup_rt_local_sids()
 		# set underlay network routes to reach the C-SID containers
 		# that start with a C-SID of the neighbor, for any parameter and
 		# Function.
-		csid="$(build_csid "${neigh}" 00)"
+		csid="$(build_csid "${neigh}" 0 00)"
 		ip -netns "${nsname}" -6 route \
 			add "${LCBLOCK_ADDR}:${csid}::/${LCBLOCK_NODE_BLEN}" \
 			table "${LOCALSID_TABLE_ID}" \
@@ -714,27 +867,43 @@ op_has_next_csid()
 # With NEXT-C-SID, it is the C-SID of the router as a prefix: on rt-4,
 # fcbb:0:40e9::/48 also matches the DA fcbb:0:40e9:20e9::.
 # args:
-#  $1 - router
+#  $1 - router with or without adjacency router
 #  $2 - operation <op> of the element (e.g. "next-csid,psp")
-#  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
-# e.g. input: "4" "psp" "0ef1"
-#      output: "fcff:4::0ef1"
-#      input: "4" "next-csid,psp" "e9"
-#      output: "fcbb:0:40e9::/48"
+#  $3 - action <act> of the element (e.g. "End" or "End.X")
+#  $4 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
+# e.g. input: "4" "noflv" "End" "000e", output: "fcff:4::000e"
+#      input: "4>2" "noflv" "End.X" "00a", output: "fcff:4::200a"
+#      input: "4" "psp" "End" "0ef1", output: "fcff:4::0ef1"
+#      input: "4>2" "psp" "End.X" "af1", output: "fcff:4::2af1"
+#      input: "4" "next-csid,psp" "End" "e9", output: "fcbb:0:40e9::/48"
+#      input: "4>2" "next-csid,psp" "End.X" "a9", output: "fcbb:0:42a9::/48"
 get_rt_sid()
 {
-	local rt="$1"
+	local node="$1"
 	local op_type="$2"
-	local func="$3"
+	local act="$3"
+	local func="$4"
+	local param
 	local csid
 
 	if op_has_next_csid "${op_type}"; then
-		csid="$(build_csid "${rt}" "${func}")"
+		rt="$(__get_srv6_node_id "${node}")"
+		param="$(__get_srv6_param "${act}" "${node}")"
+		csid="$(build_csid "${rt}" "${param}" "${func}")"
 		echo "${LCBLOCK_ADDR}:${csid}::/${LCBLOCK_NODEFUNC_BLEN}"
 		return
 	fi
 
-	echo "${LOCATOR_SERVICE}:${rt}::${func}"
+	case "${act}" in
+	"End.X")
+		rt="$(__get_srv6_node_id "${node}")"
+		param="$(__get_srv6_param "${act}" "${node}")"
+		echo "${LOCATOR_SERVICE}:${rt}::${param}${func}"
+		;;
+	*)
+		echo "${LOCATOR_SERVICE}:${node}::${func}"
+		;;
+	esac
 }
 
 # Add an SRv6 Endpoint behavior to a router, bound to a SID. Nothing is added
@@ -767,28 +936,38 @@ setup_rt_endpoint()
 		del "${sid}" table "${LOCALSID_TABLE_ID}"
 }
 
-# Add an SRv6 Endpoint behavior to each router of a Policy element <nodeid:op>.
+# Add an SRv6 Endpoint behavior to each router of a Policy element
+# <nodeid:op:act>.
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
-	local node="$1"
+	local nodes="$1"
 	local op_type="$2"
-	local func="$3"
-	local behavior_cfg="$4"
+	local act="$3"
+	local func="$4"
+	local behavior_cfg="$5"
+	local act_cfg
+	local node
 	local sid
+	local adj
 	local rt
 
-	for rt in $(echo "${node}" | sed 's/,/ /g'); do
-		sid="$(get_rt_sid "${rt}" "${op_type}" "${func}")"
-		setup_rt_endpoint "${rt}" "${sid}" "${behavior_cfg}"
+	for node in $(echo "${nodes}" | sed 's/,/ /g'); do
+		rt="$(__get_srv6_node_id "${node}")"
+		adj="$(__get_srv6_adjacent_id "${node}")"
+		sid="$(get_rt_sid "${node}" "${op_type}" "${act}" "${func}")"
+		act_cfg="$(__get_srv6_act_cfg "${act}" "${rt}" "${adj}")"
+		setup_rt_endpoint "${rt}" "${sid}" "${act_cfg} ${behavior_cfg}"
 	done
 }
 
@@ -801,12 +980,15 @@ setup_rt_endpoints()
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
+#       For End.X, the <nodeid> includes ">" and the adjacency ("h" for the
+#       host), and <act> is "End.X".
 __setup_rt_policy()
 {
 	local dst="$1"
@@ -819,33 +1001,43 @@ __setup_rt_policy()
 	local function
 	local op_type
 	local node
+	local act
+	local sid
 	local n
 
 	in_nsname="$(get_rtname "${encap_rt}")"
 
 	for n in ${policy_rts}; do
+		if ! __check_srv6_rtcfg "${n}"; then
+			ret="${ksft_fail}"
+			return 1
+		fi
+
 		node="$(__get_srv6_rtcfg_id "${n}")"
 		op_type="$(__get_srv6_rtcfg_op "${n}")"
+		act="$(__get_srv6_rtcfg_act "${n}")"
+		function="$(__get_srv6_func "${act} ${op_type}")"
 
 		case "${op_type}" in
 		"noflv")
-			policy="${policy}${LOCATOR_SERVICE}:${node}::${END_FUNC},"
-			function="${END_FUNC}"
-			behavior_cfg="End"
+			sid="$(get_rt_sid "${node}" "${op_type}" "${act}" \
+				"${function}")"
+			policy="${policy}${sid},"
+			behavior_cfg=""
 			;;
 
 		"psp")
-			policy="${policy}${LOCATOR_SERVICE}:${node}::${END_PSP_FUNC},"
-			function="${END_PSP_FUNC}"
-			behavior_cfg="End flavors psp"
+			sid="$(get_rt_sid "${node}" "${op_type}" "${act}" \
+				"${function}")"
+			policy="${policy}${sid},"
+			behavior_cfg="flavors psp"
 			;;
 
 		"next-csid,psp")
-			container="$(build_csid_container "${node}" \
-				"${END_CSID_PSP_FUNC}")"
+			container="$(build_csid_container "${node}" "${act}" \
+				"${function}")"
 			policy="${policy}${container},"
-			function="${END_CSID_PSP_FUNC}"
-			behavior_cfg="End flavors next-csid,psp ${CSID_CFG}"
+			behavior_cfg="flavors next-csid,psp ${CSID_CFG}"
 			;;
 
 		*)
@@ -854,8 +1046,8 @@ __setup_rt_policy()
 		esac
 
 		# add SRv6 Endpoint behavior to the selected routers
-		setup_rt_endpoints "${node}" \
-			"${op_type}" "${function}" "${behavior_cfg}"
+		setup_rt_endpoints "${node}" "${op_type}" "${act}" \
+			"${function}" "${behavior_cfg}"
 	done
 
 	# we need to remove the trailing comma to avoid inserting an empty
@@ -884,6 +1076,50 @@ setup_rt_policy_ipv6()
 	__setup_rt_policy "$1" "$2" "$3"
 }
 
+# Set up an unreachable route on a router so that a lookup of the next SID
+# fails under End, while End.X still forwards via its adjacency (nh6).
+# args:
+#  $1 - router to configure
+#  $2 - adjacent router, or a NEXT-C-SID node list (e.g. "4" or "4>2,2>h")
+#  $3 - operation <op> of the element (e.g. "psp" or "next-csid,psp")
+setup_rt_unreachable()
+{
+	local rt="$1"
+	local adj="$2"
+	local op_type="$3"
+	local net_prefix
+	local devname
+	local nsname
+	local sid
+
+	nsname="$(get_rtname "${rt}")"
+
+	case "${op_type}" in
+	"psp")
+		sid="${LOCATOR_SERVICE}:${adj}::/32"
+		devname="veth-rt-${rt}-${adj}"
+		net_prefix="$(get_network_prefix "${rt}" "${adj}")"
+		ip -netns "${nsname}" -6 route \
+			change unreachable "${sid}" \
+			table "${LOCALSID_TABLE_ID}"
+		defer ip -netns "${nsname}" -6 route \
+			change "${sid}" \
+			table "${LOCALSID_TABLE_ID}" \
+			via "${net_prefix}::${adj}" dev "${devname}"
+		;;
+	"next-csid,psp")
+		sid="$(build_csid_container "${adj}" "End.X" \
+			"${ENDX_CSID_PSP_FUNC}")"
+		ip -netns "${nsname}" -6 route \
+			add unreachable "${sid}" \
+			table "${LOCALSID_TABLE_ID}"
+		defer ip -netns "${nsname}" -6 route \
+			delete "${sid}" \
+			table "${LOCALSID_TABLE_ID}"
+		;;
+	esac
+}
+
 setup_hs()
 {
 	local hs="$1"
@@ -1031,6 +1267,32 @@ setup_end_flv_psp()
 	SETUP_ERR=0
 }
 
+setup_endx_flv_psp()
+{
+	SETUP_ERR=1
+
+	setup_hs_lo_addr 1 1 "${ENDX_CSID_PSP_FUNC}"
+	setup_hs_lo_addr 2 2 "${ENDX_CSID_PSP_FUNC}"
+
+	# The same SRv6 policies as in setup_end_flv_psp, except using End.X
+	setup_rt_policy_ipv6 2 1 "3>4:noflv:End.X 4>2:psp:End.X 2>h:psp:End.X"
+	setup_rt_policy_ipv6 1 2 "1>h:psp:End.X"
+
+	setup_rt_policy_ipv6 "2:${ENDX_CSID_PSP_FUNC}" 1 \
+		"3>4:next-csid,psp:End.X 4>2,2>h:next-csid,psp:End.X"
+	setup_rt_policy_ipv6 "1:${ENDX_CSID_PSP_FUNC}" 2 \
+		"4>3,3>1,1>h:next-csid,psp:End.X"
+
+	# (i.a) add fcff:4::/32 unreachable on rt-3 and fcff:2::/32 on rt-4
+	# (i.c) add fcbb:0:42a9:20a9:: unreachable on rt-3 and fcbb:0:20a9::
+	# 	on rt-4
+	setup_rt_unreachable 3 4 "psp"
+	setup_rt_unreachable 4 2 "psp"
+	setup_rt_unreachable 3 "4>2,2>h" "next-csid,psp"
+	setup_rt_unreachable 4 "2>h" "next-csid,psp"
+	SETUP_ERR=0
+}
+
 check_rt_connectivity()
 {
 	local rtsrc="$1"
@@ -1106,6 +1368,45 @@ check_and_log_hs_lo_addr_connectivity()
 		"IPv6 Hosts connectivity: hs-${hssrc} -> hs-${hsdst} (${dst})"
 }
 
+__check_srv6_rtcfg()
+{
+	local element="$1"
+	local op_type
+	local node_re
+	local nodes
+	local act
+
+	nodes="$(__get_srv6_rtcfg_id "${element}")"
+	op_type="$(__get_srv6_rtcfg_op "${element}")"
+	act="$(__get_srv6_rtcfg_act "${element}")"
+
+	if ! op_has_next_csid "${op_type}" && \
+		echo "${nodes}" | grep -q ","; then
+		echo "${element}: only NEXT-C-SID takes more than one node"
+		return 1
+	fi
+
+	case "${act}" in
+	"End")
+		node_re='^[1-4]$'
+		;;
+	"End.X")
+		node_re='^[1-4]>([1-4]|h)$'
+		;;
+	*)
+		echo "${element}: ${act} is not a behavior"
+		return 1
+		;;
+	esac
+
+	for node in $(echo "${nodes}" | sed 's/,/ /g'); do
+		if [[ ! "${node}" =~ ${node_re} ]]; then
+			echo "${element}: ${node} is not valid for ${act}"
+			return 1
+		fi
+	done
+}
+
 router_tests()
 {
 	local i
@@ -1137,7 +1438,10 @@ host2gateway_tests()
 
 host_srv6_end_flv_psp_tests()
 {
-	log_section "SRv6 connectivity test hosts (h1 <-> h2, PSP flavor)"
+	local act=${1:-"End"}
+
+	log_section \
+		"SRv6 connectivity test hosts (h1 <-> h2, ${act} PSP flavor)"
 
 	check_and_log_hs_connectivity 1 2
 	check_and_log_hs_connectivity 2 1
@@ -1145,10 +1449,15 @@ host_srv6_end_flv_psp_tests()
 
 host_srv6_end_flv_next_csid_psp_tests()
 {
-	log_section "SRv6 connectivity test hosts (h1 <-> h2, NEXT-C-SID,PSP)"
+	local act=${1:-"End"}
+	local csid_psp_func
+
+	log_section \
+		"SRv6 connectivity test hosts (h1 <-> h2, ${act} NEXT-C-SID,PSP)"
 
-	check_and_log_hs_lo_addr_connectivity 1 2 "${END_CSID_PSP_FUNC}"
-	check_and_log_hs_lo_addr_connectivity 2 1 "${END_CSID_PSP_FUNC}"
+	csid_psp_func="$(__get_srv6_func "${act} next-csid,psp")"
+	check_and_log_hs_lo_addr_connectivity 1 2 "${csid_psp_func}"
+	check_and_log_hs_lo_addr_connectivity 2 1 "${csid_psp_func}"
 }
 
 # On a router, add a route for a SID with seg6 encap in inline mode. The packets
@@ -1299,7 +1608,7 @@ host_srv6_end_flv_consumed_srh_tests()
 	local sid
 
 	log_section \
-		"SRv6 connectivity test hosts (h1 <-> h2, PSP with a consumed SRH)"
+		"SRv6 connectivity test hosts (h1 <-> h2, End PSP with a consumed SRH)"
 
 	if ! ${HAS_SRH_MATCH}; then
 		echo "SKIP: ip6tables srh match not available"
@@ -1316,16 +1625,49 @@ host_srv6_end_flv_consumed_srh_tests()
 	check_and_log_consumed_srh 2 "${sid}" 3 2 1
 
 	# Policy (i.c): rt-4 inserts the extra SRH consumed by rt-3
-	sid="$(build_csid_container 2 "${END_CSID_PSP_FUNC}")"
+	sid="$(build_csid_container 2 "End" "${END_CSID_PSP_FUNC}")"
 	check_and_log_consumed_srh 4 "${sid}" 3 1 2 "${END_CSID_PSP_FUNC}"
 
 	# Policy (i.d): rt-3 inserts the extra SRH consumed by rt-4
-	sid="$(build_csid_container 1 "${END_CSID_PSP_FUNC}")"
+	sid="$(build_csid_container 1 "End" "${END_CSID_PSP_FUNC}")"
 	check_and_log_consumed_srh 3 "${sid}" 4 2 1 "${END_CSID_PSP_FUNC}"
 
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
+	sid="$(build_csid_container "3>4" "End.X" "${ENDX_CSID_PSP_FUNC}")"
+	check_and_log_consumed_srh 1 "${sid}" 4 1 2 "${ENDX_CSID_PSP_FUNC}"
+
+	# Policy (i.d): rt-2 inserts the extra SRH consumed by rt-3
+	sid="$(build_csid_container "4>3,3>1,1>h" "End.X" \
+		"${ENDX_CSID_PSP_FUNC}")"
+	check_and_log_consumed_srh 2 "${sid}" 3 2 1 "${ENDX_CSID_PSP_FUNC}"
+
+	set_hs_seg6_enabled 0
+}
+
 test_iproute2_supp_or_ksft_skip()
 {
 	local flavor="$1"
@@ -1336,16 +1678,22 @@ test_iproute2_supp_or_ksft_skip()
 	fi
 }
 
-test_kernel_supp_or_ksft_skip()
+__test_kernel_supp_or_ksft_skip()
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
-		exit "${ksft_skip}"
+		return 1
 	fi
 
 	if ! ip -netns "${test_netns}" link \
@@ -1353,7 +1701,7 @@ test_kernel_supp_or_ksft_skip()
 		echo "SKIP: Cannot set up dummy dev to test kernel support for flavors"
 
 		ip netns del "${test_netns}"
-		exit "${ksft_skip}"
+		return 1
 	fi
 
 	if ! ip -netns "${test_netns}" link \
@@ -1361,19 +1709,42 @@ test_kernel_supp_or_ksft_skip()
 		echo "SKIP: Cannot activate dummy dev to test kernel support for flavors"
 
 		ip netns del "${test_netns}"
-		exit "${ksft_skip}"
+		return 1
 	fi
 
 	if ! ip -netns "${test_netns}" -6 route \
 		add "${IPv6_TESTS_ADDR}" encap seg6local \
-		action End flavors "${flavor}" dev "${DUMMY_DEVNAME}"; then
-		echo "SKIP: ${flavor} flavor not supported in kernel"
+		"${policy[@]}" dev "${DUMMY_DEVNAME}"; then
+		echo "SKIP: ${action} flavor ${flavor} not supported in kernel"
 
 		ip netns del "${test_netns}"
+		return 1
+	fi
+
+	if ! ip -netns "${test_netns}" -6 route show | grep -q "${flavor}"; then
+		echo "SKIP: ${action} flavor ${flavor} not supported in kernel"
+
+		ip netns del "${test_netns}"
+		return 1
+	fi
+
+	ip netns del "${test_netns}" || true
+}
+
+# Exit directly if the End action is not supported; return 1 for other
+# actions when they are not supported.
+test_kernel_supp_or_ksft_skip()
+{
+	local ret
+
+	__test_kernel_supp_or_ksft_skip "$1" "$2"
+	ret="$?"
+
+	if [ "$ret" -ne 0 ] && [ "$1" == "End" ]; then
 		exit "${ksft_skip}"
 	fi
 
-	ip netns del "${test_netns}"
+	return $ret
 }
 
 # Before enabling the tests with a consumed SRH, make sure that the rules they
@@ -1433,6 +1804,24 @@ test_end_flv()
 	defer_scope_pop
 }
 
+test_endx_flv()
+{
+	if ! ${HAS_ENDX_PSP}; then
+		log_section "SRv6 connectivity test hosts (h1 <-> h2, End.X)"
+		log_test_skipped "SRv6 End.X tests, no End.X PSP in the kernel"
+		return
+	fi
+
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
@@ -1452,7 +1841,8 @@ test_dummy_dev_or_ksft_skip
 # NEXT-C-SID is not checked: every kernel and iproute2 version that
 # supports PSP also supports NEXT-C-SID.
 test_iproute2_supp_or_ksft_skip psp
-test_kernel_supp_or_ksft_skip psp
+test_kernel_supp_or_ksft_skip End psp
+test_kernel_supp_or_ksft_skip End.X psp && HAS_ENDX_PSP=true
 check_srh_match_support
 
 set -e
@@ -1465,4 +1855,6 @@ router_tests
 host2gateway_tests
 
 test_end_flv
+test_endx_flv
+
 print_log_test_results

-- 
2.56.0

