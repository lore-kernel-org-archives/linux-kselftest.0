Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383605;
	b=cJo1TWBKzkmo44qetsPTbajOYe8AfwTK+DhiF+rxEBnBntJ90O7O+4IDlYaI1160p7Sy
	 sVph5i33qxrVJ7sJ+Tf4CjIvXOiVFP3AjKzNNQKbZLbJZ9id2JCv7aBUJtdj3rJbSQqp+
	 e85hYaHMnkD0gVicPzIFGRu3X/DMsFHk1isp7KVUl7bBejnjcV6//GtI9pqdnxcQR9fJl
	 l15l141qoA8ADU1J9oSpsNZW2damoQmZrj2eCdhsDG7zlnsOerLi8MZ7Lso//69nmKD5O
	 cD64FfxaNHr2Kc+ViejT97ALc/BVDxYSqBJsHrKRWyrrowJPZB8akvY85DmH4FD9y9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=oahx99XEloIqEujazr6llRd2iV3ppRMwlmYjmySRohQ=;
	b=v8nV7aoWSgSy59N+rTP9vRqlHRfDHBEvCffi8U0Qpz8AEKSViD+Gl1MjVJLpvySrjGgF
	 bybHbcYcOggPDopIOicdS3j1v4lF5UuoAL3+4lYWos0BBEzSLxCFT0cFtEhiWmL0ksgmo
	 rlzX6EIKWBZZz23b4fv25msD+KETq+l+mX4M+G2FfG/fb/MDi16KNvwR+YsPScH5z1AoM
	 5j287YLhafGo+Wib1AztnFGPmjeFBjVP7QBjsl+OW9HT4nnG06PhtypNPAVuVWc6s5ZKf
	 8cl4gOXMwWv6as8l5kmmD7tCa0a8QYg4/jbmcWoIYk0fl1RCEhVpRILjoi0iQJa29zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sc3wVv44;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13390606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13390606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sc3wVv44
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd69954c755so2057000a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 23:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383604; x=1794988404; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oahx99XEloIqEujazr6llRd2iV3ppRMwlmYjmySRohQ=;
        b=sc3wVv44DcuqFiFWb9yifroWPzvGQVB7bqnHX2rJJ9cSC78gYGn9dyLoWAPnCD2KnK
         xxQ++Zpr4oyOpnNSg8gwxaYvhCQY0eKSuKmbkj31bVraVjg4U583iDgzhB4h0zlagi0Y
         fYGb1/C5iWHxwCcAvIxnF9F9gwPRT8SaTaoaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383604; x=1794988404;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oahx99XEloIqEujazr6llRd2iV3ppRMwlmYjmySRohQ=;
        b=KQpbYbGpjIVK6BILbqmbz9zPg/oMvDxqM3foec20eT5EwRNuxU2BBHmY6XAKcl46hX
         lOQiXprIKC2kTlLGgfoTbzIFRZnK8NS5Dvvt4wA5Tn3pbcM8PxuhYg9SnDmT+hVE7wxc
         2Cruy8K7GzHFiJXrZM69zp+fJDD9H9pFJsmjx/d8nMZ8DegcEiaPEOQ022TbpuC/AGTk
         cuj2+IuV1TJdChp3lv6bLRg8cMAD21gtuTWAgzkpKA6amacUhUMl6bb9Q6a8i691uUU9
         Sj7V5vg9Ze/z7GMJskdHnyomMQJsigdstaKJ8/G1EMlI8cm30Mriya587AMpajdLfe8r
         DJfw==
X-Forwarded-Encrypted: i=1; AL+hErEdPKrkgwkizvxVUIXWeCwnwgm+jI1zeHOA0pYnuifE5gI00mqKz7BV2LfmKBmYPJZjZ7Z+DeWrAKLfradOEyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LyEectkU08kEeTcK2Lr1G/pJVSJgE2Aqk3oNxWfE7+Ke5Y2s/
	TS57SPEMmhHLg1bLCMvkmoY9BSrRA/8KSyQhHNcxRcvBjvScrXllAGAecmJbrkG0mcY=
X-Gm-Gg: AYBFou1eXns9b08LPQMwgkfJlraVPEcqBWQDEbWs9FoljzWyX26CABzgYZySuVhPs2i
	cRQkQqtUsyxou5qLBJaN+SWjsS4r4VoRK5FqOcGqIzQ9HT6Ve3Ea9BBeIYc0e3SnFKG5xuikPwO
	uxBp9IHcT0mUTKqS9c7kkrFeQrot3q2gRB21+RNCBbklbnzj3XxnQI34E7TObfYKw8tHoxcfcKE
	kMmyGePkz/0364J/4zy6sYkEB4sbvYP3v32JCBWvX4Q3OSHqLJncq5qhkRK3q15UYpeta1NqYLS
	5ZpCYz80YQlmTa9jWgQ23yx05w6gXXwd3fA/2ErO4D41+5c8nc7Bm2KyEUzCow4hs6qBnFCCUCv
	IyXO41dpYSaOTJfBQaq2DCmocKBSs9XbHDZvugVY40Ej2QIsU7GS2LH6yZRRuLGKkZopHm8ivVP
	T9TLmFdLb4WSvuvut1H3+vjPj8OcU9Acjj3hY8XA5i9wKFEXAuYu/v9XkdhUMHNwQnYsvm6zxqb
	8Wo8CRTQhn8QqI53hiGiMYFMq0Mb1GSCtJffOB8w39Ksq9hws2AhRsBQMhqMhaqtWz3Z5bBPNZ7
	N73nz8B/wAfGLFFAW9I/libzX4YH33p3Oo2bGKhTxNKLis3BoiGdUsVvqxBc/xWnbmUsAO5MIRg
	yJE2FS8Mrj8yXFeveCC7BsCv4jX6aZb2YMR6iMxyit6ZL3LkqQN8tY90dRuSF6/WARvo4DrEALv
	+jyIxNoMZkSlyZaby7Bb3BMzZ3ZyGa+ZBtPTJYbW5dIKjZFbwhp1gAObyoBJbrJdYGda5y7JZp9
	g==
X-Received: by 2002:a17:90b:3ecd:b0:3b0:ae41:2706 with SMTP id 98e67ed59e1d1-3b182defae2mr1841105a91.4.1794383604238;
        Tue, 10 Nov 2026 23:53:24 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17dba5ed0sm3393597a91.17.2026.11.10.23.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:23 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:20 -0800
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
Subject: [PATCH 4/9] selftests/liveupdate: Catch incorrect file accounting
 across kexec
Message-ID: <d339c0af9c4ee54a5ee8052d5fe59c81302d82a7.1794383544.git.chris@chrisdown.name>
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
index 6f592aec0f85..bce7679279d4 100755
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
index dea5a6fb2abc..76ffea7d4eb8 100755
--- a/tools/testing/selftests/liveupdate/vmtest.sh
+++ b/tools/testing/selftests/liveupdate/vmtest.sh
@@ -145,6 +145,7 @@ function mkinitrd() {
 	cat > "$workspace_dir/cpio_list_inner" <<EOF
 dir /dev 0755 0 0
 dir /proc 0755 0 0
+dir /sys 0755 0 0
 dir /debugfs 0755 0 0
 nod /dev/console 0600 0 0 c 5 1
 file /init $workspace_dir/init 0755 0 0
@@ -157,6 +158,7 @@ EOF
 	cat > "$workspace_dir/cpio_list" <<EOF
 dir /dev 0755 0 0
 dir /proc 0755 0 0
+dir /sys 0755 0 0
 dir /debugfs 0755 0 0
 nod /dev/console 0600 0 0 c 5 1
 file /init $workspace_dir/init 0755 0 0
-- 
2.54.0

