Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD133A7F4D
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792261552; cv=none; b=NJkXzsev83hkuVZW3yq87JrfCQkDmi+bxrwevo+Ngb4bgph9oPY6qFqD2sU2+xiWiCgL6+VFQl7Gdp3+0f8yc49qcfo6Z7KZWMgq1ihN8hZgHd8zD9XA6ciZUKMtZSCgR3hArVWuYG8Xl8vQE7mPD1LoUzkodR0GoR18AxT6fvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792261552; c=relaxed/simple;
	bh=baEDYXdggAz9TFs45JgCH47NrZ/roCkYBpvxtc9oseQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bxj4oGyolOKxcz+5USghGhZ+UGj+Fy0erSknqcbQeXloTzKMe2FdwlHMymaUOzBJ1dEH9QcPgUWu80e4c/HlStnXeqHMLsxe/dSgAhXWMXjll7uDGKW51jx+Q0Yhk1fKmKX7wU19DaT0eHr4ZLxFZ4INYhaYjXL/UL/oyndtJPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlRAeqc/; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlRAeqc/"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso524418a91.0
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261550; x=1792866350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMiB8dh6dsfFg4997+NtGDJuD1DGrADZtiME1dFQP+c=;
        b=DlRAeqc/E2O03Ms4NIOaddFQF050xYUpadkyHFtkRARFogpGkWMShSzmZ6VdKsOfSC
         Nd3nxDhV7HJRhIdb6TRd3F56NRMZ4pmae4o9RRY0wJ/ecDAPTKPlYLgvPmzyfYTwNybO
         yK6O0Ko/5FTI7psVjaV+wePDMIdwDXz/8zzvNvH3LZ/cPtDcod2fdODLKbHe1e0Qg8I9
         KH54IgXa4QUk77dWwHBqQLjBBAYPSFeY75co+QyvR5EleixmqR19sqLSv1pAD+XMw6KT
         RsX9BrsAjyFrkIVVeM6d1VChz/fW3FDpnPLTXkCOk7R+70xcsvf6rHDF/EmDq1yqjMLk
         nIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261550; x=1792866350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMiB8dh6dsfFg4997+NtGDJuD1DGrADZtiME1dFQP+c=;
        b=G3yXOColo+CPC8bAAGv+JNkBWs791u9F4VhUth9iVckLTXGHmr08AGVaEBx0l5cWgl
         QpK+eDza9Y0E4IcAv8JPG3H0TlskFPb5E1/0b15PPrBe565p3H2wJFzfYPqaHMqoiL0i
         +XQ0Dssfz8s89IeKyofNPHcBLN3ECxUP5Q3Ukwusb1+38NrGLlQu5aPN7FGUv6h6h3ST
         DD+6/TkWaYvp23yQUGviJK35gJkQPlc64rJ3NmC0tsludITZfPalMvjpbDLwhcUSG1My
         0wcz9pO41Svm0MJwutkfv9xYAxG5i3V3vRRlYv9sRFZNlhoBkDG13fwwzkZuQ7ZEnZG6
         422Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVIzzjb/2oPQgkJVurKj4WLZR+FsYwrguxDTaUysqH5DlxlVrPXL4no2rZkXre77TchOiGgUttDYCmMICeiAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaDakWtufLxXmWiiessSKriwxdWSIexBhXkpQjmYsVV/vXpqSq
	FpknGoBBvwF/RLCJmIqy3socKbRHeAzKwNmvkrplZXPNO0ezqgIfl/mV
X-Gm-Gg: AYBFou1eILEenbUANNIC1UKfdJDdQYATpY75XXDuZPcUiLh8fYHZzcBmxpHmZXYuMLQ
	2XLU8FtaTqcrzzxsA0VDIoKZKY14eR/jSHus8j+72fgdpLAMgcPvPdtMV5Un1OBb8kMiF8Tp0eg
	vQXzH8lFUQ2u/+2x4QC6oKN+pIbpcgQXfSuSLg0L7YS3YH488W59GIm8yhNb6hsL9WiWTAwTx5v
	pKPl3aJLGBzkhWeEQM63u61AxoRb2Dub2K9bZxm2q+Gu4l0BVhcIE+U3c32UGXxvAIKtmSUv3Ub
	dES/DC+COs0OUHYtiLmnGXjVGDCX+ZYD/MR1ZRtNdqw5f5gacPR6m7vm+UcnLW8z1QV9awrvGj0
	18sdPfyQfNBiZg8VwQ5swAZf/1bMTmiarOVhgtnrNLsaw/r/Db0J+swtqHBkoyXjtheK6gqPaES
	57jiIp7maaOB1KYo3kHRbH0MxYYIMsFRsGyMZfmXS7YjJTbDMWaPIc4OjlaqZd/X+ht55drqq1s
	oxl6/bB5cpYlyn0t0IKVG7eiDzIar/pnKsKnuIraTWGEWfM4yufktDVWGHxMsjLbs/cgQb4lu/h
	VA==
X-Received: by 2002:a17:90b:4c8e:b0:3ac:9a03:20bb with SMTP id 98e67ed59e1d1-3aceefbec6emr3109229a91.18.1792261550287;
        Sat, 17 Oct 2026 11:25:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:56a:78dc:9300:8846:761:63e4:6d67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm9241586a91.3.2026.10.17.11.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:50 -0700 (PDT)
From: Abdalla Eldoumani <aamsdoumani@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: [PATCH 2/2] kselftest/arm64: Check that PR_SVE_VL_INHERIT survives a second exec
Date: Sat, 17 Oct 2026 12:24:54 -0600
Message-ID: <20261017182455.1884-3-aamsdoumani@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20261017182455.1884-1-aamsdoumani@gmail.com>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>

The prctl_set_for_child test sets a vector length with
PR_SVE_VL_INHERIT and checks that a forked and exec()ed child sees it.
That only covers the first exec(). The kernel keeps the inherit flag
and the on-exec VL across exec() so that later descendants keep the VL
too, and nothing checks that part, which the fp TODO list notes as
testing PR_SVE_VL_INHERIT after a double fork.

Extend the test to also read the VL in a grandchild. The child
re-executes vec-syscfg in a mode that forks and execs the rdvl helper,
so the VL is read after two fork() and exec() generations. Both SVE and
SME are covered since the test runs for each vector type.

With a kernel modified to clear the inherit flag on exec() the existing
check still passes and the new check fails for both vector types, with
the grandchild getting the default VL. Drop the item from the TODO list.

Assisted-by: LLM
Signed-off-by: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
---
 tools/testing/selftests/arm64/fp/TODO         |  1 -
 tools/testing/selftests/arm64/fp/vec-syscfg.c | 62 ++++++++++++++++++-
 2 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/TODO b/tools/testing/selftests/arm64/fp/TODO
index 44004e5..90ee128 100644
--- a/tools/testing/selftests/arm64/fp/TODO
+++ b/tools/testing/selftests/arm64/fp/TODO
@@ -4,4 +4,3 @@
  - Ensure ptraced processes actually see the register state visible through
    the ptrace interface.
  - Big endian.
-- Test PR_SVE_VL_INHERIT after a double fork.
diff --git a/tools/testing/selftests/arm64/fp/vec-syscfg.c b/tools/testing/selftests/arm64/fp/vec-syscfg.c
index 2c8ccbe..b441dbf 100644
--- a/tools/testing/selftests/arm64/fp/vec-syscfg.c
+++ b/tools/testing/selftests/arm64/fp/vec-syscfg.c
@@ -24,6 +24,8 @@
 
 #define ARCH_MIN_VL SVE_VL_MIN
 
+#define FORK_EXEC_ARG "--fork-exec"
+
 struct vec_data {
 	const char *name;
 	unsigned long hwcap_type;
@@ -85,8 +87,12 @@ static int stdio_read_integer(FILE *f, const char *what, int *val)
 	return 0;
 }
 
-/* Start a new process and return the vector length it sees */
-static int get_child_rdvl(struct vec_data *data)
+/*
+ * Start a new process and return the vector length it sees.  With
+ * grandchild set the child re-executes this program, which forks and
+ * execs once more, so the VL is read two fork()/exec() generations down.
+ */
+static int get_descendant_rdvl(struct vec_data *data, bool grandchild)
 {
 	FILE *out;
 	int pipefd[2];
@@ -123,6 +129,14 @@ static int get_child_rdvl(struct vec_data *data)
 			exit(EXIT_FAILURE);
 		}
 
+		if (grandchild) {
+			execl("/proc/self/exe", "vec-syscfg", FORK_EXEC_ARG,
+			      data->rdvl_binary, NULL);
+			fprintf(stderr, "execl(/proc/self/exe) failed: %d (%s)\n",
+				errno, strerror(errno));
+			exit(EXIT_FAILURE);
+		}
+
 		/* exec() a new binary which puts the VL on stdout */
 		ret = execl(data->rdvl_binary, data->rdvl_binary, NULL);
 		fprintf(stderr, "execl(%s) failed: %d (%s)\n",
@@ -174,6 +188,37 @@ static int get_child_rdvl(struct vec_data *data)
 	return read_vl;
 }
 
+static int get_child_rdvl(struct vec_data *data)
+{
+	return get_descendant_rdvl(data, false);
+}
+
+/* FORK_EXEC_ARG mode: fork, exec path and pass on its exit status */
+static int fork_exec(const char *path)
+{
+	pid_t child;
+	int status;
+
+	child = fork();
+	if (child == -1) {
+		fprintf(stderr, "fork() failed: %d (%s)\n",
+			errno, strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	if (child == 0) {
+		execl(path, path, NULL);
+		fprintf(stderr, "execl(%s) failed: %d (%s)\n",
+			path, errno, strerror(errno));
+		_exit(EXIT_FAILURE);
+	}
+
+	if (waitpid(child, &status, 0) != child || !WIFEXITED(status))
+		return EXIT_FAILURE;
+
+	return WEXITSTATUS(status);
+}
+
 static int file_read_integer(const char *name, int *val)
 {
 	FILE *f;
@@ -498,6 +543,14 @@ static void prctl_set_for_child(struct vec_data *data)
 		return;
 	}
 
+	/* _INHERIT must survive the child's exec(), check a grandchild */
+	child_vl = get_descendant_rdvl(data, true);
+	if (child_vl != data->min_vl) {
+		ksft_test_result_fail("%s set %d _INHERIT but grandchild VL is %d\n",
+				      data->name, data->min_vl, child_vl);
+		return;
+	}
+
 	ksft_test_result_pass("%s vector length was inherited\n", data->name);
 
 	file_write_integer(data->default_vl_file, data->default_vl);
@@ -759,11 +812,14 @@ static const struct {
 	{ "change_sve_with_za", change_sve_with_za },
 };
 
-int main(void)
+int main(int argc, char **argv)
 {
 	bool all_supported = true;
 	int i, j;
 
+	if (argc == 3 && strcmp(argv[1], FORK_EXEC_ARG) == 0)
+		return fork_exec(argv[2]);
+
 	ksft_print_header();
 	ksft_set_plan(ARRAY_SIZE(tests) * ARRAY_SIZE(vec_data) +
 		      ARRAY_SIZE(all_types_tests));
-- 
2.49.0.windows.1

