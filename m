Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723964;
	b=jrZtcdzH3CtrcVRSzWFBQUb2CgnNkVqiSRVo2yY+IJzhgd5Pnd++7oKJMo0j+8l0R4uC
	 kkvsy1YDlL8aKTLkKy/Ets0opZ57/KRQfNamkkGCRwgS/6IIpLzqMo5EFvdM7uOD1Scnr
	 YlqnHxz4SWbkLpm/LgJXV7NUKMc7CAxeyt2gNqUzCuCDdYz+h8uFJrJTqeFdWcX+eNhgP
	 B+EtpDEt/DIseStnHb9IucdieDIFQPnAeqdAJMLTQsYd6/nHoPB09xFqc1BEUZM0dziNn
	 UjLEqzTm0c8gzehhGj8ma1eiY/UFg20fDlrlPPwE746u1XXZQzMOBM7ySi5lrIXrZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723964;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LTSU5/pZYUh6nYi5BogYnBf5CzMMj9W0mg8QPzWoMe4=;
	b=vb9vFwC36E2Gi3vurxm3FYWe88ugo2ndxoqeDjX6svGqVW/eSNAD76XjjJH0eR3d8vqO
	 6gc5NKM6vg1+1EcU+gGm6VgOSAXhFlVqoznf2pT3SgErzue9kD8yzpCKJGW0Ge33rI8B9
	 28HLhRscfvWYRdoYfqncyaSJ+YL2ac+KkNDh/dhjtzULxOfe/rcoq+0drcX663471QvyU
	 jRC+Hk6/JXAYjkQuUAFPYiTJJijTjfNuNF3AzLv8193ErcWK1GxOON/Q0pY3YGZHL8nN/
	 xcSODDcVmjZxiblnzsx/bhr6UiIg5EdsXcFr9NLbk9W/ORiXYBPmffONRX19PyFTg+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duNoA8Y5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0483E606EE95;
	Tue,  3 Nov 2026 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duNoA8Y5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5541F000C1;
	Tue,  3 Nov 2026 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793723963;
	bh=LTSU5/pZYUh6nYi5BogYnBf5CzMMj9W0mg8QPzWoMe4=;
	h=From:To:Cc:Subject:Date;
	b=duNoA8Y5ru9vlhtYc4y6cbTqMFzvbnfZDFyrvGZ5VsuAlu7DS3eSJnqfIfKuYeX3n
	 wbC39fXFRvoBdC6gbwC7FXBT+9RF5u7MbAkwuZzLJV+/RVxa3z3e7ZssOFCr2n/p0J
	 qMHvQu0Omko9bbjLNv39izqEHCUNXQ38Efw51BAhSfaatvm5QlTVl8noeIN5tbBfpw
	 utdFBNNFR59nnU5WCJhZaBOOj7U4/XM1O/aXv4CLSKvOTxxJcJJY3ZJ45FHHZfQ+6c
	 GmNVy4DZfgNOj77yG2rLX/gXgkEa6gjoN9/BLk39tDuqUoYalDBdv5bt/SSzHykTRb
	 nEU+a3s/uJo0Q==
From: Sasha Levin <sashal@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Dmitry Safonov <0x7f454c46@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: net: tcp_ao: don't shift a size_t by 32
Date: Tue,  3 Nov 2026 11:39:21 -0500
Message-ID: <20261103163921.641347-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

gen_tcp_addr() shifts the size_t n right by 32 and masks it with BIT(32)
- 1. On 32-bit architectures both shifts are as wide as the type, which
is undefined:

  aolib.h:230:40: warning: right shift count >= width of type [-Wshift-count-overflow]

Convert n to uint64_t first and mask with 0xffffffff.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
-m32, with and without -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without them now, and the x86_64 builds don't change.

 tools/testing/selftests/net/tcp_ao/lib/aolib.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/tcp_ao/lib/aolib.h b/tools/testing/selftests/net/tcp_ao/lib/aolib.h
index 53be1744237ee..71ff975533089 100644
--- a/tools/testing/selftests/net/tcp_ao/lib/aolib.h
+++ b/tools/testing/selftests/net/tcp_ao/lib/aolib.h
@@ -226,8 +226,8 @@ static inline union tcp_addr gen_tcp_addr(union tcp_addr net, size_t n)
 	union tcp_addr ret = net;
 
 #ifdef IPV6_TEST
-	ret.a6.s6_addr32[3] = htonl(n & (BIT(32) - 1));
-	ret.a6.s6_addr32[2] = htonl((n >> 32) & (BIT(32) - 1));
+	ret.a6.s6_addr32[3] = htonl((uint64_t)n & 0xffffffff);
+	ret.a6.s6_addr32[2] = htonl((uint64_t)n >> 32);
 #else
 	ret.a4.s_addr = htonl(ntohl(net.a4.s_addr) + n);
 #endif
-- 
2.53.0

