Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0033145B3F;
	Fri, 27 Mar 2026 01:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774575007; cv=none; b=f7zfExcxC+wOy9GPO0KxZ0MIAk9EhWQUGpzcYCIMr5oS/w+ljhHsoAFEp2iLClb5S8L3s89jqcQn8wKirz/5vF+IeCIG1HJzC+LFdY6ZarZDvQ5br3+bPbbD+u0fJQI0lg6yfineiaTITrAe3gbm8rfiUPNVxEPsZSfYARZfLbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774575007; c=relaxed/simple;
	bh=ETZw3J00wPbx6pVWylDoMG68bVBpU6WA8sGn8Kh7MEc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WeFm/kyinxUDCiu2M8BXt+tOHAIbF/2pxEdCTupnqWi6Dk22PG0ZITuAjj60TPADpiBkdG6FDe/SSX3j4Uj/Iprey74GzBQnX0SOGvDAgOacXEBNx065YRdKOLfujpvLE1mL+T80Wdmi81Jmyw6cI3ApBlvp1Xp1SCR27b1jQqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UDP8GqqR; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UDP8GqqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Lv
	niDk8mfmfFkAjOrhekZXQ186TivOTunCNcsaWQK9U=; b=UDP8GqqRQBQX4o+G8l
	OdyHEpQIylRUGm7z17BfelWE7RjLIldmXHU0OhSxiXR4oylfTRJwlnAcPAE7GQ9J
	8d+JDY43/PByIAPczwjG8mWJe06UAGP7QpXm17qYK6ZPyC+1DkQKgp/a7R3hdIcE
	bveb4YVFH9zOP37dwMkIX/I5E=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wBn8J7r3MVp3wgfBg--.15322S2;
	Fri, 27 Mar 2026 09:27:09 +0800 (CST)
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
Subject: [PATCH v3] selftests: net: broadcast_pmtu: Fix false failure from incorrect ping exit code logic
Date: Fri, 27 Mar 2026 09:27:05 +0800
Message-Id: <20260327012705.2389814-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBn8J7r3MVp3wgfBg--.15322S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xtF13ur18ur1kuF45Wrg_yoW8AFWUpa
	1rGa9YkF1xWw13Aa18CF47ZFW8Ka93Wa18GrW2g390qrs8Ja4DXr17KFy7GF1jvrZaqw13
	Z3s0qryav34kCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jn8n5UUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6Q0+CWnF3O1l0QAA36

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

The broadcast_pmtu.sh test verifies that broadcast route MTU is respected,
but it uses an incorrect criteria for test success: it relies solely on
the ping command's exit code, which leads to false failures.

When the kernel correctly blocks oversized broadcast packets due to the
configured MTU limit (1500), ping fails to transmit any packets and returns
exit code 1. The original script interprets this as a test failure, even
though the kernel is properly enforcing the MTU (the core goal of the test).

Fix this by checking ping's output for "0 packets transmitted" or
"message too long" instead of relying on exit code.

Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 tools/testing/selftests/net/broadcast_pmtu.sh | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/broadcast_pmtu.sh b/tools/testing/selftests/net/broadcast_pmtu.sh
index 726eb5d25839..68b4c5e539e7 100755
--- a/tools/testing/selftests/net/broadcast_pmtu.sh
+++ b/tools/testing/selftests/net/broadcast_pmtu.sh
@@ -40,8 +40,15 @@ cleanup() {
 trap cleanup EXIT
 
 setup &&
-	echo "Testing for broadcast route MTU" &&
-	ip net exec "${CLIENT_NS}" ping -f -M want -q -c 1 -s 8000 -w 1 -b "${CLIENT_BROADCAST_ADDRESS}" > /dev/null 2>&1
-
-exit $?
+	echo "Testing for broadcast route MTU" && {
+		ping_output=$(ip net exec "${CLIENT_NS}" ping -f -M want -c 1 -s 8000 -w 1 -b \
+			"${CLIENT_BROADCAST_ADDRESS}" 2>&1)
+		if echo "${ping_output}" | grep -q -E "0 packets transmitted|message too long"; then
+			exit_code=0
+		else
+			exit_code=1
+		fi
+	}
+
+exit ${exit_code}
 

base-commit: bbeb83d3182abe0d245318e274e8531e5dd7a948
-- 
2.25.1

