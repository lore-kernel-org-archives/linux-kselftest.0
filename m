Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D853F38C407
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223051; cv=none; b=Lc+vy42KzWuBOKK0Z9eZ6xseJB4qffJr8JXAn1ACwmqW3eUX319A+qmpi7XsWrMtrQiTI5CLwX3aV94qx80FZ1RmS9UOEgaS28m5Ob+C4WkUnSK2oXWRcBJ0nciXGWG+mbq0Pp9pAaNKrJnfgfVS77TSZuasupbNc7fnh9cSjg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223051; c=relaxed/simple;
	bh=ggluE2Bp95ABCiYVCcjspAQC0ucOqdUchQMmGNzGDps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYLaLnoNQV5eCLIHhitKpN6acd9W5xze1azKfOLdTpR2iU/5jhPY+AXFPwge4LmDUt3UcaswhCQbiIRLjEYqrcCQQfcJZ1IGxfPDsSWNTpe79O22g0NlCSh6YIowkVOe4++C4msNJFF891OYM0jLKBrpHmX7IlMwN4wYNU6YLWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ENElgdPP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ENElgdPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775223048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/8djVdSGT+sroqjImqj/OviVigb6cSLgpuvjw0dWMM=;
	b=ENElgdPPyDD80jt1KZcGCsw620XW6Fa2CiB4PoXUhDfiUryMmV/YDYoKw8C6XANqAill3q
	2a803CCj5wRDU6bTMQCEhDSvNLIVxTDTiExCSOLw7c68c+QnAoswkdfuJkWJVn5AI9cHet
	QTh+dRCsR584hZtNWqvTOGJD2YEhVuk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-u7mL8VNLPmKB538oKAiJpQ-1; Fri,
 03 Apr 2026 09:30:45 -0400
X-MC-Unique: u7mL8VNLPmKB538oKAiJpQ-1
X-Mimecast-MFC-AGG-ID: u7mL8VNLPmKB538oKAiJpQ_1775223044
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C1AD195609F;
	Fri,  3 Apr 2026 13:30:44 +0000 (UTC)
Received: from fedora (unknown [10.44.36.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2AC581955D84;
	Fri,  3 Apr 2026 13:30:41 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  3 Apr 2026 15:30:43 +0200 (CEST)
Date: Fri, 3 Apr 2026 15:30:40 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/seccomp: Add hard-coded __NR_uprobe for x86_64
Message-ID: <ac_BAMSggw-_ABPE@redhat.com>
References: <ac-7vdQNYdSGqcp-@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac-7vdQNYdSGqcp-@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

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


