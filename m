Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E56630C631;
	Thu, 26 Mar 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518209; cv=none; b=aG5Z6MAGnj43R0lXootrhvBLASixX/FCu5X7mwvRPUld8ZZQrHS1LJc4roBAftMpY4sEnbCp8ReMsIQRdlD3mVBE8bWGmcNY+Z72TPJRShRuZZjsC1eDFZsX4YObeITI8Kqlrh/kU97eYS0VvzLYfcZOtAbXQYmGumukQEhTbmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518209; c=relaxed/simple;
	bh=UNAN4ElROr4B8NLZ9jIIJGhTL8O0fAL1/whwtvYwV8Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=taD+Qzw0do19mU1BeP9pTs/mBQBgluyff15gPcTwRWGwAcCijt128QHujYCwUi9G56ZtzY2fLmucYXSbECA873oHTLVNL0IRP67ViycyEjoUU6J9ZsEHatRXqZAABFVb+M3CY5Zmx+de8xHfjtkscuPNJ5JT1NUmNfpX/WEZWW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jKBRX3yq; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jKBRX3yq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MM
	8FrgWD5e8IdrXuXgg/O49/4GSzyHpAtkEKHu9x4Xw=; b=jKBRX3yqsCUkZh4wNK
	P7bwiqJ5xphoCaxEMFzCI6mvx8jVELw5X6S9rvBFKTBpALpMj+Md0Z0ONaH/e1mH
	Oy7njKvRNaZ8BC+BbQtC4Vpz/PPYhevBghVwno8sUo45+dRb1S+6hOV2hwZJl8z5
	t+Jkypo9WQlrdzYFH+7MIBiww=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBnbqp8_8RpJI4vBg--.9990S2;
	Thu, 26 Mar 2026 17:42:22 +0800 (CST)
From: fffsqian@163.com
To: davem@davemloft.net,
	edumazet@google.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH v2] selftests: net: broadcast_pmtu: Fix false failure from incorrect ping exit code logic
Date: Thu, 26 Mar 2026 17:42:19 +0800
Message-Id: <20260326094219.2160239-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnbqp8_8RpJI4vBg--.9990S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xtF13ur18ur1kuF45Wrg_yoW8tFyDpa
	1rCa95KF1kWw13Aa1kCF42vFW0kan7Gw4UGry2gwn0qr45tFyUXF47Ka47GFyqvFsYqw13
	Z34Dtr1Yy34DCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnb18UUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbCwR+qdWnE-39B2wAA32

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

The broadcast_pmtu.sh test verifies that broadcast route MTU is respected,
but it uses an incorrect criteria for test success: it relies solely on
the ping command's exit code, which leads to false failures.

When the kernel correctly blocks oversized broadcast packets due to the
configured MTU limit (1500), ping fails to transmit any packets and returns
exit code 1. The original script interprets this as a test failure, even
though the kernel is properly enforcing the MTU (the core goal of the test).

Fix this by:
1. Checking ping's output for clear signs of MTU enforcement (instead of exit code)
   - Match "0 packets transmitted" (no packets sent due to MTU limit)
   - Match "message too long" (kernel rejects oversized packets)
2. Use an exit code variable to avoid early exit breaking the script flow
3. Maintain full compatibility with the original setup/cleanup logic

After this fix, the script returns 0 (success) when the kernel enforces the
broadcast route MTU (packets blocked), and 1 (failure) only when the kernel
fails to enforce the MTU (packets are transmitted but no response is received).

Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 tools/testing/selftests/net/broadcast_pmtu.sh | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/broadcast_pmtu.sh b/tools/testing/selftests/net/broadcast_pmtu.sh
index 726eb5d25839..c2d66c6284eb 100755
--- a/tools/testing/selftests/net/broadcast_pmtu.sh
+++ b/tools/testing/selftests/net/broadcast_pmtu.sh
@@ -40,8 +40,14 @@ cleanup() {
 trap cleanup EXIT
 
 setup &&
-	echo "Testing for broadcast route MTU" &&
-	ip net exec "${CLIENT_NS}" ping -f -M want -q -c 1 -s 8000 -w 1 -b "${CLIENT_BROADCAST_ADDRESS}" > /dev/null 2>&1
-
-exit $?
+	echo "Testing for broadcast route MTU"
+	ping_output=$(ip net exec "${CLIENT_NS}" ping -f -M want -c 1 -s 8000 -w 1 -b \
+		"${CLIENT_BROADCAST_ADDRESS}" 2>&1)
+	if echo "${ping_output}" | grep -q -E "0 packets transmitted|message too long"; then
+		exit_code=0
+	else
+		exit_code=1
+	fi
+
+exit ${exit_code}
 

base-commit: bbeb83d3182abe0d245318e274e8531e5dd7a948
-- 
2.25.1

