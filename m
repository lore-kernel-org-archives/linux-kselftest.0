Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D593750A2
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 01:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774316056; cv=none; b=aPnzPrHefAdFzopxdGhSZkbJYAylceocHsYlNHAFgYTsGS64zQsn5/GVYMLKabMlUHmes+ynwv2zb2Ji8Imn4jAiGgN4Qx2k3+ctyEMxQ/k4uOaANLVc9sKPGr7yWCt3nDVFpbibjyIzDAfXObLojjW3DExDwQxmnqPjsL+kttM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774316056; c=relaxed/simple;
	bh=RzDMxra0GBlfnTxtsuijkxRnl9ZkyuCPJMOssLSWoDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odBXb4Sf48T8NRWEEDl4QeljjUQqBNzqE4Wn8Z/+BnPXgMQ0ThvTTsKrBnl3u1nhBySIxQplTCsoINFNRpn0aWXMHj9SxWP5gZbkNHwL2wVKs+GvuZ6oWBNGXrz0Uhcyfelw5TMl6KN8pTlSPE6NKbLCxcK4Zmqq9qO53BXKn94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=caYpsznD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="caYpsznD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774316054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJOvGvWQBsJ5OmjH5/2vBPufG9+TCfOtvRt9JkSbV1w=;
	b=caYpsznD5JECyGSvgoOzNFxPqtQ6dcpei5dLIj8jT+O1Oh1pRDlvfyMb3zBrD6Gih51zRG
	souQFpr8pDJ9Ojc19P73anrkTj3lxhG0rv8uHMQ6vla1mMBaX5qgvlI2/GDerIAEok8dXn
	G3ifsESusqit4vsaQ3w3CiJMZMdijtw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-nYK0TxiRNN-9Z1p2rIIC1w-1; Mon,
 23 Mar 2026 21:34:08 -0400
X-MC-Unique: nYK0TxiRNN-9Z1p2rIIC1w-1
X-Mimecast-MFC-AGG-ID: nYK0TxiRNN-9Z1p2rIIC1w_1774316046
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 042201955EAC;
	Tue, 24 Mar 2026 01:34:06 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 504F2180058C;
	Tue, 24 Mar 2026 01:33:57 +0000 (UTC)
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
Subject: [PATCH v6 4/6] selftests/mm/vm_util: robust write_file()
Date: Tue, 24 Mar 2026 09:33:14 +0800
Message-ID: <20260324013316.2590422-5-chuhu@redhat.com>
In-Reply-To: <20260324013316.2590422-1-chuhu@redhat.com>
References: <20260324013316.2590422-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add two more checks for buflen and numwritten. The buflen should be at
least one, otherwise the 'buflen - 1' could underflow and cause trouble.
The numwritten should be equal to 'buflen - 1'. The test will exit if
any of these conditions aren't met.

Additionally, add more print information when a write failure occurs or
a truncated write happens, providing clearer diagnostics.

Signed-off-by: Chunyu Hu <chuhu@redhat.com>
---
Changes in v6:
  - save/restore errno before and after the close(), so the log could show
    the correct error info on failure. Suggested by AI.
Chagnes in v5:
  - new patch for making improve on write_file. Add more safety checks and
    diagnostics info in log
---
 tools/testing/selftests/mm/vm_util.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index ad96d19d1b85..572ccb99de8e 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -767,15 +767,23 @@ int unpoison_memory(unsigned long pfn)
 
 void write_file(const char *path, const char *buf, size_t buflen)
 {
-	int fd;
+	int fd, saved_errno;
 	ssize_t numwritten;
+	if (buflen < 1)
+		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
 
 	fd = open(path, O_WRONLY);
 	if (fd == -1)
 		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
 
 	numwritten = write(fd, buf, buflen - 1);
+	saved_errno = errno;
 	close(fd);
+	errno = saved_errno;
 	if (numwritten < 1)
-		ksft_exit_fail_msg("Write failed\n");
+		ksft_exit_fail_msg("%s write(%s) failed: %s\n", path, buf,
+				strerror(errno));
+	if (numwritten != buflen - 1)
+		ksft_exit_fail_msg("%s write(%s) is truncated, expected %zu bytes, got %zd bytes\n",
+				path, buf, buflen - 1, numwritten);
 }
-- 
2.53.0

