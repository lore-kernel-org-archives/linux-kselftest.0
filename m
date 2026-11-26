Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674480;
	b=jdaKjKP7Qvbgx5AvxLLXOYdFhO67EkEkWCwqxPYiD6+dXSnpoxP0Bn2nnxIabmS9SK1+
	 syg/bz3sZtRjxWsJ2wyb5xDsxo/Mqtp1SuzZxhJuhp+yG5bF6TJ9Ie6wN0gNX0mgyqTGK
	 9DuXqIIvxHrYt2QWi1BPtjYxnRimy4BmjtY59qbjBw87F/9/902eGukWo8dw1fmOCQQoV
	 UsZIe6zkoVgxDQbokUVsDgtRemkZPKSmMZwpxys/Uit2AiFbeX4q/86ZjiQAW8xccH1PF
	 PLoLOuEPEySk1rvb3nAuGgPYScCNoxHMWqZESzZq/nMQTTHJl/qs2GHR3mco46e2fag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674480;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Rq5hjTMUOxTwh0rZFU/mRxB1f9bGG4ADRGubV6JiU0I=;
	b=tXXpqtxbPRzcVORuKKnXmJb+xILqsYM86c77gnwPo5VCV2wWr4EP/xTCWcYHbTrZNgda
	 +uM2ZXsFExC5ee9ioKpLkQDI6poPaWnur9cAE7cehcjj0bdWhBrgQ/UhnFowlqDgOqlVB
	 aTC5jqziJk4ZNm/MzFv35SMPx/SYjCNOd1emNpkSs24xlgAMrkucGhXHQ+Skh1LXDSb9/
	 lACAy6K/ga+QI4SntUDquuaVLdcVZgFfAW02CBsiYn4ay/oVV5RxAL1sJNADImSWRklRk
	 aYyQjFpIgc80fYicHhuKd3Cs/vcGZiUdVhE/r1TvnhYOErR6CY5NMBcVohZbyd3XzAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p+qpYNtu;
	arc=none smtp.remote-ip=95.215.58.225
Received: from mta1.migadu.com (out-225.mta1.migadu.com [95.215.58.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35185606A334
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 06:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35185606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p+qpYNtu
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8PAih41MhEPrK1cLXfnULSCqvu5Gn8W6x6ap1W4NSUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795674478; v=1; x=1796279278;
 b=p+qpYNtukT7xWK/TX1FvQ8KkAMQJm3dbs1H+AuXovLr4qufLRHSpEQU7paRwcdHityP2pYlX
 8NrAIWsrDTRBqgptLPCoV+90ooUGeYI3VlD9kVF3wSjRO3bItDEI2Fuy8n2giB5Ul6m1vfhTQZ+
 SsVAWZLqllJv4y4cmS9kIt70=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id f48ba12d9e260872;
	Thu, 26 Nov 2026 06:27:58 +0000
X-Mizu-Trace-ID: f48ba12d9e260872
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 26 Nov 2026 14:27:25 +0800
Subject: [PATCH net-next v5 3/5] selftests: seg6: move SRv6 End PSP setup
 into its own helper
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-srv6_flavors_endx-v5-3-4d8232eec404@kylinos.cn>
References: <20261126-srv6_flavors_endx-v5-0-4d8232eec404@kylinos.cn>
In-Reply-To: <20261126-srv6_flavors_endx-v5-0-4d8232eec404@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

setup() installs both the base topology and the End PSP policies. That
couples general test setup with one specific flavor scenario and makes
it hard to add further flavor cases cleanly.

Extract the End PSP policy setup into setup_end_flv_psp() so flavor
tests can set up and later tear down independently (the matching
cleanup arrives in a following patch).

Run the block under set -e so a setup failure is treated as an error
instead of falling through into the connectivity checks. When deciding
to report the run as skipped, keep any failure already recorded by a
test, so a real failure is not converted into a skip.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 33 ++++++++++++++++------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 157baa8ecb0b..250de54d8bfa 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -488,10 +488,15 @@ cleanup()
 
 	# check whether the setup phase was completed successfully or not. In
 	# case of an error during the setup phase of the testing environment,
-	# the selftest is considered as "skipped".
+	# the selftest is considered as "skipped", unless a test has already
+	# recorded a failure.
 	if [ "${SETUP_ERR}" -ne 0 ]; then
-		echo "SKIP: Setting up the testing environment failed"
-		exit "${ksft_skip}"
+		if [ "$ret" -ne "$ksft_fail" ]; then
+			echo "SKIP: Setting up the testing environment failed"
+			exit "${ksft_skip}"
+		fi
+
+		echo "FAIL: Setting up the testing environment failed"
 	fi
 
 	exit "${ret}"
@@ -962,17 +967,25 @@ setup()
 	setup_hs 1 1
 	setup_hs 2 2
 
-	# set up the loopback addresses of the hosts used by the Policies (i.c)
-	# and (i.d).
-	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
-	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"
-
 	# set up default SRv6 Endpoints (i.e. SRv6 End behavior)
 	setup_rt_local_sids 1 "2 3 4"
 	setup_rt_local_sids 2 "1 3 4"
 	setup_rt_local_sids 3 "1 2 4"
 	setup_rt_local_sids 4 "1 2 3"
 
+	# testing environment was set up successfully
+	SETUP_ERR=0
+}
+
+setup_end_flv_psp()
+{
+	SETUP_ERR=1
+
+	# set up the loopback addresses of the hosts used by the Policies (i.c)
+	# and (i.d).
+	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
+	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"
+
 	# set up SRv6 policies
 	# create a connection between hosts hs-1 and hs-2.
 	# The path between hs-1 and hs-2 traverses SRv6 aware routers.
@@ -1429,6 +1442,10 @@ set +e
 
 router_tests
 host2gateway_tests
+
+set -e
+setup_end_flv_psp
+set +e
 host_srv6_end_flv_psp_tests
 host_srv6_end_flv_next_csid_psp_tests
 host_srv6_end_flv_consumed_srh_tests

-- 
2.56.0

