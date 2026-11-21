Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288427;
	b=xePVw4GSo6evhyuxsxnOphcbyGjxWRw0vrMBkugqMo+MWC90R6AjBjcvxOU/mnqmtcgh
	 y8BeIHKJwo06Nf53n62Xq817pCdKAG+04zX1+6MdHXG29wBhvS8lTulp1d2EdYhcQoUpX
	 L9X1ZspnaCzB4Z2Sk6ZOfQOIc8d/hf1FcCWBfgR20BuGMrgPfJGj4h03Lra/Q07TAGfe7
	 mGY8AmJBkbxFDBwN2orB4NAPY/ji5zVa9XLX9Vg/QUZn0+BZK+ynd9CNssycN5Y2RgBNW
	 AWTYzdgwFWgbQKQZcAWYrcvEuRmZ4NiV6Ilc/wjV2XN1+6gQ1cuXxiDASZq02EhRq+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0p5SdW2QUlP6oc7GBXyTSmsNARTVU7xBP/EBePnLS70=;
	b=0b6WImdQreGyihhAoG8PZ+TXx4HGxQwBvxVpJNLRNxIr3Wbad4KHRWYd/CmwksUWAFKD
	 26zN1S7VsbD0I8fPAAYZ0rohsQnxEGlidwLivil02YHdql5a2Ih/Kd745ww7JOUp9O1zl
	 rEP6e202BdeIjd+Bu/NJbQGr46MDzVm508RWJ4Vtjjexilh+Q5I85xMN/96qrbqeXAMkG
	 zAP+izdQZbvzulP0mrtRx9DYsg/IgtxhxX04Mcko6U/g7Ntc0Db2ZVEEPxDbhUb+J7gyv
	 N1uRM0ndyqvnZty1xGhdCpUVLFlazQeT351Dbxxan5B7K1Fjgb4+RzCiGC/V6AqNMTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FmBAFmh2;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04664606A320
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 19:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04664606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FmBAFmh2
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91f0274f88cso30049446d6.0
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 11:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288426; x=1795893226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p5SdW2QUlP6oc7GBXyTSmsNARTVU7xBP/EBePnLS70=;
        b=FmBAFmh2+uqLuJpfyQ35HUYP24JwjMRdBeGnnIEXuNsAIA2FIlxAD5RmRPuSCtxDUj
         IyqC7cn9KbDxXtcuxHL1LCEqQmys6Ag0ZRDW7Qf1tMFi8g+0oCJ5HR9QH+jtu0yoM8Dw
         AuCzMApnrfrYQ43Du7gKqDwoqc/HbYtZAppNkMIS8DL/3alQwqr8X5pydo9R8stijy+y
         ZWQn3kjjcpGj9C6MEdJvE9+T+inKR5PBTYoUTvZjd5zaiO3bIjnDQj0FsTtN4T7cRgBr
         16qSOzrDIo3letvoeY8SHXrqfJE/4mPzNlXsFYv1kpaxR8fNMST75owQf1vw04xjA44K
         QW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288426; x=1795893226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0p5SdW2QUlP6oc7GBXyTSmsNARTVU7xBP/EBePnLS70=;
        b=eWwqInFyGYeQKQNkyrmrtDqy42kgCZuTsXazJFQ965NebqRY49vekzErljzE+tq+HW
         pdXjbcyYnaC/4uBPh2D3t91fsgtFe4lUmnHQNhXZN1hwB51Vvd5uuhKxIgnZM2BOB5bB
         m9cyW7APQHiuZrBZpx4mnfkEIHOaX2tPgKXNrQtMYtbUpjZ33CHewUSpt5TxexKjW0EI
         NuHCzOc/JAxnIQCjNAYXAiV2liilGSvULfh8VqvL9irs3+STdILrfLYQxMVh/4+J2ktm
         sEkQ+0Xpw4teiJ8R8Y4dIkaWuHhOa0atmKuOvU6fUSc/C4P1KpQ5OUunXaHpdhOCENoy
         yHtw==
X-Forwarded-Encrypted: i=1; AL+hErHGqELTBATPdSBWMyatc4Cwasxymr6pV6+vOZ48YBx8rAQPRLEbeTk91LnnmG/Jf3JAefd8up9e3jlxUcp16qY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UZ69/r0O18XWtVnay5XNATgFFJPowqHKXXcO22ZDEmyufWrAe
	NzwDS+0iyHDp2UDwWNw4Uh6LUaCt4IAd2fzV2OOPF8zOWaH5q7sxAj3i
X-Gm-Gg: AZFdTZfyeFUap7eBvf7pW2vKJ4bmnvwvqGGx7hY86maZIyVmi2ixnlC7f/FCYC3P2W9
	ndPUDNoxpwbQ126Xi7QEDS+GwcCyp/gIzm85jLjSAO4hSaVmEVErUFwQ4reOS/Dok4qv4dg4QhZ
	OJKNNkvAA6ZGxPL2mgn5lhFFoCdxLfEafwJ82Onixn31B5QFzMQ9APYDD9APzEmJOjToCKPBuA/
	gBOEwIpI/iD3wo8NtfuWHmqw5i8wEdgkj4ywcwJkSJ1dEchV/wwFVNkasidTuww9Py6enhMnimw
	uo66ZfgmhKTeoDjzVAcDY7r8RPrfwvF7e/H7epWBqxMNssO9hD971IjwXZR72LGdbawPqdaKxBo
	qjrdkLWAZNt6JhPRlVkC9Gj+ZTXo0tzTNwCjA5uwemP+akfRNfQf3MkTRQdXIk2XZfpwOscc75V
	W+8JtC1freNc7A8gjPv4CP6wnOsmfJanM3S1i4cXLJbPZVyvEIFt6FM0glcuVyG09xTNHlqMP3+
	ZKMWZFt9YmY0wHE39ZGNT6zSe+EA50A8ubrmPGIdWd/suouDNQD10xCV7xl87oLrlUKo3TN/t4j
	mV7CExzJVQe+sN+jg+p+xBilRvMsVdbpPsebiB2Hkj1cFr7+VTRg2ZucfO+KmHuhRZfbPWyECes
	riw==
X-Received: by 2002:a05:6214:8504:20b0:921:2245:73c2 with SMTP id 6a1803df08f44-92134abe315mr91505836d6.20.1795288425845;
        Sat, 21 Nov 2026 11:13:45 -0800 (PST)
Received: from localhost ([143.198.29.12])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ee175sm62359706d6.26.2026.11.21.11.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:13:45 -0800 (PST)
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 2/2] selftests/coredump: include <stddef.h> for offsetof
Date: Sat, 21 Nov 2026 22:13:40 +0300
Message-Id: <20261121191340.91952-2-ndokutovich@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121191340.91952-1-ndokutovich@gmail.com>
References: <20261121191340.91952-1-ndokutovich@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both files use offsetof() without including <stddef.h>.  offsetof() is a
macro; without the header it is not expanded, so its first argument is
parsed as a function argument and the type name fails to compile:

  coredump_test_helpers.c:1309:26:
  error: expected expression before struct

Include <stddef.h> in the two files that use offsetof().

Fixes: c71147f42bff ("selftests/coredump: split out common helpers")
Fixes: c09ea6659e50 ("selftests/coredump: split out coredump socket tests")
Signed-off-by: Nikolai Dokutovich <ndokutovich@gmail.com>
---
 tools/testing/selftests/coredump/coredump_socket_test.c  | 1 +
 tools/testing/selftests/coredump/coredump_test_helpers.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/testing/selftests/coredump/coredump_socket_test.c b/tools/testing/selftests/coredump/coredump_socket_test.c
index ec73bb690bbc..c17f3c88a00b 100644
--- a/tools/testing/selftests/coredump/coredump_socket_test.c
+++ b/tools/testing/selftests/coredump/coredump_socket_test.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <stddef.h>
 #include <sys/stat.h>
 #include <sys/epoll.h>
 #include <sys/socket.h>
diff --git a/tools/testing/selftests/coredump/coredump_test_helpers.c b/tools/testing/selftests/coredump/coredump_test_helpers.c
index 072ab8624808..85bf5cdf4c4a 100644
--- a/tools/testing/selftests/coredump/coredump_test_helpers.c
+++ b/tools/testing/selftests/coredump/coredump_test_helpers.c
@@ -15,6 +15,7 @@
 #include <poll.h>
 #include <pthread.h>
 #include <stdbool.h>
+#include <stddef.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-- 
2.34.1

