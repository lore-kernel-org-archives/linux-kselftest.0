Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715390;
	b=ZY1hCiBnQJoMYYD2bgADv5+4AmseWa2uncOiO6KeVRUKw8/w/A+wKQf9/I6Y0MZ4fXMx
	 WEZlzWElQcMyhBD+WJeeXgxiR5wEWMBvyFOn7rDjwvp+cptHvzr34b8SYZSyHboXmnKGn
	 QqOzZlbEtDA07z6IqP2edyHTozqbIlvPYZQUrRzjakaeebraVfj/KzxabK0v2qRc2CQ2C
	 9U80iVMgOBCTKY8AjvMlRatpqjAWLcf+iqGmagzh0ta6RzcwXKjeWUvDIATeal9Bpt0gG
	 xnT2NqOz3FsvdQANWw6q9OmPDvTNzz8P0S8JyMIVTNcQW7a/LpgXsOH5LUVxF7uV93g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715390;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=85ZcI5ScG+6Wnelu03wiw1vV8OKX/Auzop2dtnH+X7E=;
	b=3j2rZc/G7RS3jo0ieRfoXPu3RpRvbUuIR0B4qFQ4kl0Uu1SzdsjbHgwoqHrBVK5v3+Tb
	 OI04PWa25YW4C3LtKmQJk6WlcEm2zGDVf5+vFs8/EbC4yTE57X+N1QQbw3bxulYN1IBK9
	 /RYEPsrJO2g6hrWsOrQEgkwiNwBZZ6+RDORBG9Dpl/0OoB2H7wuIIZKwQLxH+F12OkGpO
	 sh26glwv67gJgRlHiRl4RxboPMHsG1dXk6lbWpMvcCNj08vI5dL2PfgCB82n22tUQwgUd
	 roCN//qut/Cre80usL8Ls5yYVdy31JgLEC35LWBiL1aJUI5xtUdzrXiYGPQlTtF+uJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XXk6ATFM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA9E606A324;
	Tue,  3 Nov 2026 14:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XXk6ATFM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB471F000C1;
	Tue,  3 Nov 2026 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793715389;
	bh=85ZcI5ScG+6Wnelu03wiw1vV8OKX/Auzop2dtnH+X7E=;
	h=From:To:Cc:Subject:Date;
	b=XXk6ATFMZuDxS3YysJMlPkekIuUKFVm9SeWN2STzdwQZSb1l9qb+dyVlQuQJ3Cdn3
	 +jU7/M5OR4je69UkuFeAENWyFSU1Kh/h5h/fKdQ+ukh1iegGs42YPyuY2Eo98Lxdmq
	 4N/OYO29+3MIU6E0CpF+zM4kCZAcJaj8gtDC/wxS7eP145M2jSTa6x7UWHHQaRgl/a
	 9GjAxGi6W12Jk+XcOZZ9C5UOEr/FaZfLwRcJXSpzXeMama1CW+vKH7GE2PiuqDxX28
	 2oOjiXT3oVXOq+8BYn+392mrISYEngHVa8ie+y2hz7o5/fx9CKanQU7R4Yw3W5EglT
	 YQVmCIpR2fVgQ==
From: Sasha Levin <sashal@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/configfs: fix the build on 32-bit architectures
Date: Tue,  3 Nov 2026 09:16:27 -0500
Message-ID: <20261103141627.30838-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixture setup checks the result of mkdtemp() with ASSERT_NE(), which
hands the pointer to the harness. The harness casts both operands to
intmax_t to print them, and on 32-bit architectures gcc warns about the
cast from a pointer to an integer of a different size. The configfs
test builds with -Werror, so it fails to build there:

  kselftest_harness.h:797:49: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]

Compare the result against NULL inside ASSERT_TRUE(), so that the
harness only sees an int.

Fixes: a7fdcb2edd0f ("selftests/configfs: add tests for the userspace interface")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
KernelCI's 32-bit arm kselftest builds fail on this. Built
configfs_test.c with gcc 16 -m32, with and without _TIME_BITS=64 (fails
before, builds after), clang 21 -m32, and both compilers for x86_64.

The harness cast warns for every pointer comparison on 32-bit, a few
thousand warnings in one KernelCI arm build, and configfs only breaks
because of its -Werror. Making the harness print pointers through
uintptr_t would be a separate change.

 tools/testing/selftests/filesystems/configfs/configfs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/configfs/configfs_test.c b/tools/testing/selftests/filesystems/configfs/configfs_test.c
index c6a1049e5852e..94ae8f7103092 100644
--- a/tools/testing/selftests/filesystems/configfs/configfs_test.c
+++ b/tools/testing/selftests/filesystems/configfs/configfs_test.c
@@ -122,7 +122,7 @@ FIXTURE_SETUP(configfs)
 	ASSERT_EQ(unshare(CLONE_NEWNS), 0);
 	ASSERT_EQ(mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL), 0);
 
-	ASSERT_NE(mkdtemp(tmpl), NULL);
+	ASSERT_TRUE(mkdtemp(tmpl) != NULL);
 	strcpy(self->mnt, tmpl);
 
 	ASSERT_EQ(mount("configfs", self->mnt, "configfs", 0, NULL), 0);
-- 
2.53.0

