Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D051648B374;
	Tue,  1 Sep 2026 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282605; cv=none; b=moXzbIT4c5tGaEuKZhQncQzjVu+6qy1PeZ5VidK26pfs2k/SRI0+UKhzuIxH3MJ1xgMiY8UEHUIvufhX7TY7hj3dg0iqk1Z+YmNr2D/+JCxh3t2sWJftqaoJg6RBv3Tqy5M1F3iz2yLX2598EHi7BZoKawI/FY4R0W6q2gWei+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282605; c=relaxed/simple;
	bh=OD+Ba64C7inB0cl5Iu32U66JVXkD8/nZCh6jkxPgkhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BihnwWgKzSfG2hEorEXW8siT68Okxut5zHo5YTIx1lqQ1/hDStzel930nl180IPEVifc5tKrOsJe4meDlJCq12J32AlQx4qs4uCRMp4F8++/lzCdOABakOb/CwHVQ1OTZXVZE7KktXZZ5PZipGgyoIeykRcmZK0XSzQApefWPX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7HFcvQ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7HFcvQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271851F00A3D;
	Tue,  1 Sep 2026 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282603;
	bh=UUr2L0xZXuVjXC0opxsWwmpYI8eWn5RdN8+EU6TaHG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=m7HFcvQ6ZOILVfCIPfGcm2sYoC7+RyTjKQyrVhaLuGAlAaQkpHrqKZdgmymsBlVvu
	 UOTAkmWvAP0w6Npou0cuyHNEwg4+rZ+ihYIhdXQnc4/CSSvlJDBXfJVOAv1QSwOF3K
	 6a/V2SuAbbwKJIQ0BSI7lZJ4rP0qMiVlgDAC+VNHtI32EUpnuza3+Mef+zscIlYOcn
	 2veJgDLftSAOpHbT0BJjwdUXEuMyWdNDcIjDrUMRw8/fmuTjuufBDbOnMl7VcRzskf
	 TMKVUbCY4nniS9yeuiGaGUTTvwGk+0AT6SKsnwEH7arwConpLkvkxslfQ2s6ahLKX3
	 Mg+YchyeYj0aQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:50 +0100
Subject: [PATCH 10/11] kselftest/arm64: Use execv() to start fp-stress test
 loads
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-10-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3995; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OD+Ba64C7inB0cl5Iu32U66JVXkD8/nZCh6jkxPgkhI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwbMVzi46ham4MZ37vEa0QuE+9ue1LBEjwxEU
 OE99wvmAlOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGzAAKCRAk1otyXVSH
 0JN5B/4vmuinpRF9rcr/7Xwi3BARN1hFTeH+b0NVSjDDSdFgiRYjK2eoFv8hjldBC22vtMalmQs
 tZ0Lx0FHcDxL/MQZXNSkoQqM9DeiaQ1UhHTByKLvUM4fXgs1Hse2eFTPim+HLgMzf2/5FzSA4SI
 W8wSGiGPv/bMKsRy9TYGRIYYuvuVB28lmkI+axBErFzYX4627IN7N6TLsAbFNwQ+YuxHO4jJQPV
 TISvJ0x1sKaza/1L9c0A+Y0Eo2V/tA1M+uzMTYuvXq6u+YOP1CUkqx8e64Y4pWaCFi54Bv21pUQ
 HjMf2Ki+JreB0J+EuwEy4WNovrwO8BaPC9vmWSWDHjntWuCU
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

