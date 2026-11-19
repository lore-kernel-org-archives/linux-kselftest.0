Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096573;
	b=eJ3z/EObMcSzGJt8q5yXvevN0L37tcvg785LXgUrZ52rulV9YJykCxBq5jCHjJ9PgWW1
	 vl01KE0NhXUM4mfEOzCUZOcVc/BBzfskzwTuDlZQ41q3pnVLFcSKDbSx+7xsv9u0acYY1
	 tvXQ3mU9N75s4d2yjWHcAO5xNMTLN4W4+ZH3RIjq9iywXd3p/Dzd9wOgJG/whtaX1DHfv
	 xSaXsoqAf8pTT8WNxWupIGyqcqvwOxVLE9ooXq83qIeJ4sHhDCsr9R1q2HVIHcuPAodSP
	 lPEjyZYuuM21FbMxN8cU6HZ4OdIQe8IBDPHryhBl82QYSiWtUDmkXlFztWc2I3nbnow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096573;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Rq5hjTMUOxTwh0rZFU/mRxB1f9bGG4ADRGubV6JiU0I=;
	b=NTRbqV+HDoVbFp7pvBMjJwmQmaj6UiIeZY8cjE7G+kmhhhzzAqPKNST+1gIBN5n4q2tP
	 qvW6ZWODf51evSelSwHuNikA+B75ISLTtmgSk8dxU2WbQhurzLgZwDBJz1qfYwjzqIY1B
	 RTbp1QIPpEEaFWLgYIjdCaI5GPkNGxz7ZeqoIqYw2ECI8svzcMr3v25E1jeoGVHmYLjnP
	 9LG3hFrc5xMzoOYEWzBbzsPIA9nucgOhhaMOmEEDrnFsM9wv6OJdnyMNm9epdmHhrvouQ
	 qcooJIHjpaPaad9GrvGrqxtWk7qZCDDZAbw379aOHsV6NnP/aLgdFiX8bCnF0OMTA/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LCnzlOvw;
	arc=none smtp.remote-ip=91.218.175.18
Received: from mta0.migadu.com (out-18.mta0.migadu.com [91.218.175.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498A606A325
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1498A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LCnzlOvw
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8PAih41MhEPrK1cLXfnULSCqvu5Gn8W6x6ap1W4NSUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795096571; v=1; x=1795701371;
 b=LCnzlOvwCH5/81KYLFQfrnyLuvpqbXXgUXvB00Ud0ToorgPICy4k6iPa6wkJeNr7GtQWPenr
 AQzKBBOGQxJMTksr3yChF5WM7pCW6h4EVeV6tOO4o3r2mWw7Gww0eBqzUTD3L0AqtaJXwp51YC2
 JxuDoUgFmSynlaCm0fN0AcG8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f10e56e4a88febcd;
	Thu, 19 Nov 2026 13:56:10 +0000
X-Mizu-Trace-ID: f10e56e4a88febcd
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 19 Nov 2026 21:55:19 +0800
Subject: [PATCH net-next v4 3/5] selftests: seg6: move SRv6 End PSP setup
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
Message-Id: <20261119-srv6_flavors_endx-v4-3-284cdb484eee@kylinos.cn>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
In-Reply-To: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
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

