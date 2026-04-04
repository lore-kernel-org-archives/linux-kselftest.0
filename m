Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C93A9D9B;
	Sat,  4 Apr 2026 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775298314; cv=none; b=gl71/8BefGTXQI7AsXNP+xgW8Inl6oFQO1sL/xCynCt1gPtRroiV9f1YHLaXcP6+9GO8RMH3//RAkD3oc7axiLag/zEFI2OcPvC1uazQT2CFv1NX8MQIGcKjBn4xNwrr3pclEp/ij8xPVi26PfZI6eNjJ/w/aqOaeSZaNpvRbAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775298314; c=relaxed/simple;
	bh=yhc+rjmZS+/ri4F15AH1UIS3IbQVJpGORk0EnBOsrJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9T8TjHSircqZAR7w/Z4bEHxWXyiZsDyB7go8WPfeWRrzZoS50RaDDCZ2SCvU1rly85asBcV3R0nrH3Sn0x1uKfu6rnSq2tv7ZwefcvHfq4omXhjku8Q64JEyJv8ck7uqWmKXByW7ZMpkwpGaEdu1EVChE+UdTb7s8duCboD9YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYQ7ubCn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYQ7ubCn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061D2C19423;
	Sat,  4 Apr 2026 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775298311;
	bh=yhc+rjmZS+/ri4F15AH1UIS3IbQVJpGORk0EnBOsrJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZYQ7ubCnRVb1epQcNt1j443bvLWxuikT4iUFsiuU46MIoNMeVgLQML0zWXDSzi/KX
	 lqPxpdpMEUS7GtjMImivTxeJxMBNqikNRC5Ob9svWrFDvSDnIE5ZKLV+m0Hm/uIloc
	 RMNIVj06ugYvwWO4ZQudVD6r3dISz3lxvpRzRLQk2gSUYbPSIHVhVl/LO4eB+baiY7
	 vLYFjeqIjVnO8urGjlAMtQuoHUZp46a1JLsx38hgFbPlmjPOGnZ3xePH6ezBI+AoAr
	 OKw/KzWXDsyVjDAfaimZD42Fx8eY59/n25MAbWO4lGJX5qHLFuTVSGzO4HFtMY4nmA
	 vg4epi0k04JTQ==
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
Subject: [PATCH v3 4/6] selftests/liveupdate: add test for zero-size memfd preservation
Date: Sat,  4 Apr 2026 10:24:47 +0000
Message-ID: <20260404102452.4091740-5-pratyush@kernel.org>
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

A zero-size memfd is a special case of memfd preservation. It takes a
different path from normal both during preservation and during restore.
In the serialization structure, the number of folios is zero and the
vmalloc array with folios is empty. The restore logic should check for
this and make sure to not touch the invalid array.

Add a test to make sure this path works as expected. In stage 1, the
test creates and preserves a memfd without any data. In stage 2, the
test retrieves the memfd and makes sure it is still without data.

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 .../testing/selftests/liveupdate/luo_memfd.c  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
index 068c7f30c4de..2889a21523fd 100644
--- a/tools/testing/selftests/liveupdate/luo_memfd.c
+++ b/tools/testing/selftests/liveupdate/luo_memfd.c
@@ -36,6 +36,9 @@
 #define MEMFD_DATA_BUFFER_SIZE SZ_1M
 #define MEMFD_DATA_FS_COPY "memfd_data_fs_copy.bin"
 
+#define ZERO_SESSION_NAME "zero_session"
+#define ZERO_MEMFD_TOKEN 1
+
 static int luo_fd = -1;
 static int stage;
 
@@ -108,6 +111,60 @@ TEST(memfd_data)
 	}
 }
 
+static void zero_memfd_stage_1(struct __test_metadata *_metadata)
+{
+	int zero_fd, session;
+	struct liveupdate_session_preserve_fd preserve_arg = { .size = sizeof(preserve_arg) };
+
+	session = luo_create_session(luo_fd, ZERO_SESSION_NAME);
+	ASSERT_GE(session, 0);
+
+	zero_fd = memfd_create("zero_memfd", 0);
+	ASSERT_GE(zero_fd, 0);
+
+	preserve_arg.fd = zero_fd;
+	preserve_arg.token = ZERO_MEMFD_TOKEN;
+	ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_PRESERVE_FD, &preserve_arg), 0);
+
+	daemonize_and_wait();
+}
+
+static void zero_memfd_stage_2(struct __test_metadata *_metadata)
+{
+	int zero_fd, session;
+	struct liveupdate_session_retrieve_fd retrieve_arg = { .size = sizeof(retrieve_arg) };
+
+	session = luo_retrieve_session(luo_fd, ZERO_SESSION_NAME);
+	ASSERT_GE(session, 0);
+
+	retrieve_arg.token = ZERO_MEMFD_TOKEN;
+	ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_RETRIEVE_FD, &retrieve_arg), 0);
+	zero_fd = retrieve_arg.fd;
+	ASSERT_GE(zero_fd, 0);
+
+	ASSERT_EQ(lseek(zero_fd, 0, SEEK_END), 0);
+
+	ASSERT_EQ(luo_session_finish(session), 0);
+}
+
+/*
+ * Test that a zero-sized memfd is preserved across live update.
+ */
+TEST(zero_memfd)
+{
+	switch (stage) {
+	case 1:
+		zero_memfd_stage_1(_metadata);
+		break;
+	case 2:
+		zero_memfd_stage_2(_metadata);
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

