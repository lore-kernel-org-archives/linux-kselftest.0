Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1D03537CE
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624323; cv=none; b=BaR0OryOUIo0N8lFDH+60OlixWEQS9P0yX3P2aU5sqJvSITcSoxGWvO5UtQQLtR2I2yKK3f5UoMOQdp+kQEeTW/1OKSjP79JV4lP0RaG1ra9RA0qlqG9PCViwVBXBjTeVWlnT40EfCD02faBsYSBkXXb1XazUmHXDUCc82SgnqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624323; c=relaxed/simple;
	bh=hYuvfZFIDL2epZbB6+3TRrBKA058KlOCCRxcolYWUiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u55jREpOD6NMLBM7q5JS8WhkQtd327WYezxvzn/fSvuDLlbRUmBd3nP8qdOSxR/mxmTMgG6zVAkrXlHTSyc+/WGwdB9YFC+20cCir+OPCVpRSApS/M2c8JML3PlXyPCokwFHdyyzEbGliiF609/VBML9tLIoI3NVHqeQVa20rec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FuQnxeSY; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FuQnxeSY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772624319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ODRuQKMggAAl7kuSnucVregyJTgYXXmbngTapckW4oo=;
	b=FuQnxeSYWWRvrIm9SqC4OBL8Hcx7IXArhHXPQD9IJmNvff6yaSumUyvBhReBbCTykwRc1B
	3std9PThFmv2IItlt4Zq+tm+1kwCucl5NilAUdFxZHMADlOrWjx+nnAB7zzePt81e8ueyb
	Y2n/fnSeC+InKXUDglVGUGzDjW7NrSw=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: jiayuan.chen@linux.dev,
	jiayuan.chen@shopee.com,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v4 2/2] selftests: net: add test for IPv4 route with loopback IPv6 nexthop
Date: Wed,  4 Mar 2026 19:38:14 +0800
Message-ID: <20260304113817.294966-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260304113817.294966-1-jiayuan.chen@linux.dev>
References: <20260304113817.294966-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Jiayuan Chen <jiayuan.chen@shopee.com>

Add a regression test for a kernel panic that occurs when an IPv4 route
references an IPv6 nexthop object created on the loopback device.

The test creates an IPv6 nexthop on lo, binds an IPv4 route to it, then
triggers a route lookup via ping to verify the kernel does not crash.

  ./fib_nexthops.sh
  Tests passed: 249
  Tests failed:   0

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
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

