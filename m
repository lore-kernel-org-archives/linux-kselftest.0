Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AC13A5E92;
	Mon,  9 Mar 2026 11:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057299; cv=none; b=C+Z680hh2Rhgow02X2YkrmfYfxdt+/N1IJjwC9pj6XQrJGllXkXjlUSGq9NQq3ca93uNXjMjQ1AZuHGMYNwyVr1oiPolN6sroUdNu6DPr+rA6OBIm2nHxcRgzt1C11q7L/TVGHBglLM1Bk/Mvs3aT2ii82DIkcXwZu6vDBkku8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057299; c=relaxed/simple;
	bh=msGcB9Zdx1CYUYZUlEY30sJksrgQfdKtvara48aboNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CxofEVEXBCu1NFSGfeLKx4GMkDRzoMzgBMyLGBm495bA2XK9QNdIRUBGabdR56nAyU0MnlXSXPNJ33U1TmGGAIfjtG110K+9z2H0WUp0XTL1aniBoneAvBHTHAav61u7G2I4t6aAUnGiGL8IIK5nv23GB0JdOXwkYs9zylhOkPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZfhSkk8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZfhSkk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98EDC2BCAF;
	Mon,  9 Mar 2026 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773057299;
	bh=msGcB9Zdx1CYUYZUlEY30sJksrgQfdKtvara48aboNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZfhSkk80LQ6XowDTBUIF3gokRcMP3Ia+WyiGmzRrKoTsE+ulPe3hhNaMNFdb3Bnz
	 MGw4164XZfzKQElbg4BliKe5j9VgSCGmLRFRdqEg7QFnmJd44jT/M2hqM6pveB/qkY
	 4wbmtpy7l4bs6HbunVsPhH0R1AmZVXG9LrUEc4yLYh8hIx4QO5IP0JyenXnOijf1yi
	 rIZxJphhLRnPzYsiHdCxIq071i6hfltkTIJ0TSFMEecIXdbhK8dRU54ZmfmFFyatk7
	 LVgBXH3NpE3d84tuLBNPPg0QiW5aNdJCnhAJDYdUwvLqvTOjVbJxaquMekC564M0nl
	 L5l1J05HSfLDA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 4/6] selftests/liveupdate: add test for zero-size memfd preservation
Date: Mon,  9 Mar 2026 11:54:37 +0000
Message-ID: <20260309115441.266805-5-pratyush@kernel.org>
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

A zero-size memfd is a special case of memfd preservation. It takes a
different path from normal both during preservation and during restore.
In the serialization structure, the number of folios if zero and the
vmalloc array with folios is empty. The restore logic should check for
this and make sure to not touch the invalid array.

Add a test to make sure this path works as expected. In stage 1, the
test creates and preserves a memfd without any data. In stage 2, the
test retrieves the memfd and makes sure it is still without data.

Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 .../testing/selftests/liveupdate/luo_memfd.c  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
index 52b5f6b16e19..56106cd09978 100644
--- a/tools/testing/selftests/liveupdate/luo_memfd.c
+++ b/tools/testing/selftests/liveupdate/luo_memfd.c
@@ -36,6 +36,9 @@
 #define MEMFD_DATA_BUFFER_SIZE SZ_1M
 #define RANDOM_DATA_FILE "luo_random_data.bin"
 
+#define ZERO_SESSION_NAME "zero_session"
+#define ZERO_MEMFD_TOKEN 1
+
 #define LIVEUPDATE_DEV "/dev/liveupdate"
 static int luo_fd = -1, stage;
 
@@ -89,6 +92,50 @@ TEST(memfd_data)
 	}
 }
 
+/*
+ * Test that a zero-sized memfd is preserved across live update.
+ */
+TEST(zero_memfd)
+{
+	int zero_fd, session;
+	struct liveupdate_session_preserve_fd preserve_arg = { .size = sizeof(preserve_arg) };
+	struct liveupdate_session_retrieve_fd retrieve_arg = { .size = sizeof(retrieve_arg) };
+
+	switch (stage) {
+	case 1:
+		session = luo_create_session(luo_fd, ZERO_SESSION_NAME);
+		ASSERT_GE(session, 0);
+
+		zero_fd = memfd_create("zero_memfd", 0);
+		ASSERT_GE(zero_fd, 0);
+
+		preserve_arg.fd = zero_fd;
+		preserve_arg.token = ZERO_MEMFD_TOKEN;
+		ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_PRESERVE_FD, &preserve_arg), 0);
+
+		close(zero_fd);
+		daemonize_and_wait();
+		break;
+	case 2:
+		session = luo_retrieve_session(luo_fd, ZERO_SESSION_NAME);
+		ASSERT_GE(session, 0);
+
+		retrieve_arg.token = ZERO_MEMFD_TOKEN;
+		ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_RETRIEVE_FD, &retrieve_arg), 0);
+		zero_fd = retrieve_arg.fd;
+		ASSERT_GE(zero_fd, 0);
+
+		ASSERT_EQ(lseek(zero_fd, 0, SEEK_END), 0);
+
+		ASSERT_EQ(luo_session_finish(session), 0);
+		close(zero_fd);
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

