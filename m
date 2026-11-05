Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843999;
	b=Q5ZT+HImrrO5DSm9pNrQHg8Sb3e8EKI4g80a+HjsM/Q4tFIW2Q325iu+mDDKrCRIhO+N
	 oOftC6r0eXuZniv9g2Ph4qsjZdPAlKspd+nSiwt4+BWainyM/1Nepq8wCe82541obSwbf
	 Dag2wI22uZOY9YNaSHjXmfDknl2Y/VNhCAcQlL+hrn0fuUA8RFvoxrlvf7On80COq4vHK
	 3iUQoy5jW1pQeT+A7KuG2e/xgLVt3QtTHpWaENqH+a+cOTlxj2kZe+PHMr2QiQ3pVPoeV
	 8SsUtva/ZABFzCJzuP2UqEa55/kvhkSoU7YdpXc4oYPCamrt1BzDAFz/hxfMTevvwEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843999;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=Wh3rkeiAMAtqT0dyAzB3R9VY7PKWSU32hBfsSb84LpA=;
	b=xeMP/y9KLHKKPJitGrSCkiYPNzYhgjCGAvTNkCzUkBUPpDmMwsaAM96v0ExIz1d2e0Ai
	 OqD3Gqz726BzAH2d3MpHUkEEkbzSWhwu4+g2eoasatESM79EnbFP37E+51oqldsapODvC
	 CR/zaHzzAH0oqb6VAJ7bgDpWpr+4LJKgf3gohIc2ojI/s/ILWUkO5QNBYDj8bVcFl31uI
	 kgNuy3mIDh0bNrCrl16PpCQkvmzGSspKubCsIe7joj6RdR7JC5NgtB+ZZb5JgVJkPzgtC
	 GLH/spCMZxFN5c/rStm8s7FMK6Se22S4qz2jEaPxWMaWc0qO1mg68eacLRKUcxHEZAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=DwAoBuMU;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=UsGimAXk;
	arc=none smtp.remote-ip=160.80.4.35
Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.35])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D571A606A326;
	Thu,  5 Nov 2026 01:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D571A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=DwAoBuMU;
	dkim=pass (2048-bit key, unprotected) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=UsGimAXk
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6A51xN1d001510;
	Thu, 5 Nov 2026 02:59:28 +0100
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 30318122955;
	Thu,  5 Nov 2026 02:59:08 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1793843948; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wh3rkeiAMAtqT0dyAzB3R9VY7PKWSU32hBfsSb84LpA=;
	b=DwAoBuMUg/7owbjvenV/a33F1ywEjtRIhVyvbrAI+wJHQM0T1N8ubqCRcOBwGja6eVIzzy
	/xSfasdCK4zgEoDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1793843948; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wh3rkeiAMAtqT0dyAzB3R9VY7PKWSU32hBfsSb84LpA=;
	b=UsGimAXk9n8HJFpt/EaoK+SQjyGBCstYaGPl6wDrhxdlYHEsuMUkufTpc64mKfQSTKoYDg
	4bK/csN3xQ3uRIpdOcYDtH7YjV6ShPoCWpnd4u78XxbX+QtgXvA1UKlQdbnIQrCbarEUZb
	Z38azWDvTJ1gkkpWjtc4b3kuv+rmqYxAVQHTV55uMOvamqD4zfG6lazzBMl+780136j6Ri
	/ThwmZfCbWBi0AVEJkuS5yALusYWsSpflB9JfsxxTyEsRNtzSjgx+jVntmw7/OoejoNru0
	+t7l7dfxNHYGSd3iqEA3R3yNeXa38Y+ARgBqMr/Pmdr7psbrLqde57yebzYc8g==
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
        Andrea Mayer <andrea.mayer@uniroma2.it>, andrea@common-net.org
Subject: [PATCH net-next v2 5/5] selftests: seg6: add tests for PSP with a consumed SRH
Date: Thu,  5 Nov 2026 02:57:15 +0100
Message-Id: <20261105015715.57-6-andrea.mayer@uniroma2.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261105015715.57-1-andrea.mayer@uniroma2.it>
References: <20261105015715.57-1-andrea.mayer@uniroma2.it>
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
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

Extend srv6_end_flavors_test.sh with tests for the SRv6 End behavior
with the PSP flavor, alone and together with NEXT-C-SID, on packets that
carry a consumed SRH in front of the SRH to process.

Each test sends a ping along an existing SRv6 Policy, and a router on
the path inserts an extra SRH in front of the Policy's SRH. An End
behavior on another router consumes the extra SRH, and the router
connected to the host must then remove only the Policy's SRH.

These tests set seg6_enabled to 1 on the hosts, which must accept the
extra SRH, and set it back to 0 at the end. With seg6_enabled set to 1,
a host also accepts the packet when the Policy's SRH is not removed, or
when the extra SRH is removed in its place. For this reason, the
receiving host accepts the echo request only when its first SRH is the
extra SRH, with Segments Left 0 and followed by the ICMPv6 header. Any
other echo request is dropped, including one without any SRH. The extra
SRH is recognized by its last segment, which is the SID that triggered
its insertion.

The check on the receiving host uses the ip6tables srh match. Without
it, these tests are skipped. A test fails if the route that inserts the
extra SRH, or the rules on the receiving host, cannot be added.

Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
---
 tools/testing/selftests/net/config            |   1 +
 .../selftests/net/srv6_end_flavors_test.sh    | 280 +++++++++++++++++-
 2 files changed, 279 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 7a89e2618d4c..d5d2382b0b01 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -27,6 +27,7 @@ CONFIG_IP6_NF_IPTABLES=m
 CONFIG_IP6_NF_IPTABLES_LEGACY=m
 CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_MATCH_RPFILTER=m
+CONFIG_IP6_NF_MATCH_SRH=m
 CONFIG_IP6_NF_NAT=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_IP6_NF_TARGET_REJECT=m
diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 0355149bb7d6..157baa8ecb0b 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -22,8 +22,7 @@
 # flavors will be supported in the kernel.
 #
 # The purpose of the PSP flavor consists in instructing the penultimate node
-# listed in the SRv6 policy to remove (i.e. pop) the outermost SRH from the IPv6
-# header.
+# listed in the SRv6 policy to remove (i.e. pop) the SRH from the IPv6 header.
 # A PSP enabled SRv6 End behavior instance processes the SRH by:
 #  - decrementing the Segment Left (SL) value from 1 to 0;
 #  - copying the last SID from the SID List into the IPv6 Destination Address
@@ -263,6 +262,68 @@
 # the hosts). The loopback address of a host is reached only through the
 # router connected to that host: the ping succeeds only if the SRH is removed
 # by that router.
+#
+# Traffic with a consumed SRH
+# ---------------------------
+#
+# A packet can carry more than one SRH. The SRv6 End behavior skips an SRH with
+# SL=0 and processes the next header [1].
+#
+# The traffic of this section reuses the Policies (i.a), (i.b), (i.c) and (i.d).
+# A router on the path inserts an extra SRH in front of the Policy's SRH, and
+# another router then consumes the extra SRH.
+#
+# The Policy (i.a) has SID List=fcff:3::e,fcff:4::ef1,fcff:2::ef1,cafe::2. A
+# packet from hs-1 to hs-2 goes as follows:
+#
+#  - rt-1 applies the Policy and sends the packet to rt-3:
+#      IPv6 DA=fcff:3::e | Policy's SRH, SL=3 | Payload
+#
+#  - rt-3 (End) processes the Policy's SRH and sends the packet to rt-4:
+#      IPv6 DA=fcff:4::ef1 | Policy's SRH, SL=2 | Payload
+#
+#  - rt-4 (End with PSP and SL>1, acting as End) processes the Policy's SRH.
+#    The new DA is fcff:2::ef1:
+#      IPv6 DA=fcff:2::ef1 | Policy's SRH, SL=1 | Payload
+#    On rt-4, the route added by the test for fcff:2::ef1 then inserts the
+#    extra SRH, with SID List=fcff:3::e,fcff:2::ef1, and the packet goes back to
+#    rt-3:
+#      IPv6 DA=fcff:3::e | extra SRH, SL=1 | Policy's SRH, SL=1 | Payload
+#
+#  - rt-3 (End) consumes the extra SRH and sets the DA back to fcff:2::ef1:
+#      IPv6 DA=fcff:2::ef1 | extra SRH, SL=0 | Policy's SRH, SL=1 | Payload
+#
+#  - rt-2 (End with PSP) skips the extra SRH, processes the Policy's SRH and
+#    removes it. The Next Header of the extra SRH now indicates the payload
+#    instead of the Policy's SRH:
+#      IPv6 DA=cafe::2 | extra SRH, SL=0 | Payload
+#
+# The extra SRH reaches hs-2, which skips it as its SL is 0. The other
+# Policies work in the same way:
+#
+#   (i.b) hs-2 -> hs-1: on the packets with DA=fcff:1::ef1, rt-2 inserts the
+#         extra SRH with SID List=fcff:3::e,fcff:1::ef1, and rt-3 consumes it.
+#   (i.c) hs-1 -> hs-2: on the packets with DA=fcbb:0:20e9::, rt-4 inserts the
+#         extra SRH with SID List=fcff:3::e,fcbb:0:20e9::, and rt-3 consumes it.
+#   (i.d) hs-2 -> hs-1: on the packets with DA=fcbb:0:10e9::, rt-3 inserts the
+#         extra SRH with SID List=fcff:4::e,fcbb:0:10e9::, and rt-4 consumes it.
+#
+# The Policy (i.b) has no router between rt-2 and rt-1. For this reason, rt-2
+# applies the Policy, inserts the extra SRH and sends the packet to rt-3:
+#      IPv6 DA=fcff:3::e | extra SRH, SL=1 | Policy's SRH, SL=1 | Payload
+# rt-3 consumes the extra SRH, and rt-1 removes the Policy's SRH.
+#
+# The hosts need seg6_enabled set to 1 to accept the extra SRH, and it is set
+# back to 0 at the end. With seg6_enabled set to 1, a host also accepts the
+# packet when the Policy's SRH is not removed, or when the extra SRH is removed
+# in its place, as it skips every SRH with SL=0. For this reason, the receiving
+# host accepts the echo request only when its first SRH is the extra SRH, with
+# SL=0 and followed by the ICMPv6 header. Any other echo request is dropped,
+# including one without any SRH. The extra SRH is recognized by its last segment
+# (Segment List[0]), which is the SID that triggered its insertion (e.g.
+# fcff:2::ef1 for the Policy (i.a)).
+# These tests need ip6tables with the srh match, and they are skipped without
+# it.
 
 # shellcheck source=lib.sh
 source lib.sh
@@ -302,19 +363,35 @@ HOSTS=''
 
 SETUP_ERR=1
 
+# set by check_srh_match_support
+HAS_SRH_MATCH=false
+
 ret=${ksft_skip}
 nsuccess=0
 nfail=0
+nskip=0
 
 log_test()
 {
 	log_test_expected "$1" "$2" "$3"
 }
 
+# Log a test that is not run (same format as log_test_expected of lib.sh).
+log_test_skipped()
+{
+	local msg="$1"
+
+	nskip=$((nskip+1))
+	printf "    TEST: %-60s  [SKIP]\n" "${msg}"
+}
+
 print_log_test_results()
 {
 	printf "\nTests passed: %3d\n" "${nsuccess}"
 	printf "Tests failed: %3d\n"   "${nfail}"
+	if [ "${nskip}" -gt 0 ]; then
+		printf "Tests skipped: %2d\n" "${nskip}"
+	fi
 
 	# when a test fails, the value of 'ret' is set to 1 (error code).
 	# Conversely, when all tests are passed successfully, the 'ret' value
@@ -1052,6 +1129,181 @@ host_srv6_end_flv_next_csid_psp_tests()
 	check_and_log_hs_lo_addr_connectivity 2 1 "${END_CSID_PSP_FUNC}"
 }
 
+# On a router, add a route for a SID with seg6 encap in inline mode. The packets
+# that the router forwards to that SID get an extra SRH with the End SID of the
+# router that consumes it.
+# args:
+#  $1 - router on which the route is added
+#  $2 - SID of the route
+#  $3 - router with the SRv6 End behavior that consumes the extra SRH
+setup_rt_consumed_srh()
+{
+	local rt="$1"
+	local sid="$2"
+	local end_rt="$3"
+	local nsname
+
+	nsname="$(get_rtname "${rt}")"
+
+	ip -netns "${nsname}" -6 route \
+		add "${sid}" table "${LOCALSID_TABLE_ID}" \
+		encap seg6 mode inline \
+		segs "${LOCATOR_SERVICE}:${end_rt}::${END_FUNC}" \
+		dev "${DUMMY_DEVNAME}"
+}
+
+cleanup_rt_consumed_srh()
+{
+	local rt="$1"
+	local sid="$2"
+	local nsname
+
+	nsname="$(get_rtname "${rt}")"
+
+	ip -netns "${nsname}" -6 route \
+		del "${sid}" table "${LOCALSID_TABLE_ID}"
+}
+
+set_hs_seg6_enabled()
+{
+	local val="$1"
+	local hsname
+	local hs
+
+	for hs in ${HOSTS}; do
+		hsname="$(get_hsname "${hs}")"
+
+		ip netns exec "${hsname}" \
+			sysctl -wq net.ipv6.conf.all.seg6_enabled="${val}"
+		ip netns exec "${hsname}" \
+			sysctl -wq net.ipv6.conf.veth0.seg6_enabled="${val}"
+	done
+}
+
+# In a network namespace, accept the echo requests whose first SRH has the given
+# SID as last segment (Segment List[0]), SL=0 and the ICMPv6 header after it,
+# and drop any other echo request, including one without any SRH.
+# args:
+#  $1 - network namespace in which the rules are added
+#  $2 - expected last segment of the first SRH
+add_srh_check_rules()
+{
+	local nsname="$1"
+	local sid="$2"
+
+	ip netns exec "${nsname}" ip6tables -A INPUT \
+		-p ipv6-icmp --icmpv6-type echo-request \
+		-m srh --srh-lsid "${sid}" --srh-segs-left-eq 0 \
+		--srh-next-hdr 58 -j ACCEPT &&
+	ip netns exec "${nsname}" ip6tables -A INPUT \
+		-p ipv6-icmp --icmpv6-type echo-request -j DROP
+}
+
+# On a host, check that the echo requests carry the extra SRH alone.
+# args:
+#  $1 - host on which the rules are added
+#  $2 - expected last segment of the first SRH
+setup_hs_srh_check()
+{
+	local hs="$1"
+	local sid="$2"
+	local hsname
+
+	hsname="$(get_hsname "${hs}")"
+
+	add_srh_check_rules "${hsname}" "${sid}"
+}
+
+cleanup_hs_srh_check()
+{
+	local hs="$1"
+	local hsname
+
+	hsname="$(get_hsname "${hs}")"
+
+	ip netns exec "${hsname}" ip6tables -F INPUT
+}
+
+# Test a Policy with a consumed SRH: a router inserts the extra SRH on the
+# packets towards a SID, and another router consumes it. The destination host
+# accepts only the echo requests that carry the extra SRH alone.
+# args:
+#  $1 - router that inserts the extra SRH
+#  $2 - SID that triggers the insertion
+#  $3 - router with the SRv6 End behavior that consumes the extra SRH
+#  $4 - source host
+#  $5 - destination host
+#  $6 - suffix of the address on the loopback of the destination host
+#       (i.e. cafe::<host>:<suffix>), if any
+check_and_log_consumed_srh()
+{
+	local rt="$1"
+	local sid="$2"
+	local end_rt="$3"
+	local hssrc="$4"
+	local hsdst="$5"
+	local suffix="$6"
+	local msg
+
+	if ! ${HAS_SRH_MATCH}; then
+		msg="IPv6 Hosts connectivity: hs-${hssrc} -> hs-${hsdst}"
+		if [ -n "${suffix}" ]; then
+			msg="${msg} (${IPv6_HS_NETWORK}::${hsdst}:${suffix})"
+		fi
+		log_test_skipped "${msg}"
+		return
+	fi
+
+	if ! setup_rt_consumed_srh "${rt}" "${sid}" "${end_rt}"; then
+		log_test 1 0 "Extra SRH on rt-${rt} for ${sid}"
+		return
+	fi
+
+	if ! setup_hs_srh_check "${hsdst}" "${sid}"; then
+		log_test 1 0 "SRH check on hs-${hsdst} for ${sid}"
+	elif [ -n "${suffix}" ]; then
+		check_and_log_hs_lo_addr_connectivity "${hssrc}" "${hsdst}" \
+			"${suffix}"
+	else
+		check_and_log_hs_connectivity "${hssrc}" "${hsdst}"
+	fi
+
+	cleanup_hs_srh_check "${hsdst}"
+	cleanup_rt_consumed_srh "${rt}" "${sid}"
+}
+
+host_srv6_end_flv_consumed_srh_tests()
+{
+	local sid
+
+	log_section \
+		"SRv6 connectivity test hosts (h1 <-> h2, PSP with a consumed SRH)"
+
+	if ! ${HAS_SRH_MATCH}; then
+		echo "SKIP: ip6tables srh match not available"
+	fi
+
+	set_hs_seg6_enabled 1
+
+	# Policy (i.a): rt-4 inserts the extra SRH consumed by rt-3
+	sid="${LOCATOR_SERVICE}:2::${END_PSP_FUNC}"
+	check_and_log_consumed_srh 4 "${sid}" 3 1 2
+
+	# Policy (i.b): rt-2 inserts the extra SRH consumed by rt-3
+	sid="${LOCATOR_SERVICE}:1::${END_PSP_FUNC}"
+	check_and_log_consumed_srh 2 "${sid}" 3 2 1
+
+	# Policy (i.c): rt-4 inserts the extra SRH consumed by rt-3
+	sid="$(build_csid_container 2 "${END_CSID_PSP_FUNC}")"
+	check_and_log_consumed_srh 4 "${sid}" 3 1 2 "${END_CSID_PSP_FUNC}"
+
+	# Policy (i.d): rt-3 inserts the extra SRH consumed by rt-4
+	sid="$(build_csid_container 1 "${END_CSID_PSP_FUNC}")"
+	check_and_log_consumed_srh 3 "${sid}" 4 2 1 "${END_CSID_PSP_FUNC}"
+
+	set_hs_seg6_enabled 0
+}
+
 test_iproute2_supp_or_ksft_skip()
 {
 	local flavor="$1"
@@ -1102,6 +1354,28 @@ test_kernel_supp_or_ksft_skip()
 	ip netns del "${test_netns}"
 }
 
+# Before enabling the tests with a consumed SRH, make sure that the rules they
+# use can be added.
+check_srh_match_support()
+{
+	local srhm_ns
+
+	if [ ! -x "$(command -v ip6tables)" ]; then
+		return
+	fi
+
+	if ! setup_ns srhm_ns; then
+		return
+	fi
+
+	if add_srh_check_rules "${srhm_ns}" "${IPv6_TESTS_ADDR}" \
+		&>/dev/null; then
+		HAS_SRH_MATCH=true
+	fi
+
+	cleanup_ns "${srhm_ns}"
+}
+
 test_dummy_dev_or_ksft_skip()
 {
 	local test_netns
@@ -1145,6 +1419,7 @@ test_dummy_dev_or_ksft_skip
 # supports PSP also supports NEXT-C-SID.
 test_iproute2_supp_or_ksft_skip psp
 test_kernel_supp_or_ksft_skip psp
+check_srh_match_support
 
 set -e
 trap cleanup EXIT
@@ -1156,5 +1431,6 @@ router_tests
 host2gateway_tests
 host_srv6_end_flv_psp_tests
 host_srv6_end_flv_next_csid_psp_tests
+host_srv6_end_flv_consumed_srh_tests
 
 print_log_test_results
-- 
2.43.0

