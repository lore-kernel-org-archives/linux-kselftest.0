Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7253A6F0C
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777648501; cv=none; b=Kg2D+ZLjhztMdNT9tnj9PapFz2lw3JggRnds07+dioYIRUhc1urBYS7xwyOqW+AcSxfQLSl2ASC4hKREcXOFUrwzK3EIJFCqw6hr6tSjvX8cIL2tx9cziM5g5evnQeKbs8upKCuC/X6VWFwcyvgbq4DrHY/vN1H/CN4E7skrGmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777648501; c=relaxed/simple;
	bh=pgx4+xvjUVhKRcRqf68AvT3/u27B062g7R/oe/OG8Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fEhUvXISgehNpJbt4lAc/RHjiFTocVvNLlzOqNpAsJnyKinFIXbk2YbKBBM+cvU48/UTyixKQrFDl1oEifv+4kfmnQw6wa+DTT04GbyHPu3nBToPAxYyTpNBUIEExU0Mr8GUv8Idb0yNL2vtBE4nSCUFI35w+/gBVxVScnvjTdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wt6WlEDN; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wt6WlEDN"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso21938221fa.2
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777648497; x=1778253297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=llmIKEf8xgxsjh1iuIkSY/YxURawHxS+HKKjGXhYgvc=;
        b=Wt6WlEDNRZda1JyKmws08m8NhB3etOwNbN7rYW32XJyBzawVtlGg7FkqWKemVKIWiC
         dMPDOoQDJ7vWYdcTN4w6QbljItPU2IdoFNjKkfbo2mR7zT0CMWAR9AYKf8WJ97N8p48v
         t4EP6MHvtwLA+kWiGMFIa+qGGuYBNqvTaO5E+o8Epb4bInXHi9P8EVgQwGyN79cM8US7
         Fp91+nsI2AJUiT0bGd7k3937cPEmorzZRaGjDMOZ/EPbdCNPvkEMiWkloBGhSAIrO6IO
         UdGtoMGtBJdp0QeV89dDQ3ILT55i2eAIc0AM+ebUlq7HZ3bFCdT7oO0BSltNFHbNDyCg
         Ogtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777648497; x=1778253297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llmIKEf8xgxsjh1iuIkSY/YxURawHxS+HKKjGXhYgvc=;
        b=Mmvy8tr9+6Ns8+yuxpztT5skYy7oVjjbLIrG1WLljZ1bEKIjqd2zqBFm8D8m6fEGan
         4Ylh7O4G6gQQanoT8Imn/Mcw7bk4v+3agoAqBxqDbLXd5RfGwXD1W1hTontpz+oWlK46
         l4MpVV/GlIU7BFvY6rfpnNa33mACPRrxzNkxkqZNrLz3Y/ObkYeKjXwevcx3jNPv+jxa
         ZiOGxEBlL8T7yPWxxK/ljIJ8kB3QtXwXwLzvqXCXKVg4fJsZNKlNOOgG/+HKchjo1RVH
         prE5PG9qsgwSQ0iimDMF6EIVsiDKyjnq9Q9NLTH7kmTm3Z5PkH8TDjaY188RpltNcNW6
         C0jA==
X-Forwarded-Encrypted: i=1; AFNElJ8eio4cF0EYn3d4F1AouAOg1wlEc74vtGD1pevHsMxv7lxzZ1Oc0jGRtazi4UzP6hJtANanWa5TsGPHAYmXh5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyISVl6m2GkO+/hQiizZf7RjZVUAtqADjQIUmbXg2IiWTbfjEiz
	3hRChesxYrxIoJkVzOmXmsvSespI/EIrdmEjb7WYgrLJiF7FMvgy+JF2
X-Gm-Gg: AeBDieslRMmEeK4ZU8r/hZ5wdaWjGqyo+rKgBw7UaktP8EMfa52piJT2IqFCgph2H44
	h9jOFBDsfcnRbdNpnGkryjnMSJ/RODLxebEMFxHPyuENR5D5FwmbIX3u2PUaa1WoGIQImn8YE9U
	uLyzVappZimX1whhlOIM8TlxrdQkTpB/VBfpzozeVpkR2lh0OShSISKWsagt9GUbP5GWxmqlQth
	OZHMoAoyWAUpStWw6adWSyQGR9ARjTVw08jBgH+Vx6tRoB9uq5YrKtbyv57mSnLInFIca4xM8DJ
	f6rVoY/ZMSc9q01lumsnRGNFc1tJertxD6poDgwOXwDH7ouW1+LLVrhYzEPFNS8PF35wmeinwEY
	DBcEnsPzTnh9GUhXT6EgqP0EGY4VORRfUlZivSxkFrh5Fz3xhBhDNrPnmhsgISVOtSA7xcj9Cbn
	fH4R2FUnV96p2NTWEtNJsJHzP5AmlX+rB1xBXQ7mR5Rr4lRPna5Q87xoCoT/U0r5tQ6Flnjlg=
X-Received: by 2002:a2e:a54a:0:b0:38e:a883:62e9 with SMTP id 38308e7fff4ca-393643b72c6mr12372401fa.15.1777648496200;
        Fri, 01 May 2026 08:14:56 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936109039csm7984831fa.8.2026.05.01.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:14:55 -0700 (PDT)
From: Vastargazing <vebohr@gmail.com>
To: matttbe@kernel.org,
	martineau@kernel.org
Cc: mptcp@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Vastargazing <vebohr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] selftests: mptcp: add test for IPv6 subflow SLAB placement
Date: Fri,  1 May 2026 18:14:54 +0300
Message-ID: <20260501151454.211598-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mptcp_v6_initcall.sh to verify that MPTCP IPv6 subflow child
sockets are allocated from the TCPv6 SLAB cache, not the kmalloc-4k
fallback.

tcpv6_prot_override must copy tcpv6_prot after proto_register(&tcpv6_prot)
populates tcpv6_prot.slab. If the copy runs too early, override.slab
stays NULL (frozen by __ro_after_init) and subflow children fall back
to kmalloc-4k. This lacks SLAB_TYPESAFE_BY_RCU, allowing lockless
ehash lookups in __inet_lookup_established to read freed memory.

The test exercises the IPv6 accept path via MPTCP connections between
two network namespaces, then checks that the TCPv6 slab active object
count grew. On a fixed kernel, the delta is ~2 * NR_CONNS (one subflow
per side per connection); on a broken kernel, it stays near zero because
children land in kmalloc-4k instead.

Topology: two netns connected via veth pair with /64 ULA addresses;
NR_CONNS parallel short-lived MPTCP connections are established and held
open long enough to sample /proc/slabinfo. The test skips if
CONFIG_MPTCP_IPV6 is absent (checked via kallsyms) or /proc/slabinfo is
unreadable.

Verified on Ubuntu 6.17 kernel predating the fix: TAP "not ok 1 ...
TCPv6 slab gains MPTCPv6 subflow children" with delta=0. On kernels
with the fix, delta is well above the threshold of NR_CONNS/2.

Fixes: b19bc2945b40 ("mptcp: implement delegated actions")
Cc: stable@vger.kernel.org
Signed-off-by: Vastargazing <vebohr@gmail.com>
---
 tools/testing/selftests/net/mptcp/Makefile    |   1 +
 .../selftests/net/mptcp/mptcp_v6_initcall.sh  | 140 ++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 tools/testing/selftests/net/mptcp/mptcp_v6_initcall.sh

diff --git a/tools/testing/selftests/net/mptcp/Makefile b/tools/testing/selftests/net/mptcp/Makefile
index 22ba0da2adb8..c9f329441490 100644
--- a/tools/testing/selftests/net/mptcp/Makefile
+++ b/tools/testing/selftests/net/mptcp/Makefile
@@ -14,6 +14,7 @@ TEST_PROGS := \
 	mptcp_connect_splice.sh \
 	mptcp_join.sh \
 	mptcp_sockopt.sh \
+	mptcp_v6_initcall.sh \
 	pm_netlink.sh \
 	simult_flows.sh \
 	userspace_pm.sh \
diff --git a/tools/testing/selftests/net/mptcp/mptcp_v6_initcall.sh b/tools/testing/selftests/net/mptcp/mptcp_v6_initcall.sh
new file mode 100644
index 000000000000..c55fc74b5ffb
--- /dev/null
+++ b/tools/testing/selftests/net/mptcp/mptcp_v6_initcall.sh
@@ -0,0 +1,140 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Verify that MPTCP IPv6 subflow child sockets are allocated from the
+# TCPv6 slab cache.
+#
+# tcpv6_prot_override is initialised by copying tcpv6_prot, which is only
+# safe after proto_register(&tcpv6_prot) has populated tcpv6_prot.slab.
+# If the override copy runs too early during init, override.slab stays
+# NULL and __ro_after_init freezes that. Subflow child sockets then fall
+# back to kmalloc (kmalloc-4k for a TCPv6 sock), which lacks
+# SLAB_TYPESAFE_BY_RCU; lockless ehash lookups in __inet_lookup_established
+# can read freed memory.
+#
+# This test exercises the IPv6 accept path, which goes through the
+# override proto, and then asserts that the live TCPv6 slab population
+# grew. On a kernel where the override slab is NULL the delta is ~0,
+# because the children land in kmalloc-4k instead.
+
+#shellcheck disable=SC2086
+
+. "$(dirname "${0}")/mptcp_lib.sh"
+
+ns1=""
+ns2=""
+ret=0
+
+NR_CONNS=20
+TIMEOUT_POLL=30
+TIMEOUT_TEST=$((TIMEOUT_POLL * 2 + 1))
+PORT_BASE=20000
+
+# This function is used in the cleanup trap
+#shellcheck disable=SC2317,SC2329
+cleanup()
+{
+	for ns in "${ns1}" "${ns2}"; do
+		[ -n "${ns}" ] || continue
+		ip netns pids "${ns}" | xargs --no-run-if-empty kill -SIGKILL &>/dev/null
+	done
+	mptcp_lib_ns_exit "${ns1}" "${ns2}"
+}
+
+mptcp_lib_check_mptcp
+mptcp_lib_check_tools ip ss
+
+if ! mptcp_lib_kallsyms_has "tcpv6_prot_override$"; then
+	mptcp_lib_pr_skip "CONFIG_MPTCP_IPV6 not available"
+	exit ${KSFT_SKIP}
+fi
+
+if ! [ -r /proc/slabinfo ]; then
+	mptcp_lib_pr_skip "/proc/slabinfo not readable"
+	exit ${KSFT_SKIP}
+fi
+
+if ! awk '/^TCPv6 / { found = 1 } END { exit !found }' /proc/slabinfo; then
+	mptcp_lib_pr_skip "TCPv6 slab cache not present"
+	exit ${KSFT_SKIP}
+fi
+
+trap cleanup EXIT
+mptcp_lib_ns_init ns1 ns2
+
+ip -n "${ns1}" link add eth1 type veth peer name eth1 netns "${ns2}"
+ip -n "${ns1}" link set eth1 up
+ip -n "${ns1}" -6 addr add fc00::1/64 dev eth1 nodad
+ip -n "${ns2}" link set eth1 up
+ip -n "${ns2}" -6 addr add fc00::2/64 dev eth1 nodad
+
+# Wait for DAD-less addresses to settle
+ip -n "${ns1}" -6 route get fc00::2 >/dev/null 2>&1 || sleep 0.1
+
+get_tcpv6_active()
+{
+	awk '/^TCPv6 / { print $2 }' /proc/slabinfo
+}
+
+before=$(get_tcpv6_active)
+
+for i in $(seq 1 ${NR_CONNS}); do
+	echo "a" |
+		timeout ${TIMEOUT_TEST} \
+			ip netns exec "${ns2}" \
+				./mptcp_connect -6 -p $((PORT_BASE + i)) -l \
+					-t ${TIMEOUT_POLL} -w ${TIMEOUT_POLL} \
+					:: >/dev/null 2>&1 &
+done
+
+# wait_local_port_listen() only checks one port. Walk every port so we
+# do not start the connectors before all listeners are ready.
+for i in $(seq 1 ${NR_CONNS}); do
+	mptcp_lib_wait_local_port_listen "${ns2}" $((PORT_BASE + i))
+done
+
+for i in $(seq 1 ${NR_CONNS}); do
+	echo "b" |
+		timeout ${TIMEOUT_TEST} \
+			ip netns exec "${ns1}" \
+				./mptcp_connect -6 -p $((PORT_BASE + i)) \
+					-t ${TIMEOUT_POLL} -w ${TIMEOUT_POLL} \
+					fc00::2 >/dev/null 2>&1 &
+done
+
+# Wait for the accept side to materialise child sockets. ss reports the
+# number of established TCP connections in ns2 owned by mptcp_connect.
+established=0
+for _ in $(seq 20); do
+	established=$(ip netns exec "${ns2}" ss -H -t -6 state established 2>/dev/null | wc -l)
+	[ "${established}" -ge "${NR_CONNS}" ] && break
+	sleep 1
+done
+
+after=$(get_tcpv6_active)
+delta=$(( after - before ))
+
+# Conservative threshold: NR_CONNS connections (each producing at least
+# a server-side accepted child) must leave a clearly observable footprint
+# in the TCPv6 slab. On a regressed kernel, override.slab == NULL routes
+# every child into kmalloc-4k and the TCPv6 delta stays near zero.
+threshold=$(( NR_CONNS / 2 ))
+
+msg="TCPv6 slab gains MPTCPv6 subflow children"
+mptcp_lib_print_title "${msg}"
+if [ "${established}" -lt "${NR_CONNS}" ]; then
+	mptcp_lib_pr_fail "only ${established}/${NR_CONNS} connections established"
+	mptcp_lib_result_fail "${msg}"
+	ret=${KSFT_FAIL}
+elif [ "${delta}" -ge "${threshold}" ]; then
+	mptcp_lib_pr_ok "delta=${delta}"
+	mptcp_lib_result_pass "${msg}"
+else
+	mptcp_lib_pr_fail "delta=${delta} below ${threshold}:" \
+		"subflow children likely in kmalloc fallback"
+	mptcp_lib_result_fail "${msg}"
+	ret=${KSFT_FAIL}
+fi
+
+mptcp_lib_result_print_all_tap
+exit ${ret}
-- 
2.51.0

