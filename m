Received: from mta0.migadu.com (out-9.mta0.migadu.com [91.218.175.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D34B52BE52
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067313; cv=none; b=o2e8GQRm31WSMJJ2wIz8cbbgZWzjCvCRPI1tncRg3ZIBx8pxS7gpl0ZtfMZUsNNj7+R/eHefdZHLDCYraFxHtnmY3Oxrj3YABrR8yzkdbJrzBtHgnOBZqvVgXaErPwhRHpUJXyoV5Zj44VALxEa25mNd+uSjcnB/+tzPCgrWiv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067313; c=relaxed/simple;
	bh=VrecCAfrMmNVamb9Ih2HuJoCchMbXQT7mg1cMbwjUGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZ0TZu7qcKIrtRX8xOJ9g11pL7b5t+ogg7AWI9PLIzptlKP8nUMLyQkiQz6d7nIAzf3s6spe7S8o7u1DIhbz/dkf5mlQyJwKp7MiHaNEJdeHKqe1700H0AkyC/9QzqOhpvMnSi4Yfrnd3ObY7R/8UT/PQihPe7JtfDwjaJYPd04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qw2amp0S; arc=none smtp.client-ip=91.218.175.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qw2amp0S"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VrecCAfrMmNVamb9Ih2HuJoCchMbXQT7mg1cMbwjUGk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790067309; v=1; x=1790672109;
 b=qw2amp0ShewPfxJThgxg/ktIFNlb0x3y4julZFzi+OJrjGLWBs5M84y50orFUNr/ibSP4GOb
 t8SyqOmcLbKTvWBsUv2gNYfcw+6/HxcOw+2z/ddF2fMkrBccoJ3WvPGrGIMscZi2Hh/moFpAhmM
 gj5Ysn02XsrKmq0JO7z+uK7Q=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3d633f2eacbd48c7;
	Tue, 22 Sep 2026 08:55:08 +0000
X-Mizu-Trace-ID: 3d633f2eacbd48c7
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 22 Sep 2026 16:54:45 +0800
Subject: [PATCH net-next 3/5] selftests: seg6: move SRv6 End PSP setup into
 its own helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-srv6_flavors_endx-v1-3-4d01c05c47b7@kylinos.cn>
References: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
In-Reply-To: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

Extract the End PSP policy setup from setup() into setup_end_flv_psp().

Currently setup() installs both the base topology and the End PSP
policy. That couples general SRv6 test setup with a specific flavor
test case, which makes it hard to add other flavor scenarios cleanly.

Split the PSP-specific setup into its own helper so each PSP test case
can setup and later cleanup independently.

Use set -e around the PSP setup block so failures during setup are
treated as errors instead of silently continuing into the connectivity
checks.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 tools/testing/selftests/net/srv6_end_flavors_test.sh | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 318487eda671..56a1c5f865a7 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -645,6 +645,12 @@ setup()
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
@@ -661,9 +667,6 @@ setup()
 	#  - rt-1 (SRv6 End flavor PSP with SL=1)
 	setup_rt_policy_ipv6 2 1 "3:noflv 4:psp 2:psp"
 	setup_rt_policy_ipv6 1 2 "1:psp"
-
-	# testing environment was set up successfully
-	SETUP_ERR=0
 }
 
 check_rt_connectivity()
@@ -758,7 +761,13 @@ host2gateway_tests()
 
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

