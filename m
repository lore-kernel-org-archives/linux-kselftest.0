Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C09F385D60
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 03:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787195407; cv=none; b=LJKtSeHiwnJFQaKg5KW3Li/BeOsBhxxoRPHMy46UcXniol4Jdjrxp3WBfBO5x/rCPc3ZIZMbXonqpcUpNF3S+/dYL4wDzQi7Q3IzPX9zayiA4w8xFRgBYHeAxnsuU4+46l55k+ZaKrmTvZd3mQh1Do6DOV0C8sbKGj/cTypRw2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787195407; c=relaxed/simple;
	bh=7J9kUtVJ1tk8RIYl46VrOp3QOQ5zUh3MUCnBAdfQPMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIWDOW5J2SwlB19pdPScK6Uv8ZgRCVFwOqGjkN1ATddLtrL1IGyxzMW/Y+Ka9p5vtZDfZFkek/OfI17FdR+g0xiBiMemFjv9nWgMgQGefz5/LbT7a8hqP5+yCoLdSL0b2RMkZiZotDyW09Suw1HMRxpyVW5QfN6QAQ+0G1Vtai0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Lg5WG7Q3; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Lg5WG7Q3"
Received: from hwang4-g16.. (unknown [120.244.198.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 875833F7D1;
	Thu, 20 Aug 2026 03:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1787194866;
	bh=BfHcoGbbmrrNszubpsnu8NgDuOPJ5odZxIOa/DsCZY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Lg5WG7Q3NlkLcko19G+N4nXwbkxSbssgixFBszyVLHDMyJ5srJF9PHSmKATKYvYV2
	 38rE+M29Gid2BUN0AcnrFjV3NSXAAuI0gr8GTWni+NnIK3PYvJKDFjE1ZZ+Q9XrjMI
	 J+Zkz+ZDZlMzplce1VDmgezDxerYXQxU8yW8PYJ2LweUDrvuKPM9qSgV8fy27kVAN5
	 2umim2RUot9gRAEyeKT0ukIkWW5cGK886nW5fB37AO6HL8u3qbH6NieMjR0iAn8OFC
	 oK1LnNkDLjm/o6w4JapQ8mz/5sJzifmqD1sPM6yY8MilXIVZyQeJ1icbnVybEenzaW
	 C7LHPLY12ojp3Pd1i+akwxMp+XU9maDZLWplkaFKaqoT2KnyV/EYHabsVtik8E/q4u
	 FRNGDDZRxZXh5zhBcx9t7PGy2hNdK/Pwycgv+3OPla7ATiC6iTL/t7rf0apZ3VGqXv
	 3o3TM16l5478k+gm+N6ln/ZRUQeIRmRayWE6uN/rIMG3PS04h+9FNFRWREuasQ617Y
	 ZQwYS8eVSHltKDSvMQvvgCfT0IU49/Jv7kUVMxrBR1Y73WTkGrkeTMl6ob5kS/3DGy
	 +vGhznp2jpHws5b1ftNkhkyiWfRP7+JCBwmqAY9Nkm5gzUs7EA0fpXuphU3muQAEOG
	 YyWjXc/oQS3eiiJ1G6q8YAF8=
From: Hui Wang <hui.wang@canonical.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org,
	ardb@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: hui.wang@canonical.com
Subject: [PATCH v2] selftests/efivarfs: skip write tests if efivarfs is mounted read-only
Date: Thu, 20 Aug 2026 11:01:01 +0800
Message-ID: <20260820030101.35982-1-hui.wang@canonical.com>
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
efivarfs_mode ("ro" or "rw"). Group all tests that require a writable
efivarfs into a single "if [ "$efivarfs_mode" = "rw" ]" block, so they
are only run when efivarfs is writable; otherwise print a single message
explaining that they were skipped.

test_create_empty and test_invalid_filenames are left to run
unconditionally, since their expectation still holds on a read-only
mount; test_create_empty's stderr is silenced to avoid noise from the
read-only redirection failure.

Assisted-by: Copilot:claude-opus-4-8
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
In the v2:
 Move the rw tests in an if scope as suggested by Ard.

 tools/testing/selftests/efivarfs/efivarfs.sh | 41 ++++++++++++++------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh b/tools/testing/selftests/efivarfs/efivarfs.sh
index c62544b966ae..ec3036902b8a 100755
--- a/tools/testing/selftests/efivarfs/efivarfs.sh
+++ b/tools/testing/selftests/efivarfs/efivarfs.sh
@@ -26,6 +26,14 @@ check_prereqs()
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
@@ -74,7 +82,7 @@ test_create_empty()
 {
 	local file=$efivarfs_mount/$FUNCNAME-$test_guid
 
-	: > $file
+	: 2>/dev/null > $file
 
 	if [ -e $file ]; then
 		echo "$file can be created without writing" >&2
@@ -361,18 +369,27 @@ check_prereqs
 
 rc=0
 
-run_test test_create
+# Tests that are also valid on a read-only efivarfs run unconditionally.
 run_test test_create_empty
-run_test test_create_read
-run_test test_delete
-run_test test_zero_size_delete
-run_test test_open_unlink
-run_test test_valid_filenames
 run_test test_invalid_filenames
-run_test test_no_set_size
-setup_test_multiple
-run_test test_multiple_zero_size
-run_test test_multiple_create
-run_test test_multiple_delete_on_write
+
+# These tests need to create, modify or delete EFI variables, so they
+# require a writable efivarfs. Skip them when it is mounted read-only.
+if [ "$efivarfs_mode" = "rw" ]; then
+	run_test test_create
+	run_test test_create_read
+	run_test test_delete
+	run_test test_zero_size_delete
+	run_test test_open_unlink
+	run_test test_valid_filenames
+	run_test test_no_set_size
+	setup_test_multiple
+	run_test test_multiple_zero_size
+	run_test test_multiple_create
+	run_test test_multiple_delete_on_write
+else
+	echo "efivarfs is mounted read-only on $efivarfs_mount;" \
+	     "tests that require write access were skipped" >&2
+fi
 
 exit $rc
-- 
2.43.0

