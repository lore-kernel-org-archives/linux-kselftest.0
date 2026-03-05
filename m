Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C527280A
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 03:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772679794; cv=none; b=rlW6uV/tcSgPtyCPBrI9sviX1H2HAGv6leEpGlRHOoyQRBDDBMZirVM6qG/gg6f2nd7t2yoeZduJC8QZqQtJHctfZFvAsWm8RUqUqZkczZWC8crmAFZZrmTLGTekCuQ6u72swDDoNBta7iq/jhKE03gNosVrTdowvfprem0OKI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772679794; c=relaxed/simple;
	bh=qG4F646r3A03uFZqgMgj8Cu/cQ6QTmmOz2MQdWFq8TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AQ15rpJFmG0K/a11A+Q2J2ao7s8iwd4zpq75ct63eWy81YrEI7VF4WnR0BacBZvmeU3qv6gYRSEXFI/Qnt8yIUEz1yw/ABqTXuagUQKkfcjYMpehstYEjoIO89rF9zU44E4OQ+jHtgbDoSw11KUhXIVuAp7whn72CyEsUshi9qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEnqGSyJ; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEnqGSyJ"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7986fb839f5so65834567b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 19:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772679792; x=1773284592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ougbaORYHxsMlWm77a6+iuoe/ZWgFx+bT/l0ak418rc=;
        b=GEnqGSyJthze/mX9hGVYpfo0ItYzkYDwlk3qN0OIYJ06qSKKNP6y+iUtiUuzfwfMkg
         A35cAgxktitBUZkXRAuoK78Etz0X64gX3avA/wUhnF9NrBo8+Q4a9WV5pM5xo4kTf16K
         8T8mH8l8dZ5DIKx6BLTZL8neUfhpkvcPibBOsDz0K2jbHslZpii5WqTpUaSS82Lkm9MQ
         YI8S8GcF/W5dLvHNYoH7q/+sOKcloVj/XyICzT0jK+hw7vIwph6yC8lMdxWw4eVD619E
         MXHNUOayonYrRV+9uEu/zWUApu0bCUEgJ5QznaCZQCSAQRSWzqliA7M+y9S9Gd7QXc9X
         GR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772679792; x=1773284592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ougbaORYHxsMlWm77a6+iuoe/ZWgFx+bT/l0ak418rc=;
        b=OQFpVDpvB4tNFGxnPlBCLZYwWnYrV/sVeQSo54UVOMWog0AgiDZ+c5GNg0e2ClS05S
         8AHfjQuTqk0WGlVK5dJmK+c5OX5d0POT+4Fwcf1BTMa7ILOCFPacEkvnj/tc9WJPa19Z
         PnCEYarsrgtDdbgL0+G0hZeTimi91C07g/iaS8kZci3TeoaUj4XQx4DBsRAAQxfJ90sf
         zsbKbmedicVJZuRA4FU/gaMdFb3PbwFQY1IQ50bni12hbXYQ/OO7SKpek/aJXU38SVk5
         ty1BsjfaQk4Rv1BliJDqEzQ/NpjM51HqZnGK6jJZy+VmnLpKP3pnsS7xS+qtsQ4dtc/p
         66hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcE03Sw8Y3GVAxZfEyERVNygLy7I80OU/4uTlUZ+KXSds5sft6tNy2ZL1AaLEvrMoy/Uj7bSyrFydv/Pir5UY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu2jNTYXe+EJQWVUwJBLEIM627LOodM7E4bZmMuGnyezV3UvXO
	6nXbJ7NqTukkyxaUrh+YT4Uy5rHCALiTWn/rT7WlQuDA/xPGshkiRaKkNwL9zmI+P+XfOebh
X-Gm-Gg: ATEYQzyJn6fK9BSKyQUSVI7R4Lib4UZlrElPKI647yiveB7rra4WvZo+u3rwnaWdPbr
	UriP3pQgHogU3bvp51g/V046+nsche/bPHdK/HeijyiAJzXiV/MVFGVvky+G1uJBCeaUbyVrGlU
	ckflvhagcb66bJhW5t0zCt70HcwZpVjYsZnqa+gfP6bVzsFX2c4Y1asnDmIL4N0UldBCV0qV6eu
	En3A/3c29/RjPNbYWlTW7+D378yfYiJwrT+ff8S8VGGJUrHeduEoFGJHvo4fIYw0J+ARz/SYTAu
	lJuYvUDBexMFNm9ccMk8HHas9mKmFKXcVLBauSW3i0vP0Tyh+HBd0KvBaXaMTs5Qbb4VznaLSDA
	we8u9zKkjNNtRhvSTMxtI8KCqpG4SyZpW3nooXkJQ2z3Fk4Fss7MFqrBwytEuNgeTXhtnf5PSqt
	qheJpw7CqcW+63asmHk574PQ3/rJRzoaOBkM23f6lre2uqSB07uxBnx0SZnHHH8w4NSY2LtXZmG
	8anxMbDU+g2MvauiC9vGQrVVUIEPEuJCwWz
X-Received: by 2002:a05:690c:dc4:b0:798:6401:fd31 with SMTP id 00721157ae682-798c6c0e66dmr39861277b3.15.1772679792149;
        Wed, 04 Mar 2026 19:03:12 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876bf8183sm82350587b3.30.2026.03.04.19.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:03:11 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Song Liu <song@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	linux-kselftest@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 bpf-next] selftests/bpf: livepatch_trampoline: skip when prerequisites are missing
Date: Thu,  5 Mar 2026 11:02:58 +0800
Message-ID: <20260305030258.5273-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

livepatch_trampoline relies on livepatch sysfs and livepatch-sample.ko.
When CONFIG_LIVEPATCH is disabled or the samples module isn't built, the
test fails with ENOENT and causes false failures in minimal CI configs.

Skip the test when livepatch sysfs or the sample module is unavailable.
Also avoid writing to livepatch sysfs when it's not present.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---

v2:
  - Add missing Cc's suggested by get_maintainer.pl
  - Prefix subject with bpf-next to avoid Patchwork tree mis-detection
  - Drop Fixes tag to avoid verify_fixes issues due to tree mismatch
  - No code changes

v1: https://patchew.org/linux/20260227042354.20926-1-sun.jian.kdev@gmail.com/

 .../bpf/prog_tests/livepatch_trampoline.c     | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c b/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c
index 72aa5376c30e..75336d9c2313 100644
--- a/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c
+++ b/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c
@@ -2,9 +2,12 @@
 /* Copyright (c) 2025 Meta Platforms, Inc. and affiliates. */
 
 #include <test_progs.h>
+#include <unistd.h>
 #include "testing_helpers.h"
 #include "livepatch_trampoline.skel.h"
 
+#define LIVEPATCH_ENABLED_PATH "/sys/kernel/livepatch/livepatch_sample/enabled"
+
 static int load_livepatch(void)
 {
 	char path[4096];
@@ -19,7 +22,8 @@ static int load_livepatch(void)
 static void unload_livepatch(void)
 {
 	/* Disable the livepatch before unloading the module */
-	system("echo 0 > /sys/kernel/livepatch/livepatch_sample/enabled");
+	if (!access(LIVEPATCH_ENABLED_PATH, F_OK))
+		system("echo 0 > " LIVEPATCH_ENABLED_PATH);
 
 	unload_module("livepatch_sample", env_verbosity > VERBOSE_NONE);
 }
@@ -82,6 +86,28 @@ void test_livepatch_trampoline(void)
 {
 	int retry_cnt = 0;
 
+	/* Skip if kernel was built without CONFIG_LIVEPATCH */
+	if (access("/sys/kernel/livepatch", F_OK)) {
+		test__skip();
+		return;
+	}
+
+	/*
+	 * Skip if livepatch-sample.ko was not built (same path logic as
+	 * load_livepatch()).
+	 */
+	{
+		char path[4096];
+
+		snprintf(path, sizeof(path),
+			 "%s/samples/livepatch/livepatch-sample.ko",
+			 getenv("KBUILD_OUTPUT") ? : "../../../..");
+		if (access(path, R_OK)) {
+			test__skip();
+			return;
+		}
+	}
+
 retry:
 	if (load_livepatch()) {
 		if (retry_cnt) {

base-commit: 0b3bb205808195159be633a8cefb602670e856fb
-- 
2.43.0

