Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A309341AC1
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 09:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717058; cv=none; b=M8I2KZYEc4ncLxFICG0EeofmjU52VBoh7AnWys8O3iPvRNOyZ+hUVFFY21jYidMJPtpmvySqh1K9QYn7uhBh+jwn5feU1Kp0UZKqAid6g1hSog0wriRpAiJS9Qfd+EmmBxCTRnseJkrwRnz6hRmCLUxLfUGr/lrcmc+HRUSECm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717058; c=relaxed/simple;
	bh=OH6Cz1JXGQI7jBhXos7xy16tyEEuj/rvFS04YSzI86w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kI9Y8hu8sfLQ7h+hpu++u2jUaM8mAGLCW5Bal/rXw6JP2f+9F85YvCXuK3tlNXSajxPGr8u9kRsvSIMEchJhLfwY2HJZZzbgVHZXaLIZplFKX6rXXUtv68b/sU0Fi/uXozlgsDcq9VSQ417Qs50B7pgURg1/sAOx1/wO2XOuj+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=kO94Vyr+; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kO94Vyr+"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1233c155a42so614468c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 01:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770717056; x=1771321856; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vh1cK2yINspecrRl26Uw/wjS1t036TnATM/7cQD3vNs=;
        b=kO94Vyr+sakCaX5gTxWY7DOV0JRxc/wkhNNbkF91+0Y+SMzzGQKgHMlHnUzs84Zo/H
         k2yzjJ/UcRjuLksGzvHwtCeZImdGM80lXjyWpIVLQnckM/VjNZkiKyZrGvpZw8Zby6xW
         k5XKAR66XolMSOpmE+6UGoJbe5ege7PLs/QRnTFn3m38N3Up/2jyAY5eD3j9w00d35Xb
         rzZLjZwRkgNXMgW1ZQ4Gi8GGn9IC52EcTrJNYZCEunm82YmxRQOCCO2ge/xYJGQ1c0TF
         mAQN/vpjS00ZLwo8Gem9YsoXSAio3lKz4HHz0irlxHTET8FYxvQlno5lmOPtNTKVxlDj
         Tdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717056; x=1771321856;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh1cK2yINspecrRl26Uw/wjS1t036TnATM/7cQD3vNs=;
        b=Z60RFUJUida94iNAuJEBU5DJaaVZa/ncWNk2UoMDNjSkZNYNztVJcId/CJlqj4wUiq
         QCJFnsu0HYU44ryRPH0Igum9sZJfCjcU2Woyi1eVPRVECtjgyT3I3uoG1zDXmRKYw755
         rPsyuHrHyNs0mPL6L+xgHfsl5hfQILQP8QsCXEA3vffc6Tb4fwYicaWbdh31YX3V43tp
         2841dfuRmPsvemiG2H6niHl7X4xZwPy/dCKVoPJ5CTnAr5DjgGTvm5WQJ8Lv9FJY8rAO
         TJ10I+YjjPagVNL7cwiQz3GKxLB/cz8uh/9rH9yQXpkciNPVHjLv7Xa9Dv50oe624/Me
         pwLw==
X-Forwarded-Encrypted: i=1; AJvYcCWrTnBToihV6XjQlJBAjFvpq3I47+ykdql93mPvm4R//KRen9E5Gy96GRb5gL+zGnRXwhKd+o2KdJqdPYake4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8S10DwClmgo29Gjy/XLN8/SWhhpThm1Su9jWh6ike9xs/x0ma
	5R6RyjZk8hB/11JxW6XeHz6u6cC56CvzGoalG0z6QNuw/sjSgAOznOPA18GMHhzY4pQ=
X-Gm-Gg: AZuq6aJQZih2wYy6tdZI2lSyC5EVsoFv2VdJHr/776WHj/z7hsI+SwoRhdHhfZPXMhU
	i8n7DKjbKGN/3U2EGq/DnV385d7uqAMbcPVUQcZmD4rbUmsj0JemghYGMS/aFWUdzmht4iPGrVE
	L5+toxtLwLiGvZDc1LOstTk5fpOFobFVjaGzDO88EIpQT7ZqJY7AjbZjHbto5h07YfjIP5JGBl4
	fQ82obNbc+Ev/cjP/s3CXHXJWginXWy+N1GGGLKonTqyQ/xpUsyzamYu5vTg4hkr+O894xBj/L5
	4ucJ9onr9sVoYq//cMb7tgcYhO/wZMClMj4/5iCfcLll943EaTi1G22lcqE7pY5oirDvJhmTayD
	mzF25JZ7N9JgSBdDhMgvBeeZ2zznm9Ok+q4SMjWhCmw4dbCuVRlwMDBG6xMponiCjPz13ALUMgF
	9t+4nplL2iD3uk/wMdQFk3Q0q5Z4R6ooVuYvGCHNY=
X-Received: by 2002:a05:7022:160b:b0:11b:ceee:a46d with SMTP id a92af1059eb24-12703fe5da9mr4382447c88.15.1770717056203;
        Tue, 10 Feb 2026 01:50:56 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855af6452sm9354712eec.9.2026.02.10.01.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:50:55 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 10 Feb 2026 01:50:51 -0800
Subject: [PATCH v2] selftests/futex: conditionally include libnuma support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-20260128_nylon_chen_sifive_com-v2-1-630bcb707d7a@sifive.com>
X-B4-Tracking: v=1; b=H4sIAHr/imkC/x2N0QqEIBAAfyX2OUG3qLhfOULE1lro1kNBiujfk
 95mXmYuyJSYMnyaCxIVzhylCrYN+M3JSoqX6oAaB41GqxcMTlbOPYr1G4nNHLiQ9fGnHA1hcdq
 MXe+gRv6JAh/v4Dvf9wN9ihIscAAAAA==
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

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
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

