Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFB23ED5DD
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 09:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950279; cv=none; b=KAkVVmo+BH2EJD5jfEF6x+sgsn5TMNkTva2wYkaz+VPo6Np3kvB/D3EN/ehbWx6pdilPLDMY8GVe+l/P5WxRdoRLzZPKJx2061bcYB1gywz7aApHitYUI3krAuwkvOjJX9DNoNBB5fAJrRBO3lLUIq0rngZKvNcY6eGLGCCSRAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950279; c=relaxed/simple;
	bh=mz1FaubjBLQ8shVEHdDn4BVHW1w0um8wdQYDocbA74E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4XIKdytSeByc4vaDccnWK6qA4qF3z+O7DS0FIWgaZLJvY22n2qDTbBA+Ka5vdx37tIIOnq84r220aTZmM6Ya/9KIrvOgd2gc2YBr6E4M9+dGPRTDAtSUDg4DREDwEnsTLw5k9pINDudIk/8jTg6pjUeXAVx7vdRaV/MHfkfVRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FrJLLkbl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FrJLLkbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774950277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62QxktDCjvLNB+7zU7T9t0KDFlRYYB3ZQ/FbFPCsVjA=;
	b=FrJLLkblxUOMeyMrsDMCRDYDpUK1uFFkr/T4ERIP9mIX9lp4rMdc8bMksNzwvQk7M5tVRT
	ZUnf8g5hQRul/b/D3tro6CReA9ODvFU35zRNW3I0/9EIR33PtY2VJqEo9i17CAO6whPPcz
	lW6oeUwoKWVIchCSZPV07u60ILbT5E4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-FnlVuaCkOiKoGKM9c8FI2w-1; Tue,
 31 Mar 2026 05:44:22 -0400
X-MC-Unique: FnlVuaCkOiKoGKM9c8FI2w-1
X-Mimecast-MFC-AGG-ID: FnlVuaCkOiKoGKM9c8FI2w_1774950260
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E013B1800345;
	Tue, 31 Mar 2026 09:44:19 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.121])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B27B630001A1;
	Tue, 31 Mar 2026 09:44:13 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	akpm@linux-foundation.org,
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
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 1/2] selftests/mm: respect build verbosity settings for 32/64-bit targets
Date: Tue, 31 Mar 2026 17:44:01 +0800
Message-ID: <20260331094402.144131-2-liwang@redhat.com>
In-Reply-To: <20260331094402.144131-1-liwang@redhat.com>
References: <20260331094402.144131-1-liwang@redhat.com>
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
Tested-by: Andrew Morton <akpm@linux-foundation.org>
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

