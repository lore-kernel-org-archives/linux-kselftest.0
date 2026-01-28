Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BA932E6BD;
	Wed, 28 Jan 2026 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769570405; cv=none; b=RlQv1BfToSyhH9YWNvhkoYodawsxZboqtC/slpTMgffyTPxVr6cdyFsgtGCaA5M1UPAtcV30kAMvAN7QozLWsKTuzIibiUqxo110Fyrpi85nu1gTpcrHPGl5rPFMj0dQgn8iF4STJYekB2sEtRRtabd3x7ADzne6nulhhd118Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769570405; c=relaxed/simple;
	bh=+o7/a5I6UzUQDRpljqPNzHLLuTmcXN0c48iNmnI3MJE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G/BePCN2mk4Zjx07XPDTdTcfY7NvX4/Gyzh3OS9INKLJikgBij8xppOJhs1PFdBM5RSreYj0wA2szIEf8Patxzl3cP3eM3YD5OOBwUdGYqG5fE7cB1RPumP0lfGJjCqwXg7TOyeY+VWQ2QZFHGEaPGq9FXFmqZVxdckgLEauZmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=5UubG++q; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="5UubG++q"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UXgQMRgX6ZKPOQHf3S9t/mnG8F8QjY2gsD2Z4x0dn20=;
	b=5UubG++qROvPTqsov6EJnL7EsSiQSyiUNZRU1XEGuUtoraNyowJW8QfWTwv0MOzs68LUq6zko
	09D0PxROSPcmpd2A3XfbCiHYASfjHnJSe3GVImX625etq2fEM+gtNGwB2k8jhTEbWrbqGeW0p5y
	vVZe6fN+lATfOgLcq5lFe7U=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4f16qv3g6DzRhSn;
	Wed, 28 Jan 2026 11:16:27 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 83E1340363;
	Wed, 28 Jan 2026 11:19:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Jan
 2026 11:19:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<kevin.brodsky@arm.com>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 09/14] entry: Rework syscall_exit_to_user_mode_work() for arch reuse
Date: Wed, 28 Jan 2026 11:19:29 +0800
Message-ID: <20260128031934.3906955-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128031934.3906955-1-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)

In the generic entry code, the beginning of
syscall_exit_to_user_mode_work() can be reused on arm64 so it makes
sense to rework it.

In preparation for moving arm64 over to the generic entry
code, as nothing calls syscall_exit_to_user_mode_work() except for
syscall_exit_to_user_mode(), move local_irq_disable_exit_to_user() and
syscall_exit_to_user_mode_prepare() out from
syscall_exit_to_user_mode_work() to the only one caller.

Also update the comment and no functional changes.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index e4a8287af822..c4fea642d931 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -125,14 +125,14 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work);
  * syscall_exit_to_user_mode_work - Handle work before returning to user mode
  * @regs:	Pointer to currents pt_regs
  *
- * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
+ * Same as step 1 of syscall_exit_to_user_mode() but without calling
+ * local_irq_disable(), syscall_exit_to_user_mode_prepare() and
  * exit_to_user_mode() to perform the final transition to user mode.
  *
- * Calling convention is the same as for syscall_exit_to_user_mode() and it
- * returns with all work handled and interrupts disabled. The caller must
- * invoke exit_to_user_mode() before actually switching to user mode to
- * make the final state transitions. Interrupts must stay disabled between
- * return from this function and the invocation of exit_to_user_mode().
+ * Calling convention is the same as for syscall_exit_to_user_mode(). The
+ * caller must invoke local_irq_disable(), __exit_to_user_mode_prepare() and
+ * exit_to_user_mode() before actually switching to user mode to
+ * make the final state transitions.
  */
 static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
 {
@@ -155,8 +155,6 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
 	 */
 	if (unlikely(work & SYSCALL_WORK_EXIT))
 		syscall_exit_work(regs, work);
-	local_irq_disable_exit_to_user();
-	syscall_exit_to_user_mode_prepare(regs);
 }
 
 /**
@@ -192,6 +190,8 @@ static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
 {
 	instrumentation_begin();
 	syscall_exit_to_user_mode_work(regs);
+	local_irq_disable_exit_to_user();
+	syscall_exit_to_user_mode_prepare(regs);
 	instrumentation_end();
 	exit_to_user_mode();
 }
-- 
2.34.1

