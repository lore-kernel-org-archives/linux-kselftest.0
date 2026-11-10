Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281965;
	b=SYdjbYVGeJcA4GV0+z29RrLGUVnO7dGpmp9Wre9pt7tHliQyCxPonu2pNrXRTsWHuHa4
	 smF9Ovzy2ufo4Ga6ca5ivTxCAGFUP9Oy850wWxk9qrQmk/QXjPBTwAWE5SLWKqI0Ku+zr
	 dZIvCN0A1eyR69P/uf9jT/+DN1JV7Q9GB8cN0CVU0Z5qjBew09pBZJxvarrnM+mdMCxB1
	 968O/WrNbUC8VvXe6mMi73E/LuMdI4sH3PmsV16Ahy9I4RVI8OquElKH/qCvMw9DYYlUS
	 ESb0aOEwbKDlLGXg3do4Kt4OyVO2StG4qrzpWGFS6eOWaS+zXMLvGlRniZWnH/be6qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281965;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0mcs64hFOOg16tK9UtpPTT/uBG5g8APxM8xraB8fagU=;
	b=Xl5MmBTR8tMrOGfmlDWCxGbgHJDANeaGf8t7OWiuLpJxdu4yMsB2Nz+h4rsxB6Xhzgx4
	 Ogwu1chi17/50cVJRmzkjhpqRoZJ/nq0h5bhYo+4V6dho4zIoE95XIW9NKCFq4RJYuR3F
	 B/gYnXRod571aMnwOMqBtXoJjHEHaqnJabNfVT7KowNAmBIdntid9cP+Ihd4qjBH3Yu4/
	 /sgDm4ffOJIObDDBJIisVrVzZpWtXueENRIe02Fnn2KSeEp6mLbv+4tCNLvjKmGhNH653
	 seOaGgPeS2j3Zro66uZfOd41/rf28RSzB9NLzVYbD1yr/C9E8ejjkTaGVFjNwkdlcTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OHHQBst9;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C1E606A338;
	Tue, 10 Nov 2026 03:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C1E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OHHQBst9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=OHHQBst9nNvzMQIF9OKyRaPvb5dj9j+GEbDqxiD7MjAO8PTsuY+nZa+5NjKzQ9Gs+o5P3SW1dNjk7
	 N0Kaj7fqiavGVXiVrDqHBj7ABn/KnZUDkR2p2uJNx7aub4RQk4QQ7I50iEKv+gSuB2eDkUbqbOA/vS
	 Xh9znBYVpgGOD/yg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af291e9425-6a21d;
	Tue, 10 Nov 2026 11:39:22 +0800 (CST)
X-RM-TRANSID:2ee46af291e9425-6a21d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from home-ubuntu-251 (unknown[180.106.244.228])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af291e8add-a5777;
	Tue, 10 Nov 2026 11:39:22 +0800 (CST)
X-RM-TRANSID:2ee66af291e8add-a5777
From: Jingjing Xu <xujingjing@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: willemb@google.com,
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Subject: [PATCH net] selftests: net: udpgso_bench_tx: honor CPU zero in the affinity option
Date: Tue, 10 Nov 2026 03:39:20 +0000
Message-ID: <20261110033920.49267-1-xujingjing@cmss.chinamobile.com>
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

The -C option accepts a CPU number, with -1 meaning that affinity was
not requested. Testing cfg_cpu > 0 ignores an explicit -C 0, so the
benchmark can run on other CPUs despite the requested pinning.

Accept zero as well, keeping the negative default unchanged.

Discovered by Codex-assisted code inspection. Validated before and after
the fix with loopback UDP traffic, inheriting CPUs 0 and 1 and reading
the process affinity with sched_getaffinity(). Before the fix, -C 0
retains both CPUs; after it, only CPU 0 is allowed. The default and -C 1
cases retain their expected masks. Built with GCC using -Wall -Werror.

No kernel instrumentation or fault injection was used.

Fixes: 3a687bef148d ("selftests: udp gso benchmark")
Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/udpgso_bench_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/udpgso_bench_tx.c b/tools/testing/selftests/net/udpgso_bench_tx.c
index 86d80cce55b4..797c8d6800f0 100644
--- a/tools/testing/selftests/net/udpgso_bench_tx.c
+++ b/tools/testing/selftests/net/udpgso_bench_tx.c
@@ -642,7 +642,7 @@ int main(int argc, char **argv)
 
 	parse_opts(argc, argv);
 
-	if (cfg_cpu > 0)
+	if (cfg_cpu >= 0)
 		set_cpu(cfg_cpu);
 
 	for (i = 0; i < sizeof(buf[0]); i++)
base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.53.0



