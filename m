Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B40B266581
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 04:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774929749; cv=none; b=BStMuxzIzRNnKfVedvxo3w2jTIipPXt0mXDtcWBacWe2CcWrXJqYrGSEE75eJiNCaUQZeW2lBveUYQLHEN5xxHiqfY1X2uskGTYa8kQxqQgCPINm0shDfxzKrJe6uep8sO0vGQxphoK3+ahtZirZizUlXKy9KjacaKetsL0pGXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774929749; c=relaxed/simple;
	bh=abpbiRA6WBdykLPq1TztL3YkOiJcLRxo/NUnQtu4Btg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ce78SvmdYinFiFSaSNR9WJabB2ncQ7vwZgObqQpeDvvbeE/vH+dWpTt2iS7oVkZc3vG91GpCI7vX8PzTJ2T/cwL7u6fIrpxVDw0uLFg2rhslv4aH78vCkCBEObvPtAEc+v+tmm8+d5P258u+OBIYGCZ9BtMMUw4zr3V50TOh3HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TndkNMZB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TndkNMZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774929747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DLWLzQsoTlruy6dZYJmzr//ur1QVX1gW6lYgZn98iI=;
	b=TndkNMZB9lUjIpHB4ZM+Fh5hffUt+PQsMAkL0/TBvmNPv10S9ivzRB858kyEBCMwIeonX/
	vd7tkSltErlUvyUSpjqfKwodOwvXdmV15j5xwZXl5SudvOqdxSdtK2w6nTRwuAPbEs3ghN
	GfP/BHr0XcqUBrnqBn/4LFvK8t5SCG0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-173-kZ2gZjV7OFK3kiiuA2eVcw-1; Tue,
 31 Mar 2026 00:02:20 -0400
X-MC-Unique: kZ2gZjV7OFK3kiiuA2eVcw-1
X-Mimecast-MFC-AGG-ID: kZ2gZjV7OFK3kiiuA2eVcw_1774929738
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 63E2118002E8;
	Tue, 31 Mar 2026 04:02:18 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.121])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56EEC30001A1;
	Tue, 31 Mar 2026 04:02:13 +0000 (UTC)
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
Subject: [PATCH 3/4] selftests/lib.mk: set PWD from CURDIR to avoid wrong extmod path
Date: Tue, 31 Mar 2026 12:01:55 +0800
Message-ID: <20260331040156.119158-3-liwang@redhat.com>
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

When running selftests from the kernel top-level (e.g. make kselftest-all),
sub-makes might still inherit the caller's PWD from the environment.

Some selftests use $(PWD) in recursive kbuild invocations, which can
then incorrectly resolve to the kernel top directory instead of the
current test directory.

In that case, kbuild may generate an external-module wrapper Makefile in
the wrong location, potentially clobbering the top-level Makefile and
causing recursive include failures ("Too many open files").

Export PWD := $(CURDIR) in selftests/lib.mk so $(PWD) always matches the
actual current selftest directory.

Reported-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Li Wang <liwang@redhat.com>
---
 tools/testing/selftests/lib.mk                | 2 ++
 tools/testing/selftests/mm/local_config.stamp | 0
 2 files changed, 2 insertions(+)
 create mode 100644 tools/testing/selftests/mm/local_config.stamp

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index f02cc8a2e4ae..2840e98c225c 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -60,6 +60,8 @@ endif
 selfdir = $(realpath $(dir $(filter %/lib.mk,$(MAKEFILE_LIST))))
 top_srcdir = $(selfdir)/../../..
 
+export PWD := $(CURDIR)
+
 # msg: emit succinct information message describing current building step
 # $1 - generic step name (e.g., CC, LINK, etc);
 # $2 - optional "flavor" specifier; if provided, will be emitted as [flavor];
diff --git a/tools/testing/selftests/mm/local_config.stamp b/tools/testing/selftests/mm/local_config.stamp
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.53.0

