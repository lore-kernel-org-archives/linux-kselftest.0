Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0775D2D2496
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775753048; cv=none; b=IxFiMWZF4Rgu1c8Y8hOV3/lzJyJDrWulLF3j88d6OhrPirvUsLM2QXdKqwHJESc0342F4FQapuOvLmq6OzYqmOpAKdhAbeFjWWyX3Zz3q8EpzbGo6/1/11m8TbfWkb/2WDb5pWQnhJ72+4169Uw6+Co9aCMBKfJFbjlyOzSj2Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775753048; c=relaxed/simple;
	bh=3F1P6+GD4vxbHlbuYw9VWXFgdd2Y1z2cDCfz/C3oxss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EO72A+Sct8ENxm3U0YJZX4Mh7LK3bCsZ7YXDQYpycXk+TlDxU5vctFk7nmzkyvKb3BC/3ORusMhmGWfKUX/tdj+4qeQbIjZtwwWgf3oXVQc71zpajk/nWXfub98hpUYeoDa1uEcPkNRdA3vKn6d0uv6wrihMenNvI4iBPu7fN50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIe8/WUd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIe8/WUd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso17705945e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775753045; x=1776357845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjqF8Mq7jzgiWasA/qrKnok/2Z/1cgoDWFokxqYtr+w=;
        b=FIe8/WUdjqjAPlE55HYhxUNN+l7d0y5ybLZ1BGUR2iIu0rLFinM6BG/N4ia5n0iOCz
         n8IWyFm1LquV6fcGisG00SlossMb8XT4W3mP/KBEF3oYmBjtiRL6A5OjBc7p9DEY2Eg7
         78C5nVv2XNjKYV3PKReuoDwyITJfP1QU1LfjJ9nkz+vkNi2tOgNxtwtBd6jM5wrlCyIa
         3L+LZcdPBOiN9tc75tCWWU0L5Fc0Eo3nur2IqGUS0GLJsbQ/1wNGWjP7Ik2VoJK7jP2H
         hyeJrYbbVBSilbZxWYq8PLpvmLlFSzuzobeA9urbEZT1igVxmHgkPqrUW81Za+GeUtqO
         9Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775753045; x=1776357845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjqF8Mq7jzgiWasA/qrKnok/2Z/1cgoDWFokxqYtr+w=;
        b=qBwJsAAVbondX9mq0JHeqYGAo2672EJV32QUGq/7lfUWASnFcjTLi5+wtWAdCSgeSI
         BTG8+CLMtfQa1DEf6JVlSpQ/+3T78aUZlJjL+lwHF4lnu0Lg/a+5o7vkPHtseh1kl3Or
         6yFBG0uMiqqcpwq0biLaIgKrFElVQcbcnMTqPzavovhdzpgNwcZBaxijMODRYPSgm8PC
         PVyHGJSlMbyCIfu0KBKCbKDJUs1BBRp1/wPDwdyPuYFvtWRhdFh0gVB1IvLh3r5Bha00
         4E1Hkkuwq8D7T1ruE/zmB0qn/c423Ex5+7YQqZMI5Zz8aSSG8mMbJhwUKlk3lemnCGjx
         uG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWM7kRdwJKe91rOgs/L/Z10oA3c9VBlT7yoyuT47/s7wgzoxnIBtxn8R2SFktYjANQE8MNkrsX8/+vUjfwcKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsgK2dfma5KWeMeAtgZ4d41D98Ag6mXm+crbSOOSpiv4KNxPzW
	5Dwv4tcSf/WbRhdGTLeZxQy7KvLEfP3BzMqKXowKXzUgyrKvLtzQHauLSP3XVJ3Y
X-Gm-Gg: AeBDiesHIc3jeXadNlmvM/zMiOT1+tAKYDaV1L+4k9GiFYYGBIbIXgnaRMdZEldTm3P
	m+20NgtcKIBe6A74SwH0TG+B8FkoB9fYiHcyU/h9mZ6mvBCAJKFjXI4lHpSOJQySBvztUq+qWwW
	BE/9PK37VGRLYB6SBRE7NtwLi0V7DNz91S81edPXMpMX1XeTv2+ZJnP2Zjt+MC8WMv8GUPmjlSM
	NWWLLL+jHnx+zn+YoIWeYS/Dh4BJhNxDIorpghXVFBx9z0HHqwcHDBpy2X8wIiWBk9kbNL2Xs8g
	QO5ZtG0M9AktNHyRhMp6w5v/c6+mEII/OnPafjSCzXIRLb6HPEwL3QjEad1gAEx8/e/LuaKYAId
	1RkPhfE47Kp+ykDCxQWIs+g5G2LFxxBnFrtK6FXU1QIv46kbtaTE/qwJ8FmW+T7YFXEZqkuY+ua
	ziKvwRGuH0npn6r48r6Yt8grnLPsUN
X-Received: by 2002:a05:600c:4689:b0:488:be21:54ae with SMTP id 5b1f17b1804b1-488be21569bmr173437835e9.0.1775753045091;
        Thu, 09 Apr 2026 09:44:05 -0700 (PDT)
Received: from hisam ([2400:adcc:119:1300:e749:40f7:4497:4ea7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5934a6dsm3379325e9.11.2026.04.09.09.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 09:44:04 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Brigham Campbell <me@brighamcampbell.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hisam Mehboob <hisamshar@gmail.com>
Subject: [PATCH] KVM: selftests: elf: Include <endian.h> instead of <bits/endian.h>
Date: Thu,  9 Apr 2026 21:40:22 +0500
Message-ID: <20260409164020.1575176-4-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<bits/endian.h> is a glibc-internal header that explicitly states it
should never be included directly:

  #error "Never use <bits/endian.h> directly; include <endian.h> instead."

Replace it with the correct public header <endian.h> which works on
all C libraries including musl. Building KVM selftests with musl-gcc
fails with:

  lib/elf.c:10:10: fatal error: bits/endian.h: No such file or directory

Fixes: 6089ae0bd5e1 ("kvm: selftests: add sync_regs_test")
Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
 tools/testing/selftests/kvm/lib/elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/elf.c b/tools/testing/selftests/kvm/lib/elf.c
index f34d926d9735..620531a669cd 100644
--- a/tools/testing/selftests/kvm/lib/elf.c
+++ b/tools/testing/selftests/kvm/lib/elf.c
@@ -7,7 +7,7 @@
 
 #include "test_util.h"
 
-#include <bits/endian.h>
+#include <endian.h>
 #include <linux/elf.h>
 
 #include "kvm_util.h"
-- 
2.51.0

