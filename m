Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386FA1448E0
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 01:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788744907; cv=none; b=COnc3trUpLRG5sNP2SfI/aHLK1WI6JGMC7d1dv7il/f8+WJDXl8qg2xmU+FNip/J9JusSCr5sD73PQoePN2GZsR1mZ+zx3jBBixv6vHYMhdmvrnOrRdBHaT/UdhkVNq7lR2QZaXLi8mo0yC6CA367c+HUPQ4/sg31+2Quc7Z+/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788744907; c=relaxed/simple;
	bh=WqJYj6l5fd3uswwKxVL61TnRtOLLP9ZGNXr6g+glCo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P35LJpSo9t0OuqCUB0zY7V0+AvuLpx4jbcUPSUvgMU67fM6Dst5DGL0gViF8lzf8B0auQfv9wenWv7dpywk1lylbT8Wgt1xh7FKa9PN+tH1zneMDMLys4rhrWzAnXTWXfyICIwUAp7pj9haPutbMMTOAJ851LoHb7oQt59JLqYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=IBa01zHS; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="IBa01zHS"
Received: from hwang4-g16.. (unknown [183.241.39.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 5260E40CBA;
	Mon,  7 Sep 2026 01:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788744539;
	bh=cKYGd+4Ix4It34QdOIlNevn0v4NzUgoSFh26dvzkfZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=IBa01zHS/FZRJtx0FbWZ29u92bF6WDETcHRPuGtfBlNvWKrPI4Jiiw5VGndh3+sak
	 4dVG47PlnBt2bLujC4qafU6OSWhgm/Xw3u1jD84W9cjoOy9tI0F6i214TT3jyJimcn
	 xqD490rmCy4qY0No81wV5kryCjeRWQ2lfpe8RIVFRX1ttDMJRWqaanbalehbu+n9mV
	 2NAFRHrJ1Odsp6v/Ondc4fpRoDo18+Pey58KYH+mFUxI9jvLL53pY1YK1+Il2THLv5
	 hXHx1ouySMTQlOJTGEl3JYfDoQ1VBDNhBSNw7Y8k21PLjUYT5Nsk64hCm3c5F9XlYm
	 8Yatzms9nAggJgUsLTBvXqHBk5lkzDoRcDCO5XK3HNXnRXVx40c7hN5Y8FyXOpraNV
	 3kqEf/zPgYHeoUYf3kVLgPxBLIJY4edvbHhqwCySceU7qJBOJz1jSRUDMDS9yIgNsx
	 3/aCDY0txP4scG90YbtXBx8Z4etCltPctmnf4u1eMwSJxqafn1j8wCKGLvJTPf26u7
	 aMRt7gwaES16phtWHaThKZ8fuWKtIeJhPh2KkX4gGoYu2OiVs5ZRZg+XL/zcK6Qy6Z
	 rY2ItafU8V1wyWMhJUAdbFfXlBHxiGYVY0AkldEz3SNRNH3iE/+lOuuZcygFjwx1TQ
	 tGG9TuLMIJVhCln1FKV3u+m4=
From: Hui Wang <hui.wang@canonical.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org,
	ardb@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: hui.wang@canonical.com
Subject: [PATCH v3] selftests/efivarfs: skip write tests if efivarfs is mounted read-only
Date: Mon,  7 Sep 2026 09:28:52 +0800
Message-ID: <20260907012852.17477-1-hui.wang@canonical.com>
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

test_invalid_filenames is left to run unconditionally, since its
expectation still holds on a read-only mount.

Assisted-by: Copilot:claude-opus-4-8
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
In the v3: drop the change in the test_create_empty, and move this
           testcase to rw group as suggested in the v2.

 tools/testing/selftests/efivarfs/efivarfs.sh | 41 ++++++++++++++------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh b/tools/testing/selftests/efivarfs/efivarfs.sh
index c62544b966ae..9a5ad818c63b 100755
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
@@ -361,18 +369,27 @@ check_prereqs
 
 rc=0
 
-run_test test_create
-run_test test_create_empty
-run_test test_create_read
-run_test test_delete
-run_test test_zero_size_delete
-run_test test_open_unlink
-run_test test_valid_filenames
+# Tests that are also valid on a read-only efivarfs run unconditionally.
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
+	run_test test_create_empty
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

