Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8A2D73B8
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 06:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467482; cv=none; b=ZORh7HhkrEwmVT7v/QppmrGQUSZiTi9MZt2ZVoUEClwOLTPID3emPmklRGU73zrEO4CCRtehmgCze4obs5f6w/0k2YOEvqLnMbaoQHGpfzucvvRZ12+vzPyUKgSkRKJSqm/A4oVu6PPt54oKNGaPpQ47zDZ6Y2uEOt0GOr9zTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467482; c=relaxed/simple;
	bh=igLi0aFoIR8oOPtljlYZro0h7CIA1d9Odeoh220PwZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhYEP3xgA7hPqzJbtD6ag5S8sRDAh0tbklowRFS0BiZMY8KyR1XY1YrnVd003GyBeqk6HNlJUd2hLdAUlXs68lVsJPoxtDhCwksrcHl+hjhIxcZM7dW/us1fjS4sJFOch87wql83CHlrLSjwx/P9o8bBANo6HFLy6AdA8KQ8kpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bpzC9ZIO; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bpzC9ZIO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780467477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d4V0CNKpI15eY3bq0nYf9RGoV7ytpy50VKiOWNIpJgQ=;
	b=bpzC9ZIOM3QPg7VNwMnc84WZLdWNo3xVDuFgBhS5IkRTbD7lg9wbbMT3O6QX7G9xW6F3pF
	eiwJEPvdewTqfZaiskbrMtpNfH9tve5TGKpxvYwqO7NOfq7xBAQATSDVB6qtSdOmrb0O4E
	50eNlLQ25KVQto/DnZoISegdndDtxR4=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Matthieu Baerts <matttbe@kernel.org>
Subject: [PATCH net-next] selftests: net: do not detect PPPoX loopback
Date: Wed,  3 Jun 2026 14:17:44 +0800
Message-ID: <20260603061746.23452-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

By default, pppd attempts to detect loopbacks on the underlying
interface using a pseudo-randomly generated magic number and checks if
the same value is received. The seed for the PRNG is a hash of hostname
XOR current time XOR pid, which is likely to collide on NIPA, causing
false positives. Disable magic number generation.

Reported-by: Matthieu Baerts <matttbe@kernel.org>
Fixes: 7af2a94f4dcf ("selftests: net: add tests for PPPoL2TP")
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 tools/testing/selftests/net/ppp/pppoe-server-options | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/ppp/pppoe-server-options b/tools/testing/selftests/net/ppp/pppoe-server-options
index 66c8c9d319e9..cd586be7061b 100644
--- a/tools/testing/selftests/net/ppp/pppoe-server-options
+++ b/tools/testing/selftests/net/ppp/pppoe-server-options
@@ -1,2 +1,3 @@
 noauth
 noipdefault
+nomagic
-- 
2.43.0

