Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A473CCFC0
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778858177; cv=none; b=Nyxn53jq5ZeV2iGOuFyv++dfP3KnAhDM4vD3GLIDquckRguD09qQJA8AlRQcH+TDSfjJlv0PzMcy7TItQDBYXqGAiWkSppWqvfO/8Gp2YWsZC7kqo1TrOepTjSFY8ZDRbiCi9EmRjkZwfVGhMIpnzoho3JjNBpNZikGetLeidSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778858177; c=relaxed/simple;
	bh=GIJIJDp6NwwYX0Q1AbNNOxWqITIK3rl3pHKEHpkJ2us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5yANUeVqbF8iD0wvatRQlUqMqWOlHax1n2FpQxOjf/zaGPh3BEb2ptc753sGwgg6aYgB96HRqcRRgqErLkQeLEOfB0oi2UiYSCCbOpgOfy972lj9aFYAg49crRFe30InGS+fRC2djvIkEZH72COHncBb8GMbFSGPsnpjUUVcXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=lFH9Kiad; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="lFH9Kiad"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65c2428c49eso1074342d50.0
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 08:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1778858174; x=1779462974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1gP18CObPDJD3QB+9rYWPUzAtOZhH2+QD3gPrVbM98=;
        b=lFH9Kiad8WOQl2SddwASMzOlFrl8dYOSDTWgrWpfmZ6gmHkwff/wlFwYPpcMx9WA6z
         sCbJgrjgTMObh59mzYk6io1jUoDFX+VDP9RNhqB+C19ecbSSrv2KTUlNt/UAwJyNzKpb
         Nu0E9PL3l4fvMYucVXfJmWceP5qKlcMGZrvuFzQ4f9Qk0QOf09wuqSKEbQLqKviiTpIO
         +7P/FtGssH5PrzGmx9jHVWDjbukAOAw/AWDOxq+vyJLaVFZGD/C/FNL91FSVFTrGEtYU
         qp8S6j9r9IqPaFoj148bwtufVY6857gdCK4e5T8AklaFF9mSrgaAqvCFRtH2twww0nvL
         UKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778858174; x=1779462974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T1gP18CObPDJD3QB+9rYWPUzAtOZhH2+QD3gPrVbM98=;
        b=j03OejqB8X59BUCxjsEf8bh+lEbx5lbGCr+6MfqpatZlWv9ycdr4QaTooEQTCtrg9c
         ZCmph1r82VFloirhqr7QbOdT6STvpvAP00LFHLyO+n5h7Vz5HJL3T/n65XZU2M6Jh8PR
         4oDRsgM8ABENXbe4rjA/pNwxA15vBd2qi23ixhLCkYHguNzURHgNuWl/rgiT+5RHH8UH
         UzYI58chkPfK+LymbSzmU9wZNzB5X9k1bq7aIFAxlgvdifFoY/tRiVQImq5HQuU6eE2Z
         sx660H31N26Zwc5DgHRS9bzmXD/jG29HmZDvweTr/6oEe6kg03J6hVC4bwfzVM3eAqDa
         moRA==
X-Forwarded-Encrypted: i=1; AFNElJ/T+glxNEHpxkXlXw56WatdWff7rEc2rtuvcLPUTH55zrcG1lA2YLVIC0bYBut24i7KGU/5AUwdkjktY605uVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZjlgLps0Nbrsklsv4vJ1PeyV/AU7d4jDHQHjA/GlL1J6ylzq
	FqNUpOQ42g6cNA/WxV4p4HQ0LEQaVDZEI4VnbvWyH2i49tny+jbHaWchrjszP3UEWI23
X-Gm-Gg: Acq92OGWys5+1UJUV0sAuikovQwkMc12aYM/DvjHVPzTZ8XYFSqVljF5Wr+aOkLdmFj
	lX7dFtC6KgtY2khiXq0i/T3RG3oCaBkl5KYIk/lVGcwWrlgqIzc35piTOkYullQ0eoCOlY1/KoJ
	qrDzWegA2i1D8SzTHVCiP1BHS+8RR53gPIF2LjV1yhcLtyGY8HWkiUGUzjTBWXMsXjEPGWrfZWL
	j7RKNW+pphKggSzxTej1khFwp+k9kqEY4TyN4E/JqCsWEvZ2OCV+2AStf5OQr4wgSTIins+gpdk
	BsfC7IvQ9kArySemZ+yqxQ4EkbZWPQCuIFFMi6WxfENYntj1kPe4R+DuZ4kuguWskciPBmCnvx7
	PU177I37trEh17VVw6v6kRzasKTUH+SPuJLtIJKfxq6swA9pd4vERBUjr/6AsIfn6ld4e0X3nRD
	VqpghlhxLNUALGJy1tMlD4zyah4tajqFmDZZz0ZqIgEmSoimzWOB4iKN3iTfYHI9rVvmEqhAYGL
	6mlkBRraGl+1E8=
X-Received: by 2002:a05:690e:1206:b0:653:9e2:1059 with SMTP id 956f58d0204a3-65e223a1712mr2896993d50.0.1778858173484;
        Fri, 15 May 2026 08:16:13 -0700 (PDT)
Received: from kelso.tail8e61da.ts.net (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0d878cf2sm2724116d50.2.2026.05.15.08.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:16:12 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/2] selftests: net: add kTLS async split record regression
Date: Fri, 15 May 2026 11:15:56 -0400
Message-ID: <20260515151556.189841-3-clusk@northecho.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515151556.189841-1-clusk@northecho.dev>
References: <20260515151556.189841-1-clusk@northecho.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a kTLS TX regression test for the BPF sk_msg apply_bytes
split-record path. The test sends four 4096-byte writes through
a sockmap verdict program that applies 512-byte verdict windows,
then verifies that the peer receives the full TLS-protected stream.

Run the case once with the synchronous provider and once after
instantiating an async pcrypt gcm(aes) provider. Vulnerable kernels
silently truncate the async run because the split open-record remainder
is lost when encryption returns -EINPROGRESS.

Signed-off-by: Christopher Lusk <clusk@northecho.dev>
Assisted-by: Codex:gpt-5.5
Assisted-by: Claude:claude-opus-4-7
---
 tools/testing/selftests/net/Makefile          |   5 +
 .../selftests/net/ktls_async_split.bpf.c      |  24 ++
 .../testing/selftests/net/ktls_async_split.c  | 391 ++++++++++++++++++
 3 files changed, 420 insertions(+)
 create mode 100644 tools/testing/selftests/net/ktls_async_split.bpf.c
 create mode 100644 tools/testing/selftests/net/ktls_async_split.c

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index f3da38c54..0435327e9 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -179,6 +179,7 @@ TEST_GEN_PROGS := \
 	epoll_busy_poll \
 	icmp_rfc4884 \
 	ipv6_fragmentation \
+	ktls_async_split \
 	proc_net_pktgen \
 	reuseaddr_conflict \
 	reuseport_bpf \
@@ -236,3 +237,7 @@ $(OUTPUT)/bind_bhash: LDLIBS += -lpthread
 $(OUTPUT)/io_uring_zerocopy_tx: CFLAGS += -I../../../include/
 
 include bpf.mk
+
+$(OUTPUT)/ktls_async_split: CFLAGS += -I../../../lib
+$(OUTPUT)/ktls_async_split: LDLIBS += $(BPFOBJ) -lelf -lz
+$(OUTPUT)/ktls_async_split: $(BPFOBJ)
diff --git a/tools/testing/selftests/net/ktls_async_split.bpf.c b/tools/testing/selftests/net/ktls_async_split.bpf.c
new file mode 100644
index 000000000..c7caafb73
--- /dev/null
+++ b/tools/testing/selftests/net/ktls_async_split.bpf.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+
+#ifndef SK_PASS
+#define SK_PASS 1
+#endif
+
+char LICENSE[] SEC("license") = "GPL";
+
+struct {
+	__uint(type, BPF_MAP_TYPE_SOCKMAP);
+	__uint(max_entries, 4);
+	__type(key, __u32);
+	__type(value, int);
+} sock_map SEC(".maps");
+
+SEC("sk_msg")
+int apply_bytes_verdict(struct sk_msg_md *msg)
+{
+	bpf_msg_apply_bytes(msg, 512);
+	return SK_PASS;
+}
diff --git a/tools/testing/selftests/net/ktls_async_split.c b/tools/testing/selftests/net/ktls_async_split.c
new file mode 100644
index 000000000..a9a84e0f5
--- /dev/null
+++ b/tools/testing/selftests/net/ktls_async_split.c
@@ -0,0 +1,391 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+
+#include <arpa/inet.h>
+#include <bpf/bpf.h>
+#include <bpf/libbpf.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/if_alg.h>
+#include <linux/bpf.h>
+#include <linux/tls.h>
+#include <netinet/in.h>
+#include <netinet/tcp.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/resource.h>
+#include <sys/socket.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "kselftest.h"
+
+#ifndef SOL_TLS
+#define SOL_TLS 282
+#endif
+
+#define EXPECTED_BYTES 17312
+
+static void fill_seq(unsigned char *p, size_t n, unsigned char seed)
+{
+	size_t i;
+
+	for (i = 0; i < n; i++)
+		p[i] = (unsigned char)(seed + i);
+}
+
+static void bump_memlock(void)
+{
+	struct rlimit r = { RLIM_INFINITY, RLIM_INFINITY };
+
+	setrlimit(RLIMIT_MEMLOCK, &r);
+}
+
+static int run_cmd(const char *cmd)
+{
+	int ret = system(cmd);
+
+	if (ret == -1)
+		return -1;
+	if (WIFEXITED(ret))
+		return WEXITSTATUS(ret);
+	return 1;
+}
+
+static int instantiate_aead(const char *name)
+{
+	struct sockaddr_alg sa = {
+		.salg_family = AF_ALG,
+	};
+	int fd, ret;
+
+	strncpy((char *)sa.salg_type, "aead", sizeof(sa.salg_type) - 1);
+	strncpy((char *)sa.salg_name, name, sizeof(sa.salg_name) - 1);
+
+	fd = socket(AF_ALG, SOCK_SEQPACKET, 0);
+	if (fd < 0)
+		return -errno;
+
+	ret = bind(fd, (struct sockaddr *)&sa, sizeof(sa));
+	if (ret < 0)
+		ret = -errno;
+
+	close(fd);
+	return ret;
+}
+
+static bool have_async_pcrypt(void)
+{
+	FILE *f = fopen("/proc/crypto", "r");
+	char line[256];
+	bool in_driver = false;
+	bool async = false;
+
+	if (!f)
+		return false;
+
+	while (fgets(line, sizeof(line), f)) {
+		if (!strncmp(line, "driver", 6)) {
+			in_driver = strstr(line, "pcrypt(") &&
+				    strstr(line, "gcm");
+			async = false;
+			continue;
+		}
+		if (in_driver && !strncmp(line, "async", 5)) {
+			async = strstr(line, "yes");
+			if (async) {
+				fclose(f);
+				return true;
+			}
+		}
+	}
+
+	fclose(f);
+	return false;
+}
+
+static bool module_loaded(const char *name)
+{
+	FILE *f = fopen("/proc/modules", "r");
+	char line[256], mod[128];
+
+	if (!f)
+		return false;
+
+	while (fgets(line, sizeof(line), f)) {
+		if (sscanf(line, "%127s", mod) == 1 && !strcmp(mod, name)) {
+			fclose(f);
+			return true;
+		}
+	}
+
+	fclose(f);
+	return false;
+}
+
+static int make_listener(unsigned short *port)
+{
+	struct sockaddr_in addr = {
+		.sin_family = AF_INET,
+		.sin_addr.s_addr = htonl(INADDR_LOOPBACK),
+		.sin_port = 0,
+	};
+	socklen_t len = sizeof(addr);
+	int fd, one = 1;
+
+	fd = socket(AF_INET, SOCK_STREAM, 0);
+	if (fd < 0)
+		return -errno;
+
+	if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one)) < 0)
+		goto err;
+	if (bind(fd, (struct sockaddr *)&addr, sizeof(addr)) < 0)
+		goto err;
+	if (listen(fd, 1) < 0)
+		goto err;
+	if (getsockname(fd, (struct sockaddr *)&addr, &len) < 0)
+		goto err;
+
+	*port = ntohs(addr.sin_port);
+	return fd;
+
+err:
+	close(fd);
+	return -errno;
+}
+
+static int connect_client(unsigned short port)
+{
+	struct sockaddr_in addr = {
+		.sin_family = AF_INET,
+		.sin_addr.s_addr = htonl(INADDR_LOOPBACK),
+		.sin_port = htons(port),
+	};
+	int fd;
+
+	fd = socket(AF_INET, SOCK_STREAM, 0);
+	if (fd < 0)
+		return -errno;
+	if (connect(fd, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
+		close(fd);
+		return -errno;
+	}
+
+	return fd;
+}
+
+static int make_tcp_pair(int *client_fd, int *peer_fd)
+{
+	unsigned short port = 0;
+	int listen_fd, c, p;
+
+	listen_fd = make_listener(&port);
+	if (listen_fd < 0)
+		return listen_fd;
+
+	c = connect_client(port);
+	if (c < 0) {
+		close(listen_fd);
+		return c;
+	}
+
+	p = accept(listen_fd, NULL, NULL);
+	close(listen_fd);
+	if (p < 0) {
+		close(c);
+		return -errno;
+	}
+
+	*client_fd = c;
+	*peer_fd = p;
+	return 0;
+}
+
+static int enable_ktls_tx(int fd)
+{
+	struct tls12_crypto_info_aes_gcm_128 info;
+	static const char ulp[] = "tls";
+
+	if (setsockopt(fd, IPPROTO_TCP, TCP_ULP, ulp, sizeof(ulp)) < 0)
+		return -errno;
+
+	memset(&info, 0, sizeof(info));
+	info.info.version = TLS_1_2_VERSION;
+	info.info.cipher_type = TLS_CIPHER_AES_GCM_128;
+	fill_seq(info.iv, sizeof(info.iv), 0x11);
+	fill_seq(info.key, sizeof(info.key), 0x22);
+	fill_seq(info.salt, sizeof(info.salt), 0x33);
+	fill_seq(info.rec_seq, sizeof(info.rec_seq), 0x44);
+
+	if (setsockopt(fd, SOL_TLS, TLS_TX, &info, sizeof(info)) < 0)
+		return -errno;
+
+	return 0;
+}
+
+static int attach_bpf(const char *obj_path, int sock_fd, struct bpf_object **obj_out)
+{
+	struct bpf_object *obj;
+	struct bpf_program *prog;
+	int map_fd, prog_fd;
+	__u32 key = 0;
+
+	obj = bpf_object__open_file(obj_path, NULL);
+	if (libbpf_get_error(obj))
+		return -EINVAL;
+	if (bpf_object__load(obj))
+		return -EINVAL;
+
+	prog = bpf_object__find_program_by_name(obj, "apply_bytes_verdict");
+	if (!prog)
+		return -ENOENT;
+	prog_fd = bpf_program__fd(prog);
+
+	map_fd = bpf_object__find_map_fd_by_name(obj, "sock_map");
+	if (map_fd < 0)
+		return -ENOENT;
+
+	if (bpf_prog_attach(prog_fd, map_fd, BPF_SK_MSG_VERDICT, 0))
+		return -errno;
+	if (bpf_map_update_elem(map_fd, &key, &sock_fd, BPF_ANY))
+		return -errno;
+
+	*obj_out = obj;
+	return 0;
+}
+
+static void server_loop(int fd, int out_fd)
+{
+	unsigned char buf[16384];
+	int total = 0;
+
+	for (;;) {
+		ssize_t n = read(fd, buf, sizeof(buf));
+
+		if (n < 0) {
+			if (errno == EINTR)
+				continue;
+			_exit(1);
+		}
+		if (!n)
+			break;
+		total += (int)n;
+	}
+
+	(void)write(out_fd, &total, sizeof(total));
+	close(fd);
+	close(out_fd);
+	_exit(0);
+}
+
+static int run_case(const char *obj_path, int *server_read)
+{
+	struct bpf_object *obj = NULL;
+	unsigned char buf[4096];
+	int client_fd = -1, peer_fd = -1, pipefd[2] = { -1, -1 };
+	pid_t pid;
+	int status, ret, i;
+	ssize_t n, got;
+
+	ret = make_tcp_pair(&client_fd, &peer_fd);
+	if (ret)
+		return ret;
+	if (pipe(pipefd)) {
+		close(client_fd);
+		close(peer_fd);
+		return -errno;
+	}
+
+	pid = fork();
+	if (pid < 0) {
+		close(client_fd);
+		close(peer_fd);
+		close(pipefd[0]);
+		close(pipefd[1]);
+		return -errno;
+	}
+	if (!pid) {
+		close(pipefd[0]);
+		server_loop(peer_fd, pipefd[1]);
+	}
+
+	close(peer_fd);
+	close(pipefd[1]);
+
+	ret = attach_bpf(obj_path, client_fd, &obj);
+	if (ret)
+		goto out;
+	ret = enable_ktls_tx(client_fd);
+	if (ret)
+		goto out;
+
+	fill_seq(buf, sizeof(buf), 0x80);
+	for (i = 0; i < 4; i++) {
+		n = send(client_fd, buf, sizeof(buf), 0);
+		if (n != sizeof(buf)) {
+			ret = n < 0 ? -errno : -EIO;
+			goto out;
+		}
+	}
+
+	shutdown(client_fd, SHUT_WR);
+	got = read(pipefd[0], server_read, sizeof(*server_read));
+	if (got != sizeof(*server_read))
+		ret = -EIO;
+
+out:
+	close(client_fd);
+	close(pipefd[0]);
+	if (obj)
+		bpf_object__close(obj);
+	if (waitpid(pid, &status, 0) < 0)
+		return -errno;
+	if (!ret && (!WIFEXITED(status) || WEXITSTATUS(status)))
+		ret = -EIO;
+	return ret;
+}
+
+int main(int argc, char **argv)
+{
+	const char *obj_path = argc > 1 ? argv[1] : "./ktls_async_split.bpf.o";
+	int sync_read = 0, async_read = 0, ret;
+
+	ksft_print_header();
+	ksft_set_plan(2);
+	bump_memlock();
+
+	if (run_cmd("modprobe tls >/dev/null 2>&1") && !module_loaded("tls"))
+		ksft_exit_skip("missing tls module\n");
+
+	/* Keep the first run on the synchronous provider. */
+	run_cmd("modprobe -r pcrypt >/dev/null 2>&1");
+	ret = run_case(obj_path, &sync_read);
+	if (ret)
+		ksft_exit_fail_msg("sync case failed: %s\n", strerror(-ret));
+	if (sync_read != EXPECTED_BYTES)
+		ksft_exit_fail_msg("sync case read %d, expected %d\n",
+				   sync_read, EXPECTED_BYTES);
+	ksft_test_result_pass("sync provider transmits split record\n");
+
+	run_cmd("modprobe af_alg algif_aead pcrypt >/dev/null 2>&1");
+	ret = instantiate_aead("pcrypt(generic-gcm-vaes-avx2)");
+	if (ret)
+		ret = instantiate_aead("pcrypt(gcm(aes))");
+	if (ret || !have_async_pcrypt())
+		ksft_exit_skip("missing async pcrypt gcm(aes) provider\n");
+
+	ret = run_case(obj_path, &async_read);
+	if (ret)
+		ksft_exit_fail_msg("async case failed: %s\n", strerror(-ret));
+	if (async_read != EXPECTED_BYTES)
+		ksft_exit_fail_msg("async case read %d, expected %d\n",
+				   async_read, EXPECTED_BYTES);
+	ksft_test_result_pass("async provider transmits split record\n");
+
+	ksft_finished();
+}
-- 
2.54.0

