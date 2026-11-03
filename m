Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721290;
	b=5nVnGoljbxFltJzVYm6YKGmB9+WHeTwbXIePcH+i4wS5kH+ajvDcX0twUgsq+AmpuDXa
	 ab0+VG4u9C7VKk3ChkZ8IUIENYl+9hBVxIlms5BJf+yExZtSQ3WExsJX2eUvmCuhk3ovV
	 El451uPm4CzPs50GGPa4z8nZkjX6cieY4qLRZK+IAC07zLuQRmlyp7V8dlokQkrzHSUOU
	 Dl156wghpFf0vfabg1LSE/1HgLo81dX5oblPzcCjlzw/l82T0j7doIwpnR+7lTAYPSlGZ
	 f5FZXSsNzfE2NrlW1jj1J6OEpatu06qbmXZFZbtzrUWb/PJF7fiIWQOVO7V7USB1FyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721290;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NsyoYKseqmP5aOhAJD4lEnyCjD7pMHnRvTYTpMOjn3Q=;
	b=HAQ301NWsbm+9G+NYAX8Hv2iYM6aTxHN7bnlj7sGo5U6uQrKEaMOKMwEImmzhPwyPte5
	 Ik5jnVZgy34Zw/kHN0p7sYXOiBRGMNVx6i+tGVWREL+l+XeM0kmTEhN5xj5wzzjF9Cu5r
	 l2Z8J4BSOiS5iUiqgw3CIU24LO90+9C7+IqUcYa0ex+qcM7HHlpd2yGEeeMEWtB5fLHP6
	 rvSNssHm5xqAP7NUoSCUjWn92Z+lxhrg4DuUgtNLkpUurpcguglXrUSs7KFT4efg9Gboe
	 pmNI713wn670BMUO+yeO/G/9kLBxjM3p66hnrqMGlL/drWbdvt4HUpTMT1tcyw3FbzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abhB8Ok+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70399606D80B;
	Tue,  3 Nov 2026 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abhB8Ok+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED821F00A1B;
	Tue,  3 Nov 2026 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721289;
	bh=NsyoYKseqmP5aOhAJD4lEnyCjD7pMHnRvTYTpMOjn3Q=;
	h=From:To:Cc:Subject:Date;
	b=abhB8Ok+7acIIm+srpbufgIX3o8TGF6vvJoZJ4OvbkIfMiJO3GQSluPj1NwHHOK+N
	 OrHG7ceSHJkitcZrxlkNDO4hFVEeEMS4wDrSND/F5iE3ylEQXHGLAMngIf5UceoxaN
	 S3NSVdhirYddtdP8sMrcHAGtCzFs/0ErTdpxpqQmBCyeBjDbVNxXg149vLktfRHzWZ
	 SEg+Jvta+nibt7QhRASDYGhmeljxqB8QkSoujz9HKH/+pcNnpnyGQAEyMT0RLtKZth
	 NbJVifxvqALwKrhiOj/1AkL/ViyCvadlF8+9R2dgWq6m1pi0uSqRLezvZwjeAcYmzM
	 c6crQgPRV5CIQ==
From: Sasha Levin <sashal@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/pidfd: print time_t as long long
Date: Tue,  3 Nov 2026 10:54:47 -0500
Message-ID: <20261103155447.534264-1-sashal@kernel.org>
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

On 32-bit architectures with a 64-bit time_t, such as armhf in Debian
13, printing the time_t values with %lu warns:

  pidfd_test.c:523:50: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'time_t' {aka 'long long int'} [-Wformat=]

Cast them to long long and print them with %lld.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without format warnings there now, and the x86_64 builds don't
change. The other selftests get the same kind of fix in separate
patches.

 tools/testing/selftests/pidfd/pidfd_test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
index 932cbd8caa770..a53e72cb256ce 100644
--- a/tools/testing/selftests/pidfd/pidfd_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_test.c
@@ -520,7 +520,7 @@ static void test_pidfd_poll_exec(int use_waitpid)
 
 	time_t prog_time = time(NULL) - prog_start;
 
-	ksft_print_msg("Time waited for child: %lu\n", prog_time);
+	ksft_print_msg("Time waited for child: %lld\n", (long long)prog_time);
 
 	close(pidfd);
 
@@ -599,7 +599,8 @@ static void test_pidfd_poll_leader_exit(int use_waitpid)
 
 	time_t since_child_exit = time(NULL) - *child_exit_secs;
 
-	ksft_print_msg("Time since child exit: %lu\n", since_child_exit);
+	ksft_print_msg("Time since child exit: %lld\n",
+		       (long long)since_child_exit);
 
 	close(pidfd);
 
-- 
2.53.0

