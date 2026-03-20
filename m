Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ED23E6DDD
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774032036; cv=none; b=ZUDdb5QHRvi+cntaAYQaAWSRI2H+GaZSHhxMWoiy9tpofgAOokgGzC8lxFCX/ytv1UvCFniAJjQy+jFVpCLqYnbNYg0FbiLelQ+YFK20ujfmRNX5h2ltEC4AMfqG35WP2ecNZI1rcMDc41N1ar73bv+IaxdRNwhnGiKgM8FxQhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774032036; c=relaxed/simple;
	bh=1BkzluDODaIlh1zrFVpM2Lp05oXawlpqUBD32AskLX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsVpQVi1DVOn24cXgS97csZUH+jrAk23JVMEJ/U1IlAY8dhPLXrfNHzIhwNTsoatZNSRPTzmksvJnTC8NPKiCqW205xlzgrVyBE3FO9HzTqrZOMXwRvyduMeSdFg0XJmNCGaXZZGL8MgYju0Bt6SqeOhVKH0LaguAY+xl7rcyFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V79leypD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V79leypD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774032034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6scTfZdpNdLDWYVNA+QDpQesm+T9ccRyDBvKNA1+6k8=;
	b=V79leypD4o2kqxNn6GRl4CgVYpm9VXZ2JF8wa4Wj2rUSqz0tIOaEF6eZ1AJOWXVnQOKOw+
	3gEy1iCUbs6cmp3gmsxPX2xc9X2mGogVCZ4lNW3Bp85Cf8GwJu0uh4gNtmQRzt0pSJS5Oa
	j9L/DFUw7w9KjHrBK2hKZ9jRPNkERUc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-5SC89gtyOjGTIYdEmEjR1A-1; Fri,
 20 Mar 2026 14:40:28 -0400
X-MC-Unique: 5SC89gtyOjGTIYdEmEjR1A-1
X-Mimecast-MFC-AGG-ID: 5SC89gtyOjGTIYdEmEjR1A_1774032026
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 847B21955F6A;
	Fri, 20 Mar 2026 18:40:26 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.80.202])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 204B81953944;
	Fri, 20 Mar 2026 18:40:23 +0000 (UTC)
From: Audra Mitchell <audra@redhat.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	usama.anjum@collabora.com,
	colin.i.king@gmail.com,
	avagin@google.com,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Date: Fri, 20 Mar 2026 14:39:15 -0400
Message-ID: <20260320184010.759461-2-audra@redhat.com>
In-Reply-To: <20260320184010.759461-1-audra@redhat.com>
References: <f7fef55d-4334-4d1d-b6c6-b409fea7e2a1@kernel.org>
 <20260320184010.759461-1-audra@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On architectures with separate user address space, such as s390 or
those without an MMU, the soft-dirty kselftest may fail when checking
to see if the feature is supported.

  # --------------------
  # running ./soft-dirty
  # --------------------
  # TAP version 13
  # 1..15
  # Bail out! PAGEMAP_SCAN succeeded unexpectedly
  # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  # [FAIL]
  not ok 1 soft-dirty # exit=1
  # SUMMARY: PASS=0 SKIP=0 FAIL=1

The soft-dirty test will initate an ioctl with the PAGEMAP_SCAN flag with
an invalid address for the page_region. This is done intentionally to
have the ioctl return with an expected EFAULT and with the correct
categories returned.

However, on architectures with separate user address space, such as s390 or
those without an MMU, the call to __access_ok (used to validate the
variables provided with the ioctl) will always return true and we will not
fail as expected.

        if (IS_ENABLED(CONFIG_ALTERNATE_USER_ADDRESS_SPACE) ||
            !IS_ENABLED(CONFIG_MMU))
                return true;

Let's simplify the check for PAGEMAP_SCAN and provide a valid page_region
address so that we get a non-errno return if it is supported.

Fixes: 600bca580579 ("selftests/mm: check that PAGEMAP_SCAN returns correct categories")

Signed-off-by: Audra Mitchell <audra@redhat.com>
---
 tools/testing/selftests/mm/vm_util.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index a6d4ff7dfdc0..82998406b335 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -67,20 +67,26 @@ static uint64_t pagemap_scan_get_categories(int fd, char *start)
 }
 
 /* `start` is any valid address. */
-static bool pagemap_scan_supported(int fd, char *start)
+static bool pagemap_scan_supported(int fd)
 {
+	const size_t pagesize = getpagesize();
 	static int supported = -1;
-	int ret;
+	struct page_region r;
+	void *test_area;
 
 	if (supported != -1)
 		return supported;
 
-	/* Provide an invalid address in order to trigger EFAULT. */
-	ret = __pagemap_scan_get_categories(fd, start, (struct page_region *) ~0UL);
-	if (ret == 0)
-		ksft_exit_fail_msg("PAGEMAP_SCAN succeeded unexpectedly\n");
-
-	supported = errno == EFAULT;
+	test_area = mmap(0, pagesize, PROT_READ | PROT_WRITE,
+			MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
+	if (test_area == MAP_FAILED) {
+		ksft_print_msg("WARN: mmap() failed: %s\n", strerror(errno));
+		supported = 0;
+	} else {
+		supported = __pagemap_scan_get_categories(fd, test_area, &r) >= 0;
+		ksft_print_msg("errno: %d\n", errno);
+		munmap(test_area, pagesize);
+	}
 
 	return supported;
 }
@@ -90,7 +96,7 @@ static bool page_entry_is(int fd, char *start, char *desc,
 {
 	bool m = pagemap_get_entry(fd, start) & pagemap_flags;
 
-	if (pagemap_scan_supported(fd, start)) {
+	if (pagemap_scan_supported(fd)) {
 		bool s = pagemap_scan_get_categories(fd, start) & pagescan_flags;
 
 		if (m == s)
-- 
2.52.0

