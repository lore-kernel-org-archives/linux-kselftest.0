Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890469;
	b=ksdxg8NigziPseWpgq2bNwwH4QlH5y7QuQ7cDMcANo45Z2/xYiTDFU7au+yvBl9tRyFL
	 drM6/ktwB7OukWjfFNm1KpfHLYI1WIGhgv2s+bglcsoWEW85pXramS29HY+TFfn/G03JT
	 9PhUVW4EA2B4JlBV1YjufkoLdP/keNSMp3DlFRKcxYzqUmHUO9FCMMo9Z4fLkNZKKYzLY
	 hJlWa04NSj0dldJV/egtmQbnX2nJwXEJS5p3//7GOu5VuW6l9zcPIoLCyV6BXuuGAaCVo
	 x69lqdU7A4TFq2IJqo8Rq8Gsq2MgURX4cj0+qLgAaK7Jis35TR8ryW0D83XwqEsmNGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=blzEuNqgIadr6KeAt3Je7rqRIX5fb1fdefZEWhfO2PU=;
	b=Moh/v+H9bKKeRa33I1/g4kezg/i4t0kyJDjXBp5C665bBMtMy/Na9Qb1V19ipVLfqnRj
	 Ghtjgn59Pjc56uFkK7nrwjl9ijNPK5a26RqX0GsnQpYh8yEOcWJBSA91+8Q5USOIf4D5+
	 7I5QDB6l68lage2wlfGVAqVL9FzU6Ve5Up7LA7RJ3FbTQ6rxx8fRRmOIk2mso1LfGwAi6
	 6c+1rMlHaoM0SE66g1uBmFKJcm56pQNFUMjUuh5eeop4Mua3ah3hcLxar1FkgNz9fAqPj
	 cwcbkF1AOiWcgxet1gNHZvjK3iaTtS69OTeoJ+SetEcqdtYlKrUFrSDdFj8V9lBrXZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ShlV13Dm;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686A9606A696
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 686A9606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ShlV13Dm
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67db89857abso9423603d50.0
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890467; x=1796495267; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=blzEuNqgIadr6KeAt3Je7rqRIX5fb1fdefZEWhfO2PU=;
        b=ShlV13DmPp3DKPxGhrVn1KjSRjBTW4Fpa+vT7u5yW0lWaEnd/PF+7BXy+jctqm6uxe
         M7vlRXdga8hN8wwJ9T503nqrvzwfH9O5FMtuFKXNS92rcH6IhL9mrgY3WVJw2DCKrWK+
         /sy0UCInsbIx9W5LMLxWCE7Jkalp1DRgs//og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890467; x=1796495267;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blzEuNqgIadr6KeAt3Je7rqRIX5fb1fdefZEWhfO2PU=;
        b=jDuscuz7IrzbsE1+KevO/H+enhSvbgJ2FwH6SLT4aQ3ati1PHtyCi4zq4R4dJlgT+z
         ieZw8c9MB43u7BkPkaqIwb0vYCyvaUBANPkGNKeyqxVeqdD8bWVgABxFsVOvCdLW8vf2
         leLFl1SmRQGAH6vJd6ooGHauHgbQ66vcxMJaai+dv4v24lPKFpmiS9pt733wiha0XCUY
         O82/23JsL3WfzGsP3T0PoXiiwEat60IRuFs2kh5HtDb367es+oBh1XH0lhLSg0N/yGkr
         eBj3j0gMvfvL+2XZIttSazx5Z4IrMWx2LWONPHYM0M9/dimTctQzdnj5qOIz7EDTxpAR
         qwow==
X-Forwarded-Encrypted: i=1; AL+hErEl01NgU03WDyvW0wWOZk/yHhAnQGqXv88+0homfed4b3SGLErp7yslhxe2az95ZDfFmxazF6flijMExSZjGI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KYHBheMzmIqdCPblVYV31Ee8V9fWnfCwaREamrsGA+GpHw3yB
	bbBLtww4jr8wd9JPt9cf09jaACjqnotOLyGPNLVQnAB3dF2jznLqaSwm73e6IJpVh2I=
X-Gm-Gg: AZFdTZcigH2nGdwm8CDYcEWwoXVqComB6BvPxZeapCUD9RMS9X60wl5QzJ1maEzEC7m
	mc0jnFRYKqrTpFaJjEFRnZt9xeyNVuzBEsrrC72hepQDjSy7m43Fq09dFLDWpFJ7N4FUIodbvw1
	BgE1+OpMxWskpZfvuJ4AyDARRlCfG567yzllQfYOvZ7dOb6pBDTf03t4uVAouzk1W8Yiuq5CqyH
	EbhP3LjxoxnYzkmBAqod8qc/mNcY3hmUIEylukwQDAw0jb696rZB+fgPfXp6+k9/L/jzDYRiL0B
	WxQfsknYktT1eRnkIK4wO+XWZSquAEkfDDwiWx7ZDU2YfD6UlhA5X09v+JQ7YzQld2Ft153DGXR
	xzBENrws2VJ9aVAIaNYRH97j3igEVzaY+iybOaCwSW0hoVWGbKE84gnq6uyGRjqR8Id1Fq87T6A
	w8tEsGusVxt1dhVcUdrFVoR5US0bRplBjfFpCL2pyHw+TsJAwpKMUVze0TxIMQiekDpaZX3Qsyk
	+WY0YCej3Nx6Er/3fe634gyXIIm4F+mKeB/aulEbl/6eQYGgn+5xoA3Lee5XjrIufq7YacyjqSL
	RBUz8T33lW0YuwvTOTKBpMdXKZbbkYdDSe0o+YQ5Z80Kl6NBAGE9EIvKR6IT6wgMzURih8TNoeT
	FiD29kLQiF1Fkccb37sJr8EEJeox1zHUY3ZT1JhrRF/9Lhvoqsm0NyzOPpkK23nXJCp7Gjb3goL
	WaE09zeDHlVO3rf+gjot+CjOmC9FueNRm0RX++y+/dnisF5B92SPkEtoRwaPJIvkj3tjWChhIpT
	saWvsK9uXAn8afYh/KGrFM=
X-Received: by 2002:a05:690e:151c:b0:67d:b34c:9f06 with SMTP id 956f58d0204a3-67df449f814mr8018760d50.96.1795890467464;
        Sat, 28 Nov 2026 10:27:47 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67e6aeb61d7sm2519526d50.3.2026.11.28.10.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:46 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:44 -0800
Message-ID: <768ef2de1ebf9cea6f1e43027dddaf09d901c2cf.1795857773.git.chris@chrisdown.name>
In-Reply-To: <cover.1795857773.git.chris@chrisdown.name>
References: <cover.1795857773.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 7/7] selftests/liveupdate: Check handover revival, sequence
 and memory stats
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
    Mike Rapoport <rppt@kernel.org>,
    Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
    Baoquan He <baoquan.he@linux.dev>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    kexec@lists.infradead.org,
    linux-mm@kvack.org,
    linux-kernel@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    kernel-team@meta.com,
    Breno Leitao <leitao@debian.org>,
    sashiko-bot@kernel.org
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Extend the handover stats test to cover the new files. On the first
boot, kho/incoming/state should be none, liveupdate_num 0, and both KHO
sizes 0. After the kexec, the handover should be revived and
liveupdate_num should be 1.

restored_size should grow by at least a page each time a memfd is
retrieved or dropped. The memfd in the unclaimed session is retrieved
last, once everything else is done.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../selftests/liveupdate/luo_handover_stats.c | 74 +++++++++++++++++--
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/luo_handover_stats.c b/tools/testing/selftests/liveupdate/luo_handover_stats.c
index f18df79dda55..850d2fbb1dcd 100644
--- a/tools/testing/selftests/liveupdate/luo_handover_stats.c
+++ b/tools/testing/selftests/liveupdate/luo_handover_stats.c
@@ -10,6 +10,7 @@
 #include <libliveupdate.h>
 
 #define INCOMING_DIR "/sys/class/misc/liveupdate/incoming/"
+#define KHO_INCOMING_DIR "/sys/kernel/kho/incoming/"
 
 #define SESSION_CLAIMED "stats-claimed"
 #define SESSION_UNCLAIMED "stats-unclaimed"
@@ -28,13 +29,13 @@
 /* The first open starts deserialization. */
 static char state_before_open[16];
 
-static void read_incoming(const char *name, char *buf, size_t len)
+static void read_sysfs(const char *dir, const char *name, char *buf, size_t len)
 {
 	char path[128];
 	ssize_t n;
 	int fd;
 
-	snprintf(path, sizeof(path), INCOMING_DIR "%s", name);
+	snprintf(path, sizeof(path), "%s%s", dir, name);
 	fd = open(path, O_RDONLY);
 	if (fd < 0)
 		fail_exit("open %s", path);
@@ -54,6 +55,11 @@ static void read_incoming(const char *name, char *buf, size_t len)
 		buf[n - 1] = '\0';
 }
 
+static void read_incoming(const char *name, char *buf, size_t len)
+{
+	read_sysfs(INCOMING_DIR, name, buf, len);
+}
+
 static void expect_state(const char *state, const char *expected)
 {
 	if (strcmp(state, expected))
@@ -61,13 +67,13 @@ static void expect_state(const char *state, const char *expected)
 				   expected);
 }
 
-static unsigned long long read_number(const char *name)
+static unsigned long long read_number(const char *dir, const char *name)
 {
 	unsigned long long val = 0;
 	char buf[32];
 	char *p;
 
-	read_incoming(name, buf, sizeof(buf));
+	read_sysfs(dir, name, buf, sizeof(buf));
 	for (p = buf; *p >= '0' && *p <= '9'; p++) {
 		if (val > (ULLONG_MAX - (*p - '0')) / 10)
 			break;
@@ -75,19 +81,45 @@ static unsigned long long read_number(const char *name)
 	}
 	if (p == buf || *p)
 		ksft_exit_fail_msg("%s%s reads '%s', not a 64-bit unsigned number\n",
-				   INCOMING_DIR, name, buf);
+				   dir, name, buf);
 	return val;
 }
 
 static void expect_count(const char *name, unsigned long long expected)
 {
-	unsigned long long val = read_number(name);
+	unsigned long long val = read_number(INCOMING_DIR, name);
 
 	if (val != expected)
 		ksft_exit_fail_msg("%s is %llu, expected %llu\n", name, val,
 				   expected);
 }
 
+static void expect_kho_state(const char *expected)
+{
+	char state[16];
+
+	read_sysfs(KHO_INCOMING_DIR, "state", state, sizeof(state));
+	if (strcmp(state, expected))
+		ksft_exit_fail_msg("kho/incoming/state is '%s', expected '%s'\n",
+				   state, expected);
+}
+
+static unsigned long long kho_size(const char *name)
+{
+	return read_number(KHO_INCOMING_DIR, name);
+}
+
+static unsigned long long expect_more_restored(unsigned long long prev)
+{
+	unsigned long long restored = kho_size("restored_size");
+
+	if (restored < prev + getpagesize() ||
+	    restored > kho_size("preserved_size"))
+		ksft_exit_fail_msg("restored_size went from %llu to %llu\n",
+				   prev, restored);
+	return restored;
+}
+
 static void expect_counts(long retrieved, long dropped)
 {
 	char state[16];
@@ -111,6 +143,10 @@ static void run_stage_1(int luo_fd)
 	expect_state(state_before_open, "none");
 	expect_count("sessions", 0);
 	expect_count("files", 0);
+	expect_count("liveupdate_num", 0);
+	expect_kho_state("none");
+	if (kho_size("preserved_size") || kho_size("restored_size"))
+		ksft_exit_fail_msg("KHO sizes aren't 0 on a cold boot\n");
 
 	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
 
@@ -144,11 +180,16 @@ static void run_stage_1(int luo_fd)
 
 static void run_stage_2(int luo_fd, int state_session_fd)
 {
-	int claimed_fd, mfd, stage;
+	int claimed_fd, unclaimed_fd, mfd, stage;
+	unsigned long long restored;
 
 	ksft_print_msg("[STAGE 2] Checking state before and after the first open...\n");
 	expect_state(state_before_open, "pending");
 	expect_counts(0, 0);
+	expect_count("liveupdate_num", 1);
+	expect_kho_state("revived");
+	if (!kho_size("preserved_size"))
+		ksft_exit_fail_msg("kho/incoming/preserved_size is 0\n");
 
 	restore_and_read_stage(state_session_fd, STATE_MEMFD_TOKEN, &stage);
 	if (stage != 2)
@@ -163,6 +204,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	if (claimed_fd < 0)
 		fail_exit("luo_retrieve_session for '%s'", SESSION_CLAIMED);
 
+	restored = kho_size("restored_size");
 	mfd = restore_and_verify_memfd(claimed_fd, MFD_RETRIEVED_TOKEN,
 				       MFD_RETRIEVED_DATA);
 	if (mfd < 0)
@@ -170,6 +212,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 			  MFD_RETRIEVED_TOKEN);
 	close(mfd);
 	expect_counts(2, 0);
+	restored = expect_more_restored(restored);
 
 	ksft_print_msg("[STAGE 2] Finishing '%s'...\n", SESSION_CLAIMED);
 	if (luo_session_finish(claimed_fd) < 0)
@@ -177,6 +220,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	close(claimed_fd);
 
 	expect_counts(2, 1);
+	expect_more_restored(restored);
 
 	ksft_print_msg("[STAGE 2] Finishing the state session...\n");
 	if (luo_session_finish(state_session_fd) < 0)
@@ -185,6 +229,22 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 
 	/* Finishing the state session must not drop anything. */
 	expect_counts(2, 1);
+	restored = kho_size("restored_size");
+
+	ksft_print_msg("[STAGE 2] Retrieving the memfd in '%s'...\n",
+		       SESSION_UNCLAIMED);
+	unclaimed_fd = luo_retrieve_session(luo_fd, SESSION_UNCLAIMED);
+	if (unclaimed_fd < 0)
+		fail_exit("luo_retrieve_session for '%s'", SESSION_UNCLAIMED);
+	mfd = restore_and_verify_memfd(unclaimed_fd, MFD_UNCLAIMED_TOKEN,
+				       MFD_UNCLAIMED_DATA);
+	if (mfd < 0)
+		fail_exit("restore_and_verify_memfd for token %#x",
+			  MFD_UNCLAIMED_TOKEN);
+	close(mfd);
+	close(unclaimed_fd);
+	expect_counts(3, 1);
+	expect_more_restored(restored);
 
 	ksft_print_msg("\n--- HANDOVER STATS TEST PASSED ---\n");
 }
-- 
2.56.1

