Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588880;
	b=enQhyQzvp68n4bxBnCOU4dMSf44e+EGnp74J2kdozU+p0dw6ysd65o24iUnbV9ANHZYA
	 PsJGw+oCCAuJjgz7ve0nvXOJ9ZiT0NbXm9QJZOHPYlCz7/e4b7+w5ZqYgskHt2LJKu6Ki
	 ZPtu5IwrhTyCDqKktg3MnCDlieVvYcdWAoYj9qn2RDJlUmI/LUI3wcLMIrGYIgjhb4h60
	 B6D5pVbSj3v6YajFhXfQFNMNIbtWEub/m/z5BEEfLJHZL/bypm/avZFcauiNk6KuEJ5gy
	 Kw/IF1x0lDoSjmNs3MOjx0pX4gfazi45OBd8P1W3s4/R6VH909OllG3nx7svMyYhyAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588880;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h/z8BrEgGhkyhV7tQoUm/fDr4md7Wm5mAhsy0utNqzc=;
	b=cCJ3UjHPR1+T/0Wel6fyJ1nI3Er1yGS4+FhMluJrC0gXAyeeRrXt3Zl6VQ9DF3YMr2ar
	 dyjwiQRC3QT3vXr1SLtfheMfTST5wC1NYEiDGVEM5phWKiO+doEBMBNwHLr5ghc5St+b3
	 i/GfOkTV3ebFDlge2xWRDdp5qHYIKu6KIiRM6kzxxZiqjXgYLnjjb9z4WFWN42Dl21tVn
	 DibMKmwM9ayZFlxOEZDoUxJ1FXiNHNO9bTZqvI/OpUU3Ave72O8PEdsUjhaSb0DsSsfvU
	 8WO0vjDYQFWNFsQfeyKgaqjgZhPvTj8S/G37TXxo+YLX4jgPUfrVEcPvtwyTKS7kWNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=j9JxHZun;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AB7606A332;
	Wed, 25 Nov 2026 06:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56AB7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=j9JxHZun
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=j9JxHZunyGVdmL25nldFhb1iHRxwWArFpBlNgpBAYXxKt6XdahOrhLF7zYHz1eYfy7aBIMaQMjON4
	 czvp/CCJgSivAqoVUA9EyjVWgyUXR8vKmkQa/ZWsxOb8uch2t99cS0jGxVj/zJU0t36acEZgGPEbWv
	 oqACLvMuTwNt3EYA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b068307581-eef65;
	Wed, 25 Nov 2026 14:41:12 +0800 (CST)
X-RM-TRANSID:2ee86b068307581-eef65
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b068305c60-3c159;
	Wed, 25 Nov 2026 14:41:12 +0800 (CST)
X-RM-TRANSID:2ee86b068305c60-3c159
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
	idosch@nvidia.com,
	hangbin.liu@linux.dev
Subject: [PATCH net-next v2 1/3] selftests: net: report SO_RCV test failures to the runner
Date: Wed, 25 Nov 2026 06:41:08 +0000
Message-ID: <20261125064110.1396439-2-xujingjing@cmss.chinamobile.com>
In-Reply-To: <20261125064110.1396439-1-xujingjing@cmss.chinamobile.com>
References: <20261125064110.1396439-1-xujingjing@cmss.chinamobile.com>
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

test_so_rcv.sh uses KSFT_FAIL and KSFT_PASS, but lib.sh defines the
lowercase ksft_fail and ksft_pass constants. With the uppercase variables
unset, exit has no argument and returns the successful echo status, even
when the script has reported failed tests.

Use the constants actually provided by lib.sh so failures produce a
nonzero exit status.

Run as root from tools/testing/selftests/net after building the helpers.
For the original four-case script, this changes only sender metadata to 1
while the listeners still expect 2 or 3:

  sed '/\.\/cmsg_sender/s/\$arg/${arg% *} 1/' test_so_rcv.sh | bash
  echo $?

Both versions report four failures. The original prints 0 as the exit
status; with this fix it prints 1.

AI-assisted inspection found this while extending the receive tests.
With deliberately mismatched sender metadata, all four original cases
fail on both versions: the original script exits 0 and
the corrected script exits 1. The unmodified sender passes all four cases
with exit 0. No kernel instrumentation or fault injection was used.

Fixes: c935af429ec2 ("selftests: net: add support for testing SO_RCVMARK and SO_RCVPRIORITY")
Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/test_so_rcv.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/test_so_rcv.sh b/tools/testing/selftests/net/test_so_rcv.sh
index d8aa4362879d..ae01fa3c5329 100755
--- a/tools/testing/selftests/net/test_so_rcv.sh
+++ b/tools/testing/selftests/net/test_so_rcv.sh
@@ -66,8 +66,8 @@ done
 
 if [ "$FAILED_TESTS" -ne 0 ]; then
 	echo "FAIL - $FAILED_TESTS/$TOTAL_TESTS tests failed"
-	exit ${KSFT_FAIL}
+	exit ${ksft_fail}
 else
 	echo "OK - All $TOTAL_TESTS tests passed"
-	exit ${KSFT_PASS}
+	exit ${ksft_pass}
 fi
base-commit: 57f165ff2f30491bc3511d24a52ca516751a268b
-- 
2.53.0



