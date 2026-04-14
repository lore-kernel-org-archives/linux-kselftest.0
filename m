Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892C1318EE2
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196967; cv=none; b=ajQMX+2rs7F7VKnyAAVzLenIdDE5iwkgfgRRB3Uxnvkc0PxqCoaPGptoUNNCTT6I95Gvh/xSUK1bD0c7aZH7PfvVYTpHzpgi/f/6FMEYYE1LRW8ncDhU/2eLE5Ece5bpgya8y0cowFoZvA75/IrWbsbSyp3xFwnBw1Qw0CvpqeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196967; c=relaxed/simple;
	bh=G0DZF+0pwpWpvyjfgutOGcLoVHg/sZ7xURYEsVLHHAw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozysdFEBEeOZU3d3ss0aZ88f831vlexZKdCpvGHsnZz8HHq10VbXRW45t5LBZ0kMFwMtoqPAJFFM5iFNGuSsY9AZFmSVavBAGRUOiTK9Lk25b6IBGPKkerIszhiE9peFNP0Fe5cyTfaEmqeRwVmE00Cxi3TbSTUVwcyPBzy/mZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=QoTla27F; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="QoTla27F"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ac9ef74131so44813146d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 13:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1776196964; x=1776801764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCXGOxyW+pw6N8ft4rnwW7MuGB9g0PHpMRF3XlVYG+8=;
        b=QoTla27FLB8i4Y1NsrqtWt9TkPk26c1KqXtTIJNEheA9kt946/z47uu27JHu8ZgDcQ
         dS5aSIWMDPPLxjnNZZ0yYen7wfr0xTnFv8YL7Fq+wyyj+koiI9HIzZwqVXE+iRgSdpPm
         9FEDN2rmz2hYe/GVKBdCeK8P8/dJEnwMwFxlw1iq5tY+b5SKEVZsuQCdW+EDS0lhzIt2
         zVAawEn1om5q8fZRud7CLCfHt9nR4N9OxG1r9yv0qXKwHs/3kq9yoFWXnv/2PIvu30RY
         NIDmbcTwTeOmCXvg0P36+kLiv3vkjgmeiyCbub5Bgi0WwMgzgYns6RYIs4ac4Y/O6lNu
         0YjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196964; x=1776801764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yCXGOxyW+pw6N8ft4rnwW7MuGB9g0PHpMRF3XlVYG+8=;
        b=ZmUyuyFxSAe6CR2K4KhQwHJv7dRyI1gM2eRcr2tlr/KMHclaiOg9Uq5ZljHTmmlwYu
         38XPW0SPfxV3LBxNLlUJjS1XSlDHGnA7Ct9XyAtw75WEcEeuyvkTHCbRn3brrfSxsimT
         YjG2sg9NX89V45Zv2DqWghABeNDN3JrwHZLi3ywbpmLtOTNHahukaf175LjxLlHeouuE
         HUc1OLbCQPqjWozicDKAX06evHnAFydiTyW1K20qpMzFGRorP++lbKvj6ddVpR2lHh9D
         Pg5Vp5WTHrdXlhDNypCmtLthMoOyrv+y9jfETJJP6kPIXBzRmHhfSmnwua/s1LUC6AgD
         AjSg==
X-Gm-Message-State: AOJu0Yx/Oearx5xJ88dMvg+tSimd/YbLU/d3OOko5DHbo6uvhCeNKp64
	AryOYerbLeh1+2N/VAO2ooIFPEfIqN5mNapf7cNduIUoG/F15rnOeMos0S2frEZP7VzXkL+rkQ2
	6rmt5
X-Gm-Gg: AeBDieu9jydFjYjvjDhfVIEL/09F1meCOoYYtWtqqpkgPqhXT7LVjZZgAtlCJANTmv1
	pnm0YX91pGGBRIbq5Qxspo4qoHJ/494uwApQbL42pJISxhLCjOudceQFbZw9TQXwtqIMSLe7N2C
	OPK2PPhdtxfO+/gF4jRuMfiQGLJO5GKQXC1uOXy1PAOGZl+/CfaWEmrg2dyS2gmZzEe5mYbSsAR
	P23eZ6KcwN+QnqoKnrY1ma0+sZ4/H4ek+ljTof2gXKMARjAhLYM85RyxSgp7/aelOQ7cD9G5437
	j3MgvqPSaHi3T5pKZOab9vUTUfGdOOMBQuhw/pb8urK2isMf2RJnt+ez6WW55w2oAPjWAmgULN9
	OpPn7N2d7LIhBqtcz1io6AdwCx6dn7I9VB90iskgbanqTSyW30KKKwGu/zfTh31lvHg+epmZDuS
	NBnP1HB/oPk6bJT+FHbDkvftS4PrFDQyQ/bRDIduQGufKJsyP7LCGG6TJnEPsAE/CTHw==
X-Received: by 2002:a05:6214:f24:b0:89c:4cb3:4ea1 with SMTP id 6a1803df08f44-8ac861ef1bdmr302331696d6.20.1776196964120;
        Tue, 14 Apr 2026 13:02:44 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84a180a2sm132213656d6.15.2026.04.14.13.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 13:02:43 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH 3/5] selftests/liveupdate: Test session and file limit removal
Date: Tue, 14 Apr 2026 20:02:35 +0000
Message-ID: <20260414200237.444170-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414200237.444170-1-pasha.tatashin@soleen.com>
References: <20260414200237.444170-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the removal of static limits on the number of sessions and files per
session, the orchestrator now uses dynamic allocation.

Add new test cases to verify that the system can handle a large number of
sessions and files. These tests ensure that the dynamic block allocation
and reuse logic for session metadata and outgoing files work correctly
beyond the previous static limits.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../testing/selftests/liveupdate/liveupdate.c | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 37c808fbe1e9..0eaf97b19267 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -22,6 +22,7 @@
 #include <fcntl.h>
 #include <string.h>
 #include <sys/ioctl.h>
+#include <sys/resource.h>
 #include <unistd.h>
 
 #include <linux/liveupdate.h>
@@ -386,4 +387,102 @@ TEST_F(liveupdate_device, prevent_double_preservation)
 	ASSERT_EQ(close(session_fd2), 0);
 }
 
+static void ensure_nofile_limit(struct __test_metadata *_metadata,
+				long min_limit)
+{
+	struct rlimit hl;
+
+	if (getrlimit(RLIMIT_NOFILE, &hl) < 0)
+		ksft_exit_fail_msg("getrlimit failed: %s\n", strerror(errno));
+
+	if (hl.rlim_cur >= min_limit)
+		return;
+
+	hl.rlim_cur = min_limit;
+	if (hl.rlim_cur > hl.rlim_max)
+		hl.rlim_max = hl.rlim_cur;
+
+	if (setrlimit(RLIMIT_NOFILE, &hl) < 0) {
+		if (errno == EPERM) {
+			SKIP(return, "Insufficient privileges to set RLIMIT_NOFILE to %ld",
+			     hl.rlim_cur);
+		}
+		ksft_exit_fail_msg("setrlimit to %ld failed: %s\n",
+				   hl.rlim_cur, strerror(errno));
+	}
+}
+
+/*
+ * Test Case: Manage Many Sessions
+ *
+ * Verifies that a large number of sessions can be created and then
+ * destroyed during normal system operation. This specifically tests the
+ * dynamic block allocation and reuse logic for session metadata management
+ * without preserving any files.
+ */
+TEST_F(liveupdate_device, preserve_many_sessions)
+{
+#define MANY_SESSIONS 2000
+	int session_fds[MANY_SESSIONS];
+	int i;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	ensure_nofile_limit(_metadata, MANY_SESSIONS + 10);
+	if (_metadata->exit_code == KSFT_SKIP)
+		return;
+
+	for (i = 0; i < MANY_SESSIONS; i++) {
+		char name[64];
+
+		snprintf(name, sizeof(name), "many-session-%d", i);
+		session_fds[i] = create_session(self->fd1, name);
+		ASSERT_GE(session_fds[i], 0);
+	}
+
+	for (i = 0; i < MANY_SESSIONS; i++)
+		ASSERT_EQ(close(session_fds[i]), 0);
+}
+
+/*
+ * Test Case: Preserve Many Files
+ *
+ * Verifies that a large number of files can be preserved in a single session
+ * and then destroyed during normal system operation. This tests the dynamic
+ * block allocation and management for outgoing files.
+ */
+TEST_F(liveupdate_device, preserve_many_files)
+{
+#define MANY_FILES 500
+	int mem_fds[MANY_FILES];
+	int session_fd;
+	int i;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd = create_session(self->fd1, "many-files-test");
+	ASSERT_GE(session_fd, 0);
+
+	ensure_nofile_limit(_metadata, MANY_FILES + 10);
+	if (_metadata->exit_code == KSFT_SKIP)
+		return;
+
+	for (i = 0; i < MANY_FILES; i++) {
+		mem_fds[i] = memfd_create("test-memfd", 0);
+		ASSERT_GE(mem_fds[i], 0);
+		ASSERT_EQ(preserve_fd(session_fd, mem_fds[i], i), 0);
+	}
+
+	for (i = 0; i < MANY_FILES; i++)
+		ASSERT_EQ(close(mem_fds[i]), 0);
+
+	ASSERT_EQ(close(session_fd), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

