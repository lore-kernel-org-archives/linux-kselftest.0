Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161DB3D7D8C;
	Fri,  3 Apr 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775245238; cv=none; b=onKxdzuuT2T4gg4US6DsPjRkxYC5ERcqTBXvAkYydVqsvdeYwsFVOKqSEsfaeS9ecJG2X6dHO9xA/09CHJr3v4B3AfI3g5Jpqc7Qlwp8gnpUUMZkpdhWHFDIhfSkGbsjZJgkM2hNmiI9v6e//ACukDLaE1FGm5HLqMWEz6htjbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775245238; c=relaxed/simple;
	bh=hx4LuheWBNtlwVbJuz9IzDnvXJqSAD9ip7Q7EdlOqnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aj9++dW4lX0SnFdR9GTNS7sR9HvhmS7s8lckEUAOm5msGlfqHKGqsPQR2tHF9gHz1/kljuqpILL+dDQjQfr7AfalXWKkL0+G6T24TZ4QJUStQlL8gKpD/bdVPcY2rtBg/adWjLzGKaZjVdIlslDntmlgMbEk08XIbPWov5y6gz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3ej2wEl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3ej2wEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB6FC19424;
	Fri,  3 Apr 2026 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775245237;
	bh=hx4LuheWBNtlwVbJuz9IzDnvXJqSAD9ip7Q7EdlOqnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a3ej2wElP+3pm9krk6g11dT5QXKQSXJCjHbUiold3i0U+NJB8RlKfgZcxGbiLUSz7
	 A6VoexLAElGlVS2Q4t7lSFX28GrDvLxgGRkqVuqsTgAmsofO5O+ryPwnOZk/HW7fWY
	 KwYGJGnuhroSM2GPlktidOMiaKIFBeV5JpM2e1nFGFlW+LshjuEP19yqngZgIufq2U
	 /+KfF/d4qQRm5/iMnkyw6OYn2Q8i97CTHv8HthTlYdZD930cYZzZQUn7Bm42GPFema
	 Jf0HRYsmBhlwfgob+j81QzJIMm/OGdp72nhgv9wbjES9lkOMRMvklpnv4jKZZ0f/aC
	 UEMcEsbWjtupA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	Pratyush Yadav <ptyadav@amazon.de>
Subject: [PATCH v2 5/6] selftests/liveupdate: add test for operations on a preserved memfd
Date: Fri,  3 Apr 2026 19:40:11 +0000
Message-ID: <20260403194014.3704180-6-pratyush@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260403194014.3704180-1-pratyush@kernel.org>
References: <20260403194014.3704180-1-pratyush@kernel.org>
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
index 3ba0709f2c61..a1e9f34da006 100644
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

