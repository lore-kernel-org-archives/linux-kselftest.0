Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6DF3A8FF0;
	Mon,  9 Mar 2026 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057304; cv=none; b=t15GO/RGxPTzshYICoXrs+QM8IjrUZhnScCZbxHCmPUhD13EuJO3ucEi+GjbbLyOw1SKshJ0r7FlEG56NgcrHEts9PqET978dbPxTCPLb8THRGNbCHg/XystZ+uJw5xZM51RN31eZ/XKrlDpMtYXtpJNxkfRN7PY5ZnAT3QOJJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057304; c=relaxed/simple;
	bh=6RXZOME/fI1l63GcOwoRovNmREiLIcVnjWmc5XmjY64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3w6Li3Jsar20NpjznS6SW8hQuRy4swDfHPiThS58LemgvLM0CQq+J8HfgS8ugMOx+cv6DueImmQv8lf6OKhVlyxsnv0XCx/Cdim3L+DJb45sYs7yyq/jq1gGGpKXExvDmT9pPoCEQPT8lKd2ZZgqwslMFaIfTuDo2Vrsc/UVwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQZeh5kB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQZeh5kB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310F8C2BCB2;
	Mon,  9 Mar 2026 11:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773057303;
	bh=6RXZOME/fI1l63GcOwoRovNmREiLIcVnjWmc5XmjY64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQZeh5kBgJ/ZWCqVNeQ+F4HO+HIquSD9vTuIBzKtqtBEJCvEmmR4KehU8FiXOZgIw
	 OWN6/YnE2DKORuQd4J510m65RqNhfsY0aq6DzmuyBsCg+mNThgyIblpncAJeItvys7
	 Z1tttz52Y9an2AkpwGj1DtiILYbeyrci6kIOY4+3ebU7AByEMbxutKT3/o8hXu++2z
	 SRfn55ud3pVBsW0pzL9AwwZ3PgAPTRWA+SIs4otVWV+v5RDcZGVlqxlLoWogEdC1Pr
	 hkZh8aBQTZTR0azHl5joWDugVJzWStVNhYnklEeDloS3Kg3fJvwPTq9x2hTMagSkvD
	 QDRdcGjvTcTzA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 6/6] selftests/liveupdate: add fallocate test for memfd
Date: Mon,  9 Mar 2026 11:54:39 +0000
Message-ID: <20260309115441.266805-7-pratyush@kernel.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260309115441.266805-1-pratyush@kernel.org>
References: <20260309115441.266805-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

When memory is added to a memfd via fallocate(), it does not get zeroed
immediately. This is tracked by the absence of the uptodate folio flag.
Initially, memfd preservation simply saved the folio flags at preserve
time. This led to a bug, where all writes to un-initialized fallocated
memory after preserve were lost after live update. This is fixed by
patch [0] (not in mainline as of writing this).

Add a test that fallocates some memory in a memfd, preserves it, writes
to it. Then in stage 2 it verifies the written content is still present.

[0] https://lore.kernel.org/linux-mm/20260223173931.2221759-2-pratyush@kernel.org/

Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 .../testing/selftests/liveupdate/luo_memfd.c  | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
index 75f88101e7b5..dde3c78db50e 100644
--- a/tools/testing/selftests/liveupdate/luo_memfd.c
+++ b/tools/testing/selftests/liveupdate/luo_memfd.c
@@ -43,6 +43,11 @@
 #define PRESERVED_MEMFD_TOKEN 1
 #define PRESERVED_BUFFER_SIZE SZ_1M
 
+#define FALLOCATE_SESSION_NAME "fallocate_session"
+#define FALLOCATE_MEMFD_TOKEN 1
+#define FALLOCATE_BUFFER_SIZE SZ_1M
+#define RANDOM_DATA_FILE_FALLOCATE "luo_random_data_fallocate.bin"
+
 #define LIVEUPDATE_DEV "/dev/liveupdate"
 static int luo_fd = -1, stage;
 
@@ -193,6 +198,65 @@ TEST(preserved_ops)
 	ASSERT_EQ(lseek(fd, 0, SEEK_END), PRESERVED_BUFFER_SIZE);
 }
 
+/*
+ * Test that an fallocated memfd is preserved across live update and can be
+ * written to after being preserved.
+ */
+TEST(fallocate_memfd)
+{
+	int fd, session;
+	char *buffer;
+	struct liveupdate_session_preserve_fd preserve_arg = { .size = sizeof(preserve_arg) };
+	struct liveupdate_session_retrieve_fd retrieve_arg = { .size = sizeof(retrieve_arg) };
+
+	buffer = malloc(FALLOCATE_BUFFER_SIZE);
+	ASSERT_NE(buffer, NULL);
+
+	switch (stage) {
+	case 1:
+		session = luo_create_session(luo_fd, FALLOCATE_SESSION_NAME);
+		ASSERT_GE(session, 0);
+
+		fd = memfd_create("fallocate_memfd", 0);
+		ASSERT_GE(fd, 0);
+
+		/* Fallocate memory but do not write to it yet */
+		ASSERT_EQ(fallocate(fd, 0, 0, FALLOCATE_BUFFER_SIZE), 0);
+
+		preserve_arg.fd = fd;
+		preserve_arg.token = FALLOCATE_MEMFD_TOKEN;
+		ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_PRESERVE_FD, &preserve_arg), 0);
+
+		/* Now write to it after preserving */
+		ASSERT_GE(generate_random_data(buffer, FALLOCATE_BUFFER_SIZE), 0);
+		ASSERT_EQ(save_test_data(RANDOM_DATA_FILE_FALLOCATE, buffer, FALLOCATE_BUFFER_SIZE), 0);
+
+		ASSERT_GE(lseek(fd, 0, SEEK_SET), 0);
+		ASSERT_EQ(write_size(fd, buffer, FALLOCATE_BUFFER_SIZE), 0);
+
+		daemonize_and_wait();
+		break;
+	case 2:
+		session = luo_retrieve_session(luo_fd, FALLOCATE_SESSION_NAME);
+		ASSERT_GE(session, 0);
+
+		ASSERT_EQ(load_test_data(RANDOM_DATA_FILE_FALLOCATE, buffer, FALLOCATE_BUFFER_SIZE), 0);
+
+		retrieve_arg.token = FALLOCATE_MEMFD_TOKEN;
+		ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_RETRIEVE_FD, &retrieve_arg), 0);
+		fd = retrieve_arg.fd;
+		ASSERT_GE(fd, 0);
+
+		ASSERT_EQ(verify_fd_content(fd, buffer, FALLOCATE_BUFFER_SIZE), 0);
+
+		ASSERT_EQ(luo_session_finish(session), 0);
+		break;
+	default:
+		TH_LOG("Unknown stage %d\n", stage);
+		ASSERT_FALSE(true);
+	}
+}
+
 int main(int argc, char *argv[])
 {
 	int session, expected_stage = 0;
-- 
2.53.0.473.g4a7958ca14-goog

