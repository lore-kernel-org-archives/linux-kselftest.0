Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB636D4EC
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 06:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769668377; cv=none; b=d78uk/2vrlSHrnVCxS1CqFnrDrLXg71ANSSlAkw+orLQsYamk1gw7HbKTgtlGV1qZzZ8+4Z4cWfZPr7qoojF80ZjaQFIZ27qd46FaHnNVwj8H1jubA5wfxyoj0r3CVxaillG/tWjadjq/FASdaVEt/oPdUxQ/S3PYd/l6pwrNws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769668377; c=relaxed/simple;
	bh=mnQ4xqmFgscPL6ExS4kZ4ROzI+Lmy9/KgUgWWqQjIAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pUBAgzoAZGJ/v+M3zMj2Jk2EPTEo+09t9SE2pXNxB9sNyNundj6JKhkuIUYpyD1aEYZmi79Uz4ucTyyjttHl0LnIEOppTWUs9IqJQuSv/Ciq1qDaPruUq5L3L55/9u8btbOBUsYnXoTcJn4ZjTj4qD8M66RmAoi93PWT9oEMr6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=jL2XwF7N; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jL2XwF7N"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1233bb90317so1548926c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 22:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1769668375; x=1770273175; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2Lgjx/8EY+0JxQrKQpdEcGo+/xiuBp0b0+rLtcl51g=;
        b=jL2XwF7NxOh0A/hiaLb7WwIFLRgwAZLvEa0JWgAxADtWcDp8pD//aj/Oz86VFWmzZC
         WAuK8MEvv60P75S4i71V2WWUfyP0ZVPSpKl1T7Z4Ireh1SgVGu0HciVLnk8odrHsptSu
         WzbYkeCoPSvy63Qb3toK8mrqJwUxtLwsmHWVgaSxxngp5E17oxMz6UwYzVWHsZ2WIAgn
         NSQ8/bmKw/qGh35nwk+Gix35HIvnlbk5S5/WmsovoUML5zqt13bHkUKnbncrynhRtVeA
         Kst3sDGlQ5cYSvCJiftWKlZ0IuAKSS27m5HY1py9Ey8Yy2JbxdImNqm3Rowq0ljKKA9x
         vzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668375; x=1770273175;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2Lgjx/8EY+0JxQrKQpdEcGo+/xiuBp0b0+rLtcl51g=;
        b=TFDY+3/pU+lzA2iCn6WeSja7yn9VjMxSHcBZgTPRuLeVMuY6d3kSzHSbDdFrofONwh
         tmAg18CQ7V8pm9CwnDpLfCygXhYyXRaX+9esiDm1nSk5+ydgkBGwMaGOoOnNDS1g0pSA
         sOsBZ1lVljtiCSrSavtUaWaF/qRKTvBd5scX9s7mdsvLkNbakjfK6kt8iOdfn5idxcGm
         8IFGl/MsaAs8OGC5sALbz7l1jLsck6CzZkffavJbTQssAb5/LFp+IdnASFjNUu7PBMdy
         jqz7VApkDl3rmuTTrU21hz8vr3dXZ3wpcjz1IjU/U99ZWxgv5WF0NEBWPQgZp13UkJh3
         7qNw==
X-Forwarded-Encrypted: i=1; AJvYcCX7UVGgqOvVqWW0BEEUuj3ImdRue5Fz4okYGpZCW5UQgzKLRX+4qp8mgfgJv1iSVvWRnrZXOxDUBi4HreQZSGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS0M2x1yVb0ox837Hts0XCS7Rj1YMRgt9k2uWLLy/qojQR2PYl
	bG7X7KtyXmr7KePzfnX6/dog00emU/bQjTB8s+c4emDmqvLo2h63hjlaHn8g4GtwUF0=
X-Gm-Gg: AZuq6aJ8DXj7IRdeVsOKkwmpvzPRDB8SU8U/s/uUTwssuHV/eHXW5wijoMk06MUPNvq
	xAbFLGOeYUSn90OB2oqQO5rCkJCYmshsPvzySL8CoBvAvR0u27vOFs9oc81AeAJ7CxStBTpzgQY
	tBSCvBvP4tLH3d29kS17DiWUZB7MKouUPy9S4y0RnTRE9ToB/sQ60MksPdADvey/zhzQgtw0wKL
	6SaIigbRmi6IBSK8mON8xAIjtwP0BhhnVRuHdEvVEbB6J4KcTmCRzfegUDat8mUZpKqOAUfQpCc
	IVCbVWTq5u1all42Xg/cFFc1GzhS5E5qHUlPFyrIQzcljjEMxvC9KuU18Ig/7vzL6lkY3bnf3vI
	/bg2OhxxaiDeI6ru1xzpl4/S+xpgOTN4UTXTf/RW4hok0uaIyfM932ushzl1nYhwWSPJbkJegsF
	sS1Otfu6iypDM90jKDHRbHjacakTQ=
X-Received: by 2002:a05:693c:2b04:b0:2ab:f490:79f9 with SMTP id 5a478bee46e88-2b7b185ebfemr1059367eec.21.1769668375354;
        Wed, 28 Jan 2026 22:32:55 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8ac0sm5735215eec.35.2026.01.28.22.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:32:55 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Date: Wed, 28 Jan 2026 22:32:52 -0800
Subject: [PATCH] selftests/futex: skip futex_numa_mpol without libnuma
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-b4-futex-test-v1-1-ce73742068ad@sifive.com>
X-B4-Tracking: v=1; b=H4sIABP/emkC/x3MQQqAIBBA0avIrBswC6muEi2sxpqNhVoI4t2Tl
 m/xf4ZAninAJDJ4ejnw5SraRsB2GncQ8l4NSiotWzXg2qN9IiWMFCLqnTqzmdF0VkNtbk+W0/+
 bl1I+Yy91hV8AAAA=
X-Change-ID: 20260128-b4-futex-test-6de3aca9a3f6
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Nylon Chen <nylon.chen@sifive.com>
X-Mailer: b4 0.14.3

Use pkg-config --exists numa to derive HAVE_LIBNUMA.
Only keep futex_numa_mpol in TEST_GEN_PROGS when libnuma is present.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 tools/testing/selftests/futex/functional/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index af7ec309ea78..ec3c39a51182 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 PKG_CONFIG ?= pkg-config
+HAVE_LIBNUMA := $(shell sh -c "$(PKG_CONFIG) --exists numa > /dev/null 2>&1 && echo y")
 LIBNUMA_TEST = $(shell sh -c "$(PKG_CONFIG) numa --atleast-version 2.0.16 > /dev/null 2>&1 && echo SUFFICIENT || echo NO")
 
 INCLUDES := -I../include -I../../ $(KHDR_INCLUDES)
 CFLAGS := $(CFLAGS) -g -O2 -Wall -pthread -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64 $(INCLUDES) $(KHDR_INCLUDES) -DLIBNUMA_VER_$(LIBNUMA_TEST)=1
-LDLIBS := -lpthread -lrt -lnuma
 
 LOCAL_HDRS := \
 	../include/futextest.h \
@@ -27,6 +27,13 @@ TEST_GEN_PROGS := \
 
 TEST_PROGS := run.sh
 
+ifeq ($(HAVE_LIBNUMA),y)
+LDLIBS := -lpthread -lrt -lnuma
+else
+LDLIBS := -lpthread -lrt
+TEST_GEN_PROGS := $(filter-out futex_numa_mpol,$(TEST_GEN_PROGS))
+endif
+
 top_srcdir = ../../../../..
 DEFAULT_INSTALL_HDR_PATH := 1
 include ../../lib.mk

---
base-commit: 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
change-id: 20260128-b4-futex-test-6de3aca9a3f6

Best regards,
-- 
Nylon Chen <nylon.chen@sifive.com>

