Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890460;
	b=BxsyZoQcouZZELCvXgdfu83+B6BVLjx//gb+s2RUWdeDPQDnNFH689Zj7t0LkI1B3jbf
	 NWNvstGBmpPaqkLveeSYIipgFX12/Att/6nUgsw5NgAw6y6Dc4b/8P97S0DWAI0m7SVk/
	 S8LlXM++i1gIx94MhD5X/PYjKSnJqH3ICUDV+8+oMbWnQFSyQfd/RWnM16rANTfvFBiXd
	 74eCE1K1qywDreEB1WQKCVAPJmmK1/z4xCFICHWQ9CR2TEhaHU+S9/PRRlIPmIGpNLcdU
	 Bfgx0KiNVlOEHNta0ZlMmxS9Kqf4ARfPU4glGLb3eD5OrK6wQ6L36eGz3We4ZSefrSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=kawPKo9GOsn7ib1uspphdvgJjD4iB3eiUmekg6Ai9Qk=;
	b=NXjq5+iXvkZt4FhUM7TXnV0N+T+QBAdCJeTtdOq9yDabL8Jdy0NvI7YMlq18MVM6AtBd
	 lrdXut4EvBuktQiUgFtzkowJdTT6MvC9ZDGZGOrBzsglAMV3wi6utzIXJzh9pusFla1q/
	 5rd8VTyfmDA4Dc5s/HdoaUw/IfKJLkZQ0GGK54d60oCPqDf4A+C6+jtEN6MRpqB8zvY/M
	 lZmAdT6P64n9/2vC72wxkIp6/sp3JflY9CMzZNwEJWKixxs6fscBfC3LYBrvCwVklURT7
	 MbUKOZrj+/AlNfF/pD29vM6S9p3Px8q37knDvfSPvV4MD71VfBaX92ni0xs8M+NyZNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=rPi8kJFz;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92086606A693
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92086606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=rPi8kJFz
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d126f631so78488887b3.2
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890458; x=1796495258; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kawPKo9GOsn7ib1uspphdvgJjD4iB3eiUmekg6Ai9Qk=;
        b=rPi8kJFzwIK6prAd3dq9pUcmpdjCDrqOJKCI6U45h/YSzt0lcjHEgVPw3Q0NzmXwxD
         6Bk3HuCxuACu5yB28OZTp+1F3AiDNgMGwiEsOgUm69a2R4S/Yt8pNGLLOPtNPs/wQG3t
         sTywY+zq887rruro5sFMBn5JgjQZxShWh5Ja8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890458; x=1796495258;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kawPKo9GOsn7ib1uspphdvgJjD4iB3eiUmekg6Ai9Qk=;
        b=2LJeFuna98Ho7cdogQu+xigdsKPjOXZoQFEPuvDUrbWbcS8GQ+zDSU4ne42lym/xEi
         Pu633+R/N8XqiutKnn3/rdkxVEyrKQ7lHZCYvQv7TcQYdUFDHcN9KPZu/X9Ux08d8gpq
         8JS1zZcnMySFIDrxX0ix2eqta/K3mu8MGZckVNN4OT7COX4ixLulC9wl7GNfg9O6E1IN
         FGv8x9k5j121UwqFV+Y4FkuyMp4ak2muavbJodXidHqpM9IQlvXvfgjk6xAdKNNFXZhj
         qEHAAg0F44QoVPMgQP09JVC5UylrwtQvHvd+x0kFLKUVs0GvH7RlDqrHyX8iFn2efH8g
         xQOw==
X-Forwarded-Encrypted: i=1; AL+hErGcBbwI3Ppxkt+yoU064hmQ6jCpvl3gQ1hPMoZnuNqQYYOTANFFq/L+wS4B96/Zs0fMakmwe8ONubHFbUmhuuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vSRQoJHYnGiIbF+XVWuE3gvCyS/aW/ebxGh881kxNv0dzWTZo
	RtgzIsOsZh3qzSbxDGfU4v1rVaMoqbSFVGL6l16YNUT4oayU3992e2NFWxOwgTl2CMJl9yBiuzJ
	w43pL5oG/w9QIQChFaQ==
X-Gm-Gg: AZFdTZcg2WiW8GrI6dB3522rU8Dpl2591UQ6PIPxag6qZTzbbAwmJbvvRb40O4GtN+F
	PCNFLz7WCBUrfYVp1g8S4vJmooLt6qdJe5RUex0s0LtSStvvvcrt0VrcF4x/FlueuZGWiWvAot3
	yvEkUAMH89hCqVQ2SFUCWybjtdbFrssg9Il+OfBrYQU5QWvLvSytj3hnkLyFvBFv2LvTZ6YICbO
	2fOhwRkYZLkX+3ORUJifcW+mPmu8lb5Kh39seX5O5QWt1pBMG9YkSBZF/ZYtKvINiWw0G89wdPB
	QHZjYzOt4eLIvOoYrue/X84aLfitH1Rc9VhULbCidYeNxztn5HAYleOpcbB0fI/eqNLdFsAk27D
	UFhitQLkSatqqYk1+1GEyfLz/DQ7OjNs82jsmM8NPAjvZerR29YQF5pT3yd2k8G8lhNqULvklJY
	3XEfsTsQAHT1y0I1jYS+Naa/O/2D3ZPffGYwl5/vV3645p7PKOCgpWbYhF2pi6ygP9fuwtttIMC
	I+2xhLy/4ceSVeW1IQkMighk1BHt2+blGwLTTJ6LcrmKuC1pWM65obdOCa/9jXZOFzCesN82SiY
	RGEQ5rVkdWDYhn6weJ7qJUWTrSWHw9l52UzxiJDmEG2akEqVLvo5eQsdJkWxkAeJQSQ4kh+VrW5
	2rdrahVqVCxlz/nimY5h3bCstWsbxIBqYU+SDm05oiBJgMSpXnJenNDWiYidMV4FVg+Ahr7LAKH
	9uB4biZJJFMfJF6anlGwMB1/cqKQFjcba12WSzxzxmXf2RFDuQRWWHVrdLEGa+IKk7FXReA6NgA
	+2diRymI1fuzZaDnTqmO9A=
X-Received: by 2002:a05:690c:c107:b0:8b5:4cff:d81f with SMTP id 00721157ae682-8b54cffe423mr67544027b3.42.1795890458520;
        Sat, 28 Nov 2026 10:27:38 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8563sm107704837b3.5.2026.11.28.10.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:37 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:35 -0800
Message-ID: <d8ac1080dd0929e4dc31f9f60d9b5118dd587ec4.1795857773.git.chris@chrisdown.name>
In-Reply-To: <cover.1795857773.git.chris@chrisdown.name>
References: <cover.1795857773.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 3/7] selftests/liveupdate: Catch incorrect file accounting
 across kexec
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

Check that each retrieve is counted while the session is still open.
Finishing the session should count its unretrieved file as dropped,
while a file in an unclaimed session should still be held.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 tools/testing/selftests/liveupdate/init.c     |   5 +
 .../selftests/liveupdate/luo_handover_stats.c | 198 ++++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |   1 +
 tools/testing/selftests/liveupdate/vmtest.sh  |   2 +
 5 files changed, 207 insertions(+)
 create mode 100644 tools/testing/selftests/liveupdate/luo_handover_stats.c

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index 634211c66652..78a4419ff610 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -2,6 +2,7 @@
 
 TEST_GEN_PROGS += liveupdate
 
+TEST_GEN_PROGS_EXTENDED += luo_handover_stats
 TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
 TEST_GEN_PROGS_EXTENDED += luo_multi_session
 TEST_GEN_PROGS_EXTENDED += luo_stress_sessions
diff --git a/tools/testing/selftests/liveupdate/init.c b/tools/testing/selftests/liveupdate/init.c
index fb08bd58b9b9..31bd8f0ec3a9 100644
--- a/tools/testing/selftests/liveupdate/init.c
+++ b/tools/testing/selftests/liveupdate/init.c
@@ -37,6 +37,11 @@ static int mount_filesystems(void)
 		return -1;
 	}
 
+	if (mount("sysfs", "/sys", "sysfs", 0, NULL) < 0) {
+		fprintf(stderr, "INIT: Failed to mount sysfs\n");
+		return -1;
+	}
+
 	return 0;
 }
 
diff --git a/tools/testing/selftests/liveupdate/luo_handover_stats.c b/tools/testing/selftests/liveupdate/luo_handover_stats.c
new file mode 100644
index 000000000000..f18df79dda55
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_handover_stats.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2026 Meta Platforms, Inc. and affiliates. */
+
+#include <fcntl.h>
+#include <limits.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <libliveupdate.h>
+
+#define INCOMING_DIR "/sys/class/misc/liveupdate/incoming/"
+
+#define SESSION_CLAIMED "stats-claimed"
+#define SESSION_UNCLAIMED "stats-unclaimed"
+
+#define MFD_RETRIEVED_TOKEN 0x51
+#define MFD_DROPPED_TOKEN 0x52
+#define MFD_UNCLAIMED_TOKEN 0x53
+
+#define MFD_RETRIEVED_DATA "retrieved before finish"
+#define MFD_DROPPED_DATA "never retrieved"
+#define MFD_UNCLAIMED_DATA "session never retrieved"
+
+#define STATE_SESSION_NAME "handover_stats_state"
+#define STATE_MEMFD_TOKEN 997
+
+/* The first open starts deserialization. */
+static char state_before_open[16];
+
+static void read_incoming(const char *name, char *buf, size_t len)
+{
+	char path[128];
+	ssize_t n;
+	int fd;
+
+	snprintf(path, sizeof(path), INCOMING_DIR "%s", name);
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		fail_exit("open %s", path);
+
+	n = read(fd, buf, len - 1);
+	if (n < 0)
+		fail_exit("read %s", path);
+	close(fd);
+
+	/* A full buffer could hide the rest of a malformed value */
+	if ((size_t)n == len - 1)
+		ksft_exit_fail_msg("%s is longer than %zu bytes\n", path,
+				   len - 2);
+
+	buf[n] = '\0';
+	if (n > 0 && buf[n - 1] == '\n')
+		buf[n - 1] = '\0';
+}
+
+static void expect_state(const char *state, const char *expected)
+{
+	if (strcmp(state, expected))
+		ksft_exit_fail_msg("state is '%s', expected '%s'\n", state,
+				   expected);
+}
+
+static unsigned long long read_number(const char *name)
+{
+	unsigned long long val = 0;
+	char buf[32];
+	char *p;
+
+	read_incoming(name, buf, sizeof(buf));
+	for (p = buf; *p >= '0' && *p <= '9'; p++) {
+		if (val > (ULLONG_MAX - (*p - '0')) / 10)
+			break;
+		val = val * 10 + (*p - '0');
+	}
+	if (p == buf || *p)
+		ksft_exit_fail_msg("%s%s reads '%s', not a 64-bit unsigned number\n",
+				   INCOMING_DIR, name, buf);
+	return val;
+}
+
+static void expect_count(const char *name, unsigned long long expected)
+{
+	unsigned long long val = read_number(name);
+
+	if (val != expected)
+		ksft_exit_fail_msg("%s is %llu, expected %llu\n", name, val,
+				   expected);
+}
+
+static void expect_counts(long retrieved, long dropped)
+{
+	char state[16];
+
+	read_incoming("state", state, sizeof(state));
+	expect_state(state, "deserialized");
+
+	/* Three sessions, including the one carrying the test stage. */
+	expect_count("sessions", 3);
+	expect_count("files", 4);
+	expect_count("files_retrieved", retrieved);
+	expect_count("files_failed", 0);
+	expect_count("files_dropped", dropped);
+}
+
+static void run_stage_1(int luo_fd)
+{
+	int claimed_fd, unclaimed_fd;
+
+	ksft_print_msg("[STAGE 1] Checking state on a cold boot...\n");
+	expect_state(state_before_open, "none");
+	expect_count("sessions", 0);
+	expect_count("files", 0);
+
+	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+
+	ksft_print_msg("[STAGE 1] Preserving two memfds in '%s'...\n",
+		       SESSION_CLAIMED);
+	claimed_fd = luo_create_session(luo_fd, SESSION_CLAIMED);
+	if (claimed_fd < 0)
+		fail_exit("luo_create_session for '%s'", SESSION_CLAIMED);
+	if (create_and_preserve_memfd(claimed_fd, MFD_RETRIEVED_TOKEN,
+				      MFD_RETRIEVED_DATA) < 0)
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  MFD_RETRIEVED_TOKEN);
+	if (create_and_preserve_memfd(claimed_fd, MFD_DROPPED_TOKEN,
+				      MFD_DROPPED_DATA) < 0)
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  MFD_DROPPED_TOKEN);
+
+	ksft_print_msg("[STAGE 1] Preserving one memfd in '%s'...\n",
+		       SESSION_UNCLAIMED);
+	unclaimed_fd = luo_create_session(luo_fd, SESSION_UNCLAIMED);
+	if (unclaimed_fd < 0)
+		fail_exit("luo_create_session for '%s'", SESSION_UNCLAIMED);
+	if (create_and_preserve_memfd(unclaimed_fd, MFD_UNCLAIMED_TOKEN,
+				      MFD_UNCLAIMED_DATA) < 0)
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  MFD_UNCLAIMED_TOKEN);
+
+	close(luo_fd);
+	daemonize_and_wait();
+}
+
+static void run_stage_2(int luo_fd, int state_session_fd)
+{
+	int claimed_fd, mfd, stage;
+
+	ksft_print_msg("[STAGE 2] Checking state before and after the first open...\n");
+	expect_state(state_before_open, "pending");
+	expect_counts(0, 0);
+
+	restore_and_read_stage(state_session_fd, STATE_MEMFD_TOKEN, &stage);
+	if (stage != 2)
+		fail_exit("Expected stage 2, but state file contains %d", stage);
+
+	/* The retrieve must count before the session finishes. */
+	expect_counts(1, 0);
+
+	ksft_print_msg("[STAGE 2] Retrieving one of the two memfds in '%s'...\n",
+		       SESSION_CLAIMED);
+	claimed_fd = luo_retrieve_session(luo_fd, SESSION_CLAIMED);
+	if (claimed_fd < 0)
+		fail_exit("luo_retrieve_session for '%s'", SESSION_CLAIMED);
+
+	mfd = restore_and_verify_memfd(claimed_fd, MFD_RETRIEVED_TOKEN,
+				       MFD_RETRIEVED_DATA);
+	if (mfd < 0)
+		fail_exit("restore_and_verify_memfd for token %#x",
+			  MFD_RETRIEVED_TOKEN);
+	close(mfd);
+	expect_counts(2, 0);
+
+	ksft_print_msg("[STAGE 2] Finishing '%s'...\n", SESSION_CLAIMED);
+	if (luo_session_finish(claimed_fd) < 0)
+		fail_exit("luo_session_finish for '%s'", SESSION_CLAIMED);
+	close(claimed_fd);
+
+	expect_counts(2, 1);
+
+	ksft_print_msg("[STAGE 2] Finishing the state session...\n");
+	if (luo_session_finish(state_session_fd) < 0)
+		fail_exit("luo_session_finish for state session");
+	close(state_session_fd);
+
+	/* Finishing the state session must not drop anything. */
+	expect_counts(2, 1);
+
+	ksft_print_msg("\n--- HANDOVER STATS TEST PASSED ---\n");
+}
+
+int main(int argc, char *argv[])
+{
+	read_incoming("state", state_before_open, sizeof(state_before_open));
+
+	return luo_test(argc, argv, STATE_SESSION_NAME,
+			run_stage_1, run_stage_2);
+}
diff --git a/tools/testing/selftests/liveupdate/run-vmtests.sh b/tools/testing/selftests/liveupdate/run-vmtests.sh
index c3d828cfd63b..b2f38d694664 100755
--- a/tools/testing/selftests/liveupdate/run-vmtests.sh
+++ b/tools/testing/selftests/liveupdate/run-vmtests.sh
@@ -16,6 +16,7 @@ failed=0
 skipped=0
 
 TEST_NAMES=(
+	"luo_handover_stats"
 	"luo_kexec_simple"
 	"luo_multi_session"
 	"luo_stress_files"
diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing/selftests/liveupdate/vmtest.sh
index 70a8d978077a..eaab277eb978 100755
--- a/tools/testing/selftests/liveupdate/vmtest.sh
+++ b/tools/testing/selftests/liveupdate/vmtest.sh
@@ -150,6 +150,7 @@ function mkinitrd() {
 	cat > "$workspace_dir/cpio_list_inner" <<EOF
 dir /dev 0755 0 0
 dir /proc 0755 0 0
+dir /sys 0755 0 0
 dir /debugfs 0755 0 0
 nod /dev/console 0600 0 0 c 5 1
 file /init $workspace_dir/init 0755 0 0
@@ -162,6 +163,7 @@ EOF
 	cat > "$workspace_dir/cpio_list" <<EOF
 dir /dev 0755 0 0
 dir /proc 0755 0 0
+dir /sys 0755 0 0
 dir /debugfs 0755 0 0
 nod /dev/console 0600 0 0 c 5 1
 file /init $workspace_dir/init 0755 0 0
-- 
2.56.1

