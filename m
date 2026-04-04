Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497AC3A9D9C;
	Sat,  4 Apr 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775298314; cv=none; b=UV8guYlS97kXg4TKxTrQNXcsK+sj0mMWQrKfQyB8cr7KrrKJWyEkIV9uQrJguckONS1glTgJ+PSn+nhF0Kvf5UTpWkVUSepQahWeK8KHpYnUIW54c1+oECtty0+Y1y5mIR80pKabZv2PhVGoYP4J9pqrDhHMYsu6xIj1NbD+Q7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775298314; c=relaxed/simple;
	bh=JfLttArZOADtfi5TGZ0YNDYHW3nPoKjJ1lSo350PlLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HiBHdjOeQXxU55wBZuN695LdgBIWUKDt0Tj0LCpJtyEtJTHQrrNkQOVrYwrtEI/cmLDqJlWG7pbSD6RkbaeMj+31IYZ9J57U/lmjrZaI9syp4ryM/7LZM4ON2y1D4nUtLKjq0myaQoJhgKqEpGmXmqEj24nMmjzDTuWVcZwGW8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LU4xdOV0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LU4xdOV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4202AC2BCAF;
	Sat,  4 Apr 2026 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775298314;
	bh=JfLttArZOADtfi5TGZ0YNDYHW3nPoKjJ1lSo350PlLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LU4xdOV06IMSDczZpzEpiO/sssF/KovagN6uuJsWEJEOtmpk0im6gHS5tDVGSjFHX
	 FB75OF+rYDWTr2D1DLz/yLtcUcAk16Dq4g1hO9WSLskBQ3vv1bn9t49uWq6BcBpRXL
	 VDD4aDUu8vs4Li8OtsFWjL6ZwWfTpmUBPJyJlU9yyfYEAOUk+0U3yT7YK2Geu1w0gq
	 vZfCqClXMHnoLlt2PMm+rykqOgYx2o1wOqpGVLAh3+su+bJiD2sC9RU5hTjGldmDG5
	 TuBa/R36+4OcxHu1GzI3bckMwYQ4dyE/nr7612/dajhw5uJCemaaQ6ImoRIDYuQNff
	 QBjo9/IDOO1qA==
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
Subject: [PATCH v3 5/6] selftests/liveupdate: add test for operations on a preserved memfd
Date: Sat,  4 Apr 2026 10:24:48 +0000
Message-ID: <20260404102452.4091740-6-pratyush@kernel.org>
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

Once a memfd is preserved, certain operations are not allowed to
succeed since they might make the state of the memfd inconsistent with
the serialized state. Among these operations are truncating or growing
the memfd. Writes and reads to already existing memfd should succeed.

Add a test that makes sure a preserved memfd does not allow growing or
shrinking, but does allow reads and writes to existing memory to go
thorough.

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 .../testing/selftests/liveupdate/luo_memfd.c  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
index 2889a21523fd..661a7c922e9d 100644
--- a/tools/testing/selftests/liveupdate/luo_memfd.c
+++ b/tools/testing/selftests/liveupdate/luo_memfd.c
@@ -39,6 +39,10 @@
 #define ZERO_SESSION_NAME "zero_session"
 #define ZERO_MEMFD_TOKEN 1
 
+#define PRESERVED_SESSION_NAME "preserved_session"
+#define PRESERVED_MEMFD_TOKEN 1
+#define PRESERVED_BUFFER_SIZE SZ_1M
+
 static int luo_fd = -1;
 static int stage;
 
@@ -165,6 +169,59 @@ TEST(zero_memfd)
 	}
 }
 
+/*
+ * Test that preserved memfd can't grow or shrink, but reads and writes still
+ * work.
+ */
+TEST(preserved_ops)
+{
+	char write_buffer[128] = {'A'};
+	int fd, session;
+	char *buffer;
+	struct liveupdate_session_preserve_fd preserve_arg = { .size = sizeof(preserve_arg) };
+
+	if (stage != 1)
+		SKIP(return, "test only expected to run on stage 1");
+
+	buffer = malloc(PRESERVED_BUFFER_SIZE);
+	ASSERT_NE(buffer, NULL);
+
+	session = luo_create_session(luo_fd, PRESERVED_SESSION_NAME);
+	ASSERT_GE(session, 0);
+
+	fd = create_random_memfd("preserved_memfd", buffer, PRESERVED_BUFFER_SIZE);
+	ASSERT_GE(fd, 0);
+
+	preserve_arg.fd = fd;
+	preserve_arg.token = PRESERVED_MEMFD_TOKEN;
+	ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_PRESERVE_FD, &preserve_arg), 0);
+
+	/*
+	 * Write to the preserved memfd (within existing size). This should
+	 * work.
+	 */
+	ASSERT_GE(lseek(fd, 0, SEEK_SET), 0);
+	/* Write buffer is smaller than total file size. */
+	ASSERT_EQ(write_size(fd, write_buffer, sizeof(write_buffer)), 0);
+	ASSERT_EQ(verify_fd_content_read(fd, write_buffer, sizeof(write_buffer)), 0);
+
+	/* Try to grow the file using write(). */
+
+	/* First, seek to one byte behind initial size. */
+	ASSERT_GE(lseek(fd, PRESERVED_BUFFER_SIZE - 1, SEEK_SET), 0);
+
+	/*
+	 * Then, write some data that should increase the file size. This should
+	 * fail.
+	 */
+	ASSERT_LT(write_size(fd, write_buffer, sizeof(write_buffer)), 0);
+	ASSERT_EQ(lseek(fd, 0, SEEK_END), PRESERVED_BUFFER_SIZE);
+
+	/* Try to shrink the file using truncate. This should also fail. */
+	ASSERT_LT(ftruncate(fd, PRESERVED_BUFFER_SIZE / 2), 0);
+	ASSERT_EQ(lseek(fd, 0, SEEK_END), PRESERVED_BUFFER_SIZE);
+}
+
 int main(int argc, char *argv[])
 {
 	int expected_stage = 0;
-- 
2.53.0.1213.gd9a14994de-goog

