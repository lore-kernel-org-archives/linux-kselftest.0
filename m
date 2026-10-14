Received: from mta1.migadu.com (out-152.mta1.migadu.com [95.215.58.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE56237BE7F
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 05:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791955963; cv=none; b=kL/gXUGfLCgWtiZdvAsxwjWVm+V6XsmdwK0Z5QhBxJVApOljy9p+BqHZpXg0C0xX6Wqaz8c0+8rQ+LiRmz/ZA1gMHwWH1RpahoUxAFF0G1t4NefrXyET16WvXLPeLugdFjXG5FJ+P9EVcseXP48VoFIOTrDXxhXHmHwTBjVU05w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791955963; c=relaxed/simple;
	bh=DeeQ1mnSlJJadwW9+vWEJShMOdLCTlYD4T0We+pBlNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jrkIXe4wjeTVNWSQqLGAbfL2fGZ/uvrSAjOxx0cAQcPe8mnERUfkEcfzgjfyTfsVMR2y+HEHeN9Wz+i0iHRS5Mw+i+yL2vhAcHscW/+Y+24UGIw4OAEkwxbf60BWHYALdjsMwIqQCHVL5V4qUDsFG9gtY3ud/ODb1O5ojZ0wt2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U6RqeYfQ; arc=none smtp.client-ip=95.215.58.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U6RqeYfQ"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DeeQ1mnSlJJadwW9+vWEJShMOdLCTlYD4T0We+pBlNo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791955960; v=1; x=1792560760;
 b=U6RqeYfQsa9t8wcGp8m2XqD4BFIwN3noHxt+ui1QMNky1qOcLUTGIpQP8c9S96r+DEeAo4cD
 pi0/F/aykZmwCCeWKINE0jRj8HV2StoSlH6NZi8HWGdAVsApDiP3cVI1s9jwZbXmrP94M/CFWPl
 M7FujYHPWrzRM495bG4c7Au8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 172f82703bb1138b;
	Wed, 14 Oct 2026 05:32:39 +0000
X-Mizu-Trace-ID: 172f82703bb1138b
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Wed, 14 Oct 2026 13:32:24 +0800
Subject: [PATCH net-next] selftests: net: exit with test failure status
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-self_ret-v1-1-6b5a95ba6106@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MWwqAIBBA0a3IfCf4iIi2EhFaYw2EhUoI4t6TP
 i8cboGIgTDCxAoEfCnS7VvIjsF2Gn8gp701KKEGKWTPI15uDZj4qK3QwmlljYbGn4CO8r+awTf
 gMSdYav0AissFWWQAAAA=
X-Change-ID: 20261014-self_ret-83b030f32ba3
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

fdb_flush.sh, fib-onlink-tests.sh and l2tp.sh can print [FAIL]
subtests while still exiting with status 0. Their log_test(), aka
log_test_expected() in lib.sh, helpers record a failure in ret, but
the scripts never propagate ret to the exit code, so a kselftest runner
treats the run as a pass.

Initialize ret and exit with it at the end of each script so failed
subtests are reflected in the exit status.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
The patch doesn't fix a regression, nothing is failing (or passing when it
shouldn't) because of it. So target the patch to net-next.
---
 tools/testing/selftests/net/fdb_flush.sh        | 3 +++
 tools/testing/selftests/net/fib-onlink-tests.sh | 3 +++
 tools/testing/selftests/net/l2tp.sh             | 3 +++
 3 files changed, 9 insertions(+)

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
base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
change-id: 20261014-self_ret-83b030f32ba3

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

