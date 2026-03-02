Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D760250C06
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 03:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772420680; cv=none; b=QN88GVy/PLuVG44f4CbKPexWIEODJff+7J7dVbDF38Y2eWrci77AkZbVv+D9aU9HEH8YDamaiRTsOpsHW15zkkxBk9y4CManyswO1CAFfrIMdUO7FYCMf82AzzVHxMqoe8Y8W1Prp6rvOSt3ABOFA2lppw8q3cbRBhJQZQCctJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772420680; c=relaxed/simple;
	bh=tR46XW9A3HMAisk9j68ljgR5ZjGwHuKJlekeL/LAZlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u2pM4HW69KiyP1GNH0bcjlI40Vy48tuXjmI+kcmEmOjgl7zVzelLTeTDncvkt+wqdiPKqW4oOHUA5OhYes2D/GEnvhRadxWWNGE4u9aAie2kct3WZ+MkRZ2jInwGPMT6qFWERuersumok2cBLPiXXJ/n5lnPqlp6/zWi2Ex/gWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=V/Cwemf6; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="V/Cwemf6"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba895adfeaso3355155eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Mar 2026 19:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1772420679; x=1773025479; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09QXKRKJ3JXHqocKxuSfCVq5T5Qs6Ms0FJxLLsGjn2I=;
        b=V/Cwemf65laWoZqccIxctzFNAuB644RRAWKabF75ud0odcK16WoMiRh6na1HicbFik
         EzfoN+GUdSG5JBsqZxqStZ7JTzqtGwysctPfkkAWjq5QHw9EX1QzryY+tH7mqGz9M0c2
         JEqHom+x162wXbCANp4gp5nJ/Yzlx0ZZVC6cSTmXJNpaNA1UzO5J/1JgDdangPNTPydc
         nd98G2xYdgqDD96T54L9RTIWoXX4Yw3zx6+Rz0z/naUyPjlar6rm6Uxk24dhQ+eRBIT7
         8SJfoXdgmlDb+SPiWgIiLYP1pXjvdJnwa7aQURDA7eQ4hXt6CZuRbbFQjLjvxfqZ9m59
         jAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772420679; x=1773025479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09QXKRKJ3JXHqocKxuSfCVq5T5Qs6Ms0FJxLLsGjn2I=;
        b=ii9zl+oK0r4A5VFc7pHCYAj6p8WGtDq4yWCk7JD0HXoX/sTXJaIOgCAsnnFuMtRxDu
         aFlbqdSJbIjWyMR3Qa8mXLlm6X3nL41y+//oISoAA7c3IMY2vNFTBAHoJLQQoey6wIUx
         ZbcpLYn0QgFlSqv5oPQk7nXSpcxc8nPk1JQNUHM3kIZEh+B/xKGEmSVppfsUCoGBd8PJ
         5yfBAoid8MOa7vFM9gJJNhSwlBhcuJI8v5sCmG9aqPNy9ro2Lv+mJWyhbEX2H76/ORY/
         q86deHTsHWaa9Q95laBPlj9oFScf9sIeSrVvY11LMfOHWl/KDoJqOZ46YZRbVO38JjzO
         HIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3fnVeIicOqPMlVJDaEL254b+rR05IYrtHPUqKAQm/oNyV9hCDvsXrlE+9+UzaxS41wFER2PwFZvrOg+PTMq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+xQ0hdC2IdFF9KK4jCGS1zEjfWOSS2sZLfhLAgUHEd+b3Xvml
	eqHzeEDBpUCZiNGw/F3C7dAuVSLjvDs8++7v0IFjSShPnatNtYm/5A9DLg+e2lZti14=
X-Gm-Gg: ATEYQzyfzH2xB5Z63Iy7pffBjVynL+7HEM2EJeCdRX3aEfE2S7mDnz3aZ+4u9f8PEjC
	tlqmXxlS/EAumZbtDamFLXkwQS6G6+O5P1U1bgoWiyf0sMoOAfSidvAX0kd6mbK/jdIJ64T9iZq
	5xy0eQ3Kp/W6oyqpltKwbEVQ+SokK5QeiSX8qDreIkG6NLksJoHvh2p8gg8y9nom0Dqjjn4VBGe
	gVc3XCcas4zYgfl9CBBbuSEM8nlZ3kjZgOv2WzuQWMcrvfQK96gemjgxr1vvNg3++AeIj5apefz
	GetfNG7M1PVU8G+TgHizvPyRiArsln3fLLKKQIUYU2i6VHxnZ7dccVMTe9J1V1LHu0lzri6CoOC
	q/PpfvxlU4rL7t5H91nRo4sQMjeSefcYUOlskr/zerf/2Ry4szdW2cObcOnbjyRrT+IR3RapFUn
	nYvMZMzOtLT6nnzlUZWj9FBQ/TsBB0UCGPlLtgQXM=
X-Received: by 2002:a05:7300:8cac:b0:2bd:cbc7:16ec with SMTP id 5a478bee46e88-2bde1efba67mr4008333eec.24.1772420678394;
        Sun, 01 Mar 2026 19:04:38 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f7e955sm9401254eec.32.2026.03.01.19.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 19:04:37 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Date: Sun, 01 Mar 2026 19:04:34 -0800
Subject: [PATCH v3] selftests/futex: conditionally include libnuma support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-20260128_nylon_chen_sifive_com-v3-1-995ab4cc71aa@sifive.com>
X-B4-Tracking: v=1; b=H4sIAEL+pGkC/42NWwrCMBREt1Lut5E8pBG/3IeUkCa39oImJZFgK
 dm7sW7AvzlzYGaDjIkww6XbIGGhTDE0UIcO3GzDHRn5xiC57LkUnO1ByLMJ6yMG42YMJtNEBY2
 LT2axn7zlQquThTayJJzovR/chsYz5VdM6/5X5Lf9e7pIJliv+OhGzbXX9vqTxyZhqLV+AAiSG
 jfNAAAA
X-Change-ID: 20260210-20260128_nylon_chen_sifive_com-ae6fda01734a
To: tglx@kernel.org, mingo@redhat.com, shuah@kernel.org
Cc: peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net, 
 andrealmeid@igalia.com, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, zong.li@sifive.com, 
 Nylon Chen <nylon.chen@sifive.com>
X-Mailer: b4 0.14.3

Use LIBNUMA_TEST to conditionally add -lnuma to LDLIBS.
Guard numa header includes with #ifdef LIBNUMA_VER_SUFFICIENT
to allow compilation without libnuma installed.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
Changes in v3:
- Fix invalid Signed-off-by chain by adding Co-developed-by tag
- Link to v2: https://lore.kernel.org/r/20260210-20260128_nylon_chen_sifive_com-v2-1-630bcb707d7a@sifive.com

Changes in v2:
- Remove redundant HAVE_LIBNUMA variable, use existing LIBNUMA_TEST
- Keep futex_numa_mpol in TEST_GEN_PROGS
- Conditionally add -lnuma based on LIBNUMA_TEST
- Use #ifdef LIBNUMA_VER_SUFFICIENT to guard numa headers in source

selftests/futex: conditionally include libnuma support
---
 tools/testing/selftests/futex/functional/Makefile          | 5 ++++-
 tools/testing/selftests/futex/functional/futex_numa_mpol.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index af7ec309ea78..b65ad750395e 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -4,7 +4,10 @@ LIBNUMA_TEST = $(shell sh -c "$(PKG_CONFIG) numa --atleast-version 2.0.16 > /dev
 
 INCLUDES := -I../include -I../../ $(KHDR_INCLUDES)
 CFLAGS := $(CFLAGS) -g -O2 -Wall -pthread -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64 $(INCLUDES) $(KHDR_INCLUDES) -DLIBNUMA_VER_$(LIBNUMA_TEST)=1
-LDLIBS := -lpthread -lrt -lnuma
+LDLIBS := -lpthread -lrt
+ifeq ($(LIBNUMA_TEST),SUFFICIENT)
+LDLIBS += -lnuma
+endif
 
 LOCAL_HDRS := \
 	../include/futextest.h \
diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
index 220ef219c823..35ad2177f5af 100644
--- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
+++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
@@ -10,8 +10,10 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
+#ifdef LIBNUMA_VER_SUFFICIENT
 #include <numa.h>
 #include <numaif.h>
+#endif
 
 #include <linux/futex.h>
 #include <sys/mman.h>

---
base-commit: 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
change-id: 20260210-20260128_nylon_chen_sifive_com-ae6fda01734a

Best regards,
-- 
Nylon Chen <nylon.chen@sifive.com>

