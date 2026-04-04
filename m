Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A010A3AA50B;
	Sat,  4 Apr 2026 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775298316; cv=none; b=UIbXUuqjuMiCgf+R9RZQLcLQdMjo3nnusGp9+PTL2e9098Fzp4/nNAaPcUgqzJGUsBiSEXSOVtVe4gN9ruV0rtDN16VUlty7gDy9Qb90xlgWLPgK/YpIEdyhqkxpRM1dyHSC2FhVh3+/BX/RG28ARiswpxwNK1AEICJzdPhp30A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775298316; c=relaxed/simple;
	bh=HbTfOVPJ6K/pRH8J6grgNsnP9Mdw6sr2NEXeLDO74i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUwSurdiXQePuJ4nNEERL3VIo+MKllA96nE7oTxuctrsLYLfjkGe8UgRcUj+e4hG2dTH5He9PR9pvWgWN4y3bk9iCGLwXAIpP0FgTZluFLdFgdSd1YorKFzIEKjuifR3VqIaJZPeuFJDtgFKZldvvxHJygaKZNVwk5ABBTfKsz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhXhT4mL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhXhT4mL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC74C19425;
	Sat,  4 Apr 2026 10:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775298316;
	bh=HbTfOVPJ6K/pRH8J6grgNsnP9Mdw6sr2NEXeLDO74i4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AhXhT4mLjF4Cf8C62FA/KA/9pEoCDE47gsVmIFBWLTITZCgMIKZDwQxCeMJRdFQMj
	 6DzWIngvuCeXyHjq+VYiAel/m4+T9MFxPuzN+qt+FBc1yHJ0A2xm5BKVz67jHyu64e
	 nUfgw1V7azXDK8pTO8KL20Fn4FKyiNBlMZyuw7vSfuDfgosIxZw9sRQqlTxJHpTMSg
	 mQvrxFhl2s615uwDAyhc0HbqI2yVMaz/uetKKnpkeoxFLF+VR0cTop5P0FCkmgpl8l
	 rJbHS3S3ESSNJx+pV78/ntAZa3Abas8QBmDb0TXu0HjbaPA8Ge7qEDX0PSQd7GizcN
	 ZIlyNzFx1kxTQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 6/6] selftests/liveupdate: add fallocate test for memfd
Date: Sat,  4 Apr 2026 10:24:49 +0000
Message-ID: <20260404102452.4091740-7-pratyush@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260404102452.4091740-1-pratyush@kernel.org>
References: <20260404102452.4091740-1-pratyush@kernel.org>
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
commit 50d7b4332f27 ("mm: memfd_luo: always make all folios uptodate").

Add a test that fallocates some memory in a memfd, preserves it, writes
to it. Then in stage 2 it verifies the written content is still present.

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 .../testing/selftests/liveupdate/luo_memfd.c  | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
index 661a7c922e9d..4a90044ecf1d 100644
--- a/tools/testing/selftests/liveupdate/luo_memfd.c
+++ b/tools/testing/selftests/liveupdate/luo_memfd.c
@@ -43,6 +43,11 @@
 #define PRESERVED_MEMFD_TOKEN 1
 #define PRESERVED_BUFFER_SIZE SZ_1M
 
+#define FALLOCATE_SESSION_NAME "fallocate_session"
+#define FALLOCATE_MEMFD_TOKEN 1
+#define FALLOCATE_BUFFER_SIZE SZ_1M
+#define FALLOCATE_DATA_FS_COPY "fallocate_data_fs_copy.bin"
+
 static int luo_fd = -1;
 static int stage;
 
@@ -222,6 +227,84 @@ TEST(preserved_ops)
 	ASSERT_EQ(lseek(fd, 0, SEEK_END), PRESERVED_BUFFER_SIZE);
 }
 
+static void fallocate_memfd_stage_1(struct __test_metadata *_metadata)
+{
+	int fd, session;
+	char *buffer;
+	struct liveupdate_session_preserve_fd preserve_arg = { .size = sizeof(preserve_arg) };
+
+	buffer = malloc(FALLOCATE_BUFFER_SIZE);
+	ASSERT_NE(buffer, NULL);
+
+	session = luo_create_session(luo_fd, FALLOCATE_SESSION_NAME);
+	ASSERT_GE(session, 0);
+
+	fd = memfd_create("fallocate_memfd", 0);
+	ASSERT_GE(fd, 0);
+
+	/* Fallocate memory but do not write to it yet */
+	ASSERT_EQ(fallocate(fd, 0, 0, FALLOCATE_BUFFER_SIZE), 0);
+
+	preserve_arg.fd = fd;
+	preserve_arg.token = FALLOCATE_MEMFD_TOKEN;
+	ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_PRESERVE_FD, &preserve_arg), 0);
+
+	/* Now write to it after preserving */
+	ASSERT_GE(generate_random_data(buffer, FALLOCATE_BUFFER_SIZE), 0);
+	ASSERT_EQ(save_test_data(FALLOCATE_DATA_FS_COPY, buffer, FALLOCATE_BUFFER_SIZE), 0);
+
+	ASSERT_GE(lseek(fd, 0, SEEK_SET), 0);
+	ASSERT_EQ(write_size(fd, buffer, FALLOCATE_BUFFER_SIZE), 0);
+
+	daemonize_and_wait();
+}
+
+static void fallocate_memfd_stage_2(struct __test_metadata *_metadata)
+{
+	int fd, session;
+	char *buffer;
+	struct liveupdate_session_retrieve_fd retrieve_arg = { .size = sizeof(retrieve_arg) };
+
+	buffer = malloc(FALLOCATE_BUFFER_SIZE);
+	ASSERT_NE(buffer, NULL);
+
+	session = luo_retrieve_session(luo_fd, FALLOCATE_SESSION_NAME);
+	ASSERT_GE(session, 0);
+
+	ASSERT_EQ(load_test_data(FALLOCATE_DATA_FS_COPY, buffer, FALLOCATE_BUFFER_SIZE), 0);
+
+	retrieve_arg.token = FALLOCATE_MEMFD_TOKEN;
+	ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_RETRIEVE_FD, &retrieve_arg), 0);
+	fd = retrieve_arg.fd;
+	ASSERT_GE(fd, 0);
+
+	ASSERT_EQ(verify_fd_content_read(fd, buffer, FALLOCATE_BUFFER_SIZE), 0);
+
+	ASSERT_EQ(luo_session_finish(session), 0);
+}
+
+/*
+ * Test that an fallocated memfd is preserved across live update and can be
+ * written to after being preserved.
+ */
+TEST(fallocate_memfd)
+{
+	if (cwd_is_tmpfs())
+		SKIP(return, "test saves data to rootfs, cannot run on tmpfs");
+
+	switch (stage) {
+	case 1:
+		fallocate_memfd_stage_1(_metadata);
+		break;
+	case 2:
+		fallocate_memfd_stage_2(_metadata);
+		break;
+	default:
+		TH_LOG("Unknown stage %d\n", stage);
+		ASSERT_FALSE(true);
+	}
+}
+
 int main(int argc, char *argv[])
 {
 	int expected_stage = 0;
-- 
2.53.0.1213.gd9a14994de-goog

