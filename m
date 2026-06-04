Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67923A6EFC
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561955; cv=none; b=W5mMBykONkk5smSlgY0HNtL0L4Uvk3l7L73pX5RBomc0mT4lpUL/jZ4Y3jx7uVRTfqXCnMmnRfLhjWr+BRcGKlpr4NKl+i4uelKf92waNjX7td/xqUoZm1drQPB3DZWxGHSkQL9Z2dZ7NeYxv7D8mwpNUAdWseQbWkB4QJozXcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561955; c=relaxed/simple;
	bh=O/XLm6yquJb792lZu6TBmtaiO7oVMd52d25xxc25xMA=;
	h=Mime-Version:Cc:References:Subject:Message-Id:Content-Type:To:
	 From:Date:In-Reply-To; b=SmjPHvVAIyVqvxph85Yfoc/+iO5keG2G9wJlp+sv2tdbClEjiuTahAW1eVnG+uSGqtnnIw8zVOXEROxi9RH3+s1YxQvQWWP1G2PXcqaOw21BSlqmRIhI+v3v8XzbKDM4Kg9m0IcnsE9/VpM5JNhG9qDT72/j5xew2+gmUlMLAHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RPyvSUrr; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RPyvSUrr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780561947; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=MGjzTvz9nTBXvTHdzC8Aih+cYvdT1nut4fI4CSXMV5Q=;
 b=RPyvSUrr0pNbb0A809BSU3kWis6IN4cihJpkgLHqkeOrM92Pr3QGbGIgbPNesc+QyUqV1A
 q4vwRBP9ZVLf7xmA+F15bSX8LCMCt0HH55ECmq/blRVewWjk5hYTk2DcO9uu8oE+A2eLMQ
 iKfrSQRpwZc7QbKWn5pbCg/kLxfhjcNQMvIsSoPS525j2+5dLITmcGmeblYM+C4fikLBZw
 G00cBsyO5EVb5B9RN5LYCt7p5UbGKMD8tiG7myAIh4Jkf1MVkGuaGgidq0pxOYYVYLaLJ/
 B+FRAq+EuBQtXbgyfAB32KUAkwJEFbrKlkyNVYqUo/yDg4aZDbS1Y06hDKUMQQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Cc: <jpoimboe@kernel.org>, <jikos@kernel.org>, <pmladek@suse.com>, 
	<joe.lawrence@redhat.com>, <shuah@kernel.org>, 
	<live-patching@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a213818+a4f16f+vger.kernel.org+qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
References: <20260602124509.365996-1-qirui.001@bytedance.com>
Subject: [PATCH v2] selftests/livepatch: fix resource leak in test_klp_syscall init error path
Message-Id: <20260604083208.1071428-1-qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
To: <mbenes@suse.cz>
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Thu,  4 Jun 2026 16:32:08 +0800
X-Original-From: Rui Qi <qirui.001@bytedance.com>
In-Reply-To: <20260602124509.365996-1-qirui.001@bytedance.com>

In livepatch_init(), if klp_enable_patch() fails, the previously
created kobject and sysfs file are never cleaned up, causing a
resource leak. Capture the return value and add proper cleanup
on the error path.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
Changes in v2:
- Remove sysfs_remove_file() from the error path as suggested by
  Miroslav Benes. kobject_put() alone is sufficient because it
  eventually calls kobject_cleanup() -> __kobject_del() ->
  sysfs_remove_dir(), which removes the entire directory including
  all files created under it.

 .../selftests/livepatch/test_modules/test_klp_syscall.c     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
index 0630ffd9d9a1..08aacc0e14de 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
@@ -109,7 +109,11 @@ static int livepatch_init(void)
 	 */
 	npids = npids_pending;
 
-	return klp_enable_patch(&patch);
+	ret = klp_enable_patch(&patch);
+	if (ret)
+		kobject_put(klp_kobj);
+
+	return ret;
 }
 
 static void livepatch_exit(void)
-- 
2.20.1
