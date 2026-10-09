Received: from mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236849B214
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539958; cv=none; b=j/BeY993pX6BUIf2hG483Gism1GylcOxlRPS2WdMZxUk+zPDB5aRLjdXgh0hoE1fe2+yEl4TCB7hKMTwCxmijcS9YSL/wTo6I2YeeE+sE4fIw2TEQFqhogaKjFEwt1jGJJd1quN7j5cN4eR5MZTRvPNYP8bTKkzjSQMk3xM0HfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539958; c=relaxed/simple;
	bh=pfE74BMIExp61S0YZU3qrevRRQ6az2m/pNajcAw9Cn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZG9asBtFGmy0h+rn4AK8fVMwt4gZhH3VUtSASzkUih8Hs9YGcQVLHhIhJiRKUVEC452C7Ku0fzo2Q1I7JLqvsr6V7uXvkRvB0cxMzJjF616L5y+xV9PPj9KGFMmA6JgPLacv9gy8Gdhn0UG8Hsgsrx7mJo//p4Z4cQL64dbQNRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y2MD5F2C; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y2MD5F2C"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pfE74BMIExp61S0YZU3qrevRRQ6az2m/pNajcAw9Cn4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791539954; v=1; x=1792144754;
 b=Y2MD5F2CvewzF/b8fKiRV04TIF0p2RnTnlv6mrWOaNJ8w3FaPKvVGYpexA29cL7UPgx1XXaS
 ZFqLVeLUGCtbi3KPVqzenM+2ylVlpi36fSQZhh3YiSdRLe1y01CKnSXewoEh99UyRUV+1eIQQYl
 W/ReH55DHuoHwMeUMS7DVoWA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 309d0623b114de6b;
	Fri, 09 Oct 2026 09:59:14 +0000
X-Mizu-Trace-ID: 309d0623b114de6b
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Fri, 09 Oct 2026 17:58:39 +0800
Subject: [PATCH net-next v2 3/5] selftests: seg6: move SRv6 End PSP setup
 into its own helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-srv6_flavors_endx-v2-3-56ac7f838f41@kylinos.cn>
References: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
In-Reply-To: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

Currently setup() installs both the base topology and the End PSP
policy. That couples general SRv6 test setup with a specific flavor
test case, which makes it hard to add other flavor scenarios cleanly.

Extract the End PSP policy setup from setup() into setup_end_flv_psp(),
So extend PSP test cases can setup and later cleanup independently. The
matching cleanup_end_flv_psp() arrives in the following patch.

Use set -e around the PSP setup block so failures during setup are
treated as errors instead of silently continuing into the connectivity
checks.

Since SETUP_ERR is not set in one setup function, and the middle test may
set ret to 1, we also need to check ret before setting the result as SKIP

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 tools/testing/selftests/net/srv6_end_flavors_test.sh | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 30a939392eea..5ebd6a0344d6 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -328,7 +328,7 @@ cleanup()
 	# check whether the setup phase was completed successfully or not. In
 	# case of an error during the setup phase of the testing environment,
 	# the selftest is considered as "skipped".
-	if [ "${SETUP_ERR}" -ne 0 ]; then
+	if [ "${SETUP_ERR}" -ne 0 ] && [ "$ret" -ne "$ksft_fail" ]; then
 		echo "SKIP: Setting up the testing environment failed"
 		exit "${ksft_skip}"
 	fi
@@ -628,6 +628,12 @@ setup()
 	setup_rt_local_sids 3 "1 2 4"
 	setup_rt_local_sids 4 "1 2 3"
 
+	# testing environment was set up successfully
+	SETUP_ERR=0
+}
+
+setup_end_flv_psp()
+{
 	# set up SRv6 policies
 	# create a connection between hosts hs-1 and hs-2.
 	# The path between hs-1 and hs-2 traverses SRv6 aware routers.
@@ -644,9 +650,6 @@ setup()
 	#  - rt-1 (SRv6 End flavor PSP with SL=1)
 	setup_rt_policy_ipv6 2 1 "3:noflv 4:psp 2:psp"
 	setup_rt_policy_ipv6 1 2 "1:psp"
-
-	# testing environment was set up successfully
-	SETUP_ERR=0
 }
 
 check_rt_connectivity()
@@ -741,7 +744,13 @@ host2gateway_tests()
 
 host_srv6_end_flv_psp_tests()
 {
-	log_section "SRv6 connectivity test hosts (h1 <-> h2, PSP flavor)"
+	set -e
+	SETUP_ERR=1
+	setup_end_flv_psp
+	SETUP_ERR=0
+	set +e
+
+	log_section "SRv6 connectivity test hosts (h1 <-> h2, End flavor PSP)"
 
 	check_and_log_hs_connectivity 1 2
 	check_and_log_hs_connectivity 2 1

-- 
2.55.0

