Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE106346E70
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 11:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917195; cv=none; b=VRyiN9baI1/j7xTkDpSVCB3eAX6EygqlX2jRrO1IWbXYe6FlOYlSbeP8M074RKQx0cdIlR5NuqrLSjJ7X9XlHtR60WDLHiIbvxddIHrowetLsF0CFcita8oOh1oMrSwpL5fNVqspgQl5BwbYNbdF9fxZcrh1CGB2pVI/ngBTqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917195; c=relaxed/simple;
	bh=/s5uQvfAZiwIBI9NKGxxkqxKLnUfE7INVoif22bRiWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dP5gb0NKBI1dl+KkB+KqdAX/LAKN4u44cY1QOhvwPbHr+/ic4rUBt1qRk8Sz4dACvIcVfyYZIU0Djn7jJAeHlaRpewG1JrAlddrepBIFCul0BxhkU7P764hXPbOSF0o2sDBgHayorCxexxVzON8lQXRCTgfWzoAIGgJWD1YPaSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=QOoafuP2; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="QOoafuP2"
Received: from hwang4-g16.. (unknown [120.244.199.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id E4CAE41A15;
	Mon,  8 Jun 2026 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1780917185;
	bh=llNVuO3WbyaF5JRsqRE+GoZqX29/g952ZLMTqc4YeWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=QOoafuP2x8sDs2Xv8TKBppcgqFGMhP9dYy443ZTO0uXNsfxWIx/8wTNkg2vyOTpn5
	 5Yaqfmicu+qlyHyOF/MYKYvDRpiQF/G3WPfrBksxhD7ltRKzMb57Th7DNEaK6YHpQD
	 hrZ3iHA83L3T6hAvKqNWjXluGAaZyODSL8hYWmv3v953CyYgwXGtWs+zM8uN0Ipb/2
	 6O8c5meCmTVwjNvl5JOvycK00ZIkJdaXSjDSkNbGWcTGxGhL2E0Aq4HSLh9PtmfkZ+
	 gYUK8O9eyCtv8dHyudJpq/A3LxGdDd0ygp5UweXDoV/7bNQ1yk0JxMDcXOnLK4oP6l
	 88mLNYaKLNydMCFsFF2LKKP7LRX49MsFhmNAtQEQ9WT91qNvR135sHu/OJdP7puC4j
	 CleKiIjbCRp3iUNR5COu7MV8Zy9riFvH4Ga/5dULVvWbgQGutZCUQ5hLb8ZWPRa41Z
	 G+IMVYTcB+YItdS4nMZF5EYv8aUOwcegUtsS0G2lURKFowZRLGB0qlFkJepRIX/oNa
	 cCKXYXaSGRuTpvJnNbs2SJ4iMziBjSLvPO+RhQhnFMz1BRgHtRkjnJ3z7jjcN8AzlX
	 dH4BRJBpGeAqN4QuxYmk+emVpcloDvC6oMPzxrTZW6XbMY6e4ST5oMS6GrLaUrk+eg
	 STrI97jw9oBhFfGM+VGkZay0=
From: Hui Wang <hui.wang@canonical.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org,
	ardb@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: hui.wang@canonical.com
Subject: [PATCH] selftests/efivarfs: skip write tests if efivarfs is mounted read-only
Date: Mon,  8 Jun 2026 19:13:00 +0800
Message-ID: <20260608111300.63242-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

efivarfs is mounted read-only when the firmware does not provide a
working runtime SetVariable() service. This happens, for example, on
systems where the EFI runtime is provided by U-Boot's efi_loader (a
common case on RISC-V under QEMU booting via OpenSBI -> U-Boot -> GRUB),
or when runtime services are disabled (efi=noruntime, lockdown, etc).

In that situation every test that creates, modifies or deletes an EFI
variable is bound to fail, producing spurious test failures that do not
reflect a real kernel bug.

Detect the mount mode in check_prereqs() and store it in the global
efivarfs_mode ("ro" or "rw"). Extend run_test() to take an optional
"rw" argument marking tests that require a writable efivarfs; such tests
are reported as [SKIP] (instead of being run and failing) when efivarfs
is read-only, along with an explanatory message.

test_create_empty and test_invalid_filenames are left to run
unconditionally, since their expectation still holds on a read-only
mount; their stderr is silenced to avoid noise from the read-only
redirection failures.

Assisted-by: Copilot:claude-opus-4-8
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 tools/testing/selftests/efivarfs/efivarfs.sh | 44 +++++++++++++++-----
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh b/tools/testing/selftests/efivarfs/efivarfs.sh
index c62544b966ae..d8883fdf3b01 100755
--- a/tools/testing/selftests/efivarfs/efivarfs.sh
+++ b/tools/testing/selftests/efivarfs/efivarfs.sh
@@ -26,16 +26,33 @@ check_prereqs()
 		echo $msg efivarfs is not mounted on $efivarfs_mount >&2
 		exit $ksft_skip
 	fi
+
+	# Determine whether efivarfs is mounted read-only or read-write
+	# and store the result ("ro" or "rw") in the global efivarfs_mode.
+	if grep -q "^\S\+ $efivarfs_mount efivarfs ro[, ]" /proc/mounts; then
+		efivarfs_mode=ro
+	else
+		efivarfs_mode=rw
+	fi
 }
 
 run_test()
 {
 	local test="$1"
+	# Second (optional) argument: "rw" if the test needs a writable
+	# efivarfs. Such tests are skipped when efivarfs is mounted read-only.
+	local need_rw="$2"
 
 	echo "--------------------"
 	echo "running $test"
 	echo "--------------------"
 
+	if [ "$need_rw" = "rw" ] && [ "$efivarfs_mode" = "ro" ]; then
+		echo "  [SKIP] efivarfs is mounted read-only," \
+		     "skipping test that requires write access" >&2
+		return
+	fi
+
 	if [ "$(type -t $test)" = 'function' ]; then
 		( $test )
 	else
@@ -74,7 +91,7 @@ test_create_empty()
 {
 	local file=$efivarfs_mount/$FUNCNAME-$test_guid
 
-	: > $file
+	: 2>/dev/null > $file
 
 	if [ -e $file ]; then
 		echo "$file can be created without writing" >&2
@@ -361,18 +378,23 @@ check_prereqs
 
 rc=0
 
-run_test test_create
+if [ "$efivarfs_mode" = "ro" ]; then
+	echo "efivarfs is mounted read-only on $efivarfs_mount;" \
+	     "tests that require write access will be skipped" >&2
+fi
+
+run_test test_create rw
 run_test test_create_empty
-run_test test_create_read
-run_test test_delete
-run_test test_zero_size_delete
-run_test test_open_unlink
-run_test test_valid_filenames
+run_test test_create_read rw
+run_test test_delete rw
+run_test test_zero_size_delete rw
+run_test test_open_unlink rw
+run_test test_valid_filenames rw
 run_test test_invalid_filenames
-run_test test_no_set_size
+run_test test_no_set_size rw
 setup_test_multiple
-run_test test_multiple_zero_size
-run_test test_multiple_create
-run_test test_multiple_delete_on_write
+run_test test_multiple_zero_size rw
+run_test test_multiple_create rw
+run_test test_multiple_delete_on_write rw
 
 exit $rc
-- 
2.43.0

