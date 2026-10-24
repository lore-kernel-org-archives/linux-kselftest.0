Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874382;
	b=UqhmzHjjXCuQd3Xf5RA54C3x3/Ffdf3DF+RzP/DEQP/2CtKbeK4IclPBeCVjzKTUnQH+
	 Yk7uinXh916MMPGSlxpIN+FxoSMuTrbll6r2k/Sf3oJKEXIijWCfSUSLSZu8OTx0SZfsI
	 l2nCFD+tFJguEAU9qak67Oya8tl4/8UtHswYrvhjngU1kfADCrNMTbNJO0mU1TWHexU5B
	 UvYTj5DZAU3vN1BEQZRcOpt5u+Amxtbu/azjLF76UrEhK3pAw1vrk4Na6GmYz2uRW1DSR
	 NwVDlWE7hRoZAMRo5E4U5KSOhFndB1f09/xFp0dgRwmqEb48BtvwOhzpc4cz4o/6GzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2/XF0CUDnW6R6lIlNke+9b08IY9KYK5NcupSvZbkTSI=;
	b=QTuCNGS4FilpFllBnhotLsAD1qEhDPitIoLA6u48wWWWiovfUHMkwP69DNimHBe8RSbU
	 va4g/bYRdza7JnWYTGK3k1NnNkMVDwDzyyPWA5ugu9mmarLsElRMbP20aaxphTD8cP0bt
	 JNVH1n5EL6rzdxkH5YiozGGAOT+erQwVqoTshctRiyOzDtwtkq8oQK2CMTKUf6dM8UMHh
	 R/uuz1LXEM2yXJaQOyjcATlV2aEK382YceYP3hy7tNK5ZrAD9Uz6/a0qtfXL/b2qsjiCD
	 ZQXn9+EaDmTFbVXQTMPN/mhSARBWEaWR1JviAJYXz+a+NWfku1x7AuvHuHG6lP06auA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ny7DlEzb;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98D5606A329
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 20:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A98D5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ny7DlEzb
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-369f33df08eso424738eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874381; x=1793479181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/XF0CUDnW6R6lIlNke+9b08IY9KYK5NcupSvZbkTSI=;
        b=ny7DlEzbQgSfdcm+uRZCkdg7h1Mda48FRZD2+H4+8WVU2M/FCSc0TIJLapuWetIUGr
         4sT1NIYhx0ZxVJTHeel2FVheuNCPJRFkpBEbleY9t3r+++SAnBG3ffhNZ9CoGjpSREHh
         7rcKE6DWQTEZfC/jLl93u1k3008/GrZ/fMDEqhKEl8SBj3yy1sS2b4MlUl7q/6wuIaBl
         iH4eRMDYYxKP9d10Qex6qIoGVIvEsjGgBnSxO8P/1JRc5U1FCepeWj15kqN44o6t21H2
         C/SuBwFslM/A72KDDSnxSM3Hm7CDjIYZcvaSFZBONNCDCjS09G8GH08PT6Go33T5sonW
         qkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874381; x=1793479181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/XF0CUDnW6R6lIlNke+9b08IY9KYK5NcupSvZbkTSI=;
        b=VhQ+VxGdEoI+rWb0rZIergraZiz5wmbXmyv+ToenKC7QGnCD2UgVulBvQD6l3f1b9C
         9PbB5tPWj6RPtugTBLQDSCX/IlJD8UFryLZhs0OgnG64rfJ0US5fcP2GM37folM1yx+L
         03SYsapVrc3Ihcz6hbO4MYZ4YtW1CTGxxkmkagBDZ46NZhMeEj8kiM1q9gLfxirrHLd+
         sbV3SFKYwBVzLk/ZX1AJ8aht/LUPtxfQebYQefnK6QOYVgCeaGKopnop0uPkcidR/g61
         4g31qDG8URxPkqhJX9WLQuZ88/rhoKjKQZPHfIIA8vtCf+xL704QTaoX6HdQkGzhM6wb
         SGVA==
X-Forwarded-Encrypted: i=1; AKwUvByO4ytDKUpbKJwvcSLUy3/rPzwJFu4P49Kkc985s0g4p/wj3LrVpvYaXAGmrMGIkDzHiN5uWBvhsRtoXIkCDhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJussPKzTEHx4k3L+OkVHSj5BeZPO9lRykgNmQaF8Lif+Vtm4XV
	rsk7LSbglyqEHPlqPsZblmP+6u0e2kJEhWe9FSxyM0fx0MCDHMU2W3s9
X-Gm-Gg: AYBFou2b93G0UIX5axoU/Rh3IReZkA30G1yzbiCMUNEqSBBwIwx8CklbPXoYkNsG1lL
	1gbnmQbKJIml0ssqfbw9TLe2OCFImY2rT5wGO9RCgyWCC0AG55/261NtL1zl2CpNHcEMnyElw1U
	ertj5bRwNgJcUArCj+D2UiJA+nr0DyHS3EELEaYLzSipOf54/7QFSRB0qF3dhLggB8XI9w11dwd
	JQszFUpxj9d7kN0j7Xo/WU/S+5DoOxQrjFEUsoma1aMMNFoa5w2bHl0C2Y3Ms7b0Aj4C7HoFgvt
	kS2MbiA/QJHwr1l//8ANdviYGNyXZQJmhH12NcIdC47Pa54c2+xsBVMoJnhMV7N8dsN34NxG29y
	MmHm6WA3dxGfdZht6DP9yJrSaPJFkBNh4kYdIX4QllZ44wKqSEqfiXMrfx6+YtTNa6tGvWN5Hho
	qAmjVmFneiLMR5rNcAEZkpPTz+Pq582uTPN7+8kcbPsZM7LBfi4n9IW7CDIfatrtxFBILTqBJkP
	1Tb9A2r6gOF7qkWJLRzz4nkq0zISXlHC5KnHlT6995j4xJNUGPkLrXv0j2CsD+WCqv5V9k8rHLp
	8MBvCz0=
X-Received: by 2002:a05:7022:b05c:b0:164:ae59:935 with SMTP id a92af1059eb24-199363a338bmr3729020c88.34.1792874380668;
        Sat, 24 Oct 2026 13:39:40 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm9764737c88.14.2026.10.24.13.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:39:40 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Sat, 24 Oct 2026 13:39:19 -0700
Subject: [PATCH RFC 3/3] selftests/landlock: Test LANDLOCK_ADD_RULE_CREATED
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
Message-Id: <20261024-landlock-created-rights-v1-3-77c8db3f6bd2@gmail.com>
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
In-Reply-To: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, John Ericson <mail@johnericson.me>, 
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Farid Zakaria <farid.m.zakaria@gmail.com>
X-Mailer: b4 0.15.2

Cover the new flag: entries created directly in the directory are
usable while the directory and its existing entries stay unreadable, a
renamed file keeps the rights it had at its source and gains none, a
parent layer covers the files a nested domain creates, an unrelated
domain with the same policy cannot use them, and invalid flag
combinations are rejected.

Assisted-by: LLM
Signed-off-by: Farid Zakaria <farid.m.zakaria@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 227 +++++++++++++++++++++++++++++
 1 file changed, 227 insertions(+)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 7e25a6f6073c..84980d426436 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -2640,6 +2640,233 @@ TEST_F_FORK(layout1, refer_mount_root_deny)
 	EXPECT_EQ(0, close(root_fd));
 }
 
+/* clang-format off */
+#define ACCESS_CREATED ( \
+	ACCESS_RW | \
+	LANDLOCK_ACCESS_FS_MAKE_REG | \
+	LANDLOCK_ACCESS_FS_MAKE_DIR)
+/* clang-format on */
+
+/*
+ * Creates a ruleset where dir_s2d1 plays a shared store: tasks may create and
+ * remove entries in it and use what they create, but not read it otherwise.
+ * dir_s1d1 is a read-write source and dir_s3d1 a source without read access.
+ */
+static int create_created_ruleset(struct __test_metadata *const _metadata)
+{
+	const struct rule rules[] = {
+		{
+			.path = dir_s1d1,
+			.access = ACCESS_RW | LANDLOCK_ACCESS_FS_REFER |
+				  LANDLOCK_ACCESS_FS_REMOVE_FILE,
+		},
+		{
+			.path = dir_s2d1,
+			.access = LANDLOCK_ACCESS_FS_MAKE_REG |
+				  LANDLOCK_ACCESS_FS_MAKE_DIR |
+				  LANDLOCK_ACCESS_FS_REFER |
+				  LANDLOCK_ACCESS_FS_REMOVE_FILE,
+		},
+		{
+			.path = dir_s3d1,
+			.access = LANDLOCK_ACCESS_FS_REFER |
+				  LANDLOCK_ACCESS_FS_REMOVE_FILE,
+		},
+		{},
+	};
+	const int ruleset_fd = create_ruleset(
+		_metadata, ACCESS_CREATED | LANDLOCK_ACCESS_FS_REFER |
+				   LANDLOCK_ACCESS_FS_REMOVE_FILE,
+		rules);
+
+	add_path_beneath(_metadata, ruleset_fd, ACCESS_CREATED, dir_s2d1,
+			 LANDLOCK_ADD_RULE_CREATED);
+	return ruleset_fd;
+}
+
+/* Creates a new regular file and returns 0 or the open(2) errno. */
+static int create_file_at(const char *const path)
+{
+	const int fd = open(path, O_CREAT | O_EXCL | O_WRONLY | O_CLOEXEC, 0700);
+
+	if (fd < 0)
+		return errno;
+	close(fd);
+	return 0;
+}
+
+/*
+ * Checks that entries created directly in a LANDLOCK_ADD_RULE_CREATED
+ * directory are usable, while the directory, its pre-existing entries, and
+ * entries created deeper in pre-existing subdirectories stay inaccessible.
+ */
+TEST_F_FORK(layout1, created_rule)
+{
+	const char *const new_file = TMP_DIR "/s2d1/new";
+	const char *const new_dir = TMP_DIR "/s2d1/newdir";
+	const char *const new_nested = TMP_DIR "/s2d1/newdir/f";
+	const int ruleset_fd = create_created_ruleset(_metadata);
+
+	enforce_ruleset(_metadata, ruleset_fd);
+	ASSERT_EQ(0, close(ruleset_fd));
+
+	/* The directory and its existing entries are not readable. */
+	ASSERT_EQ(EACCES, test_open(dir_s2d1, O_RDONLY | O_DIRECTORY));
+	ASSERT_EQ(EACCES, test_open(file1_s2d1, O_RDONLY));
+	ASSERT_EQ(EACCES, test_open(dir_s2d2, O_RDONLY | O_DIRECTORY));
+
+	/* New entries are usable. */
+	ASSERT_EQ(0, create_file_at(new_file));
+	ASSERT_EQ(0, test_open(new_file, O_RDWR));
+	ASSERT_EQ(0, mkdir(new_dir, 0700));
+	ASSERT_EQ(0, test_open(new_dir, O_RDONLY | O_DIRECTORY));
+	ASSERT_EQ(0, create_file_at(new_nested));
+	ASSERT_EQ(0, test_open(new_nested, O_RDWR));
+
+	/*
+	 * Only direct children of the directory are covered.  The file is
+	 * created before open(2) fails, and the layout teardown expects
+	 * dir_s2d2 to contain only its own files.
+	 */
+	ASSERT_EQ(EACCES, create_file_at(TMP_DIR "/s2d1/s2d2/new"));
+	ASSERT_EQ(0, unlink(TMP_DIR "/s2d1/s2d2/new"));
+}
+
+/*
+ * Checks that a file renamed into a LANDLOCK_ADD_RULE_CREATED directory keeps
+ * the access rights it had at its source and gains none it did not have, by
+ * moving one file from a readable source and one from an unreadable source.
+ */
+TEST_F_FORK(layout1, created_rule_refer)
+{
+	const char *const moved_rw = TMP_DIR "/s2d1/moved_rw";
+	const char *const moved_ro = TMP_DIR "/s2d1/moved_ro";
+	const int ruleset_fd = create_created_ruleset(_metadata);
+
+	enforce_ruleset(_metadata, ruleset_fd);
+	ASSERT_EQ(0, close(ruleset_fd));
+
+	/* Keeps the access rights a file already had at its source. */
+	ASSERT_EQ(0, rename(file1_s1d1, moved_rw));
+	ASSERT_EQ(0, test_open(moved_rw, O_RDWR));
+
+	/* Does not gain access rights a file did not have at its source. */
+	ASSERT_EQ(EACCES, test_open(file1_s3d1, O_RDONLY));
+	ASSERT_EQ(0, rename(file1_s3d1, moved_ro));
+	ASSERT_EQ(EACCES, test_open(moved_ro, O_RDONLY));
+}
+
+/*
+ * Checks that the layer holding the LANDLOCK_ADD_RULE_CREATED rule grants
+ * access to files created by a nested domain, by stacking a permissive layer
+ * and creating the file from within it.
+ */
+TEST_F_FORK(layout1, created_rule_nested_domain)
+{
+	const char *const new_file = TMP_DIR "/s2d1/new";
+	const struct rule rules[] = {
+		{
+			.path = TMP_DIR,
+			.access = ACCESS_CREATED,
+		},
+		{},
+	};
+	const int ruleset_fd = create_created_ruleset(_metadata);
+
+	enforce_ruleset(_metadata, ruleset_fd);
+	ASSERT_EQ(0, close(ruleset_fd));
+	enforce_fs(_metadata, ACCESS_CREATED, rules);
+
+	/* The parent layer grants access to what nested domains create. */
+	ASSERT_EQ(0, create_file_at(new_file));
+	ASSERT_EQ(0, test_open(new_file, O_RDWR));
+	ASSERT_EQ(EACCES, test_open(file1_s2d1, O_RDONLY));
+}
+
+/*
+ * Checks that an unrelated domain with the same policy cannot use a file
+ * another domain created, by keeping the creating child alive while the
+ * parent enforces its own domain and tries to read the file.
+ */
+TEST_F_FORK(layout1, created_rule_other_domain)
+{
+	const char *const new_file = TMP_DIR "/s2d1/new";
+	int pipe_created[2], pipe_done[2], status;
+	pid_t child;
+	char buf;
+
+	ASSERT_EQ(0, pipe2(pipe_created, O_CLOEXEC));
+	ASSERT_EQ(0, pipe2(pipe_done, O_CLOEXEC));
+
+	child = fork();
+	ASSERT_LE(0, child);
+	if (child == 0) {
+		const int ruleset_fd = create_created_ruleset(_metadata);
+
+		ASSERT_EQ(0, close(pipe_created[0]));
+		ASSERT_EQ(0, close(pipe_done[1]));
+
+		enforce_ruleset(_metadata, ruleset_fd);
+		ASSERT_EQ(0, create_file_at(new_file));
+		ASSERT_EQ(1, write(pipe_created[1], ".", 1));
+		ASSERT_EQ(1, read(pipe_done[0], &buf, 1));
+		_exit(_metadata->exit_code);
+	}
+
+	/*
+	 * Closing the unused ends makes a read return if the other process
+	 * fails before writing.
+	 */
+	ASSERT_EQ(0, close(pipe_created[1]));
+	ASSERT_EQ(0, close(pipe_done[0]));
+
+	/* A domain with the same policy can't use what another one created. */
+	ASSERT_EQ(1, read(pipe_created[0], &buf, 1));
+	enforce_ruleset(_metadata, create_created_ruleset(_metadata));
+	ASSERT_EQ(EACCES, test_open(new_file, O_RDONLY));
+	ASSERT_EQ(1, write(pipe_done[1], ".", 1));
+
+	ASSERT_EQ(child, waitpid(child, &status, 0));
+	ASSERT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
+}
+
+/*
+ * Checks that LANDLOCK_ADD_RULE_CREATED is rejected on a file, combined with
+ * LANDLOCK_ADD_RULE_QUIET, or with an empty allowed_access.
+ */
+TEST_F_FORK(layout1, created_rule_invalid)
+{
+	const int ruleset_fd = create_ruleset(_metadata, ACCESS_CREATED, NULL);
+	struct landlock_path_beneath_attr path_beneath = {
+		.allowed_access = ACCESS_RW,
+	};
+
+	path_beneath.parent_fd = open(file1_s1d1, O_PATH | O_CLOEXEC);
+	ASSERT_LE(0, path_beneath.parent_fd);
+	ASSERT_EQ(-1, landlock_add_rule(ruleset_fd, LANDLOCK_RULE_PATH_BENEATH,
+					&path_beneath,
+					LANDLOCK_ADD_RULE_CREATED));
+	ASSERT_EQ(EINVAL, errno);
+	ASSERT_EQ(0, close(path_beneath.parent_fd));
+
+	path_beneath.parent_fd = open(dir_s1d1, O_PATH | O_CLOEXEC);
+	ASSERT_LE(0, path_beneath.parent_fd);
+	ASSERT_EQ(-1, landlock_add_rule(ruleset_fd, LANDLOCK_RULE_PATH_BENEATH,
+					&path_beneath,
+					LANDLOCK_ADD_RULE_CREATED |
+						LANDLOCK_ADD_RULE_QUIET));
+	ASSERT_EQ(EINVAL, errno);
+
+	path_beneath.allowed_access = 0;
+	ASSERT_EQ(-1, landlock_add_rule(ruleset_fd, LANDLOCK_RULE_PATH_BENEATH,
+					&path_beneath,
+					LANDLOCK_ADD_RULE_CREATED));
+	ASSERT_EQ(ENOMSG, errno);
+	ASSERT_EQ(0, close(path_beneath.parent_fd));
+	ASSERT_EQ(0, close(ruleset_fd));
+}
+
 TEST_F_FORK(layout1, refer_part_mount_tree_is_allowed)
 {
 	const struct rule layer1[] = {

-- 
2.55.0

