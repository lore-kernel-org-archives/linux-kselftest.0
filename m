Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FFA175A73
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775221704; cv=none; b=B4CEdG7Vy+32poZdmxiQhLyRrdnCfeNJMBa3NBQQl/lY6XbMQt/L1FFeAe8iF9anKjKLfRerCqeAodR3rfg0sN11icq1S4wZ37Kw/Se2HHiBpTLB4vBvMqsxRfPzPmSzMp6uDTL7Mp7MUbhBYkauShuNZGoEVFMdinQv9C+P5yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775221704; c=relaxed/simple;
	bh=ggluE2Bp95ABCiYVCcjspAQC0ucOqdUchQMmGNzGDps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JwM7AUP7H37d/80hE6vhGE5ZNEktb4VxgAGfJj7g4zwxMmMlfci0FIIA+weCRPtVARjKKsxieiaHGlgxn/WCTyb7PZ8FFAi/QKGdfiELG0SLDe1nMOqy0vH5Eqq+OomeqwmgOQX4xXMQa4SRzivgJ162QhP1VaxhBtWWGURt0TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ggr5xdpA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ggr5xdpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775221702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=5/8djVdSGT+sroqjImqj/OviVigb6cSLgpuvjw0dWMM=;
	b=ggr5xdpApqRCEwIyxDgBbPg87zAzLOpPMyHkToaoCZOTpFgDfHdNSUQZK21qAxofSdo1Kx
	8Rw2pXFFB34bY5gM9U0Arlpk7Q3nkntth6QO+fxruOjsY1fxvdE9aWqd9txBw7AHnNzyfd
	xUKp1QZBTAVvBpSdJWcJoUZE+1fRPts=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-ojHdOuhlNAChgKXORuE7hQ-1; Fri,
 03 Apr 2026 09:08:18 -0400
X-MC-Unique: ojHdOuhlNAChgKXORuE7hQ-1
X-Mimecast-MFC-AGG-ID: ojHdOuhlNAChgKXORuE7hQ_1775221697
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D19B1956089;
	Fri,  3 Apr 2026 13:08:17 +0000 (UTC)
Received: from fedora (unknown [10.44.36.60])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 643A93000223;
	Fri,  3 Apr 2026 13:08:15 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  3 Apr 2026 15:08:16 +0200 (CEST)
Date: Fri, 3 Apr 2026 15:08:13 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/seccomp: Add hard-coded __NR_uretprobe for x86_64
Message-ID: <ac-7vdQNYdSGqcp-@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This complements the commit 18f7686a1ce6 ("selftests/seccomp:
Add hard-coded __NR_uretprobe for x86_64").

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 32e2d4df397b..358b6c65e120 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -170,6 +170,12 @@ struct seccomp_data {
 # endif
 #endif
 
+#ifndef __NR_uprobe
+# if defined(__x86_64__)
+#  define __NR_uprobe 336
+# endif
+#endif
+
 #ifndef SECCOMP_SET_MODE_STRICT
 #define SECCOMP_SET_MODE_STRICT 0
 #endif
-- 
2.52.0


