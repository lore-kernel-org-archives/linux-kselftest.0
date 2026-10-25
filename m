Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792944530;
	b=mUMIRewk1MlpV8bpVZW2ZH49fEB4Ef2LItietAp1+rceQ3tiet5UyBmpy3FzVHbhQF3a
	 hNHLfeMtG9OyD6KLNFP75FrkqKmWuG5CcSEW5nILKHwPQr+xN1JSvgnenNbMCCAsrn94s
	 Bpt4QRuaR6dCHCZZ1WjSfaMZW8Ht8wKVE9Y8e3wsx2dSDnFVl0hDm41egd8PkpdNc86Mn
	 MFz/uFhp/TQfQBKJTSb54Nljv+lw9m0223nh/Gi6WdEAlPjUbNh8R5m6R1RayAyw0z5z7
	 Dg59VcwBPQu8xFTlpuL0I3qk/mC7XtCAqaEFut9ZZWOBa19ZZiqOYbVci9RpEFEfebQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792944530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FyjTUzyIpMxlYufFV8klbyjJE78IaWfevFhMkIHqCVE=;
	b=IunQV05ABY7irv9kilIKzbiiQSy0MOZL+O52YwVRIQG3sDNXUkHVw1+hzfrSTvvk7kRH
	 QCRLcUTsOUfewCpwp9krCNu6qeB7WZQQWZKWYWXftLhhnOC/sKc0+19z8AP2BYP5IcXAx
	 a/2ckZTMUW3yObGjGn9knAPHFtjFeWHedcSD4ry5U/ywiYlK6tUkL9MxWictQJYAysCDr
	 XYGWP2EKFW4OLau0qHgbD3bVH0c0SOP+p4EG1AEUiM6MWh7atQcGhWmcWmne/I0sCMqaJ
	 /Iyzey/JJLyQys2Tp+Ex9U1YPsWXc4oL15qp6Xvlmls7qkvjlxx9McWKYi5HZlCrttw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jIZ29EAp;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5ED606A31F
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 16:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB5ED606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jIZ29EAp
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so5429708eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792944528; x=1793549328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FyjTUzyIpMxlYufFV8klbyjJE78IaWfevFhMkIHqCVE=;
        b=jIZ29EAp3gvyIgSwJbditbydq79AT9NG47DZgJGQ6UQ12uzNA99dkHpR9p1XmqkG+u
         Olh0Nlgwkei+9aqkkoeBkCXu7bgsqYU23lpKRV5fpiFeXtWp92JkA95tKp5SD/SLRUsy
         bmHAGEw22LU8YPwgPukF4k9FldYrga9oP8OTb73PrQkYjpnF7nn9DadAxu2uPaSVFIYk
         kA1YhhxLm6ZauGNJBIyQjdJFNyljvyc0Mj3dVYAX7wpPr57bklyr7fU4UXI14uoq51l7
         qG0PFEhjAoIJ1gz2pXVGhnqaTibx+OHhz+0hR0La6e+iIhZhJMbBuO2ESLFaT0A8sYvx
         pNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792944528; x=1793549328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyjTUzyIpMxlYufFV8klbyjJE78IaWfevFhMkIHqCVE=;
        b=huGrUszpwfUr2qWbC1oQYtBFb5/0aj1+jHAdzPmEqguXk/iCD/1Iuw0RcMgG1r4OsT
         1ni26jUZEfsljb7yv/OnK6u7+hDhwImPFfxnrUJPqRCo9n2wfH6skXJ2k3CDxoMFe5WS
         czJqvKPymyth/OQK4nFWVf3KWoDhLut1txlJtbFfFvhUWl3jeWTiRB+8Omlrnp6CEnKY
         fpYoAZe9WhZycBC5y9DYoP9fjnIZ/xa7dQvfF/njdhf+pAhWWyJva7PUsePrUoAKfi2g
         eCSpHovgB0UBqV6JOM7kR2e4SSEZEStWVTePIQ8CVMHBIuqiJneX8fhEto9cF8TKdLVZ
         Ajlg==
X-Forwarded-Encrypted: i=1; AKwUvBxjSqwn85QK/HAgxD7QyXIWT1h3j88M90mMhnuNrODILGnebrlG2RAFUc1m8Y04QoxSUI9Z2v7cn0C0/Kufh0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNpgiJFHf+KlDSdlBRX7JOxbaPx1AT/gBDxIy2FiHrQza/+SLk
	RGikJM65Q/BbBiUEv9G3JESMdsYjjiQ7Ef0kq0xTdN57YUeaiFQP3lBg
X-Gm-Gg: AYBFou025ccAEY5Nnd6k+OOzV8zoAP6D60vP6yASA8grAkKyO4qLK4K9nLA6VKNmmq7
	/4eTfQw87EVtiuBmdvUbFUJPeFzJZey98Mb+A+Vb5nljcGVOaDI/UgaxUUcmVOXhjidUjb13biC
	Yw6A9RgqMN7W6aUFL++CqUJeizSe6FHHymVo/2S4ABZJ2GMlIJklXM2WX486NmQgLrtMHPBut6z
	KIw8BC6GxEfQXV3E1EaE8VIiXOYHp6wDzoJMgfwENjK+UtrJiFjzYxkipRzBWv/ERlB27OwlXGz
	+szMoVpD1Be21xElahkHmT8r/u0WTfylSYzV22rCOGi4y55ACKT1RmXtbR4pEf6YxCQDl0S+iTZ
	BS/RCk1c8hLSVkEtApWMtBObn6Tf7nK4SRr15SHqoVvGR2TyQkMXEVJOmoSoyyPdCvDD7tQfQ6n
	fdSZ8BFsC0dUUaj9RXk8Zlu07r3Vf4Qz47kZUTu+5P5y2QDJqFXxQKDog2RGUcnDf3MVJJCsnmX
	nqAMt5n+7cJR3UHR1mJ9YTMTcqoRbE1qO8/WNdjO6754Nc7AiM6PO7y1UCjmEVMrBkb/Ef2nwHc
	bG+ZYqi57vZUFZIgDs+K
X-Received: by 2002:a05:7022:294:10b0:14d:ef19:246f with SMTP id a92af1059eb24-1993e68e9b0mr5809336c88.45.1792944527652;
        Sun, 25 Oct 2026 09:08:47 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.166])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm16330421c88.3.2026.10.25.09.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:08:47 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>,
	netdev-bot+sashiko@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3] selftests/net: test network sysctl extremes
Date: Sun, 25 Oct 2026 21:39:26 +0530
Message-ID: <20261025160927.3934600-1-sahaj123.sc@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe the accepted lower and upper bounds of per-network-namespace TCP
receive and send memory sysctls, then exercise loopback traffic at each
bound.

Drop udp_rmem_min and udp_wmem_min: one-byte UDP traffic does not create
the memory pressure needed to test them. Keep UDP loopback only as a
transport smoke check.

Link: https://lore.kernel.org/r/20261014041446.2821085-1-sahaj123.sc@gmail.com
Tested: W=1 selftest build; x86_64 QEMU with CONFIG_NET_NS=y.
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>

---
Changes in v3:
- Handle /dev/kmsg EPIPE as lost records and skip an incomplete splat check.
- Use the kselftest result/finish API for skips and final results.
- Drop UDP sysctls that the one-byte traffic did not exercise.
- Match kernel splat signatures without matching task-controlled "BUG:" text.

Scope: In tools/testing/selftests/net, my search found packetdrill and other
scripts that set these sysctls as setup, but no test that probes accepted
bounds, restores the original values, and checks loopback traffic together.
I kept this standalone for now; Eric, would you prefer it folded into an
existing test?

Testing:
- Built sysctl_net_test and nettest with W=1 against netdev/main.
- Ran in x86_64 QEMU with CONFIG_NET_NS=y. The test searched the accepted
  lower and upper bounds of tcp_rmem and tcp_wmem, verified each write by
  reading it back, restored the original values, sent 64-byte TCP and
  one-byte UDP loopback traffic at each bound, and checked /dev/kmsg for
  splats. It tested 2 sysctls and 6 values; TCP and UDP both succeeded
  12/12 times. A task named "BUG:" produced a SIGSEGV record and stack-depth
  notice without a false splat report.
- An ARM64 run on a vendor Linux 6.12.57 kernel accepted tcp_rmem[1]=1 and
  timed out once in 12 TCP attempts; UDP succeeded 12/12. A separate local
  packet-capture probe sent 64-byte payloads with tcp_rmem[1] set to 1, 4096,
  and 131072. It timed out 5/5 times at 1 and delivered 5/5 times at both
  larger values; at 1, SO_RCVBUF was 1 and the SYN/SYN-ACK advertised zero
  windows. This was diagnostic testing, not a regression result for
  netdev/main: that tree and the documentation require each tcp_rmem value
  to be at least 4096.
- The ordinary host invocation skips because this environment cannot create
  a network namespace.
---
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/sysctl_net_test.c | 982 ++++++++++++++++++
 3 files changed, 984 insertions(+)
 create mode 100644 tools/testing/selftests/net/sysctl_net_test.c

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index 21412510ac26..b85cd287b2b7 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -44,6 +44,7 @@ so_netns_cookie
 so_reserve_mem
 so_rcv_listener
 stress_reuseport_listen
+sysctl_net_test
 tap
 tcp_fastopen_backup_key
 tcp_inq
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index df215e1a6262..6bb4226d02eb 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -200,6 +200,7 @@ TEST_GEN_PROGS := \
 	sk_so_peek_off \
 	so_incoming_cpu \
 	so_reserve_mem \
+	sysctl_net_test \
 	tap \
 	tcp_port_share \
 	tls \
diff --git a/tools/testing/selftests/net/sysctl_net_test.c b/tools/testing/selftests/net/sysctl_net_test.c
new file mode 100644
index 000000000000..81b9b32245f4
--- /dev/null
+++ b/tools/testing/selftests/net/sysctl_net_test.c
@@ -0,0 +1,982 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+#include <arpa/inet.h>
+#include <ctype.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <limits.h>
+#include <net/if.h>
+#include <netinet/in.h>
+#include <poll.h>
+#include <sched.h>
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/socket.h>
+#include <sys/stat.h>
+#include <sys/time.h>
+#include <unistd.h>
+
+#include "kselftest.h"
+
+#define SYSCTL_ROOT		"/proc/sys/net"
+#define SYSCTL_TEXT_SIZE	4096
+#define SYSCTL_MAX_VALUES	256
+#define KMSG_TEXT_SIZE		4096
+#define FIRST_TEST_PORT		20000
+#define LAST_TEST_PORT		59998
+
+struct sysctl_number {
+	uint64_t magnitude;
+	bool negative;
+};
+
+struct sysctl_values {
+	struct sysctl_number value[SYSCTL_MAX_VALUES];
+	size_t count;
+};
+
+static int kmsg_fd = -1;
+static bool kernel_log_incomplete;
+static unsigned int next_tcp_port = FIRST_TEST_PORT;
+static unsigned int next_udp_port = FIRST_TEST_PORT;
+static size_t tested_files;
+static size_t skipped_files;
+static size_t tested_values;
+static size_t tcp_attempts;
+static size_t tcp_successes;
+static size_t udp_attempts;
+static size_t udp_successes;
+static char failure[256];
+static char tcp_delivery_failure[256];
+static char udp_delivery_failure[256];
+
+/*
+ * Only add sysctls that are per network namespace and are restored by
+ * writing their original value back. Some sysctls change global state that
+ * the private namespace does not isolate and that cannot be undone.
+ */
+static const char * const representative_sysctls[] = {
+	"ipv4/tcp_rmem",
+	"ipv4/tcp_wmem",
+};
+
+static bool selected_sysctls[ARRAY_SIZE(representative_sysctls)];
+
+static void set_failure(const char *fmt, ...)
+{
+	va_list args;
+
+	if (failure[0])
+		return;
+
+	va_start(args, fmt);
+	vsnprintf(failure, sizeof(failure), fmt, args);
+	va_end(args);
+}
+
+static struct sysctl_number number_from_signed(int64_t value)
+{
+	struct sysctl_number number = {};
+
+	if (value < 0) {
+		number.negative = true;
+		number.magnitude = (uint64_t)(-(value + 1)) + 1;
+	} else {
+		number.magnitude = value;
+	}
+	return number;
+}
+
+static struct sysctl_number number_from_unsigned(uint64_t value)
+{
+	struct sysctl_number number = {
+		.magnitude = value,
+	};
+
+	return number;
+}
+
+static int64_t number_to_signed(struct sysctl_number number)
+{
+	if (!number.negative)
+		return (int64_t)number.magnitude;
+	if (number.magnitude == (UINT64_C(1) << 63))
+		return INT64_MIN;
+	return -(int64_t)number.magnitude;
+}
+
+static bool numbers_equal(struct sysctl_number a, struct sysctl_number b)
+{
+	return a.magnitude == b.magnitude &&
+	       (a.magnitude == 0 || a.negative == b.negative);
+}
+
+static bool format_number(struct sysctl_number number, char *text,
+			  size_t text_size)
+{
+	int n = snprintf(text, text_size, number.negative ? "-%llu" : "%llu",
+			 (unsigned long long)number.magnitude);
+
+	return n >= 0 && (size_t)n < text_size;
+}
+
+static bool parse_values(char *text, struct sysctl_values *values)
+{
+	char *pos = text;
+
+	values->count = 0;
+	while (*pos) {
+		char *end;
+		struct sysctl_number value;
+
+		while (isspace((unsigned char)*pos))
+			pos++;
+		if (!*pos)
+			break;
+		if (values->count == SYSCTL_MAX_VALUES)
+			return false;
+
+		errno = 0;
+		if (*pos == '-') {
+			long long signed_value = strtoll(pos, &end, 10);
+
+			if (end == pos || errno == ERANGE)
+				return false;
+			value = number_from_signed(signed_value);
+		} else {
+			unsigned long long unsigned_value = strtoull(pos, &end, 10);
+
+			if (end == pos || errno == ERANGE)
+				return false;
+			value = number_from_unsigned(unsigned_value);
+		}
+		if (*end && !isspace((unsigned char)*end))
+			return false;
+
+		values->value[values->count++] = value;
+		pos = end;
+	}
+
+	return values->count > 0;
+}
+
+static bool read_values(const char *path, struct sysctl_values *values)
+{
+	char text[SYSCTL_TEXT_SIZE];
+	size_t len = 0;
+	int fd;
+	bool ok = false;
+
+	fd = open(path, O_RDONLY | O_CLOEXEC);
+	if (fd < 0)
+		return false;
+
+	while (len < sizeof(text) - 1) {
+		ssize_t n = read(fd, text + len, sizeof(text) - 1 - len);
+
+		if (n < 0 && errno == EINTR)
+			continue;
+		if (n < 0)
+			goto out;
+		if (!n)
+			break;
+		len += n;
+	}
+	if (len == sizeof(text) - 1)
+		goto out;
+
+	text[len] = '\0';
+	ok = parse_values(text, values);
+out:
+	close(fd);
+	return ok;
+}
+
+static bool values_equal(const struct sysctl_values *a,
+			 const struct sysctl_values *b)
+{
+	size_t i;
+
+	if (a->count != b->count)
+		return false;
+	for (i = 0; i < a->count; i++) {
+		if (!numbers_equal(a->value[i], b->value[i]))
+			return false;
+	}
+	return true;
+}
+
+static bool format_values(const struct sysctl_values *values, char *text,
+			  size_t text_size)
+{
+	size_t i, len = 0;
+
+	for (i = 0; i < values->count; i++) {
+		char number[32];
+		int n;
+
+		if (!format_number(values->value[i], number, sizeof(number)))
+			return false;
+		n = snprintf(text + len, text_size - len, "%s%c", number,
+			     i + 1 == values->count ? '\n' : ' ');
+		if (n < 0 || (size_t)n >= text_size - len)
+			return false;
+		len += n;
+	}
+	return len > 0;
+}
+
+static bool write_values(const char *path,
+			 const struct sysctl_values *values)
+{
+	char text[SYSCTL_TEXT_SIZE];
+	size_t len;
+	ssize_t n;
+	int fd;
+	bool ok;
+
+	if (!format_values(values, text, sizeof(text)))
+		return false;
+	len = strlen(text);
+
+	fd = open(path, O_WRONLY | O_CLOEXEC);
+	if (fd < 0)
+		return false;
+	do {
+		n = write(fd, text, len);
+	} while (n < 0 && errno == EINTR);
+	ok = n == (ssize_t)len;
+	if (close(fd) < 0)
+		ok = false;
+	return ok;
+}
+
+static bool restore_values(const char *path,
+			   const struct sysctl_values *original)
+{
+	struct sysctl_values current;
+
+	if (read_values(path, &current) && values_equal(original, &current))
+		return true;
+	return write_values(path, original) &&
+	       read_values(path, &current) &&
+	       values_equal(original, &current);
+}
+
+static bool check_kernel_log(void)
+{
+	static const char * const splats[] = {
+		"WARNING: possible circular locking dependency",
+		"BUG: unable to handle",
+		"------------[ cut here ]",
+		"Kernel panic - not syncing:",
+		"BUG: KASAN:",
+		"watchdog: BUG: soft lockup",
+		"watchdog: BUG: hard LOCKUP",
+	};
+	static const char * const error_prefixes[] = {
+		"Oops:",
+		"divide error:",
+		"general protection fault:",
+		"invalid opcode:",
+	};
+	char record[KMSG_TEXT_SIZE + 1];
+
+	for (;;) {
+		ssize_t n = read(kmsg_fd, record, sizeof(record) - 1);
+		unsigned long prefix;
+		char *message;
+		size_t i;
+		bool splat = false;
+
+		if (n < 0 && errno == EINTR)
+			continue;
+		if (n < 0 && (errno == EAGAIN || errno == EWOULDBLOCK))
+			return true;
+		if (n < 0 && errno == EPIPE) {
+			kernel_log_incomplete = true;
+			continue;
+		}
+		if (n < 0) {
+			set_failure("cannot read /dev/kmsg: %s", strerror(errno));
+			return false;
+		}
+		if (!n)
+			return true;
+
+		record[n] = '\0';
+		message = strchr(record, ';');
+		if (!message)
+			continue;
+		/* Ignore messages that userspace wrote to /dev/kmsg. */
+		prefix = strtoul(record, NULL, 10);
+		if (prefix >> 3 != 0)
+			continue;
+		message++;
+		for (i = 0; i < ARRAY_SIZE(splats); i++) {
+			if (!strncmp(message, splats[i], strlen(splats[i]))) {
+				splat = true;
+				break;
+			}
+		}
+		if (!splat &&
+		    !strncmp(message, "WARNING: CPU: ", strlen("WARNING: CPU: "))) {
+			char *p = message + strlen("WARNING: CPU: ");
+
+			if (isdigit((unsigned char)*p)) {
+				while (isdigit((unsigned char)*p))
+					p++;
+				if (!strncmp(p, " PID: ", strlen(" PID: "))) {
+					p += strlen(" PID: ");
+					splat = isdigit((unsigned char)*p);
+				}
+			}
+		}
+		for (i = 0; !splat && i < ARRAY_SIZE(error_prefixes); i++) {
+			const char *p;
+
+			if (strncmp(message, error_prefixes[i],
+				    strlen(error_prefixes[i])))
+				continue;
+			p = message + strlen(error_prefixes[i]);
+			splat = *p == ' ' && isxdigit((unsigned char)p[1]);
+		}
+		if (!splat && !strncmp(message, "UBSAN: ", strlen("UBSAN: ")) &&
+		    isalpha((unsigned char)message[strlen("UBSAN: ")]))
+			splat = true;
+		if (!splat &&
+		    !strncmp(message, "INFO: task ", strlen("INFO: task ")) &&
+		    strstr(message, " blocked for more than "))
+			splat = true;
+		if (splat) {
+			set_failure("kernel splat detected: %.180s", message);
+			return false;
+		}
+	}
+}
+
+static uint64_t ordered_value(int64_t value)
+{
+	/* Map signed integers to unsigned keys in numeric order. */
+	return (uint64_t)value ^ (UINT64_C(1) << 63);
+}
+
+static int64_t unordered_value(uint64_t key)
+{
+	uint64_t raw = key ^ (UINT64_C(1) << 63);
+
+	if (raw <= INT64_MAX)
+		return (int64_t)raw;
+	return -1 - (int64_t)(UINT64_MAX - raw);
+}
+
+static int probe_value(const char *path, const struct sysctl_values *original,
+		       size_t index, struct sysctl_number candidate,
+		       bool *accepted)
+{
+	struct sysctl_values expected = *original;
+	struct sysctl_values current;
+	char text[32];
+
+	expected.value[index] = candidate;
+	*accepted = false;
+
+	if (write_values(path, &expected) &&
+	    read_values(path, &current) &&
+	    values_equal(&expected, &current))
+		*accepted = true;
+
+	if (!restore_values(path, original)) {
+		format_number(candidate, text, sizeof(text));
+		set_failure("failed to restore %s after probing %s", path, text);
+		return -1;
+	}
+	if (!check_kernel_log())
+		return -1;
+	return 0;
+}
+
+static uint64_t next_step(uint64_t step)
+{
+	if (step > UINT64_MAX / 2)
+		return UINT64_MAX;
+	return step * 2;
+}
+
+static int find_bound(const char *path,
+		      const struct sysctl_values *original, size_t index,
+		      bool lower, bool unsigned_domain,
+		      struct sysctl_number *bound)
+{
+	struct sysctl_number start = original->value[index];
+	uint64_t valid = unsigned_domain ? start.magnitude :
+			 ordered_value(number_to_signed(start));
+	uint64_t step = 1;
+
+	for (;;) {
+		uint64_t candidate, invalid;
+		bool accepted;
+
+		if (lower) {
+			if (!valid)
+				break;
+			candidate = valid > step ? valid - step : 0;
+		} else {
+			if (valid == UINT64_MAX)
+				break;
+			candidate = UINT64_MAX - valid < step ?
+				    UINT64_MAX : valid + step;
+		}
+		if (candidate == valid)
+			break;
+
+		if (probe_value(path, original, index,
+				unsigned_domain ? number_from_unsigned(candidate) :
+				number_from_signed(unordered_value(candidate)),
+				&accepted))
+			return -1;
+		if (accepted) {
+			valid = candidate;
+			step = next_step(step);
+			continue;
+		}
+
+		invalid = candidate;
+		while (lower ? valid - invalid > 1 : invalid - valid > 1) {
+			uint64_t middle = lower ?
+					  invalid + (valid - invalid) / 2 :
+					  valid + (invalid - valid) / 2;
+
+			if (probe_value(path, original, index,
+					unsigned_domain ?
+					number_from_unsigned(middle) :
+					number_from_signed(unordered_value(middle)),
+					&accepted))
+				return -1;
+			if (accepted)
+				valid = middle;
+			else
+				invalid = middle;
+		}
+		break;
+	}
+
+	*bound = unsigned_domain ? number_from_unsigned(valid) :
+		 number_from_signed(unordered_value(valid));
+	return 0;
+}
+
+static int find_lower_bound(const char *path,
+			    const struct sysctl_values *original,
+			    size_t index, struct sysctl_number *bound)
+{
+	struct sysctl_number start = original->value[index];
+	bool unsigned_domain = !start.negative && start.magnitude > INT64_MAX;
+
+	return find_bound(path, original, index, true, unsigned_domain, bound);
+}
+
+static int find_upper_bound(const char *path,
+			    const struct sysctl_values *original,
+			    size_t index, struct sysctl_number *bound)
+{
+	bool unsigned_domain = !original->value[index].negative;
+
+	return find_bound(path, original, index, false, unsigned_domain, bound);
+}
+
+static int get_port_pair(bool tcp, uint16_t *server, uint16_t *client)
+{
+	unsigned int *next = tcp ? &next_tcp_port : &next_udp_port;
+
+	if (*next > LAST_TEST_PORT) {
+		errno = EADDRNOTAVAIL;
+		return -1;
+	}
+	*server = *next;
+	*client = *next + 1;
+	*next += 2;
+	return 0;
+}
+
+static int bind_loopback(int fd, uint16_t port)
+{
+	struct sockaddr_in addr = {
+		.sin_family = AF_INET,
+		.sin_port = htons(port),
+		.sin_addr.s_addr = htonl(INADDR_LOOPBACK),
+	};
+
+	return bind(fd, (struct sockaddr *)&addr, sizeof(addr));
+}
+
+static int wait_readable(int fd)
+{
+	struct pollfd pfd = {
+		.fd = fd,
+		.events = POLLIN,
+	};
+	int ret;
+
+	ret = poll(&pfd, 1, 1000);
+	if (ret < 0)
+		return -1;
+	if (!ret) {
+		errno = ETIMEDOUT;
+		return -1;
+	}
+	if (!(pfd.revents & POLLIN)) {
+		errno = EIO;
+		return -1;
+	}
+	return 0;
+}
+
+static int tcp_loopback(void)
+{
+	struct timeval timeout = { .tv_sec = 1 };
+	uint16_t server_port, client_port;
+	char data[64] = { 1 };
+	char received[sizeof(data)];
+	int listener = -1, client = -1, server = -1;
+	int ret = -1;
+	ssize_t n;
+
+	if (get_port_pair(true, &server_port, &client_port))
+		return -1;
+	listener = socket(AF_INET, SOCK_STREAM | SOCK_CLOEXEC, 0);
+	client = socket(AF_INET, SOCK_STREAM | SOCK_CLOEXEC, 0);
+	if (listener < 0 || client < 0 ||
+	    setsockopt(client, SOL_SOCKET, SO_SNDTIMEO, &timeout,
+		       sizeof(timeout)) ||
+	    bind_loopback(listener, server_port) ||
+	    listen(listener, 1) || bind_loopback(client, client_port))
+		goto out;
+
+	{
+		struct sockaddr_in addr = {
+			.sin_family = AF_INET,
+			.sin_port = htons(server_port),
+			.sin_addr.s_addr = htonl(INADDR_LOOPBACK),
+		};
+
+		if (connect(client, (struct sockaddr *)&addr, sizeof(addr)))
+			goto out;
+	}
+
+	if (wait_readable(listener))
+		goto out;
+	server = accept4(listener, NULL, NULL, SOCK_CLOEXEC);
+	if (server < 0)
+		goto out;
+	n = send(client, data, sizeof(data), MSG_NOSIGNAL);
+	if (n <= 0) {
+		if (!n)
+			errno = EPIPE;
+		goto out;
+	}
+	if (wait_readable(server))
+		goto out;
+
+	n = recv(server, received, sizeof(received), 0);
+	if (n <= 0) {
+		if (!n)
+			errno = ECONNRESET;
+		goto out;
+	}
+	ret = 0;
+out:
+	if (server >= 0)
+		close(server);
+	if (client >= 0)
+		close(client);
+	if (listener >= 0)
+		close(listener);
+	return ret;
+}
+
+static int udp_loopback(void)
+{
+	uint16_t server_port, client_port;
+	struct sockaddr_in addr = {
+		.sin_family = AF_INET,
+		.sin_addr.s_addr = htonl(INADDR_LOOPBACK),
+	};
+	char data = 1, received;
+	int server = -1, client = -1;
+	int ret = -1;
+	ssize_t n;
+
+	if (get_port_pair(false, &server_port, &client_port))
+		return -1;
+	server = socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, 0);
+	client = socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, 0);
+	if (server < 0 || client < 0 || bind_loopback(server, server_port) ||
+	    bind_loopback(client, client_port))
+		goto out;
+
+	addr.sin_port = htons(server_port);
+	n = sendto(client, &data, sizeof(data), 0, (struct sockaddr *)&addr,
+		   sizeof(addr));
+	if (n != sizeof(data)) {
+		if (n >= 0)
+			errno = EIO;
+		goto out;
+	}
+	if (wait_readable(server))
+		goto out;
+
+	n = recv(server, &received, sizeof(received), 0);
+	if (n != sizeof(received)) {
+		if (n >= 0)
+			errno = EIO;
+		goto out;
+	}
+	ret = 0;
+out:
+	if (client >= 0)
+		close(client);
+	if (server >= 0)
+		close(server);
+	return ret;
+}
+
+static void run_loopback_traffic(const char *path, size_t index,
+				 const char *value)
+{
+	int err;
+
+	tcp_attempts++;
+	if (!tcp_loopback()) {
+		tcp_successes++;
+	} else {
+		err = errno;
+		if (!tcp_delivery_failure[0])
+			snprintf(tcp_delivery_failure,
+				 sizeof(tcp_delivery_failure),
+				 "%s[%zu]=%s: %s", path, index, value,
+				 strerror(err));
+	}
+
+	/* UDP is a transport smoke check, not udp_*_min pressure coverage. */
+	udp_attempts++;
+	if (!udp_loopback()) {
+		udp_successes++;
+	} else {
+		err = errno;
+		if (!udp_delivery_failure[0])
+			snprintf(udp_delivery_failure,
+				 sizeof(udp_delivery_failure),
+				 "%s[%zu]=%s: %s", path, index, value,
+				 strerror(err));
+	}
+}
+
+static int exercise_value(const char *path,
+			  const struct sysctl_values *original,
+			  size_t index, struct sysctl_number value)
+{
+	struct sysctl_values expected = *original;
+	char text[32];
+	bool restore = !numbers_equal(value, original->value[index]);
+	bool applied = false;
+
+	if (!format_number(value, text, sizeof(text))) {
+		set_failure("cannot format boundary for %s", path);
+		return -1;
+	}
+	if (restore) {
+		struct sysctl_values current;
+
+		expected.value[index] = value;
+		applied = write_values(path, &expected) &&
+			  read_values(path, &current) &&
+			  values_equal(&expected, &current);
+		if (!applied) {
+			if (!restore_values(path, original)) {
+				set_failure("failed to restore %s after setting %s",
+					    path, text);
+				return -1;
+			}
+			set_failure("%s no longer accepts boundary %s", path, text);
+			return -1;
+		}
+	}
+
+	check_kernel_log();
+	if (!failure[0])
+		run_loopback_traffic(path, index, text);
+
+	if (restore && !restore_values(path, original)) {
+		format_number(value, text, sizeof(text));
+		set_failure("failed to restore %s after traffic at %s", path,
+			    text);
+	}
+	check_kernel_log();
+	return failure[0] ? -1 : 0;
+}
+
+static bool prepare_sysctl(const char *path,
+			   const struct sysctl_values *original)
+{
+	struct sysctl_values current;
+	bool writable;
+
+	writable = write_values(path, original) &&
+		   read_values(path, &current) &&
+		   values_equal(original, &current);
+	if (!writable && !restore_values(path, original)) {
+		set_failure("failed to restore %s after initial write", path);
+		return false;
+	}
+	if (!check_kernel_log())
+		return false;
+	return writable;
+}
+
+static int test_sysctl(const char *path, const struct sysctl_values *original)
+{
+	size_t i;
+
+	if (!prepare_sysctl(path, original)) {
+		if (!failure[0]) {
+			skipped_files++;
+			printf("# SKIP %s: sysctl is not writable\n", path);
+		}
+		return failure[0] ? -1 : 0;
+	}
+
+	tested_files++;
+	for (i = 0; i < original->count; i++) {
+		struct sysctl_number lower, upper;
+
+		if (find_lower_bound(path, original, i, &lower) ||
+		    find_upper_bound(path, original, i, &upper))
+			return -1;
+		if (exercise_value(path, original, i, lower) ||
+		    (!numbers_equal(upper, lower) &&
+		     exercise_value(path, original, i, upper)))
+			return -1;
+		tested_values++;
+	}
+	return 0;
+}
+
+static void print_usage(FILE *stream, const char *program)
+{
+	size_t i;
+
+	fprintf(stream, "Usage: %s [-s SYSCTL ...]\n", program);
+	fprintf(stream, "  -s, --sysctl SYSCTL  Test a representative sysctl (repeatable)\n");
+	fprintf(stream, "  -h, --help           Show this help\n");
+	fprintf(stream, "Default sysctls:\n");
+	for (i = 0; i < ARRAY_SIZE(representative_sysctls); i++)
+		fprintf(stream, "  %s\n", representative_sysctls[i]);
+}
+
+static int parse_options(int argc, char **argv)
+{
+	static const struct option options[] = {
+		{ "help", no_argument, NULL, 'h' },
+		{ "sysctl", required_argument, NULL, 's' },
+		{}
+	};
+	bool selection_given = false;
+	int option;
+
+	while ((option = getopt_long(argc, argv, "hs:", options, NULL)) != -1) {
+		switch (option) {
+		case 's': {
+			size_t i;
+
+			selection_given = true;
+			for (i = 0; i < ARRAY_SIZE(representative_sysctls); i++) {
+				if (strcmp(optarg, representative_sysctls[i]))
+					continue;
+				selected_sysctls[i] = true;
+				break;
+			}
+			if (i == ARRAY_SIZE(representative_sysctls)) {
+				fprintf(stderr, "Unknown sysctl: %s\n", optarg);
+				goto invalid_options;
+			}
+			break;
+		}
+		case 'h':
+			print_usage(stdout, argv[0]);
+			return 1;
+		default:
+			goto invalid_options;
+		}
+	}
+	if (optind != argc)
+		goto invalid_options;
+
+	if (!selection_given) {
+		size_t i;
+
+		for (i = 0; i < ARRAY_SIZE(representative_sysctls); i++)
+			selected_sysctls[i] = true;
+	}
+	return 0;
+
+invalid_options:
+	print_usage(stderr, argv[0]);
+	return -1;
+}
+
+static int test_selected_sysctl(const char *name)
+{
+	char path[PATH_MAX];
+	struct sysctl_values values;
+	int n;
+
+	n = snprintf(path, sizeof(path), "%s/%s", SYSCTL_ROOT, name);
+	if (n < 0 || (size_t)n >= sizeof(path)) {
+		set_failure("sysctl path is too long: %s", name);
+		return -1;
+	}
+
+	if (access(path, F_OK)) {
+		if (errno == ENOENT || errno == ENOTDIR) {
+			skipped_files++;
+			printf("# SKIP %s: not available\n", name);
+			return 0;
+		}
+		set_failure("cannot inspect %s: %s", path, strerror(errno));
+		return -1;
+	}
+	if (access(path, R_OK)) {
+		int err = errno;
+
+		skipped_files++;
+		printf("# SKIP %s: not readable (%s)\n", name, strerror(err));
+		return 0;
+	}
+	if (!read_values(path, &values)) {
+		set_failure("%s is not a readable numeric sysctl", path);
+		return -1;
+	}
+	if (access(path, W_OK)) {
+		int err = errno;
+
+		skipped_files++;
+		printf("# SKIP %s: not writable (%s)\n", name, strerror(err));
+		return 0;
+	}
+
+	printf("# Testing %s\n", name);
+	return test_sysctl(path, &values);
+}
+
+static int set_loopback_up(void)
+{
+	struct ifreq ifr = {};
+	int fd, ret = -1;
+
+	fd = socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, 0);
+	if (fd < 0)
+		return -1;
+	strncpy(ifr.ifr_name, "lo", IFNAMSIZ - 1);
+	if (ioctl(fd, SIOCGIFFLAGS, &ifr))
+		goto out;
+	ifr.ifr_flags |= IFF_UP;
+	ret = ioctl(fd, SIOCSIFFLAGS, &ifr);
+out:
+	close(fd);
+	return ret;
+}
+
+int main(int argc, char **argv)
+{
+	int option_status;
+	size_t i;
+
+	option_status = parse_options(argc, argv);
+	if (option_status > 0)
+		return KSFT_PASS;
+	if (option_status < 0)
+		return KSFT_FAIL;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	if (unshare(CLONE_NEWNET)) {
+		ksft_test_result_skip("cannot create network namespace: %s\n",
+				      strerror(errno));
+		ksft_finished();
+	}
+
+	kmsg_fd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK | O_CLOEXEC);
+	if (kmsg_fd < 0) {
+		ksft_test_result_skip("cannot read /dev/kmsg: %s\n",
+				      strerror(errno));
+		ksft_finished();
+	}
+	if (lseek(kmsg_fd, 0, SEEK_END) < 0) {
+		ksft_test_result_skip("cannot seek /dev/kmsg: %s\n",
+				      strerror(errno));
+		close(kmsg_fd);
+		ksft_finished();
+	}
+	if (set_loopback_up()) {
+		ksft_test_result_skip("cannot bring loopback up: %s\n",
+				      strerror(errno));
+		close(kmsg_fd);
+		ksft_finished();
+	}
+	if (!check_kernel_log())
+		goto fail;
+
+	for (i = 0; i < ARRAY_SIZE(representative_sysctls); i++) {
+		if (!selected_sysctls[i])
+			continue;
+		if (test_selected_sysctl(representative_sysctls[i]))
+			break;
+	}
+	if (!failure[0] && !tested_files) {
+		close(kmsg_fd);
+		ksft_test_result_skip("no selected writable numeric network sysctls found\n");
+		ksft_finished();
+	}
+	if (!failure[0] && (!tcp_successes || !udp_successes))
+		set_failure("loopback delivery incomplete: TCP %zu/%zu, UDP %zu/%zu",
+			    tcp_successes, tcp_attempts,
+			    udp_successes, udp_attempts);
+	if (!failure[0] && !check_kernel_log())
+		goto fail;
+	if (tcp_delivery_failure[0])
+		printf("# first TCP delivery failure: %s\n",
+		       tcp_delivery_failure);
+	if (udp_delivery_failure[0])
+		printf("# first UDP delivery failure: %s\n",
+		       udp_delivery_failure);
+	if (failure[0])
+		goto fail;
+	if (kernel_log_incomplete) {
+		printf("# printk records were lost; kernel splat check is incomplete\n");
+		close(kmsg_fd);
+		ksft_test_result_skip("cannot complete kernel splat check\n");
+		ksft_finished();
+	}
+
+	printf("# tested %zu sysctls, %zu values; skipped %zu\n",
+	       tested_files, tested_values, skipped_files);
+	close(kmsg_fd);
+	ksft_test_result_pass("TCP/UDP loopback smoke: TCP %zu/%zu, UDP %zu/%zu\n",
+			      tcp_successes, tcp_attempts, udp_successes,
+			      udp_attempts);
+	ksft_finished();
+
+fail:
+	close(kmsg_fd);
+	ksft_test_result_fail("%s\n", failure);
+	ksft_finished();
+}
-- 
2.43.0
