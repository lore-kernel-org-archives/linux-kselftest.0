Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382216;
	b=DaAzzJeR0SHONhgIFXllfVM4WEdE2VvQv7TS001Wzl59+82soCItDvnsztTyEUdLYBLo
	 f4p60JyKvm4Lsahzas+uTynwD1jgJPji9zmzP9xX71WmUeeiSfP9GjMsFpXhGZuk/bnHc
	 Y8QPdgbFUdHKlzXXnYljOngLpGwAoODwDTVJtAjKoCVlWFbeeqcaIn4faIsc93Zrvf/Z4
	 568obXsuJq3DzoUeEeRMiVl7WJnXky1QBm5bg54xg0zpBVXM2qDmEmkNEhfY3rEm6+voH
	 UgCst/pGj29q+8GxLdBRgrYHOZpjw3/gWHJSE7m8fcyFVj5Y+mYrVXZ9lmV0uhaDtHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382216;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=tcHOtSM7nWeoLlpUcnG0DJSKH+xxx+L3ZutLIf41pi4=;
	b=MjuCCmoGFL1/XFFIirfyvzFf9rrkNUDWAOSEiTu9ZfszcU+pt3PFmvcJLEUIpBQFDbPK
	 S56DV83r90WEjdhfmu6YQhhWPRdz53cX6oNPW7S8kEH4UtD/vGjQxfXmNAhtcI7rYu8JV
	 LZ+j6CQPWpXLJROd2IW0l/R5crA5+g4xDsy1/Qb2HlTwP10t55BC4xUa7aOnYfLaI73/5
	 GPL3FOMyLuavbqJwjJSuhxXYWSSlfayoxVbe6VdFVzSAobdpxtSB+/QKixu21Hpo6wtht
	 AVzoCKeBpqwp4KelSWkxNl0OcfOe/nQJbNPKmL+hwP08FmgwB2NHncwS7JD5mAbYlWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UU7NstOu;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA3606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 17:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UU7NstOu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793382215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tcHOtSM7nWeoLlpUcnG0DJSKH+xxx+L3ZutLIf41pi4=;
	b=UU7NstOuigl0jAbaXLPgorvlmStUcCRxnt0KJPEF0fFzNbpVHtXxgLvppmfYUA0aAjo8YT
	qbsaSK9cKgdiDcySkTheMj8hJB8TJZmVsTTwSigaNnJqv+44N2KLFQwxNJi9QJuRXzisi9
	LM8GZPi2uvkpR0OnenjiqUxZ8hmSzxE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-503-puZ9tqTHM_K_IgTZt7FYHQ-1; Fri,
 30 Oct 2026 13:43:29 -0400
X-MC-Unique: puZ9tqTHM_K_IgTZt7FYHQ-1
X-Mimecast-MFC-AGG-ID: puZ9tqTHM_K_IgTZt7FYHQ_1793382208
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2FEB1954B06;
	Fri, 30 Oct 2026 17:43:27 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.94])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EDD563000B78;
	Fri, 30 Oct 2026 17:43:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: soc@lists.linux.dev,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: vDSO: Fix header search list for vgetrandom-chacha.S
Date: Fri, 30 Oct 2026 18:43:23 +0100
Message-ID: <20261030174323.370687-1-thuth@redhat.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On aarch64, vgetrandom-chacha.S includes the assembler file from
arch/arm64/kernel/vdso/vgetrandom-chacha.S, and that includes
<asm/assembler.h> which in turn includes lots of system header files.
For this, we should make sure that the kernel headers of the
*current* kernel are in the search path of the compiler, otherwise
we end up including headers from /usr/include of the current distro
instead, and this is calling for trouble! Thus use $(KHDR_INCLUDES)
here to make sure that we are using the right header files.
(This issue has been found in a patch series that replaces __ASSEMBLY__
with __ASSEMBLER__ in the various kernel headers and finally stops
defining __ASSEMBLY__ in the kernel makefiles - when vgetrandom-chacha.S
now tries to include a header from /usr/include the compilation fails
since those headers still require __ASSEMBLY__ to fence away the C code)

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 See this link for the build failure:
 https://lore.kernel.org/oe-kbuild-all/9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com/

 tools/testing/selftests/vDSO/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/Makefile b/tools/testing/selftests/vDSO/Makefile
index a61047bdcd576..1af346ac87081 100644
--- a/tools/testing/selftests/vDSO/Makefile
+++ b/tools/testing/selftests/vDSO/Makefile
@@ -37,7 +37,8 @@ $(OUTPUT)/vdso_test_getrandom: CFLAGS += -isystem $(top_srcdir)/tools/include \
                                          -isystem $(top_srcdir)/include/uapi
 
 $(OUTPUT)/vdso_test_chacha: vgetrandom-chacha.S
-$(OUTPUT)/vdso_test_chacha: CFLAGS += -idirafter $(top_srcdir)/tools/include \
+$(OUTPUT)/vdso_test_chacha: CFLAGS += $(KHDR_INCLUDES) \
+                                      -idirafter $(top_srcdir)/tools/include \
                                       -idirafter $(top_srcdir)/tools/include/generated \
                                       -idirafter $(top_srcdir)/arch/$(SRCARCH)/include \
                                       -idirafter $(top_srcdir)/include \
-- 
2.56.0

