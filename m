Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258C9346AC3
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771440145; cv=none; b=i6/ZOpYOeNFAcKGjOLnrRD/mA721+GOzPt4qZ0nksnaEbR9q3RcA7KqwyKUAUUL2a9z+XMmEp4hyXcA6oMGAPX/JkPsaCzqWPgx64TD6oaJ09Ya/Fj2brGOsIpedK39MIUAM8RgYTWCVm3sEWvKiY5wRpudR1HsxmUonLACqOPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771440145; c=relaxed/simple;
	bh=t16fduAILAy84+1+Q5Ma2Hp0vPt864Kw/8txUqiYJuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LxyHNI9lno4zmPLNqvDWyKKVRjJjVyhyZm9xTmsK7yR3FUmHW1BDFDAOfAMy59M7wMAjV7zsHkM8WO5HCxvILYk9DVUnOwe1XcLkUBIiSu+Ofr9FRX9Xz1lzYnSHofsPFzpyIPQ7k3MjALqSYVEmYvMYpcnlVtV7kiVn59xDSj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QD04WLjh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QD04WLjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771440143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=frAMfRqoE2ZGmeGzlkELRXqzdLMkM54op2gu3LYMHtI=;
	b=QD04WLjhtigfsXh7UUlXrkqK9qlR4l9jmaMn8qZ0lIAZ1fD9Rb+U9UNb7RZYsoQpU8OHKQ
	iZiMY8v5dhqxwPm6lP0vxaptD4pDtnw3n7AfMQmjmQ2oF1Spfn6fyguTstf3fzg9sya4lq
	4chq7V3yxN6BRcAt5QKiuwMjHCv1sIs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-c-abKhYvNRmNVmLPT-aNBg-1; Wed,
 18 Feb 2026 13:42:16 -0500
X-MC-Unique: c-abKhYvNRmNVmLPT-aNBg-1
X-Mimecast-MFC-AGG-ID: c-abKhYvNRmNVmLPT-aNBg_1771440135
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C47241800465;
	Wed, 18 Feb 2026 18:42:14 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.81.6])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D0DDC30001BF;
	Wed, 18 Feb 2026 18:42:12 +0000 (UTC)
From: Audra Mitchell <audra@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Date: Wed, 18 Feb 2026 13:42:10 -0500
Message-ID: <20260218184210.206466-1-audra@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On architectures with separate user address space, such as s390 or
those without an MMU, the call to __access_ok will return true.
The soft-dirty test attempts to check if the PAGEMAP_SCAN feature
is supported by providing an invalid address and expecting
__access_ok to return false, thus throwing an EFAULT error on return.
Because of this assumption, this check will always fail for the
architectures aforementioned. Update the supported check to handle
the return being zero for these types of cases.

Signed-off-by: Audra Mitchell <audra@redhat.com>
---
 tools/testing/selftests/mm/vm_util.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index d954bf91afd5..3bb7d322101c 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -77,10 +77,8 @@ static bool pagemap_scan_supported(int fd, char *start)
 
 	/* Provide an invalid address in order to trigger EFAULT. */
 	ret = __pagemap_scan_get_categories(fd, start, (struct page_region *) ~0UL);
-	if (ret == 0)
-		ksft_exit_fail_msg("PAGEMAP_SCAN succeeded unexpectedly\n");
 
-	supported = errno == EFAULT;
+	supported = (ret == 0) || (errno == EFAULT);
 
 	return supported;
 }
-- 
2.52.0

