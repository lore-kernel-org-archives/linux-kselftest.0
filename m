Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3973FC5A5;
	Wed,  8 Jul 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502705; cv=none; b=dsORfnNnstVG9ghMWOilK+xRVxzCKY8i2l8omsAFpZO0Je7kH447UP3myxXoG5I+PMN2eQEFcKfs8SIvWM+Omylku6Hxb4rlBerB/HArIYJzHpy8/t5jX+9GbOJDM007NunytxxpWRyTUmklAaEhIFreL7loKPJaa7xYjxoRIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502705; c=relaxed/simple;
	bh=FbcaszoG3ccSi2fUtQzilA+nmkbiUWWnKM46qc2It2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h3h+hLYUna364DIx/TPwbu2cTJS+1qeTw0SGDdisSICCqoiHdaws9yFTWK2joDWwrvGelzWhKNpAAIgQVIvnMRMgkhv8fUL3Iwuw9JjQZHYLIZodKtGkoOy+KDYz4t3dmHKZeuHs8N8RYoU6PXuTYnrS2c1BkvVDQu8NfRyZilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YtEe2JQa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YtEe2JQa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85C691E5E;
	Wed,  8 Jul 2026 02:24:58 -0700 (PDT)
Received: from e142502.arm.com (unknown [10.57.31.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E8FE3F85F;
	Wed,  8 Jul 2026 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783502702; bh=FbcaszoG3ccSi2fUtQzilA+nmkbiUWWnKM46qc2It2w=;
	h=From:Date:Subject:To:Cc:From;
	b=YtEe2JQaueKBOD88qFZsp9kODyad6uiVEdCiWncXS6vGcoy0Db1lC4UADVfvs5cEa
	 n6fkekCRELNRoAEkic8cRdoHLPou06/mbMQ69QmO4N8dF0FV0yboa8+q9w9c1it3tC
	 q5qFnMxGmK790tCGa5Uve+K5CE6e6XtRpKBWLNgs=
From: Arthur Cassegrain <arthur.cassegrain@arm.com>
Date: Wed, 08 Jul 2026 11:24:43 +0200
Subject: [PATCH] selftests/filesystems: include fcntl.h in fclog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-fclog-fix-include-v1-1-50b361964d6a@arm.com>
X-B4-Tracking: v=1; b=H4sIAFsXTmoC/yXMUQqDMBCE4avIPnchVTSkV5E+2DjRFYmSqAji3
 Rv18WOY/6CIIIj0yQ4K2CTK5BPer4xs3/gOLG0y5SqvlFaanR2njp3sLN6OawuGK5SpNExRGkq
 /OSDNd7P+Po7rb4BdrhCd5x+HtN3qdQAAAA==
X-Change-ID: 20260707-fclog-fix-include-ef30967e9359
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 NeilBrown <neilb@ownmail.net>, 
 Arthur Cassegrain <arthur.cassegrain@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=arthur.cassegrain@arm.com; h=from:subject:message-id;
 bh=FbcaszoG3ccSi2fUtQzilA+nmkbiUWWnKM46qc2It2w=;
 b=owGbwMvMwCXGNdGrovDKHw7G02pJDFl+4jmPzi//2Jvv07H5zL1tXxcrX33CLaBcuPL3W9kfC
 0+Ka7VydZSyMIhxMciKKbJ471KqfLmtdaHetseLYeawMoEMYeDiFICJhP5lZNj7XKFmkYBPjZaO
 4/WEjm/GbVdvF2isffxfopHDVpnxzVmG/871uptzuT7UnVx7+pnc/obOat+aZYqMqYEdHZmOQo+
 n8wIA
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

