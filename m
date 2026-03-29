Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9303E36E46F
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774788290; cv=none; b=MqkjMUehrNda3mDZlFQuSYLnRpYc8MQpk1fCKJmCK6OyHwlaNrn55SZSx6UHBlzvFYxOZB888M/ZmlulKx5rQddqr6Zk9NVPSXN3jb72Jnae9DnaYIubqQqT0KFQtM0+OLZaG/ciztUK3aioP0UwjwUTe2hAKRnAI+LAgrGLBDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774788290; c=relaxed/simple;
	bh=yCgWS18J2giAmIBQJwNeZ4CV5RD/8KYMOj8QP1lNVww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfCILU6iAJa1PWNr1K9Cy5drBzC4MoCTleR65TX1nxFRZhjhNPzRZrSYm8y2awOzzIul7yC8lPTeQSQ+I/WtYXMVi/TTlTSMrA9jJ6I3fj4U/L1Hf351YwpCvcW9ebvgJGeCApZVx8+QSeV5ioRwunh4qCMNXxsGTQUBIXAFrOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZOROEA5u; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZOROEA5u"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so34481595e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 05:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774788285; x=1775393085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIyVVbIGIEKVOI7GAfRAoypwiecz72p9gSCxjoyNoLk=;
        b=ZOROEA5uTJXY4guSfQRL21SB2P+O2QpdlIneL13j8mCLzs1CZnMf+Ok3fSl8+fABrH
         oE+WF9zy98g2gJAX2AT1FWPyr5q3CFq29sk94YVGI1mDd/EpEdEdLRcyGwcK8SF1hHza
         vJVfFuvMetGrp2a6nZuhOBqP9zmtC1Lq/r0p781t3Ah9elKehGJi6DCGCeF8uoo1/Aal
         pn2NIHaVmH/BcJ+WlVDl0yfXcKCCdpTyq+7AW0d+tE6iVHAt3VNGXpNdqvpf3AeUcN0P
         rmkqyrh+Lpx+WoETNKKsRaR5wPpN+aXOZVbqRlLaLYfW+9CtLqMVJFIjrtuqs5LWRCVC
         hSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774788285; x=1775393085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FIyVVbIGIEKVOI7GAfRAoypwiecz72p9gSCxjoyNoLk=;
        b=sf5RGTZsop7Brusjcu7nvNam8TPUXRGrgdKwJsptVcFnt4QTPBmY0UMyV9maoThtAR
         eijeFyDT2PZHrIEG7NvBIlGusoXdGFj+X8BCHqH2lVK8T3SBBLSCgWFZl0J1E0o7nyYT
         98IX1T3RKna3MqpZGXmq8BMu9pRfVE+KyayE5ZZyLvs1NI9QGjqV3tuQ2IHiHWxZA+1Y
         eOPliIxrqo+gb8os+XrcPu3zxiwy9YH3uDBIrGnx0QdtNen8dTRZn2Sd16Z+/VIRSvt0
         4SgZWg0Fne/YsuhoamqPZlbMyaOfDxpG01ZdHHJIwrRGl1voq/EGhS3ABLjeMz2C1Iuu
         8IGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfBmFX7UslCrMiV0o7IQwyEkQ5WWN4fJiOx+5WqgfzPK8K4f2n6mz1Np+bM65VydFZfzc2YYw/DLQyCJKo6Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaemli5rQ7R6upbWHYsjghZ7xuOHkKI8eQrItH6e57aA9O/Dwc
	V39ruR6S9F/UFxvL6gL0tmODMnYS7cXsP9Uvov53OoyKvxHp5iIEMNUxBgzzYLh3JxU=
X-Gm-Gg: ATEYQzyVcnRuoD2OhoIOc4Vlw7bXoyXbaAvvnzmm3PA4lzLpu57Lasf+wDinYwS17Db
	dW5lZA794kIN/dUVf2EEoCsVJzh1MvsBygh+YV7uqHtbi0CG7Z2kJN4k9HdUYvmmj3kEyRfnt5C
	D92E6iNY4exOguhKtP5PXGq6+JQye4q2fm/NwjSnwhATaXmmHxvk0FoePxTkGzA7P3jo0usLAQ5
	zWOIJS9teKVq/JE4gioWcUqNYFmNS1djqjdrLbPI5lszXV8mxCJo+YLy/tAZSkXC51aD9rGvb+o
	qjvLxk9AWgFxUYAI48prxoDKwkeG9TmI70iTuH8qVa9rh6oSxdtrU7ra96OkBjfGQ/iPbm9zIZ5
	ZBQ+iPZGrYFCpwAnHEGLcnrAyrp9vW5kp3n4lQzvMYqc4/oUiZD6qeDrl5rJRvEHQpDq8mpWG/B
	YuXPkbyIIq5b28plH17m7hrVEQU+racS7BG2fa43gqkNCPiy1IaKQ8pPhSZQBPcA==
X-Received: by 2002:a05:600c:2d82:b0:487:467:49e9 with SMTP id 5b1f17b1804b1-48722b92fcfmr118383365e9.7.1774788284911;
        Sun, 29 Mar 2026 05:44:44 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916da892sm3700321a12.14.2026.03.29.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:44:43 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Feng Yang <yangfeng@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: add test for address-based single kprobe attach
Date: Sun, 29 Mar 2026 21:43:39 +0900
Message-ID: <20260329124429.689912-3-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329124429.689912-1-hoyeon.lee@suse.com>
References: <20260329124429.689912-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, attach_probe covers manual single-kprobe attaches by
func_name, but not by raw address. This commit adds address-based
single-kprobe attach subtests for the two underlying attach paths,
legacy tracefs/debugfs and PMU-based non-legacy. The new subtests
resolve SYS_NANOSLEEP_KPROBE_NAME through kallsyms, pass the result
through bpf_kprobe_opts.addr, and verify that kprobe and kretprobe are
still triggered.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
---
 .../selftests/bpf/prog_tests/attach_probe.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/attach_probe.c b/tools/testing/selftests/bpf/prog_tests/attach_probe.c
index 9e77e5da7097..64f2ed75779d 100644
--- a/tools/testing/selftests/bpf/prog_tests/attach_probe.c
+++ b/tools/testing/selftests/bpf/prog_tests/attach_probe.c
@@ -123,6 +123,51 @@ static void test_attach_probe_manual(enum probe_attach_mode attach_mode)
 	test_attach_probe_manual__destroy(skel);
 }
 
+/* manual attach address-based kprobe/kretprobe testings */
+static void test_attach_kprobe_by_addr(enum probe_attach_mode attach_mode)
+{
+	DECLARE_LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);
+	struct bpf_link *kprobe_link, *kretprobe_link;
+	struct test_attach_probe_manual *skel;
+	unsigned long func_addr;
+
+	if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
+		return;
+
+	func_addr = ksym_get_addr(SYS_NANOSLEEP_KPROBE_NAME);
+	if (!ASSERT_NEQ(func_addr, 0UL, "func_addr"))
+		return;
+
+	skel = test_attach_probe_manual__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel_kprobe_manual_open_and_load"))
+		return;
+
+	kprobe_opts.attach_mode = attach_mode;
+	kprobe_opts.retprobe = false;
+	kprobe_opts.addr = func_addr;
+	kprobe_link = bpf_program__attach_kprobe_opts(skel->progs.handle_kprobe,
+						      NULL, &kprobe_opts);
+	if (!ASSERT_OK_PTR(kprobe_link, "attach_kprobe_by_addr"))
+		goto cleanup;
+	skel->links.handle_kprobe = kprobe_link;
+
+	kprobe_opts.retprobe = true;
+	kretprobe_link = bpf_program__attach_kprobe_opts(skel->progs.handle_kretprobe,
+							 NULL, &kprobe_opts);
+	if (!ASSERT_OK_PTR(kretprobe_link, "attach_kretprobe_by_addr"))
+		goto cleanup;
+	skel->links.handle_kretprobe = kretprobe_link;
+
+	/* trigger & validate kprobe && kretprobe */
+	usleep(1);
+
+	ASSERT_EQ(skel->bss->kprobe_res, 1, "check_kprobe_res");
+	ASSERT_EQ(skel->bss->kretprobe_res, 2, "check_kretprobe_res");
+
+cleanup:
+	test_attach_probe_manual__destroy(skel);
+}
+
 /* attach uprobe/uretprobe long event name testings */
 static void test_attach_uprobe_long_event_name(void)
 {
@@ -416,6 +461,10 @@ void test_attach_probe(void)
 		test_attach_probe_manual(PROBE_ATTACH_MODE_PERF);
 	if (test__start_subtest("manual-link"))
 		test_attach_probe_manual(PROBE_ATTACH_MODE_LINK);
+	if (test__start_subtest("kprobe-legacy-by-addr"))
+		test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_LEGACY);
+	if (test__start_subtest("kprobe-perf-by-addr"))
+		test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_PERF);
 
 	if (test__start_subtest("auto"))
 		test_attach_probe_auto(skel);
-- 
2.52.0

