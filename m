Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772846;
	b=ZaoxWq5CRDwieQ5+jlAFQ/HH+sSR9A77vf4KAmPetydoYypddZRB9jso+/SHVdF8RCli
	 zbf9GNXrdZUc6PmgS46x2MD+LiuIVIt2VJGaN5uS5ec/GRLQv8EaBWVQl728g7AUhVezH
	 t60qkB3/VYd+Y1jzquBRmcCy8zLgM99+qteoOjyDy0MMlpjuhjp6Ba5WcPcTcWJZSeQkt
	 86FIp1UUJL1uGnnAKRUKlCW4TnK/I7Qq2aU9BEiOPoA0S5E4eyttEEItCvKcy+Z1moLOk
	 +76mlAd3k8FiLBgKOiGmxh8qfsFyfCBvzJzGdlFsaQtouLWtm7C28OOSJJlyJyF2zaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GaxnK0prph0NSBW4AGT4rQ4rROqtc8384QZqDJanFFY=;
	b=A6lFn58nbcR2BGvhqvt1mnwP58vbXZdAW6TKWBlXNZmzHsu5luBpwozgIW8oHLbj8kmw
	 0F66dSsbZfSgKD9Md0coMJau7xUCQFNQWbw4BuJnMpAf6R7v6db8Azoor/Lpe8nrCm02G
	 0Oe9RRA3jRbwXULsjlHXWZ2paxWiYbuyXrhcHwApKJnSEkLjrqV4kad4ytthhayPO/Is1
	 euGvxE/5JgGsj7CMFPxULzPa1rFBPssUr/r+TpMiXmwfgKTMYTDnoBxxhmcVqePvNFn6M
	 5LVvf+TZ+NZ+cigT/Vykxu0DsuXFAsQA3md6bGlD57QJXsnprnPGS6lDgmYqg7SOppQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=Dt05Jitg;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75E606A32C
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D75E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=Dt05Jitg
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so11671216c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 01:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772845; x=1796377645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaxnK0prph0NSBW4AGT4rQ4rROqtc8384QZqDJanFFY=;
        b=Dt05Jitgy+9HI5fYN14QXTv6+01LegeVbF9TXAsR9M05J8FkqFIb+U6bfYUp4099e6
         c8W5b6TstZgBmSnHB322MsVOhOk5tFCYCSmw0erTnXDYrRM+clEIorqn/5BlG6gPc20b
         89gMx41r1BG+LcsOZgWP8QUShWZLGINk4CUXbnFCztqtJDjfiKn95dm44pky6ADp0ShV
         g1OL0DjKU7azgglUA4ahtSck/rmCyac0id9PMkFpfDVZouLIotCTcIF7+m12zOmpkxX1
         bl8H656QIC6TkVLKZQusDPgVP2lj66s8A7+I66amynpbHtMJcmF54ua6/V8ZD9kRlHjK
         Pmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772845; x=1796377645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GaxnK0prph0NSBW4AGT4rQ4rROqtc8384QZqDJanFFY=;
        b=skpHqI90M4vUdMf6RnbN0V4D2i75zSAb38EBKxhnioK+IePwZl9BJzGaRlsCv1cYKu
         eHZO9x2vZWyH9kQMfQwnVil7ZqlU8Vr243I0cUHAxX9RVNUnLMA/aIMIOLCR8jrkct8r
         kg0n1WnFRLOOoxhlNnf4AYQKfNldyZzzQ5BVL6pyxhh0hFkafBrc0N+4nb1HSAXM+Rkd
         HVqPrCFlFyDV8tZEnzasG4b33eq9MSdRYF3+wRvUDuYHYoThmRWwjmdGkKnD4PeMZb0k
         bgootGCpVga4J/6UTYNrbGJClFwo1xXzXS1m65RGaszhoppLgmkR/3jF6tWdqF01xt0e
         JwCQ==
X-Forwarded-Encrypted: i=1; AL+hErGFLTmj/2NvQHEGZTFOWqVeMWOJ/4rFxc2gFfO6NJpVDhlC1OyBAN9d17IhWTCvPofd3olGdQZw+E9+5slQ4Dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gewN7hQCG7c++S2vKlSROBGXti9S15YqzbVKtElPIDoTkmGCY
	+A79EjCHQCUBQ+Dx72qhNLxCVN4RYoU+jTiA44kCtacG7+IcdRVcgKl0RD4PvGvQey4=
X-Gm-Gg: AZFdTZfPhLm9kSLkPklsBRFET4lMfwqAXCHxv4pbggRaV0P8BJRL62jexLDY4HQ6WrM
	hiWuB8Tn2COI3bzQMf6pdfGw51uB9SxWCimCl8RHnk4L/YTJKL3RntogkNrFEYHGsx7CH4U6gZE
	mQ+pMT6VZAiTdWE0PHZ3VpOlszU6uWdevqlrzgvGxA39Q7LJJ3h1Xp6TGTShZ4/hnxgCTfQAlWk
	SSUnPcSLwV/jgfIQTA0bolBBZFvA2L5qbjpXhiWgpKEM2MG2uiQTeKm16fv6t3qVmGeerOeWe5B
	qaBahqFQN+UrRTmrd/dQlo0EMsm6WUil3oIag/0t8W7HQQYH14VjeT1ffEYToxCJAsC7KYOG2Xz
	v3NYlj7UZnW0Ed8hXlx8lv0lc1hefEJ05iGTt5ugnpim/T5fNcuHCpCguTXl5alc5tFggd4Mo/W
	OH7Vku2T31yxo3iT0bqKyzoaZmrIwY5aWapfa81Lz5GR8iMV+GmuEmaVNx2N1m63hcH5OSizn43
	b7WwgVMLc6vC3BNT8EfDw3cTDzz0EHtLYRRzVD9fKZxauQn+ujSa7kOa6PWSaq+Xan4zl+ECGUi
	tqRpo1Ov4C7WcIUy3VCMBDAedeECFUeROaQfW+/SjCY46eAacN7xyRh724eKY7tD3rR9G25pvph
	JL4kE3SyeHZFbRNCCOrZfMa0Ox3I=
X-Received: by 2002:a05:7022:ed02:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b5568f335cmr22938557c88.24.1795772845139;
        Fri, 27 Nov 2026 01:47:25 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:24 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 12/12] selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes
Date: Fri, 27 Nov 2026 09:47:03 +0000
Message-ID: <20261127094703.3025517-13-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
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

amt_v6.sh builds a gateway and a relay over an IPv6 outer transport and
checks the data plane, but only with valid attributes. The link-creation
rules this series adds for IFLA_AMT_LOCAL_IP6 and IFLA_AMT_DISCOVERY_IP6
are not exercised.

This adds a small companion without a data plane: one netns and one
dummy device, no relay, socat or smcroute. It checks that the IPv6
local and discovery addresses of a gateway, and the local address of a
relay, read back through amt_fill_info(), that a relay reports no
discovery address, that an IPv4 gateway still creates and reports its
IPv4 discovery address, and that an IPv4 relay still accepts the IPv4
discovery address it has always ignored. It then checks each rejection:
a gateway without a discovery address, a gateway whose local and
discovery addresses differ in family (both ways), an IPv6 relay given a
discovery address of either family, an IPv4 relay given an IPv6 one,
and an unspecified, loopback, multicast or IPv4-mapped IPv6 local or
discovery address. Each rejection is matched on its extack message as
well as on the failure, so a rule that fails for the wrong reason is not
a pass.

Three cases are left out because iproute2 cannot express them: both
`discovery <v4>` and `discovery <v6>`, or both `local <v4>` and
`local <v6>`, in one command, and a 16-byte IFLA_AMT_LOCAL_IP or
IFLA_AMT_DISCOVERY_IP. iproute2 rejects the repeated argument before it
builds a message, and with IPv6 support it never sends 16 bytes in an
IPv4 attribute, so those checks are reachable only from a raw netlink
client or an older iproute2.

The probe checks the readback as well as the result. An iproute2 without
the IPv6 attributes may pack the 16-byte IPv6 literal into the IPv4
attribute. This kernel refuses that with the exact length of the
attribute ("binary attribute size out of range"), which is logged as a
passing test before the probe skips, since it is the rule an older
iproute2 exercises. A kernel without that rule builds an IPv4 gateway
from the first four bytes instead, so `discovery 2001:db8:a::2` becomes
32.1.13.184; the probe reads an address without a colon back and skips,
as four truncated bytes cannot be told from an IPv4 address. The probe
also skips on an iproute2 that rejects the literal or does not know amt,
on a kernel that ignores the attributes ("Local attribute is required"),
on one without amt ("Unknown device type") and on one without IPv6
("IPv6 support is disabled", or no /proc/net/if_inet6). Any other
failure to create the probe link is a FAIL.

The script uses lib.sh: setup_ns for the namespace, check_err and
log_test for reporting, and $ksft_skip when a prerequisite is missing.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 tools/testing/selftests/net/Makefile     |   1 +
 tools/testing/selftests/net/amt_gw_v6.sh | 210 +++++++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100755 tools/testing/selftests/net/amt_gw_v6.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index a31f19e9f..bd6c08d11 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -9,6 +9,7 @@ CFLAGS += -I../
 TEST_PROGS := \
 	altnames.sh \
 	amt.sh \
+	amt_gw_v6.sh \
 	amt_v6.sh \
 	arp_ndisc_evict_nocarrier.sh \
 	arp_ndisc_untracked_subnets.sh \
diff --git a/tools/testing/selftests/net/amt_gw_v6.sh b/tools/testing/selftests/net/amt_gw_v6.sh
new file mode 100755
index 000000000..38858cbc9
--- /dev/null
+++ b/tools/testing/selftests/net/amt_gw_v6.sh
@@ -0,0 +1,210 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Netlink coverage for the AMT IPv6 attributes, IFLA_AMT_LOCAL_IP6 and
+# IFLA_AMT_DISCOVERY_IP6, and the rules that validate them. amt_v6.sh covers
+# the data plane; this needs only one netns and one dummy device.
+#
+# Not covered: `discovery <v4>` together with `discovery <v6>`, or `local <v4>`
+# together with `local <v6>`, in one command. iproute2 rejects the duplicate
+# argument itself, so those checks are reachable only from a raw netlink
+# client.
+
+source lib.sh
+
+readonly V6_LOCAL="2001:db8:a::1"
+readonly V6_DISC="2001:db8:a::2"
+readonly V4_LOCAL="192.168.0.1"
+readonly V4_DISC="192.168.0.2"
+
+# add_amt <name> <args...>: create an amt link on gw_dev, stderr in $ADD_ERR.
+add_amt()
+{
+	local name=$1; shift
+
+	ADD_ERR=$(ip -n "$GW" link add "$name" type amt dev gw_dev "$@" 2>&1)
+}
+
+# amt_field <name> <key>: one attribute as amt_fill_info reports it.
+amt_field()
+{
+	ip -n "$GW" -d -j link show "$1" 2>/dev/null |
+		jq -r ".[0].linkinfo.info_data.$2 // empty"
+}
+
+# An iproute2 without IFLA_AMT_DISCOVERY_IP6 may not reject `discovery
+# <v6>`: it can pack the literal into IFLA_AMT_DISCOVERY_IP, which this
+# kernel refuses ("binary attribute size out of range", from the exact
+# length of the attribute) and an older one turns into a v4 gateway from the
+# first four bytes. So probe on the readback, not only on the exit code. A
+# kernel without the IPv6 attributes ignores them and asks for a local
+# address, and one without amt does not know the link type. Skip in those
+# cases only; any other failure is a failure of the code under test.
+probe_v6_gateway()
+{
+	local got
+
+	if ! ip link help 2>&1 | grep -q amt; then
+		echo "SKIP: missing amt support in iproute2"
+		exit "$ksft_skip"
+	fi
+
+	if ! add_amt amtprobe mode gateway local "$V6_LOCAL" \
+	     discovery "$V6_DISC"; then
+		case "$ADD_ERR" in
+		*"binary attribute size out of range"*)
+			# An older iproute2 on this kernel: the exact length of
+			# the IPv4 attribute is what refused the 16 bytes.
+			RET=0
+			log_test "16-byte IPv4 address attribute is refused"
+			echo "SKIP: iproute2 lacks IPv6 AMT support"
+			exit "$ksft_skip"
+			;;
+		*"Local attribute is required"*|*"expected rather than"*|\
+		*"IPv6 support is disabled"*|*"Unknown device type"*|\
+		*"Operation not supported"*)
+			echo "SKIP: no IPv6 AMT support: $ADD_ERR"
+			exit "$ksft_skip"
+			;;
+		esac
+		echo "FAIL: cannot create an IPv6 gateway: $ADD_ERR"
+		exit "$ksft_fail"
+	fi
+	got=$(amt_field amtprobe discovery)
+	ip -n "$GW" link del amtprobe
+	if [[ "$got" != *:* ]]; then
+		# The attributes are exactly four bytes, so this is an iproute2
+		# that truncated the literal to an IPv4 address, or prints the
+		# IPv6 one under another key. Four truncated bytes cannot be
+		# told from a real IPv4 address, and the kernel did what it
+		# should.
+		echo "SKIP: iproute2 lacks IPv6 AMT support (read back '$got')"
+		exit "$ksft_skip"
+	fi
+}
+
+test_v6_gateway_roundtrip()
+{
+	RET=0
+	add_amt amtg6 mode gateway local "$V6_LOCAL" discovery "$V6_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtg6 discovery)" = "$V6_DISC" ]
+	check_err $? "discovery did not read back as $V6_DISC"
+	[ "$(amt_field amtg6 local)" = "$V6_LOCAL" ]
+	check_err $? "local did not read back as $V6_LOCAL"
+	ip -n "$GW" link del amtg6 2>/dev/null
+	log_test "v6 gateway: discovery round-trips through fill_info"
+}
+
+test_v6_relay_roundtrip()
+{
+	RET=0
+	add_amt amtr6 mode relay local "$V6_LOCAL"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtr6 local)" = "$V6_LOCAL" ]
+	check_err $? "local did not read back as $V6_LOCAL"
+	[ -z "$(amt_field amtr6 discovery)" ]
+	check_err $? "a relay reported a discovery address"
+	ip -n "$GW" link del amtr6 2>/dev/null
+	log_test "v6 relay: local round-trips, no discovery reported"
+}
+
+test_v4_gateway_unchanged()
+{
+	RET=0
+	add_amt amtg4 mode gateway local "$V4_LOCAL" discovery "$V4_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtg4 discovery)" = "$V4_DISC" ]
+	check_err $? "discovery did not read back as $V4_DISC"
+	ip -n "$GW" link del amtg4 2>/dev/null
+	log_test "v4 gateway still creates (no ABI change)"
+}
+
+# An IPv4 relay has always ignored IFLA_AMT_DISCOVERY_IP, and still must.
+test_v4_relay_unchanged()
+{
+	RET=0
+	add_amt amtr4 mode relay local "$V4_LOCAL" discovery "$V4_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	ip -n "$GW" link del amtr4 2>/dev/null
+	log_test "v4 relay still accepts a v4 discovery (no ABI change)"
+}
+
+# expect_reject <description> <extack substring> <args...>: the create must
+# fail, and for the stated reason.
+expect_reject()
+{
+	local desc=$1 want=$2; shift 2
+
+	RET=0
+	add_amt amtbad "$@"
+	check_fail $? "link was created but should have been rejected"
+	ip -n "$GW" link del amtbad 2>/dev/null
+	grep -qi -- "$want" <<< "$ADD_ERR"
+	check_err $? "rejected for the wrong reason: $ADD_ERR"
+	log_test "$desc"
+}
+
+require_command jq
+if [ ! -e /proc/net/if_inet6 ]; then
+	echo "SKIP: the kernel has no IPv6"
+	exit "$ksft_skip"
+fi
+trap cleanup_all_ns EXIT
+setup_ns GW || exit "$ksft_skip"
+ip -n "$GW" link add gw_dev type dummy
+ip -n "$GW" link set gw_dev up
+ip -n "$GW" addr add "$V4_LOCAL/24" dev gw_dev
+# nodad: a tentative source address would race link creation.
+ip -n "$GW" addr add "$V6_LOCAL/64" dev gw_dev nodad
+
+probe_v6_gateway
+
+test_v6_gateway_roundtrip
+test_v6_relay_roundtrip
+test_v4_gateway_unchanged
+test_v4_relay_unchanged
+expect_reject "gateway without discovery is rejected" \
+	"Discovery attribute" \
+	mode gateway local "$V6_LOCAL"
+expect_reject "gateway v6 local + v4 discovery is rejected" \
+	"of the local family is required" \
+	mode gateway local "$V6_LOCAL" discovery "$V4_DISC"
+expect_reject "gateway v4 local + v6 discovery is rejected" \
+	"of the local family is required" \
+	mode gateway local "$V4_LOCAL" discovery "$V6_DISC"
+expect_reject "v6 discovery in relay mode is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V6_LOCAL" discovery "$V6_DISC"
+expect_reject "v4 discovery on a v6 relay is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V6_LOCAL" discovery "$V4_DISC"
+expect_reject "v6 discovery on a v4 relay is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V4_LOCAL" discovery "$V6_DISC"
+expect_reject "unspecified v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::
+expect_reject "v4-mapped v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::ffff:192.168.0.1
+expect_reject "loopback v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::1
+expect_reject "multicast v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ff02::1
+expect_reject "multicast v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ff02::1
+expect_reject "loopback v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::1
+expect_reject "unspecified v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::
+expect_reject "v4-mapped v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::ffff:192.168.0.2
+
+exit "$EXIT_STATUS"
