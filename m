Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2A737CD59
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 03:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772507651; cv=none; b=gyKzhZg0Zfo9V2r+9Uzw6N39KtpX5Vv/2ZYDYDQfAa5zXHbr+T8DSGzVAz6nFdBBM+FvSx1YS4W4MGAw+svAOTBYBeXLgS6ioaq0lMs36SkXKxKX5JfjrPJZU2ago6NrQzvXPb8AIfgp8GXHWNtl0NdDyaAIibl3Pfj1Bjgsgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772507651; c=relaxed/simple;
	bh=g0zsyX5L4EjBrrYoCc53vN2N/abj8Y7XpyE4Qa9FYoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H24OKtwZvdJqZuLnx5+yC4Z7HSbC5HlaZ4fXY42veYQ2zdAlJx4Ug9AB6jyCYiKzYwzasCOzUYFeyAbshTsJvQqvE6YU3Y9p4xWoW8/EVEWK6xe+d72rj7ZD+2UCJYLdlrTJNmvaeuPg3K2cU+X2VkF1yskb+6U35mzhbUm0i1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TBRG1ocm; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TBRG1ocm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772507648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pya4KvUPnvgrc1pzLQK2NnEUBs5WZG3BUAj2N7xy7TE=;
	b=TBRG1ocmDMDIs32tTlSpGaW/vxUxiqtDFm/1EAYS5bnDLabf44SzGa029DRcX+LIY+tBS7
	jp+od9Fp1iwHFXS4UZayvYCJBBiCc+Did1vVhURCBfbkoX1s4EoNCZc5Zj3eofakL9zJqQ
	KglecdUEb9XT3yY7ALXwtXXqBM4BQfs=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: jiayuna.chen@linux.dev,
	jiayuna.chen@shopee.com,
	idosch@nvidia.com,
	Jiayuan Chen <jiayuan.chen@shopee.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 2/2] selftests: net: add test for IPv4 route with loopback IPv6 nexthop
Date: Tue,  3 Mar 2026 11:13:15 +0800
Message-ID: <20260303031318.339716-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260303031318.339716-1-jiayuan.chen@linux.dev>
References: <20260303031318.339716-1-jiayuan.chen@linux.dev>
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

