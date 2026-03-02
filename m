Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B844630F95A;
	Mon,  2 Mar 2026 05:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772428313; cv=none; b=S1bk7DXc5EcBeV1j8b/HEtHKYyZOgyk4Lyykpym6DnvfH7gIhcFSQpQU9YN/wB3me36BfzZDZnPqDbfAJZZ/WnVn3N0AFiZidfDEARevImyuLwDsC0aM3iYmsCMFAEXx9SKTQyTIBd+Sqt3Bfc/M8fkSh1Z9i4GiXtX/WzNcjjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772428313; c=relaxed/simple;
	bh=QbzI79DEIxR2FQzMSz8NxByWVZTg4621aFQJeAaoD4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNJGIbSLN1Js5MqGb4EsppeIZrUJwTiYcsn9JtJyKVMnHfNl7HCMTotfZPdc8I7WND+liwIwe5lSbjDuNNPR9S+9IKVpdApAtftBJchoRHeeFRHMnikeG0AZ1OEYVBZm7iFgAuj03U0nEBX8u12LH6MMZrWNwYLS7C7uVtFjGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xIh5DkqA; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xIh5DkqA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772428310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ACb9wiDLjoLqkPJGF/ec8JhRJyWR5cmus8+FSxEGypY=;
	b=xIh5DkqAGJbByptdeidimojTFQO5YU0ig69ZKHpx1cD4IR75cWNte+XB0lIKONBzjFsKdS
	gAXhN2Hl+EyqsoUYqz2UJ4ouu9ymApX2SuXRgYk4tVmDE3XT7bjHtRCaLaZG4+LJaq5C0P
	rgpDDANYmxjnVc3nnzem1FFBrQqDi/U=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org,
	dsahern@kernel.org
Cc: jiayuan.chen@linux.dev,
	jiayuan.chen@shopee.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 2/2] selftests: net: add test for IPv4 route with loopback IPv6 nexthop
Date: Mon,  2 Mar 2026 13:11:29 +0800
Message-ID: <20260302051132.66314-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260302051132.66314-1-jiayuan.chen@linux.dev>
References: <20260302051132.66314-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Jiayuan Chen <jiayuan.chen@shopee.com>

Add a regression test for a panic triggered when an IPv4 route
references a loopback IPv6 nexthop object. Without the fix, this
sequence causes a NULL pointer dereference in __mkroute_output()
because nhc_pcpu_rth_output is not allocated for the nexthop.

./fib_nexthops.sh
Tests passed: 249
Tests failed:   0
Tests skipped:  2

Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
---
 tools/testing/selftests/net/fib_nexthops.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index 21026b667667..6eb7f95e70e1 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -1672,6 +1672,17 @@ ipv4_withv6_fcnal()
 
 	run_cmd "$IP ro replace 172.16.101.1/32 via inet6 2001:db8:50::1 dev veth1"
 	log_test $? 2 "IPv4 route with invalid IPv6 gateway"
+
+	# Test IPv4 route with loopback IPv6 nexthop
+	# Regression test: loopback IPv6 nexthop was misclassified as reject
+	# route, skipping nhc_pcpu_rth_output allocation, causing panic when
+	# an IPv4 route references it and triggers __mkroute_output().
+	run_cmd "$IP -6 nexthop add id 20 dev lo"
+	run_cmd "$IP ro add 172.20.20.0/24 nhid 20"
+	run_cmd "ip netns exec $me ping -c1 -W1 172.20.20.1"
+	log_test $? 1 "IPv4 route with loopback IPv6 nexthop (no crash)"
+	run_cmd "$IP ro del 172.20.20.0/24"
+	run_cmd "$IP nexthop del id 20"
 }
 
 ipv4_fcnal_runtime()
-- 
2.43.0

