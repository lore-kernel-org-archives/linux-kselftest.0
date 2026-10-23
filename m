Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714673;
	b=NvVC1ABsjIoHedZtMW2JUCSVtZEUh5m5k0enZeu9khUhDqkvUILUKwV725fgL3ZG/ZXJ
	 Q53cTiV9o49j0iCq0TtxdPptiSlemh3KPRVGFLK+/tOo9fBZ1KA5oulroGxBKswJjTSOE
	 iPLKHXQa/1xHftnrp6+InxF4RiFa8TpMMdD4bVN9/0CBHRp8nw+561hXTKWqpBCU5crb2
	 z4ZRdsw3CDMcMxYvQ95CX2ywvNUedITDc7RTIiydmx3QWmXGJZiUnk1Z5hTezZxVZjwD7
	 vnVRK4LkHjtJYY1On9rG0K+LRDyiuRhpeBPX6wLEQzLaIsmS93Uf5znn+BTYr3uen5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7EFy5TBdHMksgH+69ZcrASpy/wdwGEGDCoyxJAdEsHI=;
	b=YvyTO6o8jEQdh3/BubDnKyknhLPUUuJeJis6+npurrmvNcYuH2XYRY9C01Om+DYpGd/V
	 Y2Eg8ylb3AReAy+ij0vozy0xMzqDpRMt7ery7J3BPxvGNSHdoV8phEoM1R9MRF0vfZooI
	 8I7Ru4gqYGnglFaUfvEBDd4JlROB6m2YoshSjXBh9xz1sLF8OYbATB60xovmZAM2KM1H7
	 9yrqMO+KdT4HOWlI5Dia7dQHmvWOcL1O/TJJhc9Jo1ibyiZTJB/I5edYtyjjhspzTWWQF
	 tArgMlq3odWpYhLW2fr3bOxfHNMCzCmq2vf+QIxUh+9BT3ptS48icOhGc+KwN4/CYhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TFQQx6U2;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779DB606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 00:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TFQQx6U2
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3692c5b061bso1028188eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 17:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714668; x=1793319468; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EFy5TBdHMksgH+69ZcrASpy/wdwGEGDCoyxJAdEsHI=;
        b=TFQQx6U2EiKbu6SJnHUGVeigXOoIYMVy+4L7g4STrrNBF8WunQytKeEpCGzzGCs76r
         vo1R3xq9X83PauDnlHEMqNZnoFwhVRlvlZkICLLehriSd2PxNJJfr9Jz0TmB+jPaX3n6
         B6dakkjvsoP9Icza5n7eEmEjuFmlcxpvC9GYmbBEO/aZh+ctE+0Xmu9q7CbS9QZstBGK
         mmgjZ3G12sUasm8wZwRktdTA/5GujKpKQRNiV0/SRcudBxnlkHmYb52PhDadiuJFWlw6
         mYjoBju0sgpJ2gmOtvqloecYQLsjKDGYOF4grRhxNZVxeUnQeAlfz8OBEum0cSi24ZLy
         t3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714668; x=1793319468;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EFy5TBdHMksgH+69ZcrASpy/wdwGEGDCoyxJAdEsHI=;
        b=OGS5M1SSn0mFmFj+BqA3yOfboC8URrMbwuP+NOyCzNkZEhZaRMr/xvOMb3QQaKhcQS
         5IXqdrD/+FLx8IP28fjbah5zmXV0DTCprWrRoCyVPXXHkWjBdEDfdE1zoxp3zrCS1RcW
         7AVDvI2dNc1751K7wJ+9Zc5lWXbKs0UKkiVNWW6HAHRvsZGeBlEDgqjOSmcFofqLy049
         M7NvMd8oaiFrwKO0Q0FsQTbY+IGpZv8Fh7UuqA4mh10VWU4mI7McD0iS76l5cehr02b1
         F+R/1rG+L+gSTc+bwZptY9fO1HbHmec7/DKzlX3qVs+KGrvSwyObO5Jj4B2EgXI4IcIq
         IlUA==
X-Forwarded-Encrypted: i=1; AKwUvBwgZMG5bDISsWpu7Iv8wtn062Hblq4nLHmkHZsPjFxksmm4PhSIhBEgR4sl33wTgZGOnFMWkUFgIMiZMt3sNJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2SQgvYOKyR/cE3C3DXfj6qGmg8/1ZaObTBIGwFuVlzWA0KUr3
	GRv8RnmXaQvkGW7S8KlQ4so5Vf/B3y4tmRlV2fuGYeZmYUpMnKs4o+v5MsCmrHFvF2nXmSFGW2s
	7la2HWOkk7hIVFg==
X-Received: from dydr21.prod.google.com ([2002:a05:7300:50f5:b0:369:45ee:40a0])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:881c:20b0:366:c497:610c with SMTP id 5a478bee46e88-369d9833dfdmr918007eec.33.1792714667128;
 Thu, 22 Oct 2026 17:17:47 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:07 -0700
In-Reply-To: <20261023001603.560210-8-wusamuel@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023001603.560210-14-wusamuel@google.com>
Subject: [PATCH bpf-next v2 6/6] selftests/proc: Add KALLSYMS_QUERY tests
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add a selftest for the KALLSYMS_QUERY ioctl() on /proc/kallsyms.

For symbol-to-address lookup (KALLSYMS_QUERY_BY_SYMBOL), cover valid
lookups, missing symbols (-ENOENT), input validation (-EINVAL, -EFAULT,
-ENAMETOOLONG, -E2BIG), and extensible struct size handling.

For address-to-symbol lookup (KALLSYMS_QUERY_BY_ADDR), cover lookups at
exact symbol start and interior offsets, buffer truncation
(-ENAMETOOLONG), unmapped addresses (-ENOENT), and input validation
(-EINVAL, -EFAULT).

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/testing/selftests/proc/.gitignore       |   1 +
 tools/testing/selftests/proc/Makefile         |   1 +
 .../selftests/proc/proc-kallsyms-query.c      | 213 ++++++++++++++++++
 3 files changed, 215 insertions(+)
 create mode 100644 tools/testing/selftests/proc/proc-kallsyms-query.c

diff --git a/tools/testing/selftests/proc/.gitignore b/tools/testing/selftests/proc/.gitignore
index 9c9735570abf..1762c28f524c 100644
--- a/tools/testing/selftests/proc/.gitignore
+++ b/tools/testing/selftests/proc/.gitignore
@@ -4,6 +4,7 @@
 /fd-003-kthread
 /proc-2-is-kthread
 /proc-fsconfig-hidepid
+/proc-kallsyms-query
 /proc-loadavg-001
 /proc-maps-race
 /proc-multiple-procfs
diff --git a/tools/testing/selftests/proc/Makefile b/tools/testing/selftests/proc/Makefile
index a7de2bb6d8be..dc3c28e6b83b 100644
--- a/tools/testing/selftests/proc/Makefile
+++ b/tools/testing/selftests/proc/Makefile
@@ -29,6 +29,7 @@ TEST_GEN_PROGS += setns-sysvipc
 TEST_GEN_PROGS += thread-self
 TEST_GEN_PROGS += proc-multiple-procfs
 TEST_GEN_PROGS += proc-fsconfig-hidepid
+TEST_GEN_PROGS += proc-kallsyms-query
 TEST_GEN_PROGS += proc-pidns
 
 include ../lib.mk
diff --git a/tools/testing/selftests/proc/proc-kallsyms-query.c b/tools/testing/selftests/proc/proc-kallsyms-query.c
new file mode 100644
index 000000000000..229cde432d6a
--- /dev/null
+++ b/tools/testing/selftests/proc/proc-kallsyms-query.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Tests for KALLSYMS_QUERY ioctl() on /proc/kallsyms.
+ */
+#undef NDEBUG
+#include <assert.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+#include <linux/fs.h>
+
+#include "kselftest.h"
+
+#define KSYM_NAME_LEN 512
+
+struct kallsyms_query_ext {
+	struct kallsyms_query v0;
+	__u64 extra;
+};
+
+static int do_query(int fd, void *q)
+{
+	return ioctl(fd, KALLSYMS_QUERY, q) < 0 ? -errno : 0;
+}
+
+static struct kallsyms_query sym_query(const char *name)
+{
+	return (struct kallsyms_query){
+		.size = sizeof(struct kallsyms_query),
+		.query_flags = KALLSYMS_QUERY_BY_SYMBOL,
+		.sym_name_addr = (__u64)(uintptr_t)name,
+	};
+}
+
+static int query_symbol(int fd, const char *name, struct kallsyms_query *q)
+{
+	*q = sym_query(name);
+	return do_query(fd, q);
+}
+
+static int query_addr(int fd, unsigned long long addr, char *buf,
+		      size_t buf_sz, struct kallsyms_query *q)
+{
+	*q = (struct kallsyms_query){
+		.size = sizeof(*q),
+		.query_flags = KALLSYMS_QUERY_BY_ADDR,
+		.sym_name_addr = (__u64)(uintptr_t)buf,
+		.sym_addr = addr,
+		.sym_name_size = buf_sz,
+	};
+	return do_query(fd, q);
+}
+
+static bool find_vmlinux_symbol(const char *target, unsigned long long *addr_out)
+{
+	char name[KSYM_NAME_LEN];
+	char line[1024];
+	char type;
+	char mod;
+	FILE *f;
+
+	f = fopen("/proc/kallsyms", "r");
+	if (!f)
+		return false;
+
+	while (fgets(line, sizeof(line), f)) {
+		if (sscanf(line, "%llx %c %511s %c", addr_out, &type, name, &mod) == 3 &&
+		    strcmp(name, target) == 0) {
+			fclose(f);
+			return true;
+		}
+	}
+	fclose(f);
+	return false;
+}
+
+int main(void)
+{
+	const char *sym_name = "vfs_read";
+	char resolved_name[KSYM_NAME_LEN];
+	char long_name[KSYM_NAME_LEN + 1];
+	size_t page_size = sysconf(_SC_PAGESIZE);
+	unsigned long long exp_addr;
+	struct kallsyms_query_ext q1;
+	struct kallsyms_query q;
+	char *page_buf;
+	int err;
+	int fd;
+
+	fd = open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		if (errno == ENOENT)
+			return KSFT_SKIP;
+		ksft_exit_fail_msg("open(/proc/kallsyms) failed: %s\n",
+				   strerror(errno));
+	}
+
+	if (!find_vmlinux_symbol(sym_name, &exp_addr)) {
+		close(fd);
+		return KSFT_SKIP;
+	}
+
+	/* CASE 1: Valid vmlinux symbol query (or -EPERM when addresses are hidden) */
+	err = query_symbol(fd, sym_name, &q);
+	if (err == -ENOTTY) {
+		close(fd);
+		return KSFT_SKIP;
+	}
+	if (!exp_addr) {
+		assert(err == -EPERM);
+		close(fd);
+		ksft_exit_skip("kallsyms addresses are hidden, only -EPERM checked\n");
+	}
+	assert(err == 0);
+	assert(q.sym_addr == exp_addr);
+
+	/* CASE 2: Missing symbol returns -ENOENT */
+	assert(query_symbol(fd, "__nonexistent_kallsyms_symbol__", &q) == -ENOENT);
+
+	/* CASE 3: Empty symbol name returns -EINVAL */
+	assert(query_symbol(fd, "", &q) == -EINVAL);
+
+	/* CASE 4: NULL sym_name_addr returns -EFAULT */
+	assert(query_symbol(fd, NULL, &q) == -EFAULT);
+
+	/* CASE 5: Symbol name >= KSYM_NAME_LEN returns -ENAMETOOLONG */
+	memset(long_name, 'a', KSYM_NAME_LEN);
+	long_name[KSYM_NAME_LEN] = '\0';
+	assert(query_symbol(fd, long_name, &q) == -ENAMETOOLONG);
+
+	/* CASE 6: Symbol name == KSYM_NAME_LEN - 1 returns -ENOENT */
+	long_name[KSYM_NAME_LEN - 1] = '\0';
+	assert(query_symbol(fd, long_name, &q) == -ENOENT);
+
+	/* CASE 7: Zero, multiple, or unknown query_flags return -EINVAL */
+	q = sym_query(sym_name);
+	q.query_flags = 0;
+	assert(do_query(fd, &q) == -EINVAL);
+	q.query_flags = KALLSYMS_QUERY_BY_SYMBOL | KALLSYMS_QUERY_BY_ADDR;
+	assert(do_query(fd, &q) == -EINVAL);
+	q.query_flags = 1ULL << 63;
+	assert(do_query(fd, &q) == -EINVAL);
+
+	/* CASE 8: Non-zero output fields on input in symbol mode return -EINVAL */
+	q = sym_query(sym_name);
+	q.sym_addr = 1;
+	assert(do_query(fd, &q) == -EINVAL);
+	q = sym_query(sym_name);
+	q.sym_name_size = 1;
+	assert(do_query(fd, &q) == -EINVAL);
+
+	/* CASE 9: size < minimum size returns -EINVAL */
+	q = sym_query(sym_name);
+	q.size = KALLSYMS_QUERY_SIZE_VER0 - 8;
+	assert(do_query(fd, &q) == -EINVAL);
+
+	/* CASE 10: size > PAGE_SIZE returns -E2BIG */
+	q = sym_query(sym_name);
+	q.size = page_size + 8;
+	assert(do_query(fd, &q) == -E2BIG);
+
+	/* CASE 11: Larger extensible struct with zeroed trailing bytes succeeds */
+	q1 = (struct kallsyms_query_ext){ .v0 = sym_query(sym_name) };
+	q1.v0.size = sizeof(q1);
+	assert(do_query(fd, &q1) == 0);
+	assert(q1.v0.sym_addr == exp_addr);
+
+	/*
+	 * CASE 12: Larger struct with non-zero trailing bytes returns -E2BIG.
+	 * Set the last byte of a page-sized struct so that future fields do
+	 * not change the result.
+	 */
+	page_buf = calloc(1, page_size);
+	assert(page_buf);
+	q = sym_query(sym_name);
+	q.size = page_size;
+	memcpy(page_buf, &q, sizeof(q));
+	page_buf[page_size - 1] = 1;
+	assert(do_query(fd, page_buf) == -E2BIG);
+	free(page_buf);
+
+	/* CASE 13: Valid address-to-symbol query (exact start + interior offset) */
+	memset(resolved_name, 0, sizeof(resolved_name));
+	assert(query_addr(fd, exp_addr, resolved_name, sizeof(resolved_name), &q) == 0);
+	assert(strcmp(resolved_name, sym_name) == 0);
+	assert(q.sym_addr == exp_addr);
+	assert(q.sym_name_size == strlen(sym_name) + 1);
+
+	memset(resolved_name, 0, sizeof(resolved_name));
+	assert(query_addr(fd, exp_addr + 1, resolved_name, sizeof(resolved_name), &q) == 0);
+	assert(strcmp(resolved_name, sym_name) == 0);
+	assert(q.sym_addr == exp_addr + 1);
+	assert(q.sym_name_size == strlen(sym_name) + 1);
+
+	/* CASE 14: KALLSYMS_QUERY_BY_ADDR with buffer too small returns -ENAMETOOLONG */
+	assert(query_addr(fd, exp_addr, resolved_name, strlen(sym_name), &q) == -ENAMETOOLONG);
+
+	/* CASE 15: KALLSYMS_QUERY_BY_ADDR on unmapped address returns -ENOENT */
+	assert(query_addr(fd, ~0ULL, resolved_name, sizeof(resolved_name), &q) == -ENOENT);
+
+	/* CASE 16: KALLSYMS_QUERY_BY_ADDR invalid inputs return -EINVAL or -EFAULT */
+	assert(query_addr(fd, exp_addr, resolved_name, 0, &q) == -EINVAL);
+	assert(query_addr(fd, exp_addr, NULL, sizeof(resolved_name), &q) == -EFAULT);
+
+	close(fd);
+	return 0;
+}
-- 
2.56.0.257.gf7497c7d27-goog

