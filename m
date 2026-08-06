Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370B248BD51
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040340; cv=none; b=iNp3QM6cYMUFMUzVLrHZN+Wu35Ww+PR2eSmV+RUW/RuibgQRoNeuQ7mJqelWfHGwcjpG6vzawY2lxde9Qf9BgT4OWmXoD3DvUK2psDd2b3g6h4pATMVhmbAUW2JHaL4ytRb4UUdo4rk1gJFtw7RfSVtNV6nzhBV21RK+LSKmkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040340; c=relaxed/simple;
	bh=ZBKuNglha4WYqoxCFhs6QK6geUBJrYhjcZ48W2H29YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g06OlfJqiqfylNDzQs3LoGNArLWPMfGGDRd+Roc1LWbeyahiAn6OA4Okq2vxmKmroWJzvBuOXKVIBYpumCFRo2B+esYqmn+eK0XBk71SwMpc2BLZfVnVrEVNaJtNFKEplzmqZQkFHfgPeQtzyP24bUyWfKyG7/g96xZNQXFkqPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Knzfgiqw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Knzfgiqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786040338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m6U8hXQyiT21+O1bLmwf8fA5hyjP0j3sekpPjxiz1to=;
	b=Knzfgiqwjfk4pmA6Szno0KLb+lN1ek8vwiMpKz8q6x/i74Cds5Qq3RtQxrYuGPBgc7hS9f
	752/JlGn5PAREy8qPmjAwypycYa31XH0R/IzADLE5VgdvwD1+SMnwOEFWbkH+OApATYcd8
	HkiPz5WN+YCsoFO8icwJx7R2mDAjpPs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-SoExRkXfM9ip5V-y16kW1w-1; Thu,
 06 Aug 2026 14:18:54 -0400
X-MC-Unique: SoExRkXfM9ip5V-y16kW1w-1
X-Mimecast-MFC-AGG-ID: SoExRkXfM9ip5V-y16kW1w_1786040332
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C0BDD195609F;
	Thu,  6 Aug 2026 18:18:51 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.255])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3D5051800347;
	Thu,  6 Aug 2026 18:18:48 +0000 (UTC)
From: Audra Mitchell <audra@redhat.com>
To: david@kernel.org
Cc: jocolema@redhat.com,
	raquini@redhat.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Andrei Vagin <avagin@google.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Correct __pagemap_scan_get_categories return value
Date: Thu,  6 Aug 2026 14:17:03 -0400
Message-ID: <20260806181843.1839943-2-audra@redhat.com>
In-Reply-To: <20260806181843.1839943-1-audra@redhat.com>
References: <7d6b4401-e230-4ca7-b64f-c1277fa643b8@kernel.org>
 <20260806181843.1839943-1-audra@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Currently __pagemap_scan_get_categories returns the result from the
ioctl call which should be an int, not uint64_t. The ioctl may
return -1 on error, which will be interpreted as UINT64_MAX. Adjust
the return type to use the correct value.

Fixes: 600bca580579 ("selftests/mm: check that PAGEMAP_SCAN returns correct categories")

Signed-off-by: Audra Mitchell <audra@redhat.com>
---
 tools/testing/selftests/mm/vm_util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 311fc5b4513e..6b65bd0a1e0b 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -31,7 +31,7 @@ uint64_t pagemap_get_entry(int fd, char *start)
 	return entry;
 }
 
-static uint64_t __pagemap_scan_get_categories(int fd, char *start, struct page_region *r)
+static int __pagemap_scan_get_categories(int fd, char *start, struct page_region *r)
 {
 	struct pm_scan_arg arg;
 
@@ -55,7 +55,7 @@ static uint64_t __pagemap_scan_get_categories(int fd, char *start, struct page_r
 static uint64_t pagemap_scan_get_categories(int fd, char *start)
 {
 	struct page_region r;
-	long ret;
+	int ret;
 
 	ret = __pagemap_scan_get_categories(fd, start, &r);
 	if (ret < 0)
-- 
2.52.0

