Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8243B7778
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568252; cv=none; b=uexeIgcLoOnKAQcxuFyrWfuIgYnUAl7yEhQkYBb+aiBnaAzwqtVvOf+LQSV1hr0DNQ8LtZq+keI09V9rPm+qEJcZZ8wvgZChZa4QBMGuRHZXOItTlRFJDA8oGS5/aJdpw0CwC2DjhK/IqosqDoB3pqIHaamPLEGqLJesyUr+JdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568252; c=relaxed/simple;
	bh=aiJRzYmbjr/ne3e1lrjFy8C1DoRcZx48rrVAyGcOD0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=nJaCIonBGiRA3ia3JUYCsP+zGEq9qKF1EhxzoA+4NjwxCjr6/DlGk7bRPEA66gQd+QpI4N1zv5kqQCA+wcX4S8EUTAkpcVOw6WXRQdw9dRjTlgbGTK2ow+tdS0SHHLpUpECfka5OGau62cg3bRs2VpaH9V+Lx5ZSPSI6AzMLfmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dDNvRZfQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dDNvRZfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775568250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X2mCRZ1ZqltqbwxzVXNBWJLzL6KIIABmyCusloPg0CM=;
	b=dDNvRZfQtogQ0/WIItRwNkBrfaWEeoPOmHGcRSHYdBAG2awV6gucFYCnvpMA+GR8OQ2Ubn
	Dy+en1OxeepizcJrWcmpc4VQxwabURrrt/Cl99Ik27SaNlzoSIKZwOvT62r5hmoPGu1eV4
	kcjyabvXPbIs/sMhnQp2Hk69Ra7RphI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-5EFWyfwzPb61fiP1TP0kdQ-1; Tue,
 07 Apr 2026 09:24:07 -0400
X-MC-Unique: 5EFWyfwzPb61fiP1TP0kdQ-1
X-Mimecast-MFC-AGG-ID: 5EFWyfwzPb61fiP1TP0kdQ_1775568246
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 237A21956096;
	Tue,  7 Apr 2026 13:24:06 +0000 (UTC)
Received: from t14ultra.redhat.com (unknown [10.44.32.212])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7DD3C300019F;
	Tue,  7 Apr 2026 13:24:04 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: jstancek@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/timens: extend CFLAGS to keep options from environment
Date: Tue,  7 Apr 2026 15:23:56 +0200
Message-ID: <010009be026f75eac11930bc1bb2036625dbf90a.1775568176.git.jstancek@redhat.com>
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
2.47.3

