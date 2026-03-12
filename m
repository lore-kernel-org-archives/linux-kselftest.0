Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F723A168C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315689; cv=none; b=T39oNX9dsgEU8IJpFgxhhdY9p1I0jrYwsNamuOKFLvj1tbSHuFQmpttjaMYndZT04y6+SXmuafCU8XmwlYzXiCqlSOFCXDRABPcD5JNcN1KFAj+PGAuAmsk7TkdT3tEgETyJ0gk8F61+ztDe7F39xASlhBobGoOlvb10/z3TgZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315689; c=relaxed/simple;
	bh=e0qvEWr+SSEH4j0vaCh0CP61XRiN4Et7YLSwqxXb7Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaWlRtP2eRX7iWX0qRE6sxZmDG5lN33dQkKsPGHxQCB4CMUHDQPLMR1spNmGHBI+OgqV7tEuQLJellgohssA4u+972/Iv+qCKcyh+Y5q95zUP6DcMYEu2rHgZv0UcDQUE1L1yzQuY3hDczrsejKPEb5rjySAp/lrcXum3oCWTo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UaU9qvf2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UaU9qvf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773315687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3FFU11Mi0bBXwJKlMBJvhw89oPXuQQ6MnaqLH21R0oM=;
	b=UaU9qvf21kgZQRkMu4jkdvS9+Fbic6x2Y82RcV389wNzH36tPqz+ZA3CMk//W/P+DEzbFF
	J62mFQ9ifYC2JVjdJAdWMqdH2mNoYS6/39lywSMFz3jjXbjTBzNyJuLN08m6hXyJoPjYaw
	lgXad65qm9HcnpEdKizCzWfytvot9oc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-VTST2Oz3P6SVUz4tR9q3BQ-1; Thu,
 12 Mar 2026 07:41:24 -0400
X-MC-Unique: VTST2Oz3P6SVUz4tR9q3BQ-1
X-Mimecast-MFC-AGG-ID: VTST2Oz3P6SVUz4tR9q3BQ_1773315681
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6072E195609F;
	Thu, 12 Mar 2026 11:41:21 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D58C180035F;
	Thu, 12 Mar 2026 11:41:12 +0000 (UTC)
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
	chuhu@redhat.com,
	Li Wang <liwang@redhat.com>
Subject: [RESEND PATCH 4/4] selftests/mm: transhuge_stress: skip the test when thp not available
Date: Thu, 12 Mar 2026 19:40:27 +0800
Message-ID: <20260312114027.634559-5-chuhu@redhat.com>
In-Reply-To: <20260312114027.634559-1-chuhu@redhat.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The test requires thp, skip the test when thp is not available to avoid
false positive.

Tested with thp disabled kernel.
Before the fix:
  # --------------------------------
  # running ./transhuge-stress -d 20
  # --------------------------------
  # TAP version 13
  # 1..1
  # transhuge-stress: allocate 1453 transhuge pages, using 2907 MiB virtual memory and 11 MiB of ram
  # Bail out! MADV_HUGEPAGE# Planned tests != run tests (1 != 0)
  # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  # [FAIL]
  not ok 60 transhuge-stress -d 20 # exit=1

After the fix:
  # --------------------------------
  # running ./transhuge-stress -d 20
  # --------------------------------
  # 1..0 # SKIP Transparent Hugepages not available
  # [SKIP]
  ok 5 transhuge-stress -d 20 # SKIP

CC: Li Wang <liwang@redhat.com>
Signed-off-by: Chunyu Hu <chuhu@redhat.com>
---
 tools/testing/selftests/mm/transhuge-stress.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/mm/transhuge-stress.c b/tools/testing/selftests/mm/transhuge-stress.c
index bcad47c09518..76316696426d 100644
--- a/tools/testing/selftests/mm/transhuge-stress.c
+++ b/tools/testing/selftests/mm/transhuge-stress.c
@@ -17,6 +17,7 @@
 #include <sys/mman.h>
 #include "vm_util.h"
 #include "kselftest.h"
+#include "thp_settings.h"
 
 int backing_fd = -1;
 int mmap_flags = MAP_ANONYMOUS | MAP_NORESERVE | MAP_PRIVATE;
@@ -35,6 +36,9 @@ int main(int argc, char **argv)
 	int pagemap_fd;
 	int duration = 0;
 
+	if (!thp_is_enabled())
+		ksft_exit_skip("Transparent Hugepages not available\n");
+
 	ksft_print_header();
 
 	ram = sysconf(_SC_PHYS_PAGES);
-- 
2.53.0

