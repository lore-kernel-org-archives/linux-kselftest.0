Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D453A8727;
	Mon,  9 Mar 2026 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057302; cv=none; b=CjROXa+2qH8MR1Bx1wxCmYC1i9B5TWC3tCnB3AZW86VMjNjbPqJrz1+BpKxjhaU7TeEpglWqlMrXhF71EouhEVKrixeAzJ3E3zS9bv+mxtR6acIC+WGpcK/vW4wvvIILAxMm4nzikcIe2+PyDyPIE0DBZJJwVCHkFtHRzaa9rBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057302; c=relaxed/simple;
	bh=hQMT5ZnC+kM/6V8s8lr4xcjgalTDxyHP1vCCvJobalc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQ0DETCog253l9Dc+ZMt6+jhar8k4UvezRw634Ckwel1VNMqMgbT8kkmy4sw5maRh9jhSfGLcZeqxI2Ppf7CH5B8J9u52gDtNzQW6icV1TEJ2QrLzaFDTh5aAs5DWc2JkPUhlnY7pxswUmY7WiYtuJPVbTIkFTGSa+2PEudG5dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j82uKpnm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j82uKpnm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E261CC2BC86;
	Mon,  9 Mar 2026 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773057301;
	bh=hQMT5ZnC+kM/6V8s8lr4xcjgalTDxyHP1vCCvJobalc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j82uKpnmoFrUvTTCkoOY17tPF5sZCZegqhK196oh4IOsYj3uxdMJQPO+xEB8+B3Jv
	 EUVZElGrUZiu/ZK/gUwawNjkf8ZO9XtmtVH2FxLFvzTDmoEAOknwNOUPN1rT1Z/Geh
	 kiIeGzV/ncOGHcFH2dHL22L53TeXvzNulh8dW1JBHbPAWb5C2WSU2SMiexIjc76usk
	 iNLRP6UHbVU7hXOaUT+d2nO6Utvc0hFkdGQs0N+6emPi85eiI1/BCZCRlcgTqBmM/W
	 Gdd2vlVAO+vxY+41HKbZSqnKWprM5Fw58Qt2XgG2P5j6lL+kV46PQFpGwUONvGVdx4
	 8b0CfuywmTEog==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 5/6] selftests/liveupdate: add test for operations on a preserved memfd
Date: Mon,  9 Mar 2026 11:54:38 +0000
Message-ID: <20260309115441.266805-6-pratyush@kernel.org>
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

Once a memfd is preserved, certain operations are not allowed to
succeed since they might make the state of the memfd inconsistent with
the serialized state. Among these operations are truncating or growing
the memfd. Writes and reads to already existing memfd should succeed.

Add a test that makes sure a preserved memfd does not allow growing or
shrinking, but does allow reads and writes to existing memory to go
thorough.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 .../testing/selftests/liveupdate/luo_memfd.c  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
index 56106cd09978..75f88101e7b5 100644
--- a/tools/testing/selftests/liveupdate/luo_memfd.c
+++ b/tools/testing/selftests/liveupdate/luo_memfd.c
@@ -39,6 +39,10 @@
 #define ZERO_SESSION_NAME "zero_session"
 #define ZERO_MEMFD_TOKEN 1
 
+#define PRESERVED_SESSION_NAME "preserved_session"
+#define PRESERVED_MEMFD_TOKEN 1
+#define PRESERVED_BUFFER_SIZE SZ_1M
+
 #define LIVEUPDATE_DEV "/dev/liveupdate"
 static int luo_fd = -1, stage;
 
@@ -136,6 +140,59 @@ TEST(zero_memfd)
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
+	ASSERT_EQ(verify_fd_content(fd, write_buffer, sizeof(write_buffer)), 0);
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
 	int session, expected_stage = 0;
-- 
2.53.0.473.g4a7958ca14-goog

