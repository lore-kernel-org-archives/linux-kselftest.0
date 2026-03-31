Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074DB28003A
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 04:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774929741; cv=none; b=Q6oSFIYo9jAAw87YOHiiLs50XXb1sWLqEHwEicCgNTlpmTbJv+9h4X5Syxj76Jqbayi6446S1atMKsvnObD8KYJ8iMd1J0mYfDPH2JtJYSvLfmJxVKnolSOB9ynSzX4Beqqaue9x6yx621TtS0RegP5EjrhDfOTk17K2DxiTN0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774929741; c=relaxed/simple;
	bh=COp6XN9SPW07LDJbcP5E9OZSYfLuXueUQFuAux/M89I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZFus1Mtz3mzXy0HYjMWv4ZBN/pp/yZvyC0fjzd87MExcTeCKOne+zFZsM0nuyCLP/8AHzn0lNozA3WOelYZFKgzO/QiY6EdHocQnT1nUPklMaN5LIT1uyWbb9/7+HLNVx/1p42neQxg7Ku7ymQ25Dq+nlr7IpQXe9OzkyrJoks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=isYTxNhM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="isYTxNhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774929739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvrYLvc4bheXY6nHh3gvx/fU9nd8/iSIX4Lotedv4lg=;
	b=isYTxNhMkIsTC7T+g1eDTc60QdVDra8NXgXKkRbtbKvG8ffnIW10kTcrtDluys3jAUj/6A
	M/QceICHillliJ46RCPwwQo9bTLQn2vOK8/Gs59n0jQOWnCwr8sLcWi8SN2WGD18SHxg1I
	OA/lGHDfAifyumUnoKl9CGtlm9XjV8s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-2sKpac99N2CcFOHSra_RFA-1; Tue,
 31 Mar 2026 00:02:14 -0400
X-MC-Unique: 2sKpac99N2CcFOHSra_RFA-1
X-Mimecast-MFC-AGG-ID: 2sKpac99N2CcFOHSra_RFA_1774929732
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4405180034E;
	Tue, 31 Mar 2026 04:02:12 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.121])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 892DF30001A1;
	Tue, 31 Mar 2026 04:02:07 +0000 (UTC)
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
Subject: [PATCH 2/4] selftests/mm: serialize local_config generation for parallel builds
Date: Tue, 31 Mar 2026 12:01:54 +0800
Message-ID: <20260331040156.119158-2-liwang@redhat.com>
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

The mm selftests generate both local_config.mk and local_config.h from
check_config.sh. With high parallelism (-jN), this can race and lead to
incomplete target builds (e.g. only a few binaries get built after
'make -j100', while 'make -j1' builds everything).

Switch to a stamp-based dependency:

  local_config.stamp: check_config.sh
        ... run check_config.sh ...
        touch local_config.stamp

and make local_config.mk/local_config.h depend on the stamp.

This ensures check_config.sh is executed once per update decision and
removes the parallel race window. Also hook local_config.stamp into
EXTRA_CLEAN.

No functional change intended for non-parallel builds.

Reported-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Li Wang <liwang@redhat.com>
---
 tools/testing/selftests/mm/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 3b222cd6a048..78496f705386 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -261,10 +261,14 @@ $(OUTPUT)/migration: LDLIBS += -lnuma
 
 $(OUTPUT)/rmap: LDLIBS += -lnuma
 
-local_config.mk local_config.h: check_config.sh
-	CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh
+local_config.stamp: check_config.sh
+	$(call msg,CHK,config,$@)
+	$(Q)CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh
+	$(Q)touch $@
 
-EXTRA_CLEAN += local_config.mk local_config.h
+local_config.mk local_config.h: local_config.stamp
+
+EXTRA_CLEAN += local_config.mk local_config.h local_config.stamp
 
 ifeq ($(IOURING_EXTRA_LIBS),)
 all: warn_missing_liburing
-- 
2.53.0

