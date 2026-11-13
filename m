Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601440;
	b=WakOtWa+2/rW1izlc5i6MVt+HAqPUe8SJux86W3GKhnyOsncX5YDYb1dsk9tPbPD3Tbx
	 27ltNTnrVpR4UqPwymiXqcv3+bOfG/TPSMKk1uYyJryak+LCsyLrj+7k2SOL+y43xvGV3
	 WhUYsyTZbFGKE9wOLajZ1aYDub+17E9LI1Ypk4GWaQ8xxbH1VGZOgbJ+/YmE/2qcopoz/
	 77LYgfYQVOep+ns7wRoZLLnRHy5xjKIlTQkM7+OL2OUkZoQ+RCPUREsGDEA/30D2+Wzk+
	 07LQNQWjnIpoVPPhpfKnrlQLgCTyieWtvPYY2L19B/36W6lhyEXhra3vPQ13SBVlNeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=u7Jx9B4XiDyCzWqvWYy2iq25I09vd8jKOKtiPXq+9CY=;
	b=TTQw98H5tOW2F5GExcVg3TBSqwz7IRANZ52zytAmw3xq2YymwX9r4IBBVf5NrMrN4hbn
	 KySIp1JhfnXIcwNYsdMSPDpmgQOOVXnrufPYDAoDbDjeUHQV50Oll8zz/mw5YAlTqvc8B
	 r0XCIoz1799dy1dz/x0aeX9lqsr0U0cMoRVBHCzHHjEDv3jeEist2TWuxi2NhCL6Rj1RC
	 hm+Pn4SL9mkraNe7nMTA6sYAqO3Sku1aDYcSAtxwLutz7ZPRz8ho9RputEYx5LvOi/BpH
	 X/ZBHCcU8hg7IcDgR/TtBFYimNbzR0iZ83P69wlYE23GSMXOHYI2k0RPfa0gSXFQ1zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpsjCMtm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4D606A338
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 20:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA4D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpsjCMtm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb606491faso1094365e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601439; x=1795206239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7Jx9B4XiDyCzWqvWYy2iq25I09vd8jKOKtiPXq+9CY=;
        b=YpsjCMtmCYEgPWqV+30pK7N1ZmgaoyTqGauBzlwfhSeCNLAGr2JTsjyWcQwjkuerTf
         oOqJ7kKIeDc9RxClm6MskoSOOKlqrF+a6tAbWaxr2DQH+czdaqrPCJrqgS/uLRYPUNW9
         gDHVaqqcR/PGNSQ9ksVsLEl2AsFk4Aluv6F/s7lsfpncTSnPHdKriiLafjotRrTFqSoM
         /NAoNribSHaasKcrbhYO40bnHctgDriSDtrWTAaOnrzH99oYgWVz2nfRk4s/ZeveY2md
         UYRM+1ujFTkHSmf3BxiL5udVKNgpihild2wK5OeTyCdBnjxDd9YTvkiY/8HF+UVyywhL
         OsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601439; x=1795206239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7Jx9B4XiDyCzWqvWYy2iq25I09vd8jKOKtiPXq+9CY=;
        b=Z43DVOopSkqs3rG4kdnqpEHmkdIxrHg6uwDdGcAC7ygesOb9rCwAhMGBJEZGflUS+/
         8M3dtGJV+NjzpbPtvjqd7N3pAtx+CjPkotIVTPsAiRSjrZuCBjW9pQ0PDpGQZmZFqkiy
         8pai6jQNiRp46pV7R4nMpG6TegYjT8IiDFzYnx1VeVaWQxfIUej9y7LIW+4zcMVmn/OZ
         hYYoO9g4wrevdQaiM6QuZi/xkEPqzRGROzHEp1hCeVGu2Vp16sXIuZ6LSTJA7O2GHr+O
         xn2/rCPlvaMULIt6fNHWsF+nuTCvJFXL+jeI3rl4A64L7ENMCyIwLLw7rUbJ/R/JNRSD
         oMuA==
X-Forwarded-Encrypted: i=1; AL+hErGo8QP8k/R+94KAvasTGD7TrkheX4atWb3+aVmugf33IBmMoywZKwrGYJmSrDsnsrKPDwDcU0tzzbqZ9lvh7yE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hxqT+hI0L6sUi471BVVO1Na1nGkVOT8AB3iAEaYBLP2qHGasR
	ZNPxgcscbC31VBPy0/jWgJBJU58FUufOj6NaajxJRi1S4tP0LWwqQ9a4
X-Gm-Gg: AYBFou3kJ3bvwGHPJnqK7bnOnhlrZ1PjU2gH3vgy3NvmqGK/UoTMr6hhtTnkbb8grJg
	bb/qlyltO7IVPpoe6mAFGCuup9WAnZUNMwV1wHCjv2vAqdIvBI0qgSwH/GA1B/J1dcsYMgAju5p
	A3eGdszCv5TrK1pddU66uRH2lQXMzXt1pa+GYLGKyhc6sUBj6kpPaHhMsqOmwDCPYkLKgxp2Uqv
	Mk8Dnces7eY89zbyP9kNau+YTsKyqCfQX2k5w2Oyo3IshkRTMG6auLhEHXlPvmNTmpF0WLCF96X
	z21+2djJbaQjAkwj5QakSTodC4kDORW6ye/CA27m9DeJsUF6BmCEQXQTJIbNTR6pe51U58OW3Om
	2Dfhqjd9JIwukVLSgdI4U/Oih4h2xccm/2moV6OzFopqAse2OvVXJX8dqW3kIb4U+eWlBRxTRSM
	OaLN1i4Grdakx2zPIIopelXvUERmJBfnu9OgEkxufCevsWjVZ7INjlG0qPCGoE+KIwEUBuFqoeu
	NAreXD7myd4GeVKrbk3y/u72nFx4JTrlWJ9FQ6okoSzryrHByi86vWUR1jKWNjyO/p6preBWQQn
	XmKYri+6Giv87rwu45PWvEdyKTVCDu1ajw49ST6MapRJULJlMeIB9g==
X-Received: by 2002:a7b:ce9a:0:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb55a911aemr55129645e9.28.1794601438992;
        Fri, 13 Nov 2026 12:23:58 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566a4a2csm46505365e9.0.2026.11.13.12.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:23:58 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Fri, 13 Nov 2026 21:23:25 +0100
Subject: [PATCH v3 3/5] selftests/landlock: Test that layering does not
 break refer
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-b4-landlock-refer-nonfs-layer-v3-3-02d7e42bcdfd@gmail.com>
References: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
In-Reply-To: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Regression test to exercise that layered Landlock domains do not
accidentally deny the LANDLOCK_ACCESS_FS_REFER access right.  This
used to be the case when layering a non-filesystem ruleset with a
filesystem-enforcing ruleset.  In that case, REFER operations that
would have been allowed for the individual rulesets would get denied
when layering the same rulesets.

Link: https://github.com/landlock-lsm/linux/issues/67
Link: https://github.com/landlock-lsm/go-landlock/issues/66
Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
Cc: stable@vger.kernel.org
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 54 ++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index f725882fa4a7..6d9baab0fae8 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -2612,6 +2612,60 @@ TEST_F_FORK(layout1, refer_denied_by_default4)
 				layer_dir_s1d1_refer);
 }
 
+/*
+ * Regression test for layered domains: The two enforced Landlock layers both do
+ * not restrict the tested "refer" operations on their own, so they should also
+ * not restrict them when they are layered, regardless of the layer order.
+ */
+static void test_layering_does_not_break_refer(
+	struct __test_metadata *const _metadata,
+	const struct landlock_ruleset_attr *const non_fs_attr,
+	const bool non_fs_first)
+{
+	ASSERT_EQ(0, unlink(file1_s1d2));
+
+	if (non_fs_first)
+		drop_access_rights(_metadata, non_fs_attr);
+
+	enforce_fs(_metadata, LANDLOCK_ACCESS_FS_REFER, layer_dir_s1d1_refer);
+
+	if (!non_fs_first)
+		drop_access_rights(_metadata, non_fs_attr);
+
+	EXPECT_EQ(0, test_rename(file1_s1d1, file1_s1d2));
+	EXPECT_EQ(0, test_rename(file1_s1d2, file1_s1d1));
+	EXPECT_EQ(0, test_exchange(file2_s1d1, file2_s1d2));
+	EXPECT_EQ(0, test_exchange(file2_s1d2, file2_s1d1));
+}
+
+static const struct landlock_ruleset_attr net_attr = {
+	.handled_access_net = LANDLOCK_ACCESS_NET_BIND_TCP,
+};
+
+static const struct landlock_ruleset_attr scoped_attr = {
+	.scoped = LANDLOCK_SCOPE_SIGNAL,
+};
+
+TEST_F_FORK(layout1, layering_fs_then_net_does_not_break_refer)
+{
+	test_layering_does_not_break_refer(_metadata, &net_attr, false);
+}
+
+TEST_F_FORK(layout1, layering_net_then_fs_does_not_break_refer)
+{
+	test_layering_does_not_break_refer(_metadata, &net_attr, true);
+}
+
+TEST_F_FORK(layout1, layering_fs_then_scoped_does_not_break_refer)
+{
+	test_layering_does_not_break_refer(_metadata, &scoped_attr, false);
+}
+
+TEST_F_FORK(layout1, layering_scoped_then_fs_does_not_break_refer)
+{
+	test_layering_does_not_break_refer(_metadata, &scoped_attr, true);
+}
+
 /*
  * Tests walking through a denied root mount.
  */

-- 
2.56.1

