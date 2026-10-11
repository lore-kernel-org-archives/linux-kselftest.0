Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAB52C0303;
	Sun, 11 Oct 2026 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746666; cv=none; b=IwZZD1cYbpwrTxdCAPF5J0PEY0cMC6X5SWdAfLoVAmiSmh6bOWN5NZ+THhIiI5aM7xDoLyy+ZZulUsWEgqZGJEWAOaYxQKkMl7NhbGU9X3Tnxes0ehOGg8XU7XI5PwTtjhurBeyYhxsv3X/LE6nfbIVatR87bVSyOgPHLecWtgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746666; c=relaxed/simple;
	bh=vy3XOjmQ1yRPfuF5TMngkWYUKUhhyZdhoON2ZSZYT5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=scSLZj8zOWHI5Fu1GG/pAmFeD6e0MNs74+R6oDKjLWYZlitLkB0MvvK0cUvU4IqTeFNjMaln5UsNQPRDrH7WxHdB/2Dthw4NlLPpTEYuoSswNZrwJE/AtPx1yDLqxS8/AmxFC016hFhq2+yrDPPaOlVSS9NhgEOryubu+cmsdZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=oO+i1gsU; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=gTbnSRMr; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="oO+i1gsU";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="gTbnSRMr"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 69BJNbPE010949;
	Sun, 11 Oct 2026 21:23:42 +0200
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id E61C0122950;
	Sun, 11 Oct 2026 21:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1791746613; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=07QGIbKFp31q7qT5y4oruUViDSqsFTmOUXt2FbilAKU=;
	b=oO+i1gsUDIcNIC+bj9dVxgUKXIN5LISfkLVNl2Ftch//ynqapuqe1cx69+hFf7Qw7lMzhI
	7qI16hecJEVRV2AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1791746613; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=07QGIbKFp31q7qT5y4oruUViDSqsFTmOUXt2FbilAKU=;
	b=gTbnSRMr+n3Jehb70F0F9zNrY+rsdlt6AlhOajyN6wBrrX8y9aTvqu8aN7BD7VaFegWgo5
	jOySxErr4Mt/2Ydjd7nZvaqrHwHrZz0c4L6CtBihy1yRKCMcaFQoyLTvAkUP6J4LpKD6kn
	W2fnVTMjBxcWM+g/LwsVqYN8kFZkFdRvxwkNZpHXgFzU+or6MsaPC+/R5JaI0QgnFmIimT
	kxyb9OjCCJyr9qIDDnzp95dzejR4P8J3X6VC9cD83UeN2/o5SPwz4AnqCHGN5xT+PVw3wJ
	bwLqpAdCJiLioy9dwqT3aj9bqHFMlblk4LVNPToOmRSoFlYJuL+aIhTohSV2hA==
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>,
        Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Hangbin Liu <hangbin.liu@linux.dev>,
        Justin Iurman <justin.iurman@gmail.com>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        Ahmed Abdelsalam <ahabdels@cisco.com>,
        Stefano Salsano <stefano.salsano@uniroma2.it>,
        Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: [PATCH net-next 4/5] selftests: seg6: add tests for PSP together with NEXT-C-SID
Date: Sun, 11 Oct 2026 21:23:09 +0200
Message-Id: <20261011192310.55-5-andrea.mayer@uniroma2.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261011192310.55-1-andrea.mayer@uniroma2.it>
References: <20261011192310.55-1-andrea.mayer@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

Extend srv6_end_flavors_test.sh with tests for the SRv6 End behavior
with both the NEXT-C-SID and PSP flavors.

The tests use two SRv6 Policies with C-SID containers, where every
router after the ingress one applies End with the NEXT-C-SID and PSP
flavors. To check PSP, set net.ipv6.conf.all.seg6_enabled to 0 on the
hosts in setup_hs(). The hosts then drop any packet that still carries
an SRH, and a ping to an address on the loopback of a host succeeds
only if the router connected to that host has removed the SRH. The tests
fail when PSP is not applied together with NEXT-C-SID.

Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
---
 .../selftests/net/srv6_end_flavors_test.sh    | 229 +++++++++++++++++-
 1 file changed, 226 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 30a939392eea..baa1b09a1aab 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -16,8 +16,9 @@
 #
 # The End, End.X, and End.T behaviors can support these flavors either
 # individually or in combinations.
-# Currently in this selftest we consider only the PSP flavor for the SRv6 End
-# behavior. However, it is possible to extend the script as soon as other
+# Currently in this selftest we consider the PSP flavor for the SRv6 End
+# behavior, both alone and combined with the NEXT-C-SID flavor defined in
+# RFC9800 [2]. However, it is possible to extend the script as soon as other
 # flavors will be supported in the kernel.
 #
 # The purpose of the PSP flavor consists in instructing the penultimate node
@@ -47,7 +48,20 @@
 #    "standard" End packet processing, ignoring the configured PSP flavor at
 #    all.
 #
+# The NEXT-C-SID flavor (referred to as NEXT-CSID in RFC9800 [2]) and the
+# C-SID containers are described in srv6_end_next_csid_l3vpn_test.sh, which
+# also tests this flavor for the SRv6 End behavior.
+#
+# When the NEXT-C-SID flavor is combined with the PSP, USP or USD flavors, these
+# flavors are left unchanged [2]. The NEXT-C-SID processing comes first: with a
+# non-zero Argument, the IPv6 DA is updated with the next C-SID and the packet
+# is forwarded without changing the SRH, if any. The packet goes through the End
+# behavior with the other flavors only when the Argument is zero, i.e. when the
+# IPv6 DA carries no further C-SID. For example, the PSP operation takes place
+# only for a C-SID container with a zero Argument and SL=1.
+#
 # [1] RFC8986: https://datatracker.ietf.org/doc/html/rfc8986
+# [2] RFC9800: https://datatracker.ietf.org/doc/html/rfc9800
 #
 # Network topology
 # ================
@@ -115,12 +129,30 @@
 #   +---------------------------------------------------------------------+
 #   |fcff:x::e is associated with the SRv6 End behavior                   |
 #   |fcff:x::ef1 is associated with the SRv6 End behavior with PSP flavor |
+#   |fcbb:0:0xyy::/48 is associated with the SRv6 behavior and the        |
+#   |   flavors of the Function yy                                        |
 #   +---------------------------------------------------------------------+
 #
 # The fcff::/16 prefix is reserved by the operator for the SIDs. Reachability of
 # SIDs is ensured by proper configuration of the IPv6 operator's network and
 # SRv6 routers.
 #
+# Similarly, the fcbb:0::/32 prefix is reserved by the operator for the C-SID
+# containers and it is used as their Locator-Block.
+# A C-SID (16 bits) is made of the Locator-Node (8 bits), i.e. the ID of the
+# router, followed by the Function (8 bits). The first digit of the Function
+# selects the SRv6 behavior and the second one the flavors combined with
+# NEXT-C-SID:
+#
+#   +----------+----------+--------------------+
+#   | Function | behavior | flavors            |
+#   +----------+----------+--------------------+
+#   | a1       | End      | NEXT-C-SID and PSP |
+#   +----------+----------+--------------------+
+#
+# For example, fcbb:0:04a1:02a1:: is a C-SID container carrying the C-SID of
+# rt-4 followed by the C-SID of rt-2, both with the NEXT-C-SID and PSP flavors.
+#
 #
 # SRv6 Policies
 # =============
@@ -193,6 +225,39 @@
 # set with the last SID; iii) the SRH is removed from the extension headers
 # after the IPv6 header. At this point, the packet with IPv6 DA=cafe::1 is sent
 # to the destination, i.e. hs-1.
+#
+# Traffic to the loopback addresses of the hosts
+# ----------------------------------------------
+#
+# Each host has an address on its loopback, cafe::x:a1. The traffic from the
+# other host towards this address is steered with C-SID containers: after the
+# ingress router, every router crossed applies the SRv6 End behavior with the
+# NEXT-C-SID and PSP flavors. The following SRv6 Policies are applied by rt-1
+# to the traffic towards cafe::2:a1 (i.c) and by rt-2 to the traffic towards
+# cafe::1:a1 (i.d):
+#
+#   i.c) IPv6 traffic, SID List=fcbb:0:03a1::,fcbb:0:04a1:02a1::,cafe::2:a1
+#   i.d) IPv6 traffic, SID List=fcbb:0:04a1:03a1:01a1::,cafe::1:a1
+#
+# In the Policy (i.c), rt-3 receives a zero Argument with SL=2 and applies the
+# "standard" End processing. rt-4 receives a non-zero Argument with SL=1: it
+# advances to the next C-SID and does *NOT* apply the PSP operation. rt-2
+# receives a zero Argument with SL=1 and applies the PSP operation.
+#
+# In the Policy (i.d), a single C-SID container carries three C-SIDs. rt-4 and
+# rt-3 receive a non-zero Argument with SL=1: they advance to the next C-SID and
+# do *NOT* apply the PSP operation. rt-1 receives a zero Argument with SL=1
+# and applies the PSP operation.
+#
+# The hosts use cafe::x as the source address, not the loopback address. The
+# replies are sent to cafe::x and follow the Policies (i.a) and (i.b), which
+# are tested first. This way, each ping checks a single Policy with the
+# NEXT-C-SID flavor, and a failure points directly to that Policy.
+#
+# The hosts drop the packets that carry an SRH (seg6_enabled is set to 0 on
+# the hosts). The loopback address of a host is reached only through the
+# router connected to that host: the ping succeeds only if the SRH is removed
+# by that router.
 
 # shellcheck source=lib.sh
 source lib.sh
@@ -207,6 +272,17 @@ readonly IPv6_TESTS_ADDR=2001:db8::1
 readonly LOCATOR_SERVICE=fcff
 readonly END_FUNC=000e
 readonly END_PSP_FUNC=0ef1
+readonly END_CSID_PSP_FUNC=a1
+
+readonly LCBLOCK_ADDR=fcbb:0
+readonly LCBLOCK_BLEN=32
+# do not add ':' as separator
+readonly LCNODE_FMT="0%d"
+readonly LCNODE_BLEN=8
+readonly LCNODEFUNC_BLEN=16
+
+readonly LCBLOCK_NODE_BLEN=$((LCBLOCK_BLEN + LCNODE_BLEN))
+readonly LCBLOCK_NODEFUNC_BLEN=$((LCBLOCK_BLEN + LCNODEFUNC_BLEN))
 
 PING_TIMEOUT_SEC=4
 PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
@@ -397,6 +473,40 @@ __get_srv6_rtcfg_op()
 		xargs | sed 's/ /,/g'
 }
 
+# Given the ID of a router and a Function, the function returns the C-SID made
+# of the Locator-Node (8 bits), i.e. the ID of the router, followed by the
+# Function (8 bits).
+# e.g. input: "4" "a1"
+#      output: "04a1"
+build_csid()
+{
+	local nodeid="$1"
+	local func="$2"
+
+	printf "${LCNODE_FMT}%s" "${nodeid}" "${func}"
+}
+
+# Given the <nodeid> token of a "next-csid,<flavors>" element, i.e. a
+# comma-separated list of node IDs, and a Function, the function returns the
+# C-SID container carrying the C-SIDs of these nodes.
+# e.g. input: "4,2" "a1"
+#      output: "fcbb:0:04a1:02a1::"
+build_csid_container()
+{
+	local nodeids="$1"
+	local func="$2"
+	local csids=''
+	local nodes
+	local node
+
+	nodes="$(echo "${nodeids}" | sed 's/,/ /g')"
+	for node in ${nodes}; do
+		csids="${csids}:$(build_csid "${node}" "${func}")"
+	done
+
+	echo "${LCBLOCK_ADDR}${csids}::"
+}
+
 # Setup the basic networking for the routers
 setup_rt_networking()
 {
@@ -439,6 +549,7 @@ setup_rt_local_sids()
 	local devname
 	local nsname
 	local neigh
+	local csid
 
 	nsname="$(get_rtname "${rt}")"
 
@@ -452,6 +563,14 @@ setup_rt_local_sids()
 			add "${LOCATOR_SERVICE}:${neigh}::/32" \
 			table "${LOCALSID_TABLE_ID}" \
 			via "${net_prefix}::${neigh}" dev "${devname}"
+
+		# set underlay network routes to reach the C-SID containers
+		# that start with a C-SID of the neighbor, for any Function.
+		csid="$(build_csid "${neigh}" 00)"
+		ip -netns "${nsname}" -6 route \
+			add "${LCBLOCK_ADDR}:${csid}::/${LCBLOCK_NODE_BLEN}" \
+			table "${LOCALSID_TABLE_ID}" \
+			via "${net_prefix}::${neigh}" dev "${devname}"
 	done
 
 	# Local End behavior (note that "dev" is a dummy interface chosen for
@@ -461,6 +580,17 @@ setup_rt_local_sids()
 		table "${LOCALSID_TABLE_ID}" \
 		encap seg6local action End dev "${DUMMY_DEVNAME}"
 
+	# Local End behavior with the NEXT-C-SID and PSP flavors, bound to the
+	# C-SID of the router (e.g. fcbb:0:04a1::/48 on rt-4). The /48 prefix
+	# covers every C-SID container whose first C-SID is this one, whatever
+	# the Argument that follows.
+	csid="$(build_csid "${rt}" "${END_CSID_PSP_FUNC}")"
+	ip -netns "${nsname}" -6 route \
+		add "${LCBLOCK_ADDR}:${csid}::/${LCBLOCK_NODEFUNC_BLEN}" \
+		table "${LOCALSID_TABLE_ID}" \
+		encap seg6local action End flavors next-csid,psp \
+		lblen "${LCBLOCK_BLEN}" nflen "${LCNODEFUNC_BLEN}" \
+		dev "${DUMMY_DEVNAME}"
 
 	# all SIDs start with a common locator. Routes and SRv6 Endpoint
 	# behavior instances are grouped together in the 'localsid' table.
@@ -468,6 +598,12 @@ setup_rt_local_sids()
 		add to "${LOCATOR_SERVICE}::/16" \
 		lookup "${LOCALSID_TABLE_ID}" prio 999
 
+	# the C-SID containers use their own Locator-Block. Their routes and
+	# SRv6 Endpoint behavior instances are in the 'localsid' table too.
+	ip -netns "${nsname}" -6 rule \
+		add to "${LCBLOCK_ADDR}::/${LCBLOCK_BLEN}" \
+		lookup "${LOCALSID_TABLE_ID}" prio 999
+
 	# set default routes to unreachable
 	ip -netns "${nsname}" -6 route \
 		add unreachable default metric 4278198272 \
@@ -479,12 +615,16 @@ setup_rt_local_sids()
 # configures the SRv6 nodes specified in the SID List to process the traffic
 # according to the operations required by the Policy itself.
 # args:
-#  $1 - destination host (i.e. cafe::x host)
+#  $1 - destination host (i.e. cafe::x host), or x:a1 for the address
+#       cafe::x:a1 on the loopback of the host
 #  $2 - SRv6 router configured for enforcing the SRv6 Policy
 #  $3 - compact way to represent a list of SRv6 routers with their operations
 #       (i.e. behaviors) that each of them needs to perform. Every <nodeid:op>
 #       element constructs a SID that is associated with the behavior <op> on
 #       the <nodeid> node. The list of such elements forms an SRv6 Policy.
+#       For "next-csid,psp", <nodeid> is a comma-separated list of node IDs.
+#       The element constructs a C-SID container with the C-SIDs of these
+#       nodes, e.g. "4,2:next-csid,psp" gives fcbb:0:04a1:02a1::.
 __setup_rt_policy()
 {
 	local dst="$1"
@@ -494,6 +634,7 @@ __setup_rt_policy()
 	local in_nsname
 	local rt_nsname
 	local policy=''
+	local container
 	local function
 	local fullsid
 	local op_type
@@ -520,6 +661,15 @@ __setup_rt_policy()
 			behavior_cfg="End flavors psp"
 			;;
 
+		"next-csid,psp")
+			# the behavior is already set up on every router by
+			# setup_rt_local_sids.
+			container="$(build_csid_container "${node}" \
+				"${END_CSID_PSP_FUNC}")"
+			policy="${policy}${container},"
+			continue
+			;;
+
 		*)
 			break
 			;;
@@ -571,6 +721,7 @@ setup_hs()
 
 	ip netns exec "${hsname}" sysctl -wq net.ipv6.conf.all.accept_dad=0
 	ip netns exec "${hsname}" sysctl -wq net.ipv6.conf.default.accept_dad=0
+	ip netns exec "${hsname}" sysctl -wq net.ipv6.conf.all.seg6_enabled=0
 
 	ip -netns "${hsname}" link add veth0 type veth \
 		peer name "${RT2HS_DEVNAME}" netns "${rtname}"
@@ -590,6 +741,33 @@ setup_hs()
 		sysctl -wq net.ipv6.conf."${RT2HS_DEVNAME}".proxy_ndp=1
 }
 
+# Set up an address on the loopback of a host, and the route towards it on the
+# router connected to the host.
+# args:
+#  $1 - host
+#  $2 - router connected to the host
+#  $3 - suffix of the address (i.e. cafe::<host>:<suffix>)
+setup_hs_lo_addr()
+{
+	local hs="$1"
+	local rt="$2"
+	local suffix="$3"
+	local hsname
+	local rtname
+	local addr
+
+	hsname="$(get_hsname "${hs}")"
+	rtname="$(get_rtname "${rt}")"
+	addr="${IPv6_HS_NETWORK}::${hs}:${suffix}"
+
+	ip -netns "${hsname}" addr \
+		add "${addr}/128" dev lo nodad
+
+	ip -netns "${rtname}" -6 route \
+		add "${addr}" \
+		via "${IPv6_HS_NETWORK}::${hs}" dev "${RT2HS_DEVNAME}"
+}
+
 setup()
 {
 	local i
@@ -622,6 +800,11 @@ setup()
 	setup_hs 1 1
 	setup_hs 2 2
 
+	# set up the loopback addresses of the hosts used by the Policies (i.c)
+	# and (i.d).
+	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
+	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"
+
 	# set up default SRv6 Endpoints (i.e. SRv6 End behavior)
 	setup_rt_local_sids 1 "2 3 4"
 	setup_rt_local_sids 2 "1 3 4"
@@ -645,6 +828,21 @@ setup()
 	setup_rt_policy_ipv6 2 1 "3:noflv 4:psp 2:psp"
 	setup_rt_policy_ipv6 1 2 "1:psp"
 
+	# Direction hs-1 -> hs-2 (cafe::2:a1, NEXT-C-SID and PSP flavors)
+	#  - rt-1 (SRv6 H.Insert policy)
+	#  - rt-3 (Argument=0 and SL>1, acting as an End behavior)
+	#  - rt-4 (Argument!=0 and SL=1, advancing the C-SID)
+	#  - rt-2 (Argument=0 and SL=1, PSP)
+	#
+	# Direction hs-2 -> hs-1 (cafe::1:a1, NEXT-C-SID and PSP flavors)
+	#  - rt-2 (SRv6 H.Insert policy)
+	#  - rt-4 (Argument!=0 and SL=1, advancing the C-SID)
+	#  - rt-3 (Argument!=0 and SL=1, advancing the C-SID)
+	#  - rt-1 (Argument=0 and SL=1, PSP)
+	setup_rt_policy_ipv6 "2:${END_CSID_PSP_FUNC}" 1 \
+		"3:next-csid,psp 4,2:next-csid,psp"
+	setup_rt_policy_ipv6 "1:${END_CSID_PSP_FUNC}" 2 "4,3,1:next-csid,psp"
+
 	# testing environment was set up successfully
 	SETUP_ERR=0
 }
@@ -710,6 +908,20 @@ check_and_log_hs_connectivity()
 	check_and_log_hs_ipv6_connectivity "${hssrc}" "${hsdst}"
 }
 
+check_and_log_hs_lo_addr_connectivity()
+{
+	local hssrc="$1"
+	local hsdst="$2"
+	local suffix="$3"
+	local dst
+
+	dst="${IPv6_HS_NETWORK}::${hsdst}:${suffix}"
+
+	check_hs_ipv6_connectivity "${hssrc}" "${hsdst}:${suffix}"
+	log_test $? 0 \
+		"IPv6 Hosts connectivity: hs-${hssrc} -> hs-${hsdst} (${dst})"
+}
+
 router_tests()
 {
 	local i
@@ -747,6 +959,14 @@ host_srv6_end_flv_psp_tests()
 	check_and_log_hs_connectivity 2 1
 }
 
+host_srv6_end_flv_next_csid_psp_tests()
+{
+	log_section "SRv6 connectivity test hosts (h1 <-> h2, NEXT-C-SID,PSP)"
+
+	check_and_log_hs_lo_addr_connectivity 1 2 "${END_CSID_PSP_FUNC}"
+	check_and_log_hs_lo_addr_connectivity 2 1 "${END_CSID_PSP_FUNC}"
+}
+
 test_iproute2_supp_or_ksft_skip()
 {
 	local flavor="$1"
@@ -836,6 +1056,8 @@ test_command_or_ksft_skip sort
 test_command_or_ksft_skip xargs
 
 test_dummy_dev_or_ksft_skip
+# NEXT-C-SID is not checked: every kernel and iproute2 version that
+# supports PSP also supports NEXT-C-SID.
 test_iproute2_supp_or_ksft_skip psp
 test_kernel_supp_or_ksft_skip psp
 
@@ -848,5 +1070,6 @@ set +e
 router_tests
 host2gateway_tests
 host_srv6_end_flv_psp_tests
+host_srv6_end_flv_next_csid_psp_tests
 
 print_log_test_results
-- 
2.43.0

