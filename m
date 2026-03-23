Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2783E0C66
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 20:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297912; cv=none; b=V2ZuX9x1ATAfnSs57m+5HhKCRINPXSrLWdEDGeyDYvXLGaBEFIQEPbBM8lVOaatRzaC8bUfQAMCzR/8jBo29P2ncZnmO1tbsae4cKT7vtRRELJx8Up6sy+l0o49HtdavWvNwU4pVG0v2lgdfVzXMN+i6Qrwvkvma3jlUkcx8TQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297912; c=relaxed/simple;
	bh=LI3SMXsnBn5nSeznTWFsUVVpxVDKbB9pJnDUUCkPN10=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F05hXEA8kAERjRGNzl0j9rIIbL7fO0tkVwFVfjxK/+PeRU9Oxwmr9d/I1wornUBzOnMYQ741aBbgIGZ5tcnbDiu+6ZxdqLL6L6sqKH2+BGLpjwxiWqAK1xeqvpK+IS6KXkaeofnk+MRaNfqbmDhV40BB1OvlR966IFwJ8NQTAzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=AhqGxn3N; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="AhqGxn3N"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cd90401034so51693185a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 13:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774297909; x=1774902709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ob8Y//wo6MRj/M0Dz67mgrBX7aDHTN1F2suUDWyFSyU=;
        b=AhqGxn3NeinaN5xnp4M13fajPpek7zCWCOexIWv8Ud1lSvbHmvz3ePiUFttpiLyIrG
         CWDgh865IZ0/QMtBF7iuPSoj/+keNHnETZw5PmLspU6X/gbbrSyCaUXXYtzbPX2/UxeC
         hANSyiyEF3QrSLpM8bbEyRh1goPEycqh4YfGjrYivWZiR/4lffglcWqE6RM61nxdHoQr
         lNBbdCg1ZbdhA1Zxwsfrs0C7iZAzVhu149RMah2fFdommhY5QytVtSyDB/woTMQDw88s
         ngzEVgd+La0vQOv5j5zPNa67fpzcEKdW0KVYH36/hx/XMjrVeglDLXTDVCdxeHMrp64L
         DXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297909; x=1774902709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ob8Y//wo6MRj/M0Dz67mgrBX7aDHTN1F2suUDWyFSyU=;
        b=eCJoqbb9xdGcUi9PJ6UwedCleCIDlN4oxFjLTna3yBBu19ZQd/2qA6wLqKZnNi0a0n
         jVACEaQPU3uNzdMEBs+gYrfRrld5Z3MWE7MsIzmB0OIH/jm3fei0Afou2eRauaeWkEG6
         PtEX3hmYz6ACG6l0RjIUI5wGZY8/i/3mUPiKzyLrr67wI6Q15lpoi75sAtozUWORXQev
         B02KztacYKkY+UKfWn+ac2JsSnSdZwNSZC2/HZgHG7sh1RXxBcf4VLk0pER5HBLTLrJj
         OMBk+Nyf5/6NhLGXbTQqKDse36RBNff42LK96M+1FJ7bO0+xn81ep996iR6Nq6XkRW8f
         tfyw==
X-Gm-Message-State: AOJu0YyrwVUdwAlVFjNrjvJ6tpbbFhgIx1uT0jW4fhWET8zCUQWgZrf+
	zGrcQV807nWe3sjyjYSIWQ06bpDLFKukCzl9DpT8wKqbm1h5soy8YxvgdzNMeXbXHNklJek0fMh
	AVa7f
X-Gm-Gg: ATEYQzxSCCCuJ7aKO1xpGIBdLKbeTn0gklUDyzMde9vkEWtQX7Ak/t8TovHdDI/HZnE
	cik66Qun728xgfZ3SQyYlPd7G+wsyq4q+O6RzvKJQvg3WYEY+S5Qa3GABK9ZtSbw8HkXpkyJtEl
	Wd4JBrKeqlXqu21SZdQ+1CUdYfP3yipoBRBjMFfZLOy/EYQyKDOJdB7B3uXpOE0NokyYy+0pnnA
	TTy0uZzz2o4N7mRZayqakoVdxyBhiJ8yxczspPj88Jeglz7GyU/1EacbQxY0RYapq7iaUR7JYvS
	5qXNLgR39DGT4fAxTKpu82lkeizTfMfMmJIMpXPgQkMj4qFlKOfQnIgnWzhl2k5RffvrC2S8DrI
	O3Ymr2PSvUipdo/eT3rmTYxITDCo7eLU9paESoiAhQ6jazJthrpIWjlA5PBwI/8fLy4P3Jnonj0
	gDDqIU4+WDK4hDgXWBy/iFvOEZfUyVtfusmA+W+psLLHLMzB8dhoYS31iGvtlNonO3B84c85Fet
	+nV
X-Received: by 2002:a05:622a:213:b0:50b:4bb6:d9b6 with SMTP id d75a77b69052e-50b4bb6e880mr132565441cf.32.1774297909339;
        Mon, 23 Mar 2026 13:31:49 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fb9c10sm1014271785a.19.2026.03.23.13.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:31:48 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	pratyush@kernel.org,
	skhawaja@google.com
Subject: [PATCH v2 2/2] selftests: liveupdate: add test for double preservation
Date: Mon, 23 Mar 2026 20:31:45 +0000
Message-ID: <20260323203145.148057-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323203145.148057-1-pasha.tatashin@soleen.com>
References: <20260323203145.148057-1-pasha.tatashin@soleen.com>
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

