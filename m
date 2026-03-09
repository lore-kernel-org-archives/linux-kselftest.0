Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398933B531D
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072182; cv=none; b=XapSjW7/WmM+QpIb2/GUYAO78bogUYs0AHUP+64n2f0qCH5WRiLe/BOlrAUjDIn/g2/H5TXfxpBCVAVEUvFlUFuaGVZPlqVrktKaSmHGojLDHKidkyfuj9OIkmwae52jEu/17ywhqcAvXx0xi9PEKRJsmm055C6zp+lWYePs2h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072182; c=relaxed/simple;
	bh=VZ1BIqL8i6P+He8dWltWZCbdPkS9xTO6wWulg2F5f48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LPyntuEJRTxjKXicc8VFbJinc3faXZnT35dTUkFs+FIFobG5bfOTQZm1vrAJiNtNhWbuhZU+2KHw0hTEcf7gQlDXDx+EDc5GNAAGTCTrzM+lArMiKENNL8RRL5LDnnGZsBjghbZWenP2ayiyNfgD/tBM7dROzgQ/dNslOjj+Fls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d5v83f2r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d5v83f2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773072178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u4dkpXFG4aTyAb5XVO2UTWBuvIYgMqymSwley3GnlI8=;
	b=d5v83f2r1dgx0MQ+UKjKzN3GVlU4rV/A8kmxbu7qC65oA09uJufni7ypJHPUKx8gz3NCes
	9384rArSDjSVnqiAqCH5p+t7K2aSQ77vT4JxU23IgvbrYFxnVRuPlXf6W+pV/0NPnw94nJ
	4Qr1+grqQUkgtDXTsewmNs2Grv5IDnY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-540-B65hgm3aN2CjtyE_8CYC3A-1; Mon,
 09 Mar 2026 12:02:54 -0400
X-MC-Unique: B65hgm3aN2CjtyE_8CYC3A-1
X-Mimecast-MFC-AGG-ID: B65hgm3aN2CjtyE_8CYC3A_1773072172
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 00B881955D48;
	Mon,  9 Mar 2026 16:02:29 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.81.138])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 285521955D71;
	Mon,  9 Mar 2026 16:02:25 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] selftest: memcg: Skp memcg_sock test if address family not supported
Date: Mon,  9 Mar 2026 12:02:05 -0400
Message-ID: <20260309160205.651754-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On systems where IPv6 isn't enabled or not configured to support
SOCK_STREAM, the test_memcg_sock test always fails. The purpose
of the test_memcg_sock test is to verify that memory.stat.sock and
memory.current values are close. If the socket() call fails, there is
no way we can test that. I believe it is better to just skip the test
in this case instead of reporting a test failure hinting that there
may be something wrong with the memcg code.

Fixes: 5f8f019380b8 ("selftests: cgroup/memcontrol: add basic test for socket accounting")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 tools/testing/selftests/cgroup/test_memcontrol.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 2fb096a2a9f9..3c13ef67fafb 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -1280,8 +1280,11 @@ static int tcp_server(const char *cgroup, void *arg)
 	saddr.sin6_port = htons(srv_args->port);
 
 	sk = socket(AF_INET6, SOCK_STREAM, 0);
-	if (sk < 0)
+	if (sk < 0) {
+		/* Pass back errno to the ctl_fd */
+		write(ctl_fd, &errno, sizeof(errno));
 		return ret;
+	}
 
 	if (setsockopt(sk, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes)) < 0)
 		goto cleanup;
@@ -1414,6 +1417,9 @@ static int test_memcg_sock(const char *root)
 
 		if (!err)
 			break;
+		if (err == EAFNOSUPPORT)
+			/* Skip if address family not supported by protocol */
+			goto skip;
 		if (err != EADDRINUSE)
 			goto cleanup;
 
@@ -1460,6 +1466,9 @@ static int test_memcg_sock(const char *root)
 	free(memcg);
 
 	return ret;
+skip:
+	ret = KSFT_SKIP;
+	goto cleanup;
 }
 
 /*
-- 
2.53.0

