Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCC03DC84C;
	Thu, 10 Sep 2026 09:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031666; cv=none; b=WkzL3+GXravHXoihpQ3tu0ZQjSDTTqH2MXULTyKWqMVe7mZEDrul/qq3HWIU0BGDlx735NyRCtNNWuel3NyGQBpo8hVkopmt9grMllWBA4a2Iy+o0+ctCnbVaaC3/fMXZTe9w4JoDM3vGGJbqsJnN+d9cLZyZdDbLfs3rPy1uTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031666; c=relaxed/simple;
	bh=jt1EmTW/vPtxl+AdfmNiUaN3MYxIpVBSh+7sfiiUWjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YlOB569O0ecxiVxaz+rFbtd8HFb9Em58Fq5BY+TlDGfFfxZGY+s7s1tlrNdT7TkJEKw/+UMcMffIlELUoCCX3MKjuAITqJMqJxpLJMZJAAw5yLIuBNqFN8S4LneGlzql4cAu4yM11tv9rlliIIVJPaJx2xeMuKHkmAb9XXiV0jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=G7CVx5l8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G7CVx5l8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41C911570;
	Thu, 10 Sep 2026 02:14:15 -0700 (PDT)
Received: from e142502.arm.com (e142502.arm.com [10.34.111.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D910A3F528;
	Thu, 10 Sep 2026 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789031658; bh=jt1EmTW/vPtxl+AdfmNiUaN3MYxIpVBSh+7sfiiUWjc=;
	h=From:Date:Subject:To:Cc:From;
	b=G7CVx5l842uijans7UkpoI7/p0szuNuy5ZiIkuVxk0XQRP0oZLCjdqj0bXv+yyO1T
	 2PY4w6nFwQ2T3udJ03BfFSIovXcBLdL0sPoGYtP3z6UzqLnAcOO5ZLUi86iRFe04kN
	 V7I5Tdo80bluY7R6NtltesXl+ZMhFQ8eVblauZa0=
From: Arthur Cassegrain <arthur.cassegrain@arm.com>
Date: Thu, 10 Sep 2026 11:14:05 +0200
Subject: [PATCH RESEND] selftests/filesystems: include fcntl.h in fclog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fclog-fix-include-v1-1-b72bb03eb998@arm.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 NeilBrown <neilb@ownmail.net>, 
 Arthur Cassegrain <arthur.cassegrain@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=arthur.cassegrain@arm.com; h=from:subject:message-id;
 bh=jt1EmTW/vPtxl+AdfmNiUaN3MYxIpVBSh+7sfiiUWjc=;
 b=owGbwMvMwCXGNdGrovDKHw7G02pJDFmLSl6+icgWPHNpa9ica1tinfvuG/HO+iab97v+zfOXt
 iVFdgaSHaUsDGJcDLJiiizeu5QqX25rXai37fFimDmsTCBDGLg4BWAiO68xMjxrWL/upaSouNnF
 3mPvOqxPNbaza2k1XeDfPb9zRUJZySGG/25/eGTNAn1XvG2JUtonIifRYZPB8VpiqfqO66KWag2
 HeAA=
X-Developer-Key: i=arthur.cassegrain@arm.com; a=openpgp;
 fpr=4BBA2279E9B685A12EB6E3A30A914A7871D4FC08

fclog.c uses open(), O_RDONLY, O_CLOEXEC and AT_FDCWD, but it does
not include <fcntl.h>, where they are declared or defined.

This was hidden while <sys/mount.h> pulled in <fcntl.h> indirectly.
glibc stopped providing that transitive include in [1], which exposes
the missing direct dependency.

Include <fcntl.h> explicitly so fclog.c builds with glibc 2.44
development headers.

[1] glibc -- change 419245719ccb ("include: isolate __O_CLOEXEC flag for
    sys/mount.h and fcntl.h")
Link: https://sourceware.org/git/?p=glibc.git;a=commit;h=419245719ccb

Fixes: df579e471111 ("selftests/filesystems: add basic fscontext log tests")
Reported-by: NeilBrown <neilb@ownmail.net>
Closes: https://lore.kernel.org/all/178331747789.27465.4739600418387513587@noble.neil.brown.name/
Signed-off-by: Arthur Cassegrain <arthur.cassegrain@arm.com>
---
 tools/testing/selftests/filesystems/fclog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/filesystems/fclog.c b/tools/testing/selftests/filesystems/fclog.c
index 551c4a0f395a..df0767a7e01d 100644
--- a/tools/testing/selftests/filesystems/fclog.c
+++ b/tools/testing/selftests/filesystems/fclog.c
@@ -6,6 +6,7 @@
 
 #include <assert.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <sched.h>
 #include <stdio.h>
 #include <stdlib.h>

---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260707-fclog-fix-include-ef30967e9359

Best regards,
--
Arthur Cassegrain <arthur.cassegrain@arm.com>
-- 
Arthur Cassegrain <arthur.cassegrain@arm.com>

