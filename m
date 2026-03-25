Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E163242AC
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 18:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462834; cv=none; b=ltMQ3KDLC/tfPr3+eHxA+WegDVZ3MAjvXiAhJRHGn5agyHMN9RdQZQaVh1yO1w5aAxGPkblpzvzcEQJzLa7+eNGlUWcvQNA9/rtmmUUCWbzzcWz9wAjFVcu7Nq3w8Hr4ClLI0OPP9pg3mcG6Lt5ANQnsejd0z/+nAt6/63LVRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462834; c=relaxed/simple;
	bh=GBazXh/uUV+veTugAXj7FLLeItvlURuuxUNZwTmoUrY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iARAl34R6LUUYlpWCFzgi1mz8+isG5nBdr1PX+zT7fIdN2ZH71XfTBWexXMhC1NJ6RDTssATcgI2YS51IvnNg23fUkidzlTQe9HDwKkGDxWr03hUaPl9cNQ2uMWNlwrwtRj4jeIyBwR7iwttg0NvLfkr7JBGgyjDio+bCck3XH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=AnRg3aAb; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="AnRg3aAb"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cd8576a512so143013185a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 11:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774462832; x=1775067632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHul+QGmCaYYH+cSj7r6hzl0Za0NZYfxsHk+JlDRO+k=;
        b=AnRg3aAb7+X+f9ButWL0knvC5TyGmEeeWeiozk8VwOFQ9PH9fkBBXTltpQKqBF+L2C
         dWys7Lq9dL7uN8EMXFBgZ//MyMaW274PQnhAmaXj0Jdij+5+3vvYVyWA60GoeJc90Mg3
         KFmaN/BSQ+hoUNYG1pAdToaiXBS9xOdutDLpGKokUXaXp0WQAsSy4e1Mwn5MVNmV/UBk
         iK4KVkx1lJrCfqZHuFMNzDsiXy+HL+CK47zM5hRolfbtheWajAYcnjv81679Bh81Eu6b
         zNkTbouwjI3gxtCF+bCF3hmjD2XxI8UVezgn0ADd/5qCKIxfGnwAVk4O694DWbVESQWE
         6YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462832; x=1775067632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHul+QGmCaYYH+cSj7r6hzl0Za0NZYfxsHk+JlDRO+k=;
        b=HIi2oYYhm5ea18o1dK5jJ7UnbKami0hmwUhfE5ZFc/CSiVInGD51Ek6PY+ianSTlS3
         j5yamfqrD4IydMYDZ2V2clRadwCp6feHngI7/XRX30SW8y+Yk605VvEk8ZvNuQ3h1YrX
         J7xfGcKDXhAotmJhWget0ABS/xy3yq1ghAcklRfBAbV0BVwQtjNey+xHOL9IJeQVtTVR
         aar/0lh5QN0g4wh2a0txAL2uMjFC4pSkxwR2H+RoC2LDAid7D5u0F3v2x5neOhib6cnd
         u4c6kJHAP+OV+BtS+AMIGlQw2h0R4w9FHxOvnEm7MZptSYoY9VpQJ2hQ86VUtqjtdpdV
         5vtA==
X-Gm-Message-State: AOJu0YyYAYYdxra9UcbMctlxcGtvJkG8+iTuDRK59rqLLOXkB8j6WoxA
	pE6U85PLa03E8MhO3AbRkWfLEhU0mkeelXxB98SsKQmwRP522M0VnU6e++G16J3PjjKZgkiprvv
	jdvGN
X-Gm-Gg: ATEYQzwwNIGy1cXH3VRH8sIR0yH3R3K9u482I/y77G+xtRF2LJvOMvSm1MFEyRQ6REK
	JliaWqTBH2FZv8shAkkzE/FuRPZN1Fg9oCFlnTDhkBRqgtvhkpaLGQvLwQKF4vGgYeH4Z6Q7h0y
	mt2EGDVr7EK3ZRk8Sio6eRZtM5GF+VKcauVPq2X2xxiY8w+ERfBl08cSMSWEI9KabEd74y2t88N
	8eKuKWTWwxEbTaVSqvnsOo0IZzq3ZGRRVL/h6VYqrQ/9wBZXlQJ4PbFs8weOGvpo/dyBfBWNzvH
	hmSM7pYtQE8f/oPviBC1IZ1QQTj1LqERKpWPGik+brQrdbxdLH6/LRpFx9NMBA/Hv7bqif3fkJh
	FMJW1FyoUeXCFjWNF93wWsXIcxiQXO6lX1Gu00ZduT8VQa1YSn7ik0aHnvrvLVFbQbFiQOIUX4r
	xbakPTbP43/bS9inPr9s3HdOjqK8u0ZKgWfDXN6bK5xv6xnR0oGFgxw61kSHFfToALLrGJv81Bx
	PJy
X-Received: by 2002:a05:620a:488d:b0:8cf:cc59:c0a0 with SMTP id af79cd13be357-8d0005ab522mr599385885a.27.1774462831645;
        Wed, 25 Mar 2026 11:20:31 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e250556sm64225385a.0.2026.03.25.11.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:20:31 -0700 (PDT)
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
Subject: [PATCH v3 2/2] selftests: liveupdate: add test for double preservation
Date: Wed, 25 Mar 2026 18:20:26 +0000
Message-ID: <20260325182026.467307-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325182026.467307-1-pasha.tatashin@soleen.com>
References: <20260325182026.467307-1-pasha.tatashin@soleen.com>
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

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
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

