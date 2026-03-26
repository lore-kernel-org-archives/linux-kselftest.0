Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4740F8F9
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774543191; cv=none; b=jqga+T6mKbqUSwigF2tck/EFtSDdva+UAn0f8M4NI3nCVzdomczoHRt/TEgeaDZwKWhoGQC7mwMMn/9T6QWjak1FicHJYZQo+Kxq3V71DAlBca7v3DUK46q2DTdG3kLtq27dR7b1U5SeMnhF6ey55khuwuI8kIok65TSd1ookhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774543191; c=relaxed/simple;
	bh=GBazXh/uUV+veTugAXj7FLLeItvlURuuxUNZwTmoUrY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPNfNTmQmXPcjmAHPx5tZWslOo6a8y5czhyXbJ81VoqmOZo8/hLR8p8OZW694X8sHUTim6+fdiazip288Gx0/HLehcNbWo93OcEcVXX+6/crH4+mzNK5H7m+/ghn2RYupfSlHM0qu/9zD/KFAgdeIF+mfoovjYJeOMYEhK9CqLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Ds8KrWBO; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Ds8KrWBO"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50b29c4e554so14989011cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774543188; x=1775147988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHul+QGmCaYYH+cSj7r6hzl0Za0NZYfxsHk+JlDRO+k=;
        b=Ds8KrWBOU9GXh5edQu2VDbmKEgosBYsKe79AxCi2LjUaRSKXQi4gn0D/Q3u8AcmN76
         tcYB5FOpvfCHdyOXaDzLihUFY0WtyVf3inqKMmbXL694fuOdtDi0XnpSzbBqwJBxs7z4
         v1RNieDVLtk5rXOH3MqrAHT/Dtxb/OCrCEOXQEaZK95MF/qolTN/yeRsPv6GX2HG3xtj
         lv7Ti895wvUkXixdYs+kFpmH+UNHq/cNbTT5i0tTL42LslpsWJ00TCxw1pqbyex9bdp8
         Y9e2yDHkEhLM6b/D0Ehi3II5YOU/HBAtACdQiLICheNtKYYb3QeatqibVn3L6FpNmp3X
         /zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774543188; x=1775147988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHul+QGmCaYYH+cSj7r6hzl0Za0NZYfxsHk+JlDRO+k=;
        b=AhZ7TGfsnO0OBHUXuvggVRkQOVo9EIOGWpx17PVSKpSTWV+3VpwdbtdTJgGNcrXylq
         UEAm+68/HQXPqPWoOr7o547qRB7f69+fjEt5M/eoV15hmuy0WC5yhRM9/QMOJlEy4SOe
         YSfpZ0oylzE6Kgle8bh1XQi5QpAXTFo+a4S0dodIcd+12XCzkEmVM3aTVQqpBwnfWH5Q
         EL1f5gCs61peQqJnxISptmz3iPszbZ4nBShXvto1HzXgfVVN87cXkVW3w2xaRY8JryjX
         IMg1XxmJNbpMSWFdwwjN0Fkk7KG5ys2mIOPhg+0uf6TxaiH09KMEcjsAyJmyj8DumifX
         Mwzw==
X-Gm-Message-State: AOJu0Ywnh5qt8SKBUYq77LS3mBUlF4uywOncxtve64uRfeP8Bk6NagqY
	Xvspnrzvc9sQ/UDTPB7OmzuGjVO+/UExLpNH6F1mF4Ilp7yEehD5UiShxVdUmLa2bzyb8nZWDO8
	U7l85
X-Gm-Gg: ATEYQzxKJh5y1YB37wgp5lCCQTT6W4x9/uffDSc5W8/MgUFB9eApFTY6xu9AT0eZOyT
	g6KUedbIKGCa5YhT2ZoSYe2GFb+4WFo9um2hvagOzAitTa1brT9BGcMwgKShEpg3vjMHsjJ855X
	cbgeWvMxCL670ebsY/FzFUe/wdPoIYLdJ/Le7rPVEanFNOW3XENxgwd12hNz50B54a0ltxdf1Gj
	W5HY3pmX1slfZgwU/FzFDfpB7I+3+M7DZzd1LYR0opO6rXkk89a9/AJp5fQKP9lhqGU6bzKFhUJ
	YwxIVMkLG3vo8NWDpMzkF5rW/hw3yGf4NW0LqgyU9la+kuFL/Bj14u8a6EyBQ7F+xZ0EGBiiNaa
	/F6VqifIbpHkHsXcXQYOuADxLeboThsPdeLYEMZP8t7CsxlXGf4ZCJIAWlEKLLtyAye+rsDT58J
	KIr+HexBd6IdnmUTPGA5NjiAnO53MYjSXYhEyFKK9TyizdIQtv2Hc88nigmaAbPefuKA==
X-Received: by 2002:a05:622a:251a:b0:508:faa5:4512 with SMTP id d75a77b69052e-50b80e5418dmr113877081cf.50.1774543188330;
        Thu, 26 Mar 2026 09:39:48 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b920f77cfsm28238251cf.6.2026.03.26.09.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:39:47 -0700 (PDT)
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
Subject: [PATCH v4 3/3] selftests: liveupdate: add test for double preservation
Date: Thu, 26 Mar 2026 16:39:43 +0000
Message-ID: <20260326163943.574070-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326163943.574070-1-pasha.tatashin@soleen.com>
References: <20260326163943.574070-1-pasha.tatashin@soleen.com>
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

