Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383631;
	b=ewqqjIOAXb3tT3jpXPh6JCzFBR57LY2FLV/489RJCSL7eASTrw0a393T4O4ZUZUVf0HH
	 dwF5kO/p6AFQ/pMisHMldryu8OJG9KtuWFxufu3stlOzQ1uiEfOMwNsK4OL8vqSvi2r5D
	 yXo0ogZnVGfKWoBskrXd5PgzWo/Li/snyyWoA4y+pD+dqMdGRjvmdetQt+soKEls63aiK
	 4YY6s59/BSlVJ8VV0LTbRgtdFhdmOLlBOpAtNcLaqU6WrpwrppCqDTD1lwsxkqUDGw8Zx
	 zq61+AyMQIUPAdGomGyb0yfAGVtmQGtW9m7xCJ6VvXIvXhQXbmFb+WgV4mM0zBnhZUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=SSI9syxLw5WcjFuLZ1glFarNni2XFz8U30mQtyysmWI=;
	b=SUme9iNH1zG8VGWCQr/2wNCcLaHsVhTTr/QIVaFSGSlP37ThtAkRw82unqPhfM5lLBmx
	 v9vg9u7N5MK+mpn7rpK9F9jHVheFRJKashdn7bCF15IMXvMvRlpTakJjsGd1WKLfc0pQQ
	 OLmPiMHIagfBswENnMymE7L5XC4+m+o3Lx31LgOgxM/c1nDYjfkaJ9Rhe6wNqwlu7hWTD
	 Q1yx9G5Dp1Kwi/68hlQpJugTO2NwVk+Zwbl3WdDhLHHXNnKx8Ow0eV0fkPLo5r55XDZZz
	 HUwxrfnMk0gtYu58043FK5LaNL1nGOffAdjbAvgO8HEJCxgCfxaVc3ULXex5wKIQYoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eSrG0lFG;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9A160A2602
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9A160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eSrG0lFG
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso1207893a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 23:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383629; x=1794988429; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SSI9syxLw5WcjFuLZ1glFarNni2XFz8U30mQtyysmWI=;
        b=eSrG0lFG7ySeSzefrD8AR8ZX0qx68Br5x/TZblJhR3nl+ObylVOTerjSzmy8C4PBMi
         zQ8XaEcAQ853WdxMFYccDPa1xeiDsJZyucqlmn4WRgozQGECM/gtMifq/tBf/bSL7BIf
         7HssaeBv173YHqdkxXqCrzCGGeEn1Z0k2X2II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383629; x=1794988429;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSI9syxLw5WcjFuLZ1glFarNni2XFz8U30mQtyysmWI=;
        b=zLPOnWswimdWhdiPzrzEMXMrheLub2G9qHAFPfFZoEiRErdEbqNUCR+EfmjEGn626f
         LlVnP4Nzzsap1G2RyK9tzOcEi0vFE+WU+tGYunNVbd93t/pQDiGL8ZzHuFIOSxjrpm2S
         tbVqzRBls9FnAcbMBIHHMludmvdyj69FLozbPc66Ay1wIm3XRsMJfVdrtx99M2VLLA92
         ltYxLiOq8LLHxvXBvvR2922QDZy8rOsAU5ppwVKh/suokU9PsSgJGfaBO2bSVyAv50Yd
         BssUC3YCg3LQ/0196xVXCcTvmD4J1t/74mEDhDjEr5ELqtAN7O/b2za1DgXVR9kOV2vq
         vPdQ==
X-Forwarded-Encrypted: i=1; AL+hErFMipCMHZv9KObHnWE/Tkw9DRiYpydZkUCpKWZevIILKMD3aosxhlX3EhDuqwVZVJaCu+Izy6c6OenWE/Ml5/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8olLbQX9XppStvATWYcjTm2Fkywyufk+mlisYdjDGaoLDq7rfz
	cUcb2f3SeRrjfThDvWsO+l4DzuioZpTkDlBM7oHKEbPrR2j3bx06aJzQN0ixsPax9D4=
X-Gm-Gg: AYBFou0gU7MFz/bzzBIswZ939dvV9XS3Z2wXYs+CDIxIdk3qYetE1umGWFf+UKU42h/
	O1Z5ZiX19opVSfSMdf4FKwRkbwSZv2HsXRbG2NMMVfUu3F90CduQQWEMQID9Eb0kzRtjTO0Fl86
	KJCf/4vqxGOtJ+A8wr26xqgF/RZH1bx4z79F9wvydirUWUbnjSI+KvzzjTQfSNj+eQsA1GYH1Ii
	/842r8OfnnK7A3yoDsbfYaOpdpEDEVxKbcyR3F9aDDXj9KEN3aqIFjmj/TLVqj/x2jDyiNY01gw
	qVVFHPRAWQyEERoslMJrgCZHk6m8WjDXEZoe8Eb8iWzwIqlYsOGgeJkORJ8iPKkT9TIQJXGwDs6
	K7M8ZwYXAUekNPmdQIf40p/YtZ5FZjaVf+LvTMJ4iL90VrB3ddcG9zSWeenNYp52mw1ctHYM5J/
	81h66QoyhVtoqV0NUFGEvaDNiBVVwuwkuJE3EaGPRm86zxkXcVLtzb9onIwaV76zxiU65hjNe9p
	A7k+7TNzcyZqk3tmbiAapU0nYMrDhc45Ty287CQ2PKoNCv/DS9SMzyajqTEkHsuFjgwXSQc69lu
	kTDXx2A7ipoM25JHPsgkj8/fjK/fx7iPSqKDr1K2i25RyUfYnQEka47JCSuLmMcwbaVur3wZUw+
	lsoCdWBLFfuCYp9ZMEmVqiBi25s95TeKS6IzblOZ5e9kFwBRaEDzg9BpgPU2OMcEqqeGQrxizWG
	n5j2KQsWpxmO+QYjAkW8UhPTFgvegCzz57dWemI9dX5nJwE5upWNg5
X-Received: by 2002:a17:90b:5483:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b182fb308emr1835511a91.25.1794383629583;
        Tue, 10 Nov 2026 23:53:49 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17da4cd8csm3404966a91.2.2026.11.10.23.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:49 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:45 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 9/9] selftests/liveupdate: Check handover revival, sequence
 and memory stats
Message-ID: <738fbfd19034ce495de9b22c705a7815a236907d.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Extend the handover stats test to cover the new files. On the first
boot, kho_incoming/state should be none, liveupdate_num 0, and both KHO
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
index f18df79dda55..2863630b823e 100644
--- a/tools/testing/selftests/liveupdate/luo_handover_stats.c
+++ b/tools/testing/selftests/liveupdate/luo_handover_stats.c
@@ -10,6 +10,7 @@
 #include <libliveupdate.h>
 
 #define INCOMING_DIR "/sys/class/misc/liveupdate/incoming/"
+#define KHO_INCOMING_DIR "/sys/kernel/kexec/kho_incoming/"
 
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
+		ksft_exit_fail_msg("kho_incoming/state is '%s', expected '%s'\n",
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
+		ksft_exit_fail_msg("kho_incoming/preserved_size is 0\n");
 
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
2.54.0

