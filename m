Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBEE54529D
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969440; cv=none; b=LeXXsLgnOy1oTZGu9SUqocyI1cOxuV+qfOBEMc4Am/3Qrs4LpyABvJUrzwT5MaPYPHYMpTBfLb2JevHHAgZgXJ6exI7tntvdRhC/KTdggJ1azIWGf06xVPrYyHnOG9zVEeSYeTHpm4mlpzCDvT0kKnqlx4BYFZP7VLFV5PiYoTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969440; c=relaxed/simple;
	bh=0RFtyh6aJbXhcA1DZQGVQY/D0p6G9727k9Mk2RXmuAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IxjjPCNYqtGjYerkzDuaYwLOsPWDcQw+yv/JHiXpY0U3d7+zoToEHLcLzEJnO2VyW0Zck2GkGQWIdP650PyRVw2EHIFqeSYvJJYXKRsYqib6OQqEUPsL/AQrnqZ5e5/IuEgFqMKvwzcEUzTajMFxtM1VMUoEWlbo3Ba9oGCcWDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KMDsN5Ww; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KMDsN5Ww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788969438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BvUDg/Oxz2M+0TGMqb858AQomxjddSwF9FBAvTPEnjs=;
	b=KMDsN5WwvslwRVtMTN0Bl89biDwjw5HyqUfpwF6CKJytA7l56B2HY6YHNaaMsg8jF4KkYs
	jR8Qr9tMtJm8p46LaZLyHWBonTrR+daawxddOMNGBMPZdzexeqL08ztO8aINlZWezk5pqN
	eXZR8hv86i63SSqxKjEgFDa2BhdBZvs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-261-wVMvkf5uM-Kyikrj8YapQg-1; Wed,
 09 Sep 2026 11:57:14 -0400
X-MC-Unique: wVMvkf5uM-Kyikrj8YapQg-1
X-Mimecast-MFC-AGG-ID: wVMvkf5uM-Kyikrj8YapQg_1788969432
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA9E519540E1;
	Wed,  9 Sep 2026 15:57:11 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2907195608E;
	Wed,  9 Sep 2026 15:57:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kselftest/arm64: Fix size of thread_data values for pthread_join()
Date: Wed,  9 Sep 2026 17:57:07 +0200
Message-ID: <20260909155707.161121-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

pthread_join() stores the thread's return value (a "void *", i.e.
8 bytes on 64 bit computers) into the address that is passed as second
parameter. However, the entries of thread_data are only normal "int"s,
i.e. only 4 bytes. The additional 4 bytes of the return value clobber
whatever is adjacent on the stack, i.e. other members of the thread_data
array (which will be re-written in the next iteration of the for-loop,
so that nobody noticed this problem), or another other local variable
on the stack for the last iteration. Use "intptr_t" to declare the
thread_data array entries with the correct size.

Fixes: 29f080881601c ("kselftest/arm64: check GCR_EL1 after context switch")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
index d23f154d3288c..5d9dc8bcfbf55 100644
--- a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
+++ b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
@@ -69,7 +69,7 @@ void *execute_thread(void *x)
 int execute_test(pid_t pid)
 {
 	pthread_t thread_id[MAX_THREADS];
-	int thread_data[MAX_THREADS];
+	intptr_t thread_data[MAX_THREADS];
 
 	for (int i = 0; i < MAX_THREADS; i++)
 		pthread_create(&thread_id[i], NULL,
-- 
2.55.0

