Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E7D3B47F3
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783883806; cv=none; b=pUpFpqLcwzJd9eIRDU3he+zIGO2j8tGSHHrTGQH5fgjOYBAPEde2O4MSwugYYz9nLmEF0x1CWmh3jm1AI6zQhuOWVgCBlGK07f77tsn8X32KVvwY53S4v57JF9jt6tcNGiT/2VmX3FAT1WSYgH2dbfGKbtgEB5nqeDLobKS5VA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783883806; c=relaxed/simple;
	bh=4A2wcwDC6TPVtBJOGPAh+xGITBtauaoPQY/X+WGFWGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/AsQylOt/npKX3WKhgmA7AlX3bKAV7IfklsINWaX7YaWha2CWCW/XysVwgEpnEUzGssBM+DXwwW5Yt4kx7GQ/xcVPNuaD3y0xWGR1eWMY3HQIQVcDZ86c1iIO3cgGa1geZeNcDGiTrQNxsWCb80pdi2tWkhb9cT5IjyxILg/q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjkQ/WcZ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjkQ/WcZ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848d21bbaffso1080262b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 12:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783883804; x=1784488604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aESVowwE0I7p07cBsP5Kpg2lfQJQkDpRnjETImztddg=;
        b=cjkQ/WcZVfZJxirWLyDzNe2Pu0IRE6qnUPmNMmqYY/vMK4qYvYNlFDkao7QdQMsAtc
         LJbwWfb467VFctkWLIMJiFLfC7OKq9rIa0AIO5Fq3iC/9rtnp5xTCrUezgRHnZFNhObd
         cMEziYVJqbyCzg6xFkRI9HLJb3J/TrQxOBs5Q8dVE0M+aYnNgzj0DUHSkuvvmilXspJ0
         cAzQ7RF9Je6awvcczSKPEjCxItH2dxoOYXt0yZ+ibJdk/phz04VmjcESJuOUGiIAMuPS
         u3n79h3XD7c7cbzj3E4v3NHIohtljscCv4guHyXtv2Id4yo1uGdLj0TtymjTQcoq13zs
         5jOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783883804; x=1784488604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aESVowwE0I7p07cBsP5Kpg2lfQJQkDpRnjETImztddg=;
        b=sjrXYDhZpB4oU8oEEKz3Y6RaDvNNv+xU+CLjizuCm62JUhCUJqQ9KvNt3S8qRr8eTx
         PWAUfxtqLeFd3ucHJInmFv8kS1q/QgBb5bkbZCxBLxbJbJPw8dnPbTr/zlm89SqnQnKg
         Mviw+Akrws0ERs+hc8HO/iC+Y8bL57u5P9LJT9VI6I9uZFoR5L4gBhvnkJvHlFuNPmac
         p1PKP8UApcR5v+lRb2iOwJ77NwXYvMDgVOXBxOfkEMNSTUGeSInyDtph/NGr5TS1/QSZ
         SFkrhOBbKBn56w0DzAI4H2B0DIzZlXKDYnKVl06WMhL00q1KiEb7CgAELaFJqYrSJZ8k
         echw==
X-Forwarded-Encrypted: i=1; AHgh+Royy/ZbW0t8tvTYk0rjj79rdp8OWwtD6dBKKpIiHnl04wYavGeVVyuUVXGdqDijg0cH7Jw1eSvsvXXg/1zKlRI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8pknabsLa+OIdARmH6pZ63NpeBFVDtGpr2hGNe2hTML4ZMADd
	lOLc6AcS89ACbDl9gemnU9ZqxIHC7Vb0mwSTKu3UarIiZSIFhfEqkFWsT8xyJdoG
X-Gm-Gg: AfdE7cn+12zdN5zluWUSXW+23O19uRX4QKsZmx7nm9WUQqr0uS3H3RPKoqfCXA1VRJa
	7GoH1vQl9zdRRrvyJY3WcpAmXBhxx7IEC1sseMUNsaq15/Fn5pOi4c7PUIE5NdzEyzdM5U8UDkC
	5LgRupLCFuBBYp5pTLR10YJRSWLoK+uZxVGAryZZJtXm8xltYcVWU2lUJvfDcu/COi28/d0iOLQ
	cVU8pS8csTS8fLlAqg5wJBBdjYaFaReLOPi/MnPNXwflzJe3u6P7+/PHGvwSD7/Z/dI8ucVNid5
	LItys787+/0nQABYtVGp8jNpG1MAM/8OmSlc1SqGt6qZ4Nm4veDFOYDAclqyMMiHN1xJ+X23Tl7
	/WEn3gKYfXCbc4vdedNFT6CsmXo1tKIiYp1/PF3/xSmekqmQL2kMAuGzL0QftJUgSDhDejorBt7
	yvN4ZeuMPEGvgrKJZy8AqcnEVUtzsjGCw0y6i/ZfHmzFLcMQ==
X-Received: by 2002:a05:6a00:2346:b0:848:2f84:736 with SMTP id d2e1a72fcca58-8488990b70amr6054703b3a.73.1783883804156;
        Sun, 12 Jul 2026 12:16:44 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.redmond.corp.microsoft.com ([70.37.26.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm13079371b3a.60.2026.07.12.12.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 12:16:43 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
To: netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>
Cc: Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Ma <jack4it@gmail.com>
Subject: [PATCH net-next 3/3] selftests: net: add coverage for fdb nexthop dst port
Date: Sun, 12 Jul 2026 19:12:18 +0000
Message-ID: <20260712191218.236-4-jack4it@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712191218.236-1-jack4it@gmail.com>
References: <20260712191218.236-1-jack4it@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add fib_nexthops_fdb_port.sh, which exercises the NHA_FDB_PORT rules:
accept a port on an fdb nexthop that has a gateway and echo it back on
dump, reject it on non-fdb or gateway-less nexthops, allow a group whose
legs differ only in UDP port, and confirm a portless fdb nexthop omits
the attribute.  The test SKIPs cleanly on kernels or iproute2 without
NHA_FDB_PORT support.

Signed-off-by: Jack Ma <jack4it@gmail.com>
---
 tools/testing/selftests/net/Makefile          |  1 +
 .../selftests/net/fib_nexthops_fdb_port.sh    | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100755 tools/testing/selftests/net/fib_nexthops_fdb_port.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 708d960ae..c06eb4927 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -36,6 +36,7 @@ TEST_PROGS := \
 	fib_nexthop_multiprefix.sh \
 	fib_nexthop_nongw.sh \
 	fib_nexthops.sh \
+	fib_nexthops_fdb_port.sh \
 	fib_rule_tests.sh \
 	fib_tests.sh \
 	fin_ack_lat.sh \
diff --git a/tools/testing/selftests/net/fib_nexthops_fdb_port.sh b/tools/testing/selftests/net/fib_nexthops_fdb_port.sh
new file mode 100755
index 000000000..8b401c6d2
--- /dev/null
+++ b/tools/testing/selftests/net/fib_nexthops_fdb_port.sh
@@ -0,0 +1,78 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Control-plane selftest for per-nexthop VXLAN fdb destination port
+# (NHA_FDB_PORT).  Verifies the accept/reject rules and the dump roundtrip.
+# No datapath traffic here -- see tests/integ/vxlan-fdb-port-integ.sh for the
+# real forwarding test.
+#
+# Requires: patched kernel (NHA_FDB_PORT) and patched iproute2 (the "port"
+# keyword on "ip nexthop ... fdb").  SKIPs cleanly otherwise.
+
+set -u
+
+ksft_skip=4
+NS="nhfdbport-$$"
+IP="ip -netns $NS"
+ret=0
+
+log_test() {	# $1 actual_rc  $2 expected_rc  $3 name
+	if [ "$1" = "$2" ]; then
+		printf "TEST: %-58s [ OK ]\n" "$3"
+	else
+		printf "TEST: %-58s [FAIL] (rc=$1 want=$2)\n" "$3"
+		ret=1
+	fi
+}
+
+# passes (returns 0) iff the command FAILS
+expect_fail() {
+	if "$@" >/dev/null 2>&1; then return 1; else return 0; fi
+}
+
+cleanup() { ip netns del "$NS" 2>/dev/null; }
+
+command -v ip >/dev/null 2>&1 || { echo "SKIP: iproute2 not found"; exit $ksft_skip; }
+ip nexthop help 2>&1 | grep -q fdb || { echo "SKIP: no fdb nexthop support"; exit $ksft_skip; }
+
+trap cleanup EXIT
+cleanup
+ip netns add "$NS" || { echo "SKIP: cannot create netns"; exit $ksft_skip; }
+$IP link set lo up
+
+# Probe for "port" keyword + kernel NHA_FDB_PORT support; SKIP if missing.
+if ! $IP nexthop add id 1 via 10.0.0.1 fdb port 4790 2>/dev/null; then
+	echo "SKIP: 'ip nexthop ... fdb port' unsupported (needs patched kernel + iproute2)"
+	exit $ksft_skip
+fi
+log_test 0 0 "add fdb nexthop with port"
+
+# Dump roundtrip must echo the port back.
+$IP nexthop show id 1 | grep -qw "port 4790"
+log_test $? 0 "dump shows fdb port 4790"
+
+# Reject: port on a routed (non-fdb) nexthop.
+expect_fail $IP nexthop add id 2 via 10.0.0.1 dev lo port 4790
+log_test $? 0 "reject port on non-fdb nexthop"
+
+# Reject: fdb port without a gateway.
+expect_fail $IP nexthop add id 3 fdb port 4790
+log_test $? 0 "reject fdb port without gateway"
+
+# The HA case: a group whose legs share the gateway but differ in port.
+$IP nexthop add id 10 via 10.0.0.1 fdb port 4789 && \
+$IP nexthop add id 11 via 10.0.0.1 fdb port 5789 && \
+$IP nexthop add id 100 group 10/11 fdb
+log_test $? 0 "add fdb nexthop group with differing ports"
+
+# A fdb nexthop without a port must NOT emit one (backward compat).
+$IP nexthop add id 20 via 10.0.0.1 fdb
+$IP nexthop show id 20 | grep -qw "port"
+log_test $? 1 "fdb nexthop without port omits NHA_FDB_PORT"
+
+if [ $ret -eq 0 ]; then
+	echo "PASS: all NHA_FDB_PORT control-plane checks"
+else
+	echo "FAIL: one or more NHA_FDB_PORT checks failed"
+fi
+exit $ret
-- 
2.43.0

