Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42874A2E1E;
	Thu, 26 Feb 2026 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772121938; cv=none; b=FWUEImz5JnDv9nEcNMtx/1kkxEAJIYha2hiRnMbUUa1gOcBTQ1J6nYT8DbwWtlbqhganfzPmBR+tb3Fj0CFk7I13IV59iUgd90nzZA6W17TsOp23i/j3wolboxmztD6fkFHdDkb7d81nleHQc1Tq6RhdjD9/cyNHYa5i1YA5kps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772121938; c=relaxed/simple;
	bh=vmNY/um9G+bwBHysTJuVVWcHuR/Vq1L6YzINaZGyZbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dv0sk/NKMF1J8EcTV+WCPJCVcZOXeIOHUOV1mMxaM3vlcgR54c7XbLPL/ocyn4P6HjaOBcnFHqudWP0mMQpQ2LA+SN0ZiKeLi2NMai+KipUCpZbcUrmrvAIZnO1JRjkrJ2EYxE+/1tREiwylrSULJEkGKeAuLxIeEkQJytdvgdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9ZXsMLE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9ZXsMLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D17C116C6;
	Thu, 26 Feb 2026 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121938;
	bh=vmNY/um9G+bwBHysTJuVVWcHuR/Vq1L6YzINaZGyZbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F9ZXsMLEFXDdK1cFM1hgtCY4kdAu4MObLQ3zPhSQoAaJSiHVoS1tGeYBbtQhQFV6S
	 BZ0hmk9QOVcUD6Lk4vErPXGEKH+q1UCCS+MnBF6U+527OqQt4X75zJMHuC0Z7WpeJ7
	 /0bNA/BnjI5jCFwzIFLO5XlXK8vANBYZCFgAVjyEEZUCMd++dZRMxN8n5WvzYEUlTY
	 ftSSRsVzh+EAx2sT/N8pKxRCXVmtEazAJZyw54npdIoxKKQN5a3O5sLCz/JwfU4XXS
	 3696lPrlf5hK58Qac13t2CYCq4vPY3UPUL5IKZ5p0Ex+R4gJr5JmrKx9JcIDVIL6hU
	 mLYM9OdQILWww==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Feb 2026 16:05:26 +0000
Subject: [PATCH v4 2/3] kselftest/filelock: Report each test in oftlocks
 separately
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-selftest-filelock-ktap-v4-2-db8ae192ff42@kernel.org>
References: <20260226-selftest-filelock-ktap-v4-0-db8ae192ff42@kernel.org>
In-Reply-To: <20260226-selftest-filelock-ktap-v4-0-db8ae192ff42@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=4646; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vmNY/um9G+bwBHysTJuVVWcHuR/Vq1L6YzINaZGyZbY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpoG9LuSyEfp+tvAz0ySnNFkMA+cz/O6A+MFIcg
 h/TCN7OSK+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaBvSwAKCRAk1otyXVSH
 0M0EB/9Pf84sVuIqOf2VJcrpb96wtaOE8Dnli3oHRxXk5a+go7OB0VNMPOEgl0D6LhKIWm+1rW7
 G3j2t09CR16wBuSi+7Uf3TdF9ZcGzD8H41KuI3cwgZebUluU5/OlTr1HjhcNWvZ0SKozeskYgtV
 XiOIH80MfHdXo33GD7a3ERjlZz/fJcxbdUWXRnX7V6C13AQjZzOSsY8JkbZ80otjq/QzcgdjyMg
 qHlrN9cojVQl+GiaEWpu6X6o1gTjczJMc9JczZSJmTMsRVZHrj3Nd1f2AsCIzqMC+nvcL6Vqa+Q
 Re85HANiTqD+U0/40vBJnkWBXwb6EkvqLSbap6SklUa+lxk3
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

