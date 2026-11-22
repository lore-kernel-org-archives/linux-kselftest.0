Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362556;
	b=pMBnr4R/UYMBlVnuMjozyv2uTlJPZrXG0+bImzLiOvFjZLaXxHB0A2TBtuQtkr9rafG9
	 K7qj2zdpLmT+OZtce2oHtEL/ucUpMxiNzC09z+NWT/dM25v6v3RAbqltqlZATfQr5Wj9R
	 87rAPGgkpWGi3+cI0dTaysWBmoXRHqhT3Cg3jFq6pdizxo9yYG087KlUqo4GhFYrwFyze
	 VXoT3heX9obnyFxefMxiiEggFIXrnOLEFZRLAof6KEX5b+cDZ4DoE56/NXz0nqLspI/yy
	 NfYH9gwJkaj4FG6GfTqnIkA4kr2OaEn093b+DFPQw740HwH3hHYzps4HIe5bm1MHExQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362556;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ySwzYdflLWbQzpzpMfCcItSeqQJFD4RCu6ac2lMIrNQ=;
	b=ZUcz/PMpyD8jsWKTd9OVZ1neldDeqLwhhf8KHF2XAA0heRBUKSycxTCqgQaLmb44d3ou
	 OFQg00Wsv3BgmxaASWTNLzhIWEko6e/zO0kmgb3l9pibF3Nql7TlWHoHdgNgsbNIqlUbO
	 kWE+xe52j/va9QT/y/CSpWpV+usXFu4I6sDIewX8ifjT3tGJ/5zWI2IODOtOmrZupK18Y
	 88DhU932YCOFt4Qv62CLakAE7rHWXB/ESNzESKaSsKd6gpYoZOHNgpfCNUzUqXKaFddSp
	 JZipnXAfOqD+KxtHTaa0Mu6YZSRCG4utbZ0eGVpm8+ik5ahNyEWwqA9fQYPDDcomSxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RaJvXB2N;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359C3606A320;
	Sun, 22 Nov 2026 15:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 359C3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RaJvXB2N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RaJvXB2Nk9cet0R3CX4BKyewp3hSnFuntCCXhQc71nicGe+OuO8HIw07Nic3E9pQozqnGeKGxWKPV
	 hkFJktihY23nW59E/mUEhOonkI2pkJtY/Z8e+wpSMUyH6JltF5ErR3tHvnTpxHLm5ISlCXcR9AOLhf
	 Yj8HvzhN30Q2vP2Y=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26b030efac93-7036c;
	Sun, 22 Nov 2026 23:49:14 +0800 (CST)
X-RM-TRANSID:2ee26b030efac93-7036c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16b030ef7809-72e6f;
	Sun, 22 Nov 2026 23:49:14 +0800 (CST)
X-RM-TRANSID:2ee16b030ef7809-72e6f
From: Jingjing Xu <xujingjing@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	annaemesenyiri@gmail.com,
	idosch@nvidia.com
Subject: [PATCH net-next 2/2] selftests: net: cover zero receive mark and priority
Date: Sun, 22 Nov 2026 15:49:12 +0000
Message-ID: <20261122154912.1272447-2-xujingjing@cmss.chinamobile.com>
In-Reply-To: <20261122154912.1272447-1-xujingjing@cmss.chinamobile.com>
References: <20261122154912.1272447-1-xujingjing@cmss.chinamobile.com>
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

Exercise SO_RCVMARK and SO_RCVPRIORITY with zero values as well as the
existing nonzero values, for both IPv4 and IPv6. These cases catch using
the expected metadata value as the ancillary-message enable flag.

Use the lowercase ksft_fail and ksft_pass constants defined by lib.sh.
The uppercase names are undefined, so the failure path otherwise exits
with the status of echo and incorrectly reports success to the runner.

With the new tests and the original listener, four of eight cases fail
and the script exits with status 1. With the fixed listener, all eight
pass and the script exits with status 0. The original four cases also
pass with the original listener. Verification used real UDP sockets in
isolated network namespaces; discovery and testing were AI-assisted.

No kernel instrumentation or fault injection was used.

Fixes: c935af429ec2 ("selftests: net: add support for testing SO_RCVMARK and SO_RCVPRIORITY")
Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/test_so_rcv.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/test_so_rcv.sh b/tools/testing/selftests/net/test_so_rcv.sh
index d8aa4362879d..3263ba2d1a67 100755
--- a/tools/testing/selftests/net/test_so_rcv.sh
+++ b/tools/testing/selftests/net/test_so_rcv.sh
@@ -11,6 +11,8 @@ FAILED_TESTS=0
 declare -A TESTS=(
 	["SO_RCVPRIORITY"]="-P 2"
 	["SO_RCVMARK"]="-M 3"
+	["SO_RCVPRIORITY_ZERO"]="-P 0"
+	["SO_RCVMARK_ZERO"]="-M 0"
 )
 
 check_result() {
@@ -66,8 +68,8 @@ done
 
 if [ "$FAILED_TESTS" -ne 0 ]; then
 	echo "FAIL - $FAILED_TESTS/$TOTAL_TESTS tests failed"
-	exit ${KSFT_FAIL}
+	exit ${ksft_fail}
 else
 	echo "OK - All $TOTAL_TESTS tests passed"
-	exit ${KSFT_PASS}
+	exit ${ksft_pass}
 fi
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.53.0



