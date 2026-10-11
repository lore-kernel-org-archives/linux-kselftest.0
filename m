Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9C61799F;
	Sun, 11 Oct 2026 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746667; cv=none; b=m7A5f20wI6wSWktdqjNSaEIAjrBCeM1MZUnuvPk/MNqAqi33XQB390mXotgoWoTYYyEOqPqMjNG6CA8UhoRlvlNf0se/5n+YJw29ECyunC86+B4shtx9G+0w+z/74lftLKQMYxH14Jp5+GFrZ6ElyTdnCV11rK6kiHHOcW47q3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746667; c=relaxed/simple;
	bh=9IaWpDWJk5Gbi278t0rT7Lai/uFkUewnHTJkpfN79Fg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=afno5lvKO82SvOfwX/8ihTNvx5IYGLyG9Zm8AOnpON/LMYcLdoJFPj4zwMA8llRWhnudQ1/aY0UwI3MRffXDRznILLa50nLCvNTLrk20KUX4HUD9asjRlMeO1r25zivamV25x0Tzl8PtvN4TyU9t9oUZhaha+4Yr3DhJGi2iTsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=F9KXUcur; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=HESeCpbu; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="F9KXUcur";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="HESeCpbu"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 69BJNmLK010979;
	Sun, 11 Oct 2026 21:23:53 +0200
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 0A24C122951;
	Sun, 11 Oct 2026 21:23:33 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1791746613; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3khTIdJtKuzUeBNVkUrLUTx/1NTsYsHs6hwG6zduTg0=;
	b=F9KXUcurreqFlPdVhGXHkkFbdch7Dd8Tk2R2JqLMPzgvRgwZDsGs2nbGTPaZ1/4/+69Ip/
	KprCOtHzjuebjkCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1791746613; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3khTIdJtKuzUeBNVkUrLUTx/1NTsYsHs6hwG6zduTg0=;
	b=HESeCpbuWWCToS8veXEQSWGB7XVC0zlyP4Xcp8FwoDbvel9GRSGxtQvAn5yC81Z6UPUuu4
	pvoiypOFc87C5rZVoufpYUu21pnp72MYi3e0aqKvEbqRsrzep6bxuCfm+ioZ0seaTTmpTv
	Eqg2kNpQJ0we3OOAFvFsWBldxUhGt6jkqClM8aOesTsTajv/+aJiBSQLVp/avqo4mhCvwv
	k3FktKo3+eCimsvgrqaNaTHqnmqPmAH5/Wx4RxrNVfSsnNrTm9pJpqZU9vitqiKMW9WLhh
	GvCQBdAwz0LMYaBjiDFOYvzJ2LumkQ2glzRgkWcHfEoFynXiiiUXYCvhE119rw==
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
Subject: [PATCH net-next 5/5] selftests: seg6: add tests for PSP with a consumed SRH
Date: Sun, 11 Oct 2026 21:23:10 +0200
Message-Id: <20261011192310.55-6-andrea.mayer@uniroma2.it>
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
with the PSP flavor, alone and together with NEXT-C-SID, on packets that
carry a consumed SRH in front of the SRH to process.

Each test sends a ping along an existing SRv6 Policy, and a router on
the path inserts an extra SRH in front of the Policy's SRH. An End
behavior on another router consumes the extra SRH, and the router
connected to the host must then remove only the Policy's SRH. A test
passes if the ping succeeds.

These tests set seg6_enabled to 1 on the hosts, which must accept the
extra SRH, and set it back to 0 at the end. PSP itself is checked
by the other PSP tests, which run with seg6_enabled set to 0.

Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
---
 .../selftests/net/srv6_end_flavors_test.sh    | 144 +++++++++++++++++-
 1 file changed, 142 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index baa1b09a1aab..b5dbf53a7f23 100755
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
@@ -258,6 +257,60 @@
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
+#    removes it:
+#      IPv6 DA=cafe::2 | extra SRH, SL=0 | Payload
+#
+# The extra SRH reaches hs-2, which skips it as its SL is 0. The other
+# Policies work in the same way:
+#
+#   (i.b) hs-2 -> hs-1: on the packets with DA=fcff:1::ef1, rt-2 inserts the
+#         extra SRH with SID List=fcff:3::e,fcff:1::ef1, and rt-3 consumes it.
+#   (i.c) hs-1 -> hs-2: on the packets with DA=fcbb:0:02a1::, rt-4 inserts the
+#         extra SRH with SID List=fcff:3::e,fcbb:0:02a1::, and rt-3 consumes it.
+#   (i.d) hs-2 -> hs-1: on the packets with DA=fcbb:0:01a1::, rt-3 inserts the
+#         extra SRH with SID List=fcff:4::e,fcbb:0:01a1::, and rt-4 consumes it.
+#
+# The Policy (i.b) has no router between rt-2 and rt-1. For this reason, rt-2
+# applies the Policy, inserts the extra SRH and sends the packet to rt-3:
+#      IPv6 DA=fcff:3::e | extra SRH, SL=1 | Policy's SRH, SL=1 | Payload
+# rt-3 consumes the extra SRH, and rt-1 removes the Policy's SRH.
+#
+# The hosts need seg6_enabled set to 1 to accept the extra SRH, and it is set
+# back to 0 at the end. These tests only check that the ping succeeds: PSP
+# itself is checked by the PSP flavor and NEXT-C-SID,PSP tests, which run with
+# seg6_enabled set to 0.
 
 # shellcheck source=lib.sh
 source lib.sh
@@ -967,6 +1020,92 @@ host_srv6_end_flv_next_csid_psp_tests()
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
+host_srv6_end_flv_consumed_srh_tests()
+{
+	local sid
+
+	log_section "SRv6 connectivity test hosts (h1 <-> h2, consumed SRH)"
+
+	set_hs_seg6_enabled 1
+
+	# Policy (i.a): rt-4 inserts the extra SRH consumed by rt-3
+	sid="${LOCATOR_SERVICE}:2::${END_PSP_FUNC}"
+	setup_rt_consumed_srh 4 "${sid}" 3
+	check_and_log_hs_connectivity 1 2
+	cleanup_rt_consumed_srh 4 "${sid}"
+
+	# Policy (i.b): rt-2 inserts the extra SRH consumed by rt-3
+	sid="${LOCATOR_SERVICE}:1::${END_PSP_FUNC}"
+	setup_rt_consumed_srh 2 "${sid}" 3
+	check_and_log_hs_connectivity 2 1
+	cleanup_rt_consumed_srh 2 "${sid}"
+
+	# Policy (i.c): rt-4 inserts the extra SRH consumed by rt-3
+	sid="$(build_csid_container 2 "${END_CSID_PSP_FUNC}")"
+	setup_rt_consumed_srh 4 "${sid}" 3
+	check_and_log_hs_lo_addr_connectivity 1 2 "${END_CSID_PSP_FUNC}"
+	cleanup_rt_consumed_srh 4 "${sid}"
+
+	# Policy (i.d): rt-3 inserts the extra SRH consumed by rt-4
+	sid="$(build_csid_container 1 "${END_CSID_PSP_FUNC}")"
+	setup_rt_consumed_srh 3 "${sid}" 4
+	check_and_log_hs_lo_addr_connectivity 2 1 "${END_CSID_PSP_FUNC}"
+	cleanup_rt_consumed_srh 3 "${sid}"
+
+	set_hs_seg6_enabled 0
+}
+
 test_iproute2_supp_or_ksft_skip()
 {
 	local flavor="$1"
@@ -1071,5 +1210,6 @@ router_tests
 host2gateway_tests
 host_srv6_end_flv_psp_tests
 host_srv6_end_flv_next_csid_psp_tests
+host_srv6_end_flv_consumed_srh_tests
 
 print_log_test_results
-- 
2.43.0

