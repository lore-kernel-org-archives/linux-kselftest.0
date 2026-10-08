Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88933399340
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469674; cv=none; b=sAnLAtiOJ+73MSjXEMrRhbIU28T3go3w2txaqnIyjWKpqOBTDEuNlkjjDj9Au21KzKA8RuYcTkljdHacXPR8TcmLbsCkAJuye8D0Xyf9BK9uJbw3kqzkKoBeVLdVUxJUMiAcNhpU5p+A2U/xvz7wj1N7NA7hRMGcI70tvvug5HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469674; c=relaxed/simple;
	bh=EtjG65TeW8iJffKBLb26OGQJLVjvIjuuHm1ET/mvnLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIwbXrRFeuO367+8OIRCE8gfI7ip9LKhIESc/Xub3Qcgzl4/dLt7oLc9wn6hUvx2YKOFfTnlfp/St4+YAYXAujpwmhldGptH4i0sqp676iCJmMwG/N1mOKNBnXIdiTgIvL5YbJhylDUam657ghw0RRzLE1WV/U+v7quv7kg4dNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DX/hzmQU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DX/hzmQU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so2225990f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469670; x=1792074470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J8tCdvf31u7mf9wAPxH4T+LS5l/fNI4rs8nM7sIQNyw=;
        b=DX/hzmQUQpWoZkxoKNStxFwRvehqjdLrg4xIXndGPcvS57zvMZx+N8a7fls6KvW6N8
         nh37eoOhL/zkCgIwAf07b/YBapMUge1u43ZgeI6ZbE/SawsQm6HVbg34dC4jVMspokdX
         j6MY41j5vWgGVhhnJmsIop+K41g0fKxu1QCOinr6HRqbhGeZ5P8gTl9puuT6nib5eZVM
         cEDUXmGkpgbd1T/PJCIGxOqHWqNlwZLoylOVESLvm/AzGIu6jdwHuNvvp0vmyWaFdC53
         9VpO+cEe+9i8upOweWfQLFSuUGnwyxPXFB4tT9PC01IRrNbEs4BvgurHuBvlnebSnWPZ
         RcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469670; x=1792074470;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8tCdvf31u7mf9wAPxH4T+LS5l/fNI4rs8nM7sIQNyw=;
        b=tXkcp+gCw4y/KxClXRhCw4F3OL/YB/MXUkMf4ValV40L/1Ntg4B2rWAJ3kINe3m6ud
         KtVuUPaHJbrdcMXf+AFYZqHvjr20awDPt7FngM4Krxfau/lArvCuTIq7jiuXE6rVRG8j
         3kOfdRj/Zn0vWq4MDZBFTfe5JqK9trDMh93Lsg4aJNo6rLPc3L2D6R6Nvg/SBVu4/+zp
         XubGJ4ftTIx3Rjw0HjDaX5vG/TLNWZgHCejVAGVTpg4nJVPqpK0yqFY+f8ksVB6xofOZ
         k0txP30x3ujkTtcgpSBO0OLEqrXTaxkMqRLwO/Wv9r5FuGmTeN2+ki7OaG9vSG8Kt6TQ
         67ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwe42Ju3JqBKhIIO+K/SCWUzcaEqufItFyr/JBjnt6PwSczRIkmhBM2qYAmnOzzT+vPRAtzQGSK4ohlFWgcw1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvrRvnUJ5lQQagf1njhwXygMG0IfX6sexCUuxetE9s+Ggr3e8W
	dVJLznT+xGw7iD9WX/M4naD7bbLiNMSfH15nskq041b0TpUMx4t/TZxY
X-Gm-Gg: AYBFou3cfNstx8mWX/1Jnso/G4Yr8Ji4vrCx394073Dco5nq+eSjt8WwaZ1Nl+TvxFv
	nBplvrQCPAjaCKa4JBvf3Rr89IENA2XfGEDzXj2YEUiTCZpj8vksmsyHfapy0wN7jjkpKSjAkwz
	kP0w+BLSPHMr7MzCU/wUzGI8ESq8RExOHUuZx4orYiIsthFQgjP4FqSB4Vy1exrlEPR2L6gqooG
	WjLETIGDExKuiGwjdgeiD4toF8FsXAd5/qjuP2HTmIfl+gQCPDPGmR3mn2+BnTo3Cf++vunda/r
	69VX3hAaGGc6srUpwC76DxlPHw4bzMWUJTiESOmnWNdLCPTtPaaKZ/MJm7cpciXAWGoCFHpvchG
	xYUoVxt4PeuywAbzA8PaEU+kMlZzmwimCKO/dZPSOCXnQdO7A0IuICP/O2gJ5rBSWA301h8YKsw
	eZ4a2IUd4JiE9O2TgLJD42QbXJmoDnAerpY04qcPfF9kXXo7Rsv+DeVI2xqmyCa0Ih3Q4Q/D75E
	wzEzTrPEKp+8QjmWRVpm8c=
X-Received: by 2002:a5d:52c9:0:b0:48c:6616:8f32 with SMTP id ffacd0b85a97d-48c728892f0mr8069996f8f.53.1791469669352;
        Thu, 08 Oct 2026 07:27:49 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48d5a548b99sm1639881f8f.47.2026.10.08.07.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:48 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/27] selftests/landlock: Assert WIFEXITED() before checking the exit status
Date: Thu,  8 Oct 2026 16:25:54 +0200
Message-ID: <20261008142604.39107-27-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WEXITSTATUS() is only meaningful if WIFEXITED() was true (see
wait(2)).  Check WIFEXITED() with ASSERT, as most tests already do, so
that a signaled child does not also produce a misleading exit status
failure.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/base_test.c |  2 +-
 tools/testing/selftests/landlock/fs_test.c   | 10 +++++-----
 tools/testing/selftests/landlock/net_test.c  | 14 +++++++-------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index c19aa20609d6..f7c063fdc397 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -618,7 +618,7 @@ TEST(cred_transfer)
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Re-checks ruleset enforcement. */
diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index c73a438e088f..7e36baffdf36 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -4644,7 +4644,7 @@ static void test_connect_to_parent(struct __test_metadata *const _metadata,
 
 	/* Wait for child. */
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Clean up. */
@@ -4743,7 +4743,7 @@ static void test_connect_to_child(struct __test_metadata *const _metadata,
 
 	/* Wait for child. */
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 }
 
@@ -5413,7 +5413,7 @@ TEST_F_FORK(layout1_bind, path_disconnected_rename)
 	}
 
 	EXPECT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	ASSERT_EQ(0, rename(dir_s4d2, dir_s1d3))
@@ -5435,7 +5435,7 @@ TEST_F_FORK(layout1_bind, path_disconnected_rename)
 	}
 
 	EXPECT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -7988,7 +7988,7 @@ TEST_F(audit_layout1, resolve_unix)
 	}
 
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	EXPECT_EQ(0, matches_log_fs_extra(_metadata, self->audit_fd,
diff --git a/tools/testing/selftests/landlock/net_test.c b/tools/testing/selftests/landlock/net_test.c
index 51bcb4740dde..e194fd78d8a1 100644
--- a/tools/testing/selftests/landlock/net_test.c
+++ b/tools/testing/selftests/landlock/net_test.c
@@ -903,7 +903,7 @@ static void test_bind_and_connect(struct __test_metadata *const _metadata,
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Closes connection, if any. */
@@ -1274,7 +1274,7 @@ TEST_F(protocol, connect_unspec)
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Closes connection, if any. */
@@ -1373,7 +1373,7 @@ TEST_F(protocol, tcp_fastopen)
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	if (client_fd != bind_fd)
@@ -1528,7 +1528,7 @@ TEST_F(protocol, sendmsg_dgram)
 		_exit(_metadata->exit_code);
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -1571,7 +1571,7 @@ TEST_F(protocol, sendmsg_dgram)
 		return;
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -1642,7 +1642,7 @@ TEST_F(protocol, sendmsg_dgram)
 		return;
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -1677,7 +1677,7 @@ TEST_F(protocol, sendmsg_dgram)
 		_exit(_metadata->exit_code);
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 }
 
-- 
2.56.0

