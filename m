Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD6D28468E
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 04:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774929737; cv=none; b=OlZcPFVuLzN+cPxbHlwdk9GtkG3tye2hzuPO3BytYL0YC7lo0YCPTzULEfC7mppMvtoPnvnLEaX3rDOwD5PtX3/X/9Th+SiI1p6ewg+SfwH8nIFAkEMoGK5fcAw6mMhJM99q7zTEGBcdv8t0t30+AEL1lGlYxlwfsO+75Wd9rFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774929737; c=relaxed/simple;
	bh=0nOt3lP1ja2j2lpE4bJwPuQosa8mpsUf1Uqk9KJ2KJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lz5K/cExy3i6LBtxg9eI8YQH/yS5hM22LtGfx6UYPc9j1NAN+SEZ6E/8CTN1OvPikEZKuMfelfQf3IhxcxN9/TvyZvbu6hQaNS3zCmPxeAl2qbx2O38J6q7e1Z6Ro/x6a+qzfovjPDcyu+LKOadw5B25sqodGkTL2hOWhD16WpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DMznjROh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DMznjROh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774929735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3EbDAZyAv6jeWZmKthzK/4CcHQ9kPum7Wu48BPoSuVk=;
	b=DMznjROhDyfj0f1uVAzD5vyvGrGl1sh3LeZ0SChbg2OSCLUkAGBBYuBYg9hokajkNEZPoZ
	IKG5GM2Nc8jFmvLVblaOCqUCCv9M6DzI4+AXzaHuwrAqSag++VpfVoOuephTvpxkvr3vsX
	GTVcTNAVrUVssDRzNlqVlThVJSt2qas=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-hqGagfUEPRab7xyPRGlypA-1; Tue,
 31 Mar 2026 00:02:08 -0400
X-MC-Unique: hqGagfUEPRab7xyPRGlypA-1
X-Mimecast-MFC-AGG-ID: hqGagfUEPRab7xyPRGlypA_1774929727
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C5A851800561;
	Tue, 31 Mar 2026 04:02:06 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.121])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF0D830002C3;
	Tue, 31 Mar 2026 04:02:00 +0000 (UTC)
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
Subject: [PATCH 1/4] selftests/mm: respect build verbosity settings for 32/64-bit targets
Date: Tue, 31 Mar 2026 12:01:53 +0800
Message-ID: <20260331040156.119158-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The 32-bit and 64-bit compilation rules invoke $(CC) directly, bypassing
the $(Q) quiet prefix and $(call msg,...) helper used by the rest of the
selftests build system. This causes these rules to always print the full
compiler command line, even when V=0 (the default).

Wrap the commands with $(Q) and $(call msg,CC,,$@) to match the
convention used by lib.mk, so that quiet and verbose builds behave
consistently across all targets.

==== Build logs ====
  ...
  CC       merge
  CC       rmap
  CC       soft-dirty
  gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..
                -isystem /usr/src/25/tools/testing/selftests/../../../usr/include
                -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi
                -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE=
                -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests
                -m32 -mxsave  protection_keys.c vm_util.c thp_settings.c pkey_util.c
                -lrt -lpthread -lm -lrt -ldl -lm
                -o /usr/src/25/tools/testing/selftests/mm/protection_keys_32
  gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..
                -isystem /usr/src/25/tools/testing/selftests/../../../usr/include
                -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi
                -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE=
                -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests
                -m32 -mxsave  pkey_sighandler_tests.c vm_util.c thp_settings.c pkey_util.c
                -lrt -lpthread -lm -lrt -ldl -lm
                -o /usr/src/25/tools/testing/selftests/mm/pkey_sighandler_tests_32
  ...

Reported-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Li Wang <liwang@redhat.com>
---
 tools/testing/selftests/mm/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 7a5de4e9bf52..3b222cd6a048 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -215,7 +215,8 @@ ifeq ($(CAN_BUILD_I386),1)
 $(BINARIES_32): CFLAGS += -m32 -mxsave
 $(BINARIES_32): LDLIBS += -lrt -ldl -lm
 $(BINARIES_32): $(OUTPUT)/%_32: %.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+	$(call msg,CC,,$@)
+	$(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
 $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-32,$(t))))
 endif
 
@@ -223,7 +224,8 @@ ifeq ($(CAN_BUILD_X86_64),1)
 $(BINARIES_64): CFLAGS += -m64 -mxsave
 $(BINARIES_64): LDLIBS += -lrt -ldl
 $(BINARIES_64): $(OUTPUT)/%_64: %.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+	$(call msg,CC,,$@)
+	$(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
 $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-64,$(t))))
 endif
 
-- 
2.53.0

