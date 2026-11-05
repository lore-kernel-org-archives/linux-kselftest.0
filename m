Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888071;
	b=FmZp59cEI3BXthcixcGA39mO+gKu63Oqj3OU77ihWzHO5S4llG1BYVeM82PmGl3M1wp0
	 iZc8qtnGOkAIzhbkP2fLvAQkACQsFH0PC2Z9URq48LEnuOwuNGE7SEgTCM0k4IteIB8xd
	 wG3ivztC5FLxQaQ6HJiGCOHv0zh1iwf04xADrux+2DNGUdC+DnLRxLO9gcSFVT9D5QIFa
	 OOfBlfCZzI4HZ5tFt6iimBGDzFQuhieREKN/LzgPOwcSbCG4tyqF3TmUPnqV7bgx54b+s
	 686SnNmbCmJE1oMbsfbAaULYHrWs9YwdneAdfFr+WBsAHbY0eHLSI7UrotpX2zJ6aXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888071;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UUr2L0xZXuVjXC0opxsWwmpYI8eWn5RdN8+EU6TaHG8=;
	b=SI0TZaQmtF/wD5FxDTTGw5C1kdrSO2Uh/eZKqKpdbDIIRuCylrO6olhIi5b1C/H0Ipn8
	 JJuYa1Rfd2SCnRBfpO/Xc+kdtfi560BfmIAtFy+oth4MmrsWHbGa9he+yCBNrgreARJy9
	 bXgoPsJUvr+iHP4VTR1DWLuEiu3x002wvhfClyG1UnaPpsHs+rXeWxG9NEEwxAF65b1o2
	 cCFE5YJYnxurWd6nTZwVcmJR3YvixseDVMqvbFIYJplHD/PrLMbLBM5mIXe/yQ+Jo9Qvd
	 2qKbqlAAxDcl7ObMlfqwEoaoELKhVLFFfNH15IRtKvNKwu64EhDDVvbsM2mbuZQZiLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bWQ1VH/f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF41A6082BCC;
	Thu,  5 Nov 2026 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bWQ1VH/f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE961F00A2A;
	Thu,  5 Nov 2026 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888070;
	bh=UUr2L0xZXuVjXC0opxsWwmpYI8eWn5RdN8+EU6TaHG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bWQ1VH/fZ0ys/xQSByUc/nnlX5qnS4Lak9ARwR9szLBLFBMZTIL0hcty8eWwrodL9
	 zpXWe0LDZ4F+S850sMnlzWhOTWSN7EhgsNm20G3UANsXVLXlALfZfJFeFY20Jts1xq
	 akvDecTtSlbJSje6yaMgDd+algzfQUg6iFnZMoIlX0vsOrfZB+/h0T8D29nGOlWiMA
	 kHvVY7XBAJoHUvpl2h253LTuQOotHdQKUde6VyZqdbZWVuf2XVC5G3lioxQ6/KQKEV
	 BjPaD3dWpfNZDBjrBJr9WG9wwWIcIo849Mg9iwdwfMqLbQY0W7IF45h6Lk9XICre8w
	 +dvuHZDzLgYgg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:23 +0000
Subject: [PATCH v2 10/11] kselftest/arm64: Use execv() to start fp-stress
 test loads
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-10-81a5172468f0@kernel.org>
References: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
In-Reply-To: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3995; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OD+Ba64C7inB0cl5Iu32U66JVXkD8/nZCh6jkxPgkhI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9Gs+KjG1WNFTudJ4ewPr8bTelFXeJx+k2k1xObR29
 l9B4W8XO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARTU1Ghr0N1/crdgSypkze
 nq7KbH21csYGq/CzYroamg87uo7sa2ZkuPLJ7rPTUQP+s9rsB2wf7OT4PeWioresm1lgxN/Yqaf
 l2QA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

In preparation for adding KVM test loads which will take command line
arguments switch to using execv() instead of execl() to start the test
load programs.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index 65e01aba96ff..e96fe1ac1ad1 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -60,7 +60,7 @@ static int num_processors(void)
 	return nproc;
 }
 
-static void child_start(struct child_data *child, const char *program)
+static void child_start(struct child_data *child, char *const prog_args[])
 {
 	int ret, pipefd[2], i;
 	struct epoll_event ev;
@@ -116,9 +116,9 @@ static void child_start(struct child_data *child, const char *program)
 			printf("%d bytes of data on startup pipe\n", ret);
 		close(3);
 
-		ret = execl(program, program, NULL);
-		printf("execl(%s) failed: %d (%s)\n",
-		       program, errno, strerror(errno));
+		ret = execv(prog_args[0], prog_args);
+		printf("execv(%s) failed: %d (%s)\n",
+		       prog_args[0], errno, strerror(errno));
 
 		exit(EXIT_FAILURE);
 	} else {
@@ -310,32 +310,35 @@ static void handle_exit_signal(int sig, siginfo_t *info, void *context)
 
 static void start_fpsimd(struct child_data *child, int cpu, int copy)
 {
+	char *args[] = { "./fpsimd-test", NULL };
 	int ret;
 
 	ret = asprintf(&child->name, "FPSIMD-%d-%d", cpu, copy);
 	if (ret == -1)
 		ksft_exit_fail_msg("asprintf() failed\n");
 
-	child_start(child, "./fpsimd-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }
 
 static void start_kernel(struct child_data *child, int cpu, int copy)
 {
+	char *args[] = { "./kernel-test", NULL };
 	int ret;
 
 	ret = asprintf(&child->name, "KERNEL-%d-%d", cpu, copy);
 	if (ret == -1)
 		ksft_exit_fail_msg("asprintf() failed\n");
 
-	child_start(child, "./kernel-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }
 
 static void start_sve(struct child_data *child, int vl, int cpu)
 {
+	char *args[] = { "./sve-test", NULL };
 	int ret;
 
 	ret = prctl(PR_SVE_SET_VL, vl | PR_SVE_VL_INHERIT);
@@ -346,13 +349,14 @@ static void start_sve(struct child_data *child, int vl, int cpu)
 	if (ret == -1)
 		ksft_exit_fail_msg("asprintf() failed\n");
 
-	child_start(child, "./sve-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }
 
 static void start_ssve(struct child_data *child, int vl, int cpu)
 {
+	char *args[] = { "./ssve-test", NULL };
 	int ret;
 
 	ret = asprintf(&child->name, "SSVE-VL-%d-%d", vl, cpu);
@@ -363,13 +367,14 @@ static void start_ssve(struct child_data *child, int vl, int cpu)
 	if (ret < 0)
 		ksft_exit_fail_msg("Failed to set SME VL %d\n", ret);
 
-	child_start(child, "./ssve-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }
 
 static void start_za(struct child_data *child, int vl, int cpu)
 {
+	char *args[] = { "./za-test", NULL };
 	int ret;
 
 	ret = prctl(PR_SME_SET_VL, vl | PR_SVE_VL_INHERIT);
@@ -380,20 +385,21 @@ static void start_za(struct child_data *child, int vl, int cpu)
 	if (ret == -1)
 		ksft_exit_fail_msg("asprintf() failed\n");
 
-	child_start(child, "./za-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }
 
 static void start_zt(struct child_data *child, int cpu)
 {
+	char *args[] = { "./zt-test", NULL };
 	int ret;
 
 	ret = asprintf(&child->name, "ZT-%d", cpu);
 	if (ret == -1)
 		ksft_exit_fail_msg("asprintf() failed\n");
 
-	child_start(child, "./zt-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }

-- 
2.47.3

