Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F4A324705
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775094400; cv=none; b=GCEYK19c1kMNNJBEqo1Y08IXVnULbCCLq6JmwcIranpNuZignqLx8gD06+378ExA/hSvct2IzoEH0hwwaLYc094lUq+E+qJfTVSuw4YlTsKqj4/RZPUwrS8a84VOVyckEFxqq6QpKXnIeZG+MdLR/7PceKmJhmY1NW2mAGc4c30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775094400; c=relaxed/simple;
	bh=F/tQZ7MZbHJuL6ABQZeL560ScXtKvvHOv6ROCzLjtdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cW+LvhwApzQV4/N8U3f16RCvp1t+GgKq2FFJTeJlkf3vEFBbBtwuSbsA4RztdRAdJhg3PTlpw7jICLVvPphSYh1q6zWOtRbX99qhhv22AwDjNe3HwgGFyEh+I+X7R/NFxRBz8fEbQc7L/wJy1x+gKAT8r6l6aOTeocIg4Z5vGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B2HTg37d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B2HTg37d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775094398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDU4afNqvnoHoqSo/k3e5WTx+bzCLp33/wZdOxE3SPA=;
	b=B2HTg37dRVGgIDxkbv+xbVw71b6OEERBXos6Q1ekSNt5a3ApWBVRczseq/HxcPmlfd57XQ
	1Rh7qcQGVE3H1dKp7n0OxOeDgaGW8lNv2phCgr9DghbIbTvRWdDMmc6Lh1g0mHoH3ymmTr
	jP+YMIXfk+7ByvirmxBQSVraYpklyy8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-248-CzV-77pMPretbtz4CzGeKg-1; Wed,
 01 Apr 2026 21:46:34 -0400
X-MC-Unique: CzV-77pMPretbtz4CzGeKg-1
X-Mimecast-MFC-AGG-ID: CzV-77pMPretbtz4CzGeKg_1775094392
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09E8D195604F;
	Thu,  2 Apr 2026 01:46:32 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0862F19560AB;
	Thu,  2 Apr 2026 01:46:23 +0000 (UTC)
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
Subject: [PATCH v8 4/6] selftests/mm/vm_util: robust write_file()
Date: Thu,  2 Apr 2026 09:45:41 +0800
Message-ID: <20260402014543.1671131-5-chuhu@redhat.com>
In-Reply-To: <20260402014543.1671131-1-chuhu@redhat.com>
References: <20260402014543.1671131-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add three more checks for buflen and numwritten. The buflen should be at
least two, that means at least one char and the null-end. The error case
check is added by checking numwriten < 0 instead of numwritten < 1. And the
truncate case is checked. The test will exit if any of these conditions
aren't met.

Additionally, add more print information when a write failure occurs or
a truncated write happens, providing clearer diagnostics.

Signed-off-by: Chunyu Hu <chuhu@redhat.com>
---
Changes in v8:
  - go back to ksft_exit_fail_msg in the two error exit path as no clean
    ksft_exit_fail_perror that supports va_list
Changes in v7:
  - add an empty line before the 'buflen < 1' line.  And change to
   'buflen < 2 to limit the buflen at least to be 2, so at least one char
    is allowed.
  - handle the numwriten < 0 case, which is the error path.
  - use ksft_exit_fail_perror in error exit path.
  - use %.*s to print the buf when error happened
Changes in v6:
  - save/restore errno before and after the close(), so the log could show
    the correct error info on failure. Suggested by AI.
Chagnes in v5:
  - new patch for making improve on write_file. Add more safety checks and
    diagnostics info in log
---
 tools/testing/selftests/mm/vm_util.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index ad96d19d1b85..db94564f4431 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -767,15 +767,24 @@ int unpoison_memory(unsigned long pfn)
 
 void write_file(const char *path, const char *buf, size_t buflen)
 {
-	int fd;
+	int fd, saved_errno;
 	ssize_t numwritten;
 
+	if (buflen < 2)
+		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
+
 	fd = open(path, O_WRONLY);
 	if (fd == -1)
 		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
 
 	numwritten = write(fd, buf, buflen - 1);
+	saved_errno = errno;
 	close(fd);
-	if (numwritten < 1)
-		ksft_exit_fail_msg("Write failed\n");
+	errno = saved_errno;
+	if (numwritten < 0)
+		ksft_exit_fail_msg("%s write(%.*s) failed: %s\n", path, (int)(buflen - 1),
+				buf, strerror(errno));
+	if (numwritten != buflen - 1)
+		ksft_exit_fail_msg("%s write(%.*s) is truncated, expected %zu bytes, got %zd bytes\n",
+				path, (int)(buflen - 1), buf, buflen - 1, numwritten);
 }
-- 
2.53.0

