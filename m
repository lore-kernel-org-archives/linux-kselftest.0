Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9E54F4746
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565348; cv=none; b=mXSCEjnpKQ++fymLmJtDZcD29c+MzopgJ6+gGwKms/MxPLDQlzfnc0Eg+d+f5o9nNf1qAUZNaV6aGpBVM/4cQOjejcfX+XdcvESc8ZLLV6uEHo3YzwGEkM3as54/lOgcUTMwe3e29t9zbj/pdxEVIFfnfX6RcROOpT2AVWDio4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565348; c=relaxed/simple;
	bh=DuCtb9s3GxBflb05RsmY9gtapXBWYniJ4ybKet7iHtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=aIK9PemvjnVk0anzXQE/4zKUYZtSKqFiSa0zCc57HDkugUhwXKHuURB4+rtcOKj9QpYenoWfZ3+tsI7JMZk2yHpKo8c26axQ2/YJcHtbVc7W6hLWeaJdtQFr/V3M7KBPlI6aTen5KTCOkuuxj16O+UFQouBMMnAaBQgRBzUvZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K2YJ7V+7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K2YJ7V+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789565346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yujGt1GkWQ2RNAZS1blJViwQT7Osz6xYsfGP32GibmQ=;
	b=K2YJ7V+7u80AxCTfk91GNxqyPFVmfnQWk+0U5LQ7gTx7j73eoSBtQbx6IG+QJF+UI5AqtR
	Syi+QO7t+N5TeXQNUYx5/nJsjSytXE6YuUXGpLuLNOckaYvn4+xBph820lTfxQW7PBsSiT
	Yc6pGsiHwubGWyizsbcucFmgYIyBcnA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-GM2OBS7_MN-1pfIICxINqQ-1; Wed,
 16 Sep 2026 09:29:02 -0400
X-MC-Unique: GM2OBS7_MN-1pfIICxINqQ-1
X-Mimecast-MFC-AGG-ID: GM2OBS7_MN-1pfIICxINqQ_1789565341
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40DB319539BE;
	Wed, 16 Sep 2026 13:29:00 +0000 (UTC)
Received: from jstancek-thinkpadt14gen5.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B26A030001BB;
	Wed, 16 Sep 2026 13:28:58 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: jstancek@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/timens: extend CFLAGS to keep options from environment
Date: Wed, 16 Sep 2026 15:28:47 +0200
Message-ID: <06b3bb05b9512695a9833a9bb291b768516578e2.1789565191.git.jstancek@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Package build environments like Fedora rpmbuild introduced hardening
options (e.g. -pie -Wl,-z,now) by passing a -spec option to CFLAGS
and LDFLAGS.

Some Makefiles currently override CFLAGS but not LDFLAGS, which leads
to a mismatch and build failure, for example:

  CC       timens
  /usr/bin/ld: /tmp/cc2nZXqb.o: relocation R_X86_64_32 against `.rodata'
    can not be used when making a PIE object; recompile with -fPIE
  /usr/bin/ld: failed to set dynamic section sizes: bad value

This mimics fixes already done in other tests, for example:
  commit 23b3a7c4a758 ("selftests: mptcp: extend CFLAGS to keep options
  from environment")

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 tools/testing/selftests/timens/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: Rebased to v7.3-rc3

diff --git a/tools/testing/selftests/timens/Makefile b/tools/testing/selftests/timens/Makefile
index f0d51d4d2c87..357077792395 100644
--- a/tools/testing/selftests/timens/Makefile
+++ b/tools/testing/selftests/timens/Makefile
@@ -1,7 +1,7 @@
 TEST_GEN_PROGS := timens timerfd timer clock_nanosleep procfs exec futex vfork_exec
 TEST_GEN_PROGS_EXTENDED := gettime_perf
 
-CFLAGS := -Wall -Werror -pthread
+CFLAGS += -Wall -Werror -pthread
 LDLIBS := -lrt -ldl
 
 include ../lib.mk
-- 
2.55.0

