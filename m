Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6018276041;
	Fri, 21 Aug 2026 03:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787282143; cv=none; b=SIh7umX/x4o+XeBz5rNe8/KvGP+KV8NC5DHKxg5+ivXX0YGwWga0TxIfoNAOvhLOP39GCM6ioQoRavApavGu6QoSV8HF7TiWSOWXe0eA9hJTVRFPwQvbGmlGzp4N2d6W2K0g2lWN6qcj7V4f9XX/xLOezIDg3IGSicOyQFRfokg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787282143; c=relaxed/simple;
	bh=Zy058E4f2Q9KPgaORsneUluMfmZ1H7u5TNw5RRMXtXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TzkT+ypgTe5BT2OJ8WSY4T9b8RYe3Y+bYrOmR512xHZNFXhnSLdgxexswK3YbGKgyOs3DgIKiQsN3uuK2dyVpPvsT64KmpQWWNswc+TV5xSsj1DVwfRgQfuc/b/f/6hN9+1NSulBoza8XD62xMJAkodOminiK76JZf+oRLqKHEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Jalm902s; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Jalm902s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nR
	xltsBUEpeZAWEfGTiKbjNg5j5UEofcVblskYkeIbg=; b=Jalm902sxCwL8v7RJG
	0kheXb+BWkNZe77/7164GT4JTWXeGnn7KVHCKTYggVK6D0Hjo6FUUE/wxXxDKQHB
	EtSS2UEcY0ju02xYpd+RaWuBG6vFnzveapdtAa5bBWqsHtCFH96Sx6Oi2Uqu5mLa
	Ya8nnHYtDUy3j4saN44yn8pGY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3H5Giwodq71VORA--.62832S3;
	Fri, 21 Aug 2026 11:14:43 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	SeongJae Park <sjpark@amazon.de>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH net v2 2/2] selftests/net: check fork() return value in fin_ack_lat
Date: Fri, 21 Aug 2026 11:14:42 +0800
Message-Id: <20260821031442.1124777-2-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260821031442.1124777-1-fffsqian@163.com>
References: <20260821030922.1123754-1-fffsqian@163.com>
 <20260821031442.1124777-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H5Giwodq71VORA--.62832S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrtry7ArW5Gr48AF4fKF4xtFb_yoW8JF1rpF
	yrG3sIkF48Ww17t3WkKayxCFy8Wr4kWw4xJr1rKr13Zr1DJFWkJrWfK3WYqF9Fk3ySqa4a
	v3WIgayYy3WDAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEGQDUUUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6gRWIWqHwqQodQAA3P

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

main() never checks fork() for failure.  When fork() returns -1
(EAGAIN/ENOMEM/RLIMIT_NPROC), the !child_pid test is false and the
process falls into server()'s infinite accept() loop with no client ever
connecting, producing empty output.  The wrapper script treats an
empty log as a passing test, producing a false positive.

Check fork() for failure with error(), as is done for every other
syscall in this file.

Fixes: af8c8a450bf4 ("selftests: net: Add FIN_ACK processing order related latency spike test")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 tools/testing/selftests/net/fin_ack_lat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/fin_ack_lat.c b/tools/testing/selftests/net/fin_ack_lat.c
index 98044e6f9f43..4068f8e227cf 100644
--- a/tools/testing/selftests/net/fin_ack_lat.c
+++ b/tools/testing/selftests/net/fin_ack_lat.c
@@ -143,6 +143,8 @@ int main(int argc, char const *argv[])
 
 	fprintf(stderr, "server port: %d\n", ntohs(laddr.sin_port));
 	child_pid = fork();
+	if (child_pid < 0)
+		error(-1, errno, "fork");
 	if (!child_pid)
 		client(ntohs(laddr.sin_port));
 	else
-- 
2.25.1

