Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583F360EE4
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 17:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615672; cv=none; b=MOFDA0twEsGJm3uguCAt/BJhLi2G+khscu/Bw0XkblYCjGCIfe8rweAsrDV/glq8kolrrDgZTYXBdUV8dGkZUOIA+TVnVyJ+GRll7xsOrBaNEDtkNg0+JyyCHtwfGxSgLz+inMstFvKLcyiL+np8refA/l92c0kQlSufZDFXgRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615672; c=relaxed/simple;
	bh=o59pLErvV1Eka8G0igqbbC6iIQ7emfCpQ9bDOzw+AAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7cHmx5Q4GhiWKBEGQLvgKu9T+nkG8+4rOg3HitolWq+elV3OVotU/f0UmbK5eTCoIwYXgmUsY6vUI5s8rY+J0WKpGvTOANDBFYgpLsjDekxcp92HMtozk03JyrDE+orB+HfOKSLDcOyPKlAxD7Jmw6W+eSjbA9Oihw9d3yZnxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmMbLBhl; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmMbLBhl"
Received: by mail-oo2-f41.google.com with SMTP id 46e09a7af769-7fcb425fb68so1993465a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 10:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790615669; x=1791220469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brqpvi0CsTT/mXnGEZ0fbXA8kawPBkDyjGi1skaJHcQ=;
        b=AmMbLBhlejMXSnZI3uouKyZftGnw4B8IlNH7OZfigtXEyRfw2pWiXI5IZnuaOolB8e
         rTUiP8Gdgm6s9I3Pv+45yPPEf6yQfJdP4660dcH1Px6ju3Ko+l6CvrgRIrNi9KAEOFPm
         Xi6c3Wc5q3HlAkuF81AnMxx2nv0pMhGCh9LhzVI8JdcFMvRYrrqmR/C7xbuoYa4g1ZLx
         DrZCgI9oVM/zlPfiuYJszedIqinDzvgNHz43CZAccb9SSH4czSHI+zPu4PPSBQydmSuL
         EdvuHTl9SLxOiwzSgsAQ/LOcCYMYZMi7GMABEB499pfCBuVE2jLo7dJXJKE01pMeQwS/
         bkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615669; x=1791220469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=brqpvi0CsTT/mXnGEZ0fbXA8kawPBkDyjGi1skaJHcQ=;
        b=cv9AnlBRG7gcp9keAwOAifit7dPd0uJ++y05a85X4F8MJwh2IiA8hOVTjGB5AicQlQ
         TFWu7mj8nr2s1AVPGH1ZI+Gu7i0FH8QcZooqpItylb5+4g2l9rZ6KokEM2aByPFepuej
         BVOX+HAnB5ccnlfE+8NFFP4l5FU/3diwblO/X9wC2Whv5eRpAeu2hy97DRDqCrjTNWsK
         XeGBOKGkpTsRJT9IQohih8UEkt7FcBdOd4egr1No7McV9H8b76D/EANcr2uhHpQ144tq
         HGn7mg6tV4GhPbU93AUl7MDna9CmcQZ2sieaT4yUa3Jo10ZtIHne9sMST+T6qWdXTFlY
         96BQ==
X-Forwarded-Encrypted: i=1; AKwUvBzF0Xiq6dBwLWrTP8ofhBy1H0aSfaS5Eiv+ZU0oBkydCF6lPSyiPOhBjiuSbnHzKSvj0+JD8IwhxA4fZtgdJEY=@vger.kernel.org
X-Gm-Message-State: AFuF++nbQNPJSfaPQqrVJa1WTlSu8TZaU0ceykJx7fBht2Zmki2qAz3j
	FgIKlFYEAnD2Fcn5oz8Qko/gfQLZEEPafNGzZ0crNgeXr9qAmAJROVMJ
X-Gm-Gg: AYBFou1SBZj5IAyCE7ncYHu3/271XJdN4KE69o+dN23R2/e+79MHiGDwr8v0Ou7PFuQ
	DaODcQW57ZmPc0VHewP1nxzD+Pq5JCRcsxxh/rBlYkcLFeyrXt2X/R0tZaDV0hJYWM4+0hU8R3R
	+0vvOM3EZMLJJHPCvWGdvKJHhYqI7tNG+5HwXQa/12UkUil3BaMde1y37Xljcc4tJxOT3V+sj38
	Zzy9VgI2qLLBK/rCjAE7sw0u3xaOzYP0lMSnx3yfPqni/QR2+s9FqnxL5cKPv6bA/5iHcJ4J1NN
	G7eoQWyHmHABpek6fxrDaVDq8E4YErzgIMjFsfeXXxigPcUhrnsWE28Y0oKDcthksgSCsvF/CMm
	XpPhxTn+oglEl7OFjJhoL+OeXDs5wYuZR7FXN50nua+AiEAZZhWbjP1eo50fq3IyAhUqFRTk4ao
	6BaiNgtQwK+qvps5LX+wG861K3XPQ3f2tuWBo5faRxxakgqSJsdMnnKNaj4g07pcvlS5QZneHP6
	e83x9/fZvehAtSNKEVseCZFDnCREWiUSiVvVmUi
X-Received: by 2002:a05:6820:81d1:b0:6d7:9cf4:e993 with SMTP id 006d021491bc7-6d79cf4f414mr6840896eaf.11.1790615669113;
        Mon, 28 Sep 2026 10:14:29 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d87d9060cbsm5492874eaf.0.2026.09.28.10.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:14:28 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Beau Belgrave <beaub@linux.microsoft.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/2] selftests/user_events: Fix pointer casts for 32-bit builds
Date: Mon, 28 Sep 2026 12:14:24 -0500
Message-ID: <20260928171424.199202-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928171424.199202-1-danishkhateeb03@gmail.com>
References: <20260928171424.199202-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tests cast pointers directly to __u64. On 32-bit builds GCC
sign-extends such casts, so addresses above 2 GiB, like the stack of a
32-bit task on a 64-bit kernel, become 0xffffffffxxxxxxxx and every
registration fails.

Cast through uintptr_t so the tests also work when built for 32-bit and
cover the compat ioctl path.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Built with and without -m32. With 1/2 applied, the 32-bit tests pass on
    x86_64; the 64-bit binaries are unchanged in behaviour and still pass.
    The -Wpointer-to-int-cast warnings left in a 32-bit build come from
    kselftest_harness.h, not from these tests.

 .../testing/selftests/user_events/abi_test.c  | 10 +++---
 .../testing/selftests/user_events/dyn_test.c  |  6 ++--
 .../selftests/user_events/ftrace_test.c       | 32 +++++++++----------
 .../testing/selftests/user_events/perf_test.c | 10 +++---
 4 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/user_events/abi_test.c b/tools/testing/selftests/user_events/abi_test.c
index b71813eaf5c0..21e1e3cca197 100644
--- a/tools/testing/selftests/user_events/abi_test.c
+++ b/tools/testing/selftests/user_events/abi_test.c
@@ -179,10 +179,10 @@ static int reg_enable_multi(void *enable, int size, int bit, int flags,
 	}
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)full_args;
+	reg.name_args = (__u64)(uintptr_t)full_args;
 	reg.flags = USER_EVENT_REG_MULTI_FORMAT | flags;
 	reg.enable_bit = bit;
-	reg.enable_addr = (__u64)enable;
+	reg.enable_addr = (__u64)(uintptr_t)enable;
 	reg.enable_size = size;
 
 	ret = ioctl(fd, DIAG_IOCSREG, &reg);
@@ -202,10 +202,10 @@ static int reg_enable_flags(void *enable, int size, int bit, int flags)
 		return -1;
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)"__abi_event";
+	reg.name_args = (__u64)(uintptr_t)"__abi_event";
 	reg.flags = flags;
 	reg.enable_bit = bit;
-	reg.enable_addr = (__u64)enable;
+	reg.enable_addr = (__u64)(uintptr_t)enable;
 	reg.enable_size = size;
 
 	ret = ioctl(fd, DIAG_IOCSREG, &reg);
@@ -231,7 +231,7 @@ static int reg_disable(void *enable, int bit)
 
 	reg.size = sizeof(reg);
 	reg.disable_bit = bit;
-	reg.disable_addr = (__u64)enable;
+	reg.disable_addr = (__u64)(uintptr_t)enable;
 
 	ret = ioctl(fd, DIAG_IOCSUNREG, &reg);
 
diff --git a/tools/testing/selftests/user_events/dyn_test.c b/tools/testing/selftests/user_events/dyn_test.c
index 78e3c33f4015..32f159544d0b 100644
--- a/tools/testing/selftests/user_events/dyn_test.c
+++ b/tools/testing/selftests/user_events/dyn_test.c
@@ -58,9 +58,9 @@ static int reg_event(int fd, int *check, int bit, const char *value)
 	struct user_reg reg = {0};
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)value;
+	reg.name_args = (__u64)(uintptr_t)value;
 	reg.enable_bit = bit;
-	reg.enable_addr = (__u64)check;
+	reg.enable_addr = (__u64)(uintptr_t)check;
 	reg.enable_size = sizeof(*check);
 
 	if (ioctl(fd, DIAG_IOCSREG, &reg) == -1)
@@ -75,7 +75,7 @@ static int unreg_event(int fd, int *check, int bit)
 
 	unreg.size = sizeof(unreg);
 	unreg.disable_bit = bit;
-	unreg.disable_addr = (__u64)check;
+	unreg.disable_addr = (__u64)(uintptr_t)check;
 
 	return ioctl(fd, DIAG_IOCSUNREG, &unreg);
 }
diff --git a/tools/testing/selftests/user_events/ftrace_test.c b/tools/testing/selftests/user_events/ftrace_test.c
index decce06b9ba8..b9c75202f0bd 100644
--- a/tools/testing/selftests/user_events/ftrace_test.c
+++ b/tools/testing/selftests/user_events/ftrace_test.c
@@ -127,7 +127,7 @@ static int clear(int *check)
 
 	unreg.size = sizeof(unreg);
 	unreg.disable_bit = 31;
-	unreg.disable_addr = (__u64)check;
+	unreg.disable_addr = (__u64)(uintptr_t)check;
 
 	fd = open(data_file, O_RDWR);
 
@@ -174,9 +174,9 @@ static int check_print_fmt(const char *event, const char *expected, int *check)
 		return fd;
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)event;
+	reg.name_args = (__u64)(uintptr_t)event;
 	reg.enable_bit = 31;
-	reg.enable_addr = (__u64)check;
+	reg.enable_addr = (__u64)(uintptr_t)check;
 	reg.enable_size = sizeof(*check);
 
 	/* Register should work */
@@ -239,14 +239,14 @@ TEST_F(user, register_events) {
 	struct user_unreg unreg = {0};
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)"__test_event u32 field1; u32 field2";
+	reg.name_args = (__u64)(uintptr_t)"__test_event u32 field1; u32 field2";
 	reg.enable_bit = 31;
-	reg.enable_addr = (__u64)&self->check;
+	reg.enable_addr = (__u64)(uintptr_t)&self->check;
 	reg.enable_size = sizeof(self->check);
 
 	unreg.size = sizeof(unreg);
 	unreg.disable_bit = 31;
-	unreg.disable_addr = (__u64)&self->check;
+	unreg.disable_addr = (__u64)(uintptr_t)&self->check;
 
 	/* Register should work */
 	ASSERT_EQ(0, ioctl(self->data_fd, DIAG_IOCSREG, &reg));
@@ -263,13 +263,13 @@ TEST_F(user, register_events) {
 
 	/* Register without separator spacing should still match */
 	reg.enable_bit = 29;
-	reg.name_args = (__u64)"__test_event u32 field1;u32 field2";
+	reg.name_args = (__u64)(uintptr_t)"__test_event u32 field1;u32 field2";
 	ASSERT_EQ(0, ioctl(self->data_fd, DIAG_IOCSREG, &reg));
 	ASSERT_EQ(0, reg.write_index);
 
 	/* Multiple registers to same name but different args should fail */
 	reg.enable_bit = 29;
-	reg.name_args = (__u64)"__test_event u32 field1;";
+	reg.name_args = (__u64)(uintptr_t)"__test_event u32 field1;";
 	ASSERT_EQ(-1, ioctl(self->data_fd, DIAG_IOCSREG, &reg));
 	ASSERT_EQ(EADDRINUSE, errno);
 
@@ -310,9 +310,9 @@ TEST_F(user, write_events) {
 	int before = 0, after = 0;
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)"__test_event u32 field1; u32 field2";
+	reg.name_args = (__u64)(uintptr_t)"__test_event u32 field1; u32 field2";
 	reg.enable_bit = 31;
-	reg.enable_addr = (__u64)&self->check;
+	reg.enable_addr = (__u64)(uintptr_t)&self->check;
 	reg.enable_size = sizeof(self->check);
 
 	field1 = 1;
@@ -367,9 +367,9 @@ TEST_F(user, write_empty_events) {
 	int before = 0, after = 0;
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)"__test_event";
+	reg.name_args = (__u64)(uintptr_t)"__test_event";
 	reg.enable_bit = 31;
-	reg.enable_addr = (__u64)&self->check;
+	reg.enable_addr = (__u64)(uintptr_t)&self->check;
 	reg.enable_size = sizeof(self->check);
 
 	io[0].iov_base = &reg.write_index;
@@ -401,9 +401,9 @@ TEST_F(user, write_fault) {
 	void *anon;
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)"__test_event u64 anon";
+	reg.name_args = (__u64)(uintptr_t)"__test_event u64 anon";
 	reg.enable_bit = 31;
-	reg.enable_addr = (__u64)&self->check;
+	reg.enable_addr = (__u64)(uintptr_t)&self->check;
 	reg.enable_size = sizeof(self->check);
 
 	anon = mmap(NULL, l, PROT_READ, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
@@ -439,9 +439,9 @@ TEST_F(user, write_validator) {
 	int before = 0, after = 0;
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)"__test_event __rel_loc char[] data";
+	reg.name_args = (__u64)(uintptr_t)"__test_event __rel_loc char[] data";
 	reg.enable_bit = 31;
-	reg.enable_addr = (__u64)&self->check;
+	reg.enable_addr = (__u64)(uintptr_t)&self->check;
 	reg.enable_size = sizeof(self->check);
 
 	/* Register should work */
diff --git a/tools/testing/selftests/user_events/perf_test.c b/tools/testing/selftests/user_events/perf_test.c
index 5727cb5b914c..b444d114b2f0 100644
--- a/tools/testing/selftests/user_events/perf_test.c
+++ b/tools/testing/selftests/user_events/perf_test.c
@@ -89,7 +89,7 @@ static int clear(int *check)
 
 	unreg.size = sizeof(unreg);
 	unreg.disable_bit = 31;
-	unreg.disable_addr = (__u64)check;
+	unreg.disable_addr = (__u64)(uintptr_t)check;
 
 	int fd = open(data_file, O_RDWR);
 
@@ -160,9 +160,9 @@ TEST_F(user, perf_write) {
 	__u32 *val;
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)"__test_event u32 field1; u32 field2";
+	reg.name_args = (__u64)(uintptr_t)"__test_event u32 field1; u32 field2";
 	reg.enable_bit = 31;
-	reg.enable_addr = (__u64)&self->check;
+	reg.enable_addr = (__u64)(uintptr_t)&self->check;
 	reg.enable_size = sizeof(self->check);
 
 	/* Register should work */
@@ -224,9 +224,9 @@ TEST_F(user, perf_empty_events) {
 	__u32 *val;
 
 	reg.size = sizeof(reg);
-	reg.name_args = (__u64)"__test_event";
+	reg.name_args = (__u64)(uintptr_t)"__test_event";
 	reg.enable_bit = 31;
-	reg.enable_addr = (__u64)&self->check;
+	reg.enable_addr = (__u64)(uintptr_t)&self->check;
 	reg.enable_size = sizeof(self->check);
 
 	/* Register should work */
-- 
2.55.0

