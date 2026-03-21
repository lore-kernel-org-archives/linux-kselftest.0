Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1734751A
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774115896; cv=none; b=OTYbEhBI5Jt/N954cwJ+rhxIxRXK6LMv9YFo7Dj5/THwaQKMklXJSJL7G9VwvwTTNbkYFgc+K3/dv4Fj6207yqLTth7I+utSblCB4Pc4yM7SAtOWQwxQBL2kzuzxvnk30linzs2XIPSG4DLt4LUxYpI9LjnQG/g1vgKHSc+l3/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774115896; c=relaxed/simple;
	bh=LI3SMXsnBn5nSeznTWFsUVVpxVDKbB9pJnDUUCkPN10=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gz6T7GPS9935L3fadAl8PXs2KochuPC7RvTYIbOLd1xGC/+/ONdf4pcaZLSghw3+UFLSgEKwLqR3PBjBTdx6E/TyLCAvSE4ee57Ier9ACWPnacqd+uv649squIhyuTaP6PGJpG0jU0TqmWxjriiWSAHdHLeO//0CnQk/bEkeMcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Dz+r8qj7; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Dz+r8qj7"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cb20bcff5aso252689285a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774115893; x=1774720693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ob8Y//wo6MRj/M0Dz67mgrBX7aDHTN1F2suUDWyFSyU=;
        b=Dz+r8qj7MM/VFJu+GfI+Ha9dNj+jry+e9m7vzd1y4ZgEEqbSWeqS6cVq1orp5u+efD
         8Zv42dZDNsvF2Ej6rJnPULMJgCKVqwNSMZa1B9E3EyMIUEqrz+v8MeuFmJxCtH/x1ny3
         w62Dte4tlaW2+j+Qk5wPWS3AEjbZMnJROiB2BkxKGp/UkVclDOdPodfHQ5ah7rRRGyxY
         yrgMfUHAd4Ii+pTMg/lkNe+PGpJwOhPGGMBgkdYHbH5MECgWW2jlR2THUJwZYJyKQhlL
         8RqgUfaEHfXgOUyrZ8GQuFAPqmTpBw6FiP9rp8xhnxWRWZzXJn1bRmFuJBs8g8HTJd12
         S94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774115893; x=1774720693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ob8Y//wo6MRj/M0Dz67mgrBX7aDHTN1F2suUDWyFSyU=;
        b=bYs1kYkt/VNQO/mO+BZJIaYRnWGoheJb+lFdyVwxvJyvw5AbHAwxNHmN8atA+1tHrH
         5yjZrxxFWrd586KZ4927mcJ3yYsF6yKJovXaMnyPWydioFafZ2dnqecqXOuOmb9dChnX
         bOuy616yuJHKMRTEjMN84mHzE2tHkjxltuL676qC+ykr12YL7VP9vp7vsZe4H5AJEB7m
         5mIz2K1BZC6XwNvDnYQThEls72u5Ej3ZWZZOCVYqI3FrKEbwJM+umaanh2u990lCruxy
         pXnOyV4TRObNa+QZyw4ZiXboOQJTyjJsRPUIPOwOsGaPf3myfQ9MMa6X4dxX9P82tZpv
         +uSw==
X-Forwarded-Encrypted: i=1; AJvYcCWpupofUZMzypNpG9K7w/GSR2a6YmNTXV22oVyDCN+QrU7Hebz4W9ANdyFBTf4TdBNOm962bb9nDALr/uAc37A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkhR5z531DBuaQ6zERBEz0uYCUcyIAK9NSsVibZ26uACw9S2ic
	EvImAAQGwkjC0BqI1owl+1E4JfQXXRmR19YtpTLg2lsnWxSXjSj8dkUusmn8Xktmbu4=
X-Gm-Gg: ATEYQzwKGup+sYSdjYT3iNmNwyWVx+6pgsxmbh/wsHRvnAy2lNtGUDnsi5bx4mQrFZB
	ZW5m83a+aRnktVUHF3pez8FsnfGa1bbu12gd1HqmtKtFwKuCugRbrRMrEA4fUNLyQhP/O8n+cYz
	ynRPdnG0nMcOj1gUE5IY0kBgPdzK+auiI3pWmIIGPvAkf4NMflDJABM9KyCU8dJg4F7Wf/5H8AL
	mN+IcGmsRvXc3G3o3+9TAOrmrdwMelTLc5wtbScyRNMngQnTHBP7sAP/drZycXgIi3vdUpqmXv3
	wCFkASm434jCM+nJD89FDW+hiHlz9eyfXyNwd6mZjVF3pkcHLd5dwW04IZb7WqMRMopvi/GKAYF
	4HlnZLbIwDqNt7vKfDxi/hyD+m+PVrh/D3LsHw8Add0pT17HzN3degRGr5B4NO7Scb2lUS3RPtD
	ZFFy89xXuNK2o/7YEvi5u263c1HdZDB+S1+/Udp7u27efB9/73HtDBkO1dxuYpsMcbwQ==
X-Received: by 2002:a05:620a:aa03:b0:8cf:cf2c:e021 with SMTP id af79cd13be357-8cfcf2ce4d1mr751287185a.7.1774115893390;
        Sat, 21 Mar 2026 10:58:13 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc9089ca9sm426515985a.24.2026.03.21.10.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 10:58:12 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: brauner@kernel.org,
	linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	jack@suse.cz,
	shuah@kernel.org,
	linux-fsdevel@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	pratyush@kernel.org,
	skhawaja@google.com
Subject: [PATCH 2/2] selftests: liveupdate: add test for double preservation
Date: Sat, 21 Mar 2026 17:58:08 +0000
Message-ID: <20260321175808.57942-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260321175808.57942-1-pasha.tatashin@soleen.com>
References: <20260321175808.57942-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that a file can only be preserved once across all active
sessions. Attempting to preserve it a second time, whether in the same
or a different session, should fail with EBUSY.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../testing/selftests/liveupdate/liveupdate.c | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index c2878e3d5ef9..37c808fbe1e9 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -345,4 +345,45 @@ TEST_F(liveupdate_device, preserve_unsupported_fd)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Prevent Double Preservation
+ *
+ * Verifies that a file (memfd) can only be preserved once across all active
+ * sessions. Attempting to preserve it a second time, whether in the same or
+ * a different session, should fail with EBUSY.
+ */
+TEST_F(liveupdate_device, prevent_double_preservation)
+{
+	int session_fd1, session_fd2, mem_fd;
+	int ret;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd1 = create_session(self->fd1, "double-preserve-session-1");
+	ASSERT_GE(session_fd1, 0);
+	session_fd2 = create_session(self->fd1, "double-preserve-session-2");
+	ASSERT_GE(session_fd2, 0);
+
+	mem_fd = memfd_create("test-memfd", 0);
+	ASSERT_GE(mem_fd, 0);
+
+	/* First preservation should succeed */
+	ASSERT_EQ(preserve_fd(session_fd1, mem_fd, 0x1111), 0);
+
+	/* Second preservation in a different session should fail with EBUSY */
+	ret = preserve_fd(session_fd2, mem_fd, 0x2222);
+	EXPECT_EQ(ret, -EBUSY);
+
+	/* Second preservation in the same session (different token) should fail with EBUSY */
+	ret = preserve_fd(session_fd1, mem_fd, 0x3333);
+	EXPECT_EQ(ret, -EBUSY);
+
+	ASSERT_EQ(close(mem_fd), 0);
+	ASSERT_EQ(close(session_fd1), 0);
+	ASSERT_EQ(close(session_fd2), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

