Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DA733FE27
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883764; cv=none; b=dYFfNXcb0ZbCSVjk2wiVTQgSNzrPYn0ngjCI0Vg/SYMMmJxwH7qjuGtOsnvBhMDLTA/xGQsTyNPzW0QjlVgAmMnmKrL9D4CpVXtJag3vqii/uP+pLRuogmBnV2uWgj2/SSmz4JDaLGwOkcZpb35SQVx9WOV8BxIpQ4WnQRWutDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883764; c=relaxed/simple;
	bh=w95nu1CM2flukevvyNPTVHpid/veCWwhw2TvXNKSSm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxPBvMIyqCR7voO16PnWFbRlDZNRCB/tLyal34ryTNDNw+kvnrv8nTC8gbya/psCjk18vqr5TIhd0P4DPQr4Gp9IYroFbj+WvvSdkxPJuZz4g7N1l6Ay1QOGxce4hV8tAsMpuOZyddlZMBWUtl1sLJY3Uw+W58E0+dg/bNlzGRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=elP5L/Ez; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="elP5L/Ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774883761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ie9j02dRCYKPPj+cFCU+BtD494a7hZlu7MrIBbhAVwo=;
	b=elP5L/Ez6s7zlJA+WTx9w5AsIcHdNNqlia/Xbyrg54RpOXG8HGo0jWJzZ+B5CGS1ZnFFP4
	UqRuR9eARofpbLpzt+qFNdBxX7pyNBpj2lG3Zu/f9Wq3OvQHSC/+XRQUBDnhK8GSpuszhn
	CT46xqy2etfBHiJiybjYoGIYHOpa3yo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-Plyn5C7LNeaQvCTlucDj4Q-1; Mon,
 30 Mar 2026 11:15:54 -0400
X-MC-Unique: Plyn5C7LNeaQvCTlucDj4Q-1
X-Mimecast-MFC-AGG-ID: Plyn5C7LNeaQvCTlucDj4Q_1774883752
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E13B318002E9;
	Mon, 30 Mar 2026 15:15:51 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E440719560AB;
	Mon, 30 Mar 2026 15:15:43 +0000 (UTC)
From: Chunyu Hu <chuhu@redhat.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	chuhu@redhat.com
Subject: [PATCH v7 4/7] selftests: ksft_exit_fail_perror: support printf style arguments
Date: Mon, 30 Mar 2026 23:15:00 +0800
Message-ID: <20260330151503.670415-5-chuhu@redhat.com>
In-Reply-To: <20260330151503.670415-1-chuhu@redhat.com>
References: <20260330151503.670415-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The ksft_exit_fail_perror function previously only accepted a single string
argument, which limited its flexibility for providing specific context to
failure messages.

This change updates ksft_exit_fail_perror to support variable arguments,
similar to ksft_exit_fail_msg.  Adding the __printf(1, 2) attribute enables
compile-time checking for format string correctness.

Signed-off-by: Chunyu Hu <chuhu@redhat.com>
---
Changes in v7:
  - new patch to convert ksft_exit_fail_perror support variable arguments
---
 tools/testing/selftests/kselftest.h | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index afbcf8412ae5..11cabdabb3f6 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -43,7 +43,7 @@
  * the program is aborting before finishing all tests):
  *
  *    ksft_exit_fail_msg(fmt, ...);
- *    ksft_exit_fail_perror(msg);
+ *    ksft_exit_fail_perror(fmt, ...);
  *
  */
 #ifndef __KSELFTEST_H
@@ -417,9 +417,24 @@ static inline __noreturn __printf(1, 2) void ksft_exit_fail_msg(const char *msg,
 	exit(KSFT_FAIL);
 }
 
-static inline __noreturn void ksft_exit_fail_perror(const char *msg)
+static inline __noreturn __printf(1, 2) void ksft_exit_fail_perror(const char *msg, ...)
 {
-	ksft_exit_fail_msg("%s: %s (%d)\n", msg, strerror(errno), errno);
+	va_list args;
+	char *buf = NULL;
+	int saved_errno = errno;
+
+	va_start(args, msg);
+	if (vasprintf(&buf, msg, args) == -1) {
+		va_end(args);
+		ksft_exit_fail_msg("vasprintf failed: %s (%d)\n", strerror(saved_errno),
+				saved_errno);
+	}
+	va_end(args);
+
+	errno = saved_errno;
+	ksft_exit_fail_msg("%s: %s (%d)\n", buf, strerror(errno), errno);
+
+	free(buf);
 }
 
 static inline __noreturn void ksft_exit_xfail(void)
-- 
2.53.0

