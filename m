Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A1B266581
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 04:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774929753; cv=none; b=ckWKLm9Lr3XTT4N/fTTzaFknwaKRsIjkUzPsqfqegxtHKyreiGmI/KGp/ucBiXIIRJ2XdLvYYOVbcFe36uql18C2+hqBofrq5MUJZ+wvlzBVzKj64f9zF2ltHEqkYTMtcuVAKrOgyyj1KpscJ9rNjhpJQQMTCEr96H2+WSY/b8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774929753; c=relaxed/simple;
	bh=WmEBY0GClx1WzlYKiyZ1mVwgVQQo3a2NI8aHv5BNqHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qs20GJ4yXP0OVXgtF8FCKRpYapXAtWPyf7DHsa+wjWFkja2nJqteEnQDaZv9CZjP9XiYS2PqN9xLOa2fiCjHpUhk1xX/uFc/XLPXrPvJwHngq8+UaBx+uYyKsaFnboIXcfUdvLZglUGB98b65ziD08A504Fn/0zN0ZgI/61P+kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XVhhZK1T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XVhhZK1T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774929751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xxDRoVyz2HRzp4YgRHoGs0Z0VHavzt0gkcpBjOPrbJI=;
	b=XVhhZK1TCriMknagntF8ou54Dy4WI8STpBmQr6ePaJyUjT+m0qsLxlIJSFG/Oa4i0RGgRL
	xfQbgOY6Z0xGAFOvZUFIeVz4OZuVZXU5FN3UNYbrTDz6WNa51orGHhVIdJBSQLzf+F41bc
	jmSI/rI3ZLaRd6kCzxv5k+Gy+j2pl3g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-SmUw6YuZOKCNPKr_74qPSA-1; Tue,
 31 Mar 2026 00:02:26 -0400
X-MC-Unique: SmUw6YuZOKCNPKr_74qPSA-1
X-Mimecast-MFC-AGG-ID: SmUw6YuZOKCNPKr_74qPSA_1774929744
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E0E419560A7;
	Tue, 31 Mar 2026 04:02:24 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.121])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 166BC30001A2;
	Tue, 31 Mar 2026 04:02:18 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] selftests/mm: fix cow/gup_longterm link failures when liburing flags are missing
Date: Tue, 31 Mar 2026 12:01:56 +0800
Message-ID: <20260331040156.119158-4-liwang@redhat.com>
In-Reply-To: <20260331040156.119158-1-liwang@redhat.com>
References: <20260331040156.119158-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

mm selftests rely on IOURING_EXTRA_LIBS (typically from local_config.mk)
to link io_uring-based tests (cow and gup_longterm). On some systems
with liburing installed, IOURING_EXTRA_LIBS can still be empty, causing
link failures with unresolved io_uring symbols.

Add a fallback detection:

  IOURING_EXTRA_LIBS := $(shell pkg-config --libs liburing)

when IOURING_EXTRA_LIBS was not set by local_config.mk.

Also gate io_uring-dependent test binaries (cow and gup_longterm) on
IOURING_EXTRA_LIBS being non-empty, so missing liburing support cleanly
skips those tests instead of failing the build.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 tools/testing/selftests/mm/Makefile | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 78496f705386..01bdd25e04e4 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -10,6 +10,11 @@ LOCAL_HDRS += $(selfdir)/mm/mseal_helpers.h
 
 include local_config.mk
 
+PKG_CONFIG ?= pkg-config
+ifeq ($(IOURING_EXTRA_LIBS),)
+IOURING_EXTRA_LIBS := $(shell $(PKG_CONFIG) --libs liburing 2>/dev/null)
+endif
+
 ifeq ($(ARCH),)
 
 ifeq ($(CROSS_COMPILE),)
@@ -55,10 +60,12 @@ else
 PAGE_FRAG_WARNING = "missing Module.symvers, please have the kernel built first"
 endif
 
-TEST_GEN_FILES = cow
-TEST_GEN_FILES += compaction_test
-TEST_GEN_FILES += gup_longterm
+TEST_GEN_FILES = compaction_test
 TEST_GEN_FILES += gup_test
+ifneq ($(IOURING_EXTRA_LIBS),)
+TEST_GEN_FILES += cow
+TEST_GEN_FILES += gup_longterm
+endif
 TEST_GEN_FILES += hmm-tests
 TEST_GEN_FILES += hugetlb-madvise
 TEST_GEN_FILES += hugetlb-read-hwpoison
-- 
2.53.0

