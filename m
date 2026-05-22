Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5983F5BC3;
	Fri, 22 May 2026 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450884; cv=none; b=svApO3wOdAZw5aepY9wo3/kr1JWHdC8e+d09VYYaU4fRsrhXr3Bc6oTmtACUBukMozT2VuayHFAdJvDvi/MY/4y0TVe8pgdJx1Vq9WzlXkeKNYDS6dfGodnO7DSrFXMNuYLj26b39NhczhWts5ZQQIeaRLXJe5sGZXxeZlU9+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450884; c=relaxed/simple;
	bh=vmNY/um9G+bwBHysTJuVVWcHuR/Vq1L6YzINaZGyZbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6Jdhc7CjPe/Eb3RDKjscceSt3zgfwGczkknVV1ZQPnuD3aVLZXqbYNocgoGYFA4U+Yat8YzG/8ZFsSaBM+0ppM8HMfTYebtzj7IXNZYCnVaxvDFRp7o0yWUctbRZhCcRlwyPYmZqYnVWTv3IWXBBOh1FOoU3I0MhNyF+/VfbTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJPx3/F5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJPx3/F5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A561F000E9;
	Fri, 22 May 2026 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779450880;
	bh=hWOKqpDYU7flUOclHgTiyxU5PTr/VzIli+kEg4ybh+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BJPx3/F5anvmCiCIsdb8DQoRuxctsbAAKQMvZyyCiDo2D6QWhcxKWbPThBm/fi8ot
	 tW/BJ5ndJzRD1vL+zxfrB/7vc+2vudbE18L5WEgGqX7S9SgIMv1xTqeow6MmHUDBhD
	 X9171y55q//wU8aoyJmMecjqDElSP2ADzcbUrRAIUAJOvDI0QdHnn/HJn9098pdbwi
	 yVBUYXSr7YCe4BlckkXlDvB1u5BLX9PkVP2nUtpSnq0Sis6SJqmNrwBZ/wTAPQ6Xpw
	 hJzzFpn4+xcgWw5zeDGYzgIYxmpaj7iAuhtJmlECAVhCUwZCFGx2YmAEPpbzgI5WxJ
	 sKCHiTTx/pO4g==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 May 2026 12:54:24 +0100
Subject: [PATCH v5 2/3] kselftest/filelock: Report each test in oftlocks
 separately
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-selftest-filelock-ktap-v5-2-8d0e3c012a36@kernel.org>
References: <20260522-selftest-filelock-ktap-v5-0-8d0e3c012a36@kernel.org>
In-Reply-To: <20260522-selftest-filelock-ktap-v5-0-8d0e3c012a36@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4646; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vmNY/um9G+bwBHysTJuVVWcHuR/Vq1L6YzINaZGyZbY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEEP6QN1ACF7F5AfUOV28pEx1iiVnrxgV2wn9E
 7Xsb99MR4WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahBD+gAKCRAk1otyXVSH
 0HXlB/0UCf21InluFGqPNBSBO3yc1eHiUtB+PCe8WaNDqhFgLkR2p/o50ZIZwVVGqEEHmgXHMHZ
 RCpfhepES1fH4fWGCiVWdbN5iNaoNY9Ld3ozoi22MprB84ZGIETMaLpQ7qyOq08YyHXZzLzti4N
 TsIjCABnoL7tniB6+rs63XxmHC8j5jWGiAfv6q4AWLRcfJ/ITyaSbex9z5H+9mLoLCDNtI6BEbb
 cyIaDWpcHRuDDFgHIV6ACA7FJ3ygZzQu8oeYo5slcGgov3SKQcFzzPK1hR/+rRUAnXfbWu6/uiq
 AcbSK5c9MtZIlgq6CuPbnhox0dol/FqeDYrTZSeY70fzM+KI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The filelock test checks four different things but only reports an overall
status, convert to use ksft_test_result() for these individual tests. Each
test depends on the previous ones so we still bail out if any of them fail
but we get a bit more information from UIs parsing the results.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/filelock/ofdlocks.c | 90 +++++++++++++----------------
 1 file changed, 39 insertions(+), 51 deletions(-)

diff --git a/tools/testing/selftests/filelock/ofdlocks.c b/tools/testing/selftests/filelock/ofdlocks.c
index 2d3b06ce5e5e..68bac28b234b 100644
--- a/tools/testing/selftests/filelock/ofdlocks.c
+++ b/tools/testing/selftests/filelock/ofdlocks.c
@@ -39,94 +39,82 @@ int main(void)
 	int fd = open("/tmp/aa", O_RDWR | O_CREAT | O_EXCL, 0600);
 	int fd2 = open("/tmp/aa", O_RDONLY);
 
+	ksft_print_header();
+	ksft_set_plan(4);
+
 	unlink("/tmp/aa");
 	assert(fd != -1);
 	assert(fd2 != -1);
-	ksft_print_msg("[INFO] opened fds %i %i\n", fd, fd2);
+	ksft_print_msg("opened fds %i %i\n", fd, fd2);
 
 	/* Set some read lock */
 	fl.l_type = F_RDLCK;
 	fl.l_start = 5;
 	fl.l_len = 3;
 	rc = lock_set(fd, &fl);
-	if (rc == 0) {
-		ksft_print_msg
-		    ("[SUCCESS] set OFD read lock on first fd\n");
-	} else {
-		ksft_print_msg("[FAIL] to set OFD read lock on first fd\n");
-		return -1;
-	}
+	ksft_test_result(rc == 0, "set OFD read lock on first fd\n");
+	if (rc != 0)
+		ksft_finished();
+
 	/* Make sure read locks do not conflict on different fds. */
 	fl.l_type = F_RDLCK;
 	fl.l_start = 5;
 	fl.l_len = 1;
 	rc = lock_get(fd2, &fl);
 	if (rc != 0)
-		return -1;
-	if (fl.l_type != F_UNLCK) {
-		ksft_print_msg("[FAIL] read locks conflicted\n");
-		return -1;
-	}
+		ksft_finished();
+	if (fl.l_type != F_UNLCK)
+		ksft_exit_fail_msg("read locks conflicted\n");
+
 	/* Make sure read/write locks do conflict on different fds. */
 	fl.l_type = F_WRLCK;
 	fl.l_start = 5;
 	fl.l_len = 1;
 	rc = lock_get(fd2, &fl);
 	if (rc != 0)
-		return -1;
-	if (fl.l_type != F_UNLCK) {
-		ksft_print_msg
-		    ("[SUCCESS] read and write locks conflicted\n");
-	} else {
-		ksft_print_msg
-		    ("[SUCCESS] read and write locks not conflicted\n");
-		return -1;
-	}
+		ksft_finished();
+	ksft_test_result(fl.l_type != F_UNLCK,
+			 "read and write locks conflicted\n");
+	if (fl.l_type == F_UNLCK)
+		ksft_finished();
+
 	/* Get info about the lock on first fd. */
 	fl.l_type = F_UNLCK;
 	fl.l_start = 5;
 	fl.l_len = 1;
 	rc = lock_get(fd, &fl);
-	if (rc != 0) {
-		ksft_print_msg
-		    ("[FAIL] F_OFD_GETLK with F_UNLCK not supported\n");
-		return -1;
-	}
-	if (fl.l_type != F_UNLCK) {
-		ksft_print_msg
-		    ("[SUCCESS] F_UNLCK test returns: locked, type %i pid %i len %zi\n",
-		     fl.l_type, fl.l_pid, fl.l_len);
-	} else {
-		ksft_print_msg
-		    ("[FAIL] F_OFD_GETLK with F_UNLCK did not return lock info\n");
-		return -1;
-	}
+	if (rc != 0)
+		ksft_exit_fail_msg("F_OFD_GETLK with F_UNLCK not supported\n");
+	ksft_test_result(fl.l_type != F_UNLCK,
+			 "F_OFD_GETLK with F_UNLCK returned lock info\n");
+	if (fl.l_type == F_UNLCK)
+		ksft_exit_fail();
+	ksft_print_msg("F_UNLCK test returns: locked, type %i pid %i len %zi\n",
+		       fl.l_type, fl.l_pid, fl.l_len);
+
 	/* Try the same but by locking everything by len==0. */
 	fl2.l_type = F_UNLCK;
 	fl2.l_start = 0;
 	fl2.l_len = 0;
 	rc = lock_get(fd, &fl2);
-	if (rc != 0) {
-		ksft_print_msg
-		    ("[FAIL] F_OFD_GETLK with F_UNLCK not supported\n");
-		return -1;
-	}
+	if (rc != 0)
+		ksft_exit_fail_msg
+		    ("F_OFD_GETLK with F_UNLCK not supported\n");
+	ksft_test_result(memcmp(&fl, &fl2, sizeof(fl)) == 0,
+			 "F_UNLCK with len==0 returned the same\n");
 	if (memcmp(&fl, &fl2, sizeof(fl))) {
-		ksft_print_msg
-		    ("[FAIL] F_UNLCK test returns: locked, type %i pid %i len %zi\n",
+		ksft_exit_fail_msg
+		    ("F_UNLCK test returns: locked, type %i pid %i len %zi\n",
 		     fl.l_type, fl.l_pid, fl.l_len);
-		return -1;
 	}
-	ksft_print_msg("[SUCCESS] F_UNLCK with len==0 returned the same\n");
+
 	/* Get info about the lock on second fd - no locks on it. */
 	fl.l_type = F_UNLCK;
 	fl.l_start = 0;
 	fl.l_len = 0;
 	lock_get(fd2, &fl);
-	if (fl.l_type != F_UNLCK) {
-		ksft_print_msg
-		    ("[FAIL] F_OFD_GETLK with F_UNLCK return lock info from another fd\n");
-		return -1;
-	}
-	return 0;
+	ksft_test_result(fl.l_type == F_UNLCK,
+			 "F_OFD_GETLK with F_UNLCK return lock info from another fd\n");
+
+	ksft_finished();
 }

-- 
2.47.3

