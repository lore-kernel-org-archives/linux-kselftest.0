Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BC54EC65E
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 17:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615671; cv=none; b=C/4rIE12oPo67bk976p3oMbv+OxhQxjtgRlxrts63r3z8YoFDoqesj929Ka2yJRIbJAvG8zmW6IZbMiM/Bd6+PicUP9ELvhjhnVsjKimJ9+/36SW7RBVgmbS1e+vbwIeZFic5AsfhBcNdEB6jR7+b3nxj9CIq9Qljsx4n+R0m8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615671; c=relaxed/simple;
	bh=tehroZN3KtgNHaPozWMKAR0G6Rqm8qcNfVMBdzcofAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TH4z9Ee+Ti9ORj1htTno9GkCd4/hhJosu3nm+6J4yuOfUj1sRQ83OVjflslBNV9/blVbvtl9WWM2JtE/LkDb8pwuNNT+LaF3SOTr0unaXZjkEhNRNPfhiDS6k4Os6rrG4NLomE70H0Low/2JuWhy+ytx2GQpTgDU2/GNIPzoumk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSYe76pQ; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSYe76pQ"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b36a8d5b5so1032026a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 10:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790615668; x=1791220468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvEKnO6S00JYk9QppCVl3/HoC/Fjv0c3U2lycj2T5RE=;
        b=RSYe76pQcKyuu5SwzFTcq9kPXd5aZnRmnBdqyP37oa1QYRIwezgoUggFcywmCARuUh
         QNX5EFvVezYqY/zog7oSBkjJ+oZwwp+7FbtXGuArILqdihTUsNToaxpqPCLbt8BdvR3o
         WUsYujrYeLtBIqeP2Jo4bPWX+kn2+gLv++9cbP39uf+CWPJKxhQWdTRdCnmUUajvPuXT
         zze27PdPtwVH91STO2I3kY5Beu+a01JvuwvmaK+5/dgFjoKO4ynwz6pboNsOYZ2X4Fwq
         dSGzeiExPefZLx84Ux+67uNm7bFObLIvEy72bRYr2mrREP96UqdRLjksYQrmD0pig7/t
         fBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615668; x=1791220468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvEKnO6S00JYk9QppCVl3/HoC/Fjv0c3U2lycj2T5RE=;
        b=OXJqyyt2gAx+6pdNfLUBRCBKuyKDETaBqnJZ/0R1+3KY4BoQQSAAfE0b+MZPcTh0fC
         cL2jgNDiRwwUpOmue3y0p2yyGxu1c+a/gHz0oaF77FGB6JO/SWQos9c6Z5FuAIdfGBzm
         muI7HYmyCu9CZm+LgFE3g5kSqBuLhEa+P+gPZsJsMMhyx/SA6KCk73GqVUQUE6kvq2Xi
         Ldc37gAJo4XcX7gsT8jJxtdw77c8H4uojN7JuGq6QTH7R//VUmLhcbdhYNoqL0fS/UXG
         5i4g/sqTIzezEnQFC+g7kJT0Fu/q4WrcRL5U8i0Cre7g3u3B0LFA6j1U0abPHb8CeZpg
         dAQA==
X-Forwarded-Encrypted: i=1; AKwUvBx6Q/F20QkoIbZCCQHJchm2QrhCxQcmU2fZ6vgYI20qQn4j3kv/Ml9eOi/YUIanxaa1V6HduEvqhtf0caG4Aug=@vger.kernel.org
X-Gm-Message-State: AFuF++mmrHSil+EfpJXP1Z8Q2dnIJVwWkd1JiUzav0XgCoaRGqcMs+LW
	DvjNFpeabnw/piOPg48xaUL2S4OM9funyLwuSlyyy8MTi7f9ZSMf4aHa
X-Gm-Gg: AYBFou3gHJznV3HOYROu9Y3HKuZzoWySqSS3hZUVyrBmzE/ApjLs5OppR1Y4kGLb0IO
	54Jxgs3AnYh4/zL6/gkRORDCUR+P8dgt9phznhT5/+BMchvOpt7MkiXB9msXUNjpe+tYQTlAIPA
	Rumf+6DHjQqWUCzBfRnknRe8HATupe6J1JzEf50hTuP236O5NBS9NeKG0Y/jMLAfgOqBq43Ta4T
	ryAUj0k3FVjnsjMNZhcdbl9011AqthRGfV1VqYCotk69nmNZbcKkEeelfpDjfSb5mOcZyPWsHSX
	xyFKUfxZRiiaCUSDqYg+X93WHve5E4bbQKnW1zpGk0XrY8KBYMJNBsq1pRIk59Jmzt1Oei01z00
	jIrver+H6OEFtyBhccHSa8dUCvINkNH/6pD+VT9Fc6LnY3m67+CSLpotZDw/wHzpWkoqFJnYktO
	GIw5d6+NXhdVU48Az0eqtDxSB4STDf10avQc8ETyalrLsa8Eo45mhRsUhbVvwgJEc6V0QTZb7ST
	x/Znra9Idx1oPtI5FBQ7QmOkVlTP4eqaj4ptOY//w==
X-Received: by 2002:a05:6820:986:b0:6d8:6049:1247 with SMTP id 006d021491bc7-6d860491701mr3981185eaf.2.1790615667972;
        Mon, 28 Sep 2026 10:14:27 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d87d9060cbsm5492874eaf.0.2026.09.28.10.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:14:27 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Beau Belgrave <beaub@linux.microsoft.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] tracing/user_events: Handle ioctls from 32-bit tasks
Date: Mon, 28 Sep 2026 12:14:23 -0500
Message-ID: <20260928171424.199202-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DIAG_IOCSREG, DIAG_IOCSDEL and DIAG_IOCSUNREG ioctl numbers are
defined with pointer types, so their size field is 4 for 32-bit
userspace and 8 for 64-bit userspace. user_events_data has no
compat_ioctl handler, so on a 64-bit kernel every one of these ioctls
from a 32-bit task fails with -ENOTTY and such a task cannot register
any user events.

struct user_reg and struct user_unreg are packed and only use fixed-size
fields, so they have the same layout for 32-bit and 64-bit tasks. Add a
compat_ioctl handler that maps the 32-bit ioctl numbers to the native
ones and passes the argument through compat_ptr().

Fixes: 7f5a08c79df3 ("user_events: Add minimal support for trace_event into ftrace")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on x86_64 in QEMU (v7.3-rc5 plus this series, KASAN and lockdep):
    - A 32-bit program that registers and unregisters an event gets -ENOTTY
      from DIAG_IOCSREG before and works after.
    - tools/testing/selftests/user_events built with -m32 (with 2/2): all
      four tests fail before and pass after, in three runs each. The
      64-bit build passes before and after. No splats.
    Also built with CONFIG_COMPAT=n on x86_64 and with CONFIG_COMPAT=y on
    riscv64, both with W=1.

 kernel/trace/trace_events_user.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_user.c
index f658c3a77aa7..07cfbb5a17de 100644
--- a/kernel/trace/trace_events_user.c
+++ b/kernel/trace/trace_events_user.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/cdev.h>
+#include <linux/compat.h>
 #include <linux/hashtable.h>
 #include <linux/list.h>
 #include <linux/io.h>
@@ -2737,6 +2738,36 @@ static long user_events_ioctl(struct file *file, unsigned int cmd,
 	return ret;
 }
 
+#ifdef CONFIG_COMPAT
+/*
+ * These IOCTLs encode the size of a pointer and thus change their numbers
+ * between 32 and 64 bits. The structs they point to have the same layout.
+ */
+#define DIAG_IOCSREG_COMPAT	_IOWR(DIAG_IOC_MAGIC, 0, compat_uptr_t)
+#define DIAG_IOCSDEL_COMPAT	_IOW(DIAG_IOC_MAGIC, 1, compat_uptr_t)
+#define DIAG_IOCSUNREG_COMPAT	_IOW(DIAG_IOC_MAGIC, 2, compat_uptr_t)
+
+static long user_events_compat_ioctl(struct file *file, unsigned int cmd,
+				     unsigned long uarg)
+{
+	switch (cmd) {
+	case DIAG_IOCSREG_COMPAT:
+		cmd = DIAG_IOCSREG;
+		break;
+	case DIAG_IOCSDEL_COMPAT:
+		cmd = DIAG_IOCSDEL;
+		break;
+	case DIAG_IOCSUNREG_COMPAT:
+		cmd = DIAG_IOCSUNREG;
+		break;
+	}
+
+	return user_events_ioctl(file, cmd, (unsigned long)compat_ptr(uarg));
+}
+#else
+#define user_events_compat_ioctl NULL
+#endif
+
 /*
  * Handles the final close of the file from user mode.
  */
@@ -2787,6 +2818,7 @@ static const struct file_operations user_data_fops = {
 	.write		= user_events_write,
 	.write_iter	= user_events_write_iter,
 	.unlocked_ioctl	= user_events_ioctl,
+	.compat_ioctl	= user_events_compat_ioctl,
 	.release	= user_events_release,
 };
 

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0

