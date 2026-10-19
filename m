Received: from mta1.migadu.com (out-167.mta1.migadu.com [95.215.58.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7C72BEC34
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 00:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792370477; cv=none; b=oZYiFS27SSrBa9jf+JHek1rggeyh9FcjHKUhqk18mdEzdtAzC2uaNBYj7sAf2feHVYeOhsIlwJpls+Xx96KO075sJUc9ugmg9sqxb3zEaHXAbT3Ncnm9wBtVRDtxdIN3zADOtXgyP8fB+6EigQSBTeRzwrm/qfvSV6a+Jy5xkV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792370477; c=relaxed/simple;
	bh=4a7jDpLRIzJQzbG52iX9YlVOvUlhIfeawAGaFNLFtRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cE8rcPYSmQFtWRYzm42vTIPTvNkW0P5Wgz/70nw706njFCNj7QTRuiDuzS0l165ErsQje0BMaj59kC8bAtAG3d90aatxlpjae5a87yHs1ypZeapf4rTmwxWZOHeVzETwLh6v3UsKBOYjubfD6JbI7EQZbk5Q5XBDT4cZ40ONj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r+Ik6rjW; arc=none smtp.client-ip=95.215.58.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r+Ik6rjW"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4a7jDpLRIzJQzbG52iX9YlVOvUlhIfeawAGaFNLFtRs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792370473; v=1; x=1792975273;
 b=r+Ik6rjW2Ht2vyRqJyaW8r4tNL+QjWVG2sXg8tXfmyywRNp8DWcmKYM8qFefANm7Ob2YRXkY
 +HrAYTjN7j/2khlEQ7jmVYRSaB3PfoeqRcY4JymjX+YPQE/ehbVMnaguSllbt/ViaFLBU0G9u8T
 lcU4tMgWf6rnQUD0nYKgBhGw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 9132aad3da785e02;
	Mon, 19 Oct 2026 00:41:13 +0000
X-Mizu-Trace-ID: 9132aad3da785e02
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Mon, 19 Oct 2026 08:41:03 +0800
Subject: [PATCH net-next v2] selftests: net: exit with test failure status
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-self_ret-v2-1-43d1d11bc9a3@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNywrCMBBFf6XM2kgeNqgr/0OKJHViB0tSklBaS
 v7dkK3Lw7mce0DCSJjg3h0QcaVEwVeQpw7GyfgPMnpXBsmlFlxcWMLZvSJmdlWWK+6UtEZBnS8
 RHW0t9QRfBx63DEM1E6Uc4t4+VtH8f24VTDBte3PrralOP777TD6k8+hhKKX8AALNiN6rAAAA
X-Change-ID: 20261014-self_ret-83b030f32ba3
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

The changed four tests can print [FAIL] subtests while still exiting with
status 0. Their log_test(), aka log_test_expected() in lib.sh, helpers
record a failure in ret, but the scripts never propagate ret to the exit
code, so a kselftest runner treats the run as a pass.

Initialize ret and exit with it at the end of each script so failed
subtests are reflected in the exit status.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
The patch doesn't fix a regression, nothing is failing (or passing when it
shouldn't) because of it. So target the patch to net-next.
---
Changes in v2:
- Also update fib_nexthop_multiprefix.sh (Ido Schimmel)
- Link to v1: https://lore.kernel.org/r/20261014-self_ret-v1-1-6b5a95ba6106@kylinos.cn

To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Shuah Khan <shuah@kernel.org>
To: David Ahern <dsahern@kernel.org>
To: Ido Schimmel <idosch@nvidia.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 tools/testing/selftests/net/fdb_flush.sh               | 3 +++
 tools/testing/selftests/net/fib-onlink-tests.sh        | 3 +++
 tools/testing/selftests/net/fib_nexthop_multiprefix.sh | 1 +
 tools/testing/selftests/net/l2tp.sh                    | 3 +++
 4 files changed, 10 insertions(+)

diff --git a/tools/testing/selftests/net/fdb_flush.sh b/tools/testing/selftests/net/fdb_flush.sh
index 4965e52d5ef5..0827fdd60f8c 100755
--- a/tools/testing/selftests/net/fdb_flush.sh
+++ b/tools/testing/selftests/net/fdb_flush.sh
@@ -6,6 +6,7 @@
 # some combinations of arguments.
 
 source lib.sh
+ret=0
 
 FLUSH_BY_STATE_TESTS="
 	vxlan_test_flush_by_permanent
@@ -778,3 +779,5 @@ for t in $TESTS
 do
 	setup; $t; cleanup;
 done
+
+exit $ret
diff --git a/tools/testing/selftests/net/fib-onlink-tests.sh b/tools/testing/selftests/net/fib-onlink-tests.sh
index a26075abf7d2..325da693c918 100755
--- a/tools/testing/selftests/net/fib-onlink-tests.sh
+++ b/tools/testing/selftests/net/fib-onlink-tests.sh
@@ -6,6 +6,7 @@
 source lib.sh
 PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
 VERBOSE=0
+ret=0
 
 # Network interfaces
 # - odd in current namespace; even in peer ns
@@ -473,3 +474,5 @@ if [ "$TESTS" != "none" ]; then
 	printf "\nTests passed: %3d\n" ${nsuccess}
 	printf "Tests failed: %3d\n"   ${nfail}
 fi
+
+exit $ret
diff --git a/tools/testing/selftests/net/fib_nexthop_multiprefix.sh b/tools/testing/selftests/net/fib_nexthop_multiprefix.sh
index bd0b8a053ea1..2671cff270e5 100755
--- a/tools/testing/selftests/net/fib_nexthop_multiprefix.sh
+++ b/tools/testing/selftests/net/fib_nexthop_multiprefix.sh
@@ -269,3 +269,4 @@ if [ $ret -eq 0 ]; then
 fi
 
 cleanup
+exit $ret
diff --git a/tools/testing/selftests/net/l2tp.sh b/tools/testing/selftests/net/l2tp.sh
index 41e8b19d1bd3..de4b5da2da1b 100755
--- a/tools/testing/selftests/net/l2tp.sh
+++ b/tools/testing/selftests/net/l2tp.sh
@@ -16,6 +16,7 @@
 source lib.sh
 VERBOSE=0
 PAUSE_ON_FAIL=no
+ret=0
 
 which ping6 > /dev/null 2>&1 && ping6=$(which ping6) || ping6=$(which ping)
 
@@ -357,3 +358,5 @@ cleanup
 
 printf "\nTests passed: %3d\n" ${nsuccess}
 printf "Tests failed: %3d\n"   ${nfail}
+
+exit $ret

---
base-commit: 98c2ad4f5d805dbc1ea436a334ee59311806a48c
change-id: 20261014-self_ret-83b030f32ba3

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

