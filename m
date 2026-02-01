Received: from ljfogelstrom.se (ljfogelstrom.se [217.154.245.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E3F2BAF4
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.154.245.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769945469; cv=none; b=IgOSvZSCWZ7vtDz/iPTVXllDZYF3VwWP4Uazlg9DWklPu31HWZwmWNlOATyR6SvMHGeeiHUGZhA2rlrCxLm9wncKsW7/KU1Yil/JC3UXj26V60BbzMVwEnFeSMTxAzl+qWIMQM/EbofV020XS3D4r6QEGRHiaZFy2h8aOdYeY0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769945469; c=relaxed/simple;
	bh=5ckrkjUDXjjljEQ4a+tCBg2jMb9IsYgyPYyvP5/VR84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QLplk3s5W63LNB7Rz+Ji/3hQc2bHZ1ajDNmgp4MEuusTBonlma4d5xYTEa1/u/YTTemGK1kWqWsktMYq6BJyXf+FNPeA+JOnp9JVKO3/x5lllMlgzEi3U+fzWTNJmvvLhL8rXklPScp+PocY+3lScLyae1A/CZhXD36BLmU/Gnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ljfogelstrom.se; spf=pass smtp.mailfrom=ljfogelstrom.se; dkim=temperror (0-bit key) header.d=ljfogelstrom.se header.i=@ljfogelstrom.se header.b=lyUOI525; arc=none smtp.client-ip=217.154.245.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ljfogelstrom.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljfogelstrom.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=ljfogelstrom.se header.i=@ljfogelstrom.se header.b="lyUOI525"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ljfogelstrom.se;
	s=1024; t=1769945151;
	bh=5ckrkjUDXjjljEQ4a+tCBg2jMb9IsYgyPYyvP5/VR84=;
	h=From:To:Cc:Subject:Date;
	b=lyUOI525Qoimrenf28u5bWABpcvSEhn0YyFmsap8MInApEnWHcxuYtL0mrtyVNyx7
	 B3jOH9ZVAKLT0FPUNOZjvHSeRT/P81tpZWjjBgkeDIvA2GZV/Ug1jAru5gdcwiffnA
	 DHdG/02tg3qmw4qBJwoq2vQ2n0MchAnhbC3DDxCs=
Received: by ljfogelstrom.se (Postfix, from userid 0)
	id 46E5223FF6; Sun, 01 Feb 2026 11:25:51 +0000 (UTC)
From: root <info@ljfogelstrom.se>
To: linux-kselftest@vger.kernel.org
Cc: LJ Fogelstrom <info@ljfogelstrom.se>
Subject: [PATCH] selftests/filesystems/mount-notify: fix unused result compiler warning
Date: Sun,  1 Feb 2026 11:25:08 +0000
Message-ID: <20260201112541.1632107-1-root@ljfogelstrom.se>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: LJ Fogelstrom <info@ljfogelstrom.se>

Signed-off-by: L. J. Fogelstrom <info@ljfogelstrom.se>
---
 .../selftests/filesystems/mount-notify/mount-notify_test.c      | 2 +-
 .../selftests/filesystems/mount-notify/mount-notify_test_ns.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
index 6381af6a40e3..a3ffc07d26e4 100644
--- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
+++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
@@ -464,7 +464,7 @@ TEST_F(fanotify, rmdir)
 	ASSERT_GE(ret, 0);
 
 	if (ret == 0) {
-		chdir("/");
+		ASSERT_EQ(chdir("/"), 0);
 		unshare(CLONE_NEWNS);
 		mount("", "/", NULL, MS_REC|MS_PRIVATE, NULL);
 		umount2("/a", MNT_DETACH);
diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c
index 320ee25dc8a5..0e85e49cb259 100644
--- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c
+++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c
@@ -491,7 +491,7 @@ TEST_F(fanotify, rmdir)
 	ASSERT_GE(ret, 0);
 
 	if (ret == 0) {
-		chdir("/");
+		ASSERT_EQ(chdir("/"), 0);
 		unshare(CLONE_NEWNS);
 		mount("", "/", NULL, MS_REC|MS_PRIVATE, NULL);
 		umount2("/a", MNT_DETACH);
-- 
2.52.0

