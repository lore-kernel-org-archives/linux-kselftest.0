Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793467839;
	b=QGf8Zq9RHkqU60Xfo0XV40eazO9X9irNaPVhCwcYnLzXRby2mmFvh+yNsStcGw6FJzqa
	 d7yvncAn2CDnXvoA9VRXIDdV9s/Y1t3ZPhBXHip4bY0XSqUsIqtfSj9F1Zb83OtRqv4ZX
	 HPhGH/a2XApFLqVwod0SgJSvT0WP/xfLQNSXecd+s7HOQZKqvVdSDlUzs3L91qSn+NVz3
	 ttPmGEoXM7NseqVg56l9p/ewTnQOeEecmfA5C8FDjUo2D9kQF68bShw1FUN0v5u7fFUcw
	 SY2LHPm5kUXPLj+yQyv/L9xOKLVBGpiLMB33p8SSB4z+//Q263Sh4C1p3sORLXfxTqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793467839;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZyAMpffqQzs5u1P9uNHMv8kr9vuC9ICPu09YY6ag56A=;
	b=zm3AK3tM6SDTsiOLZEeEi88YFpDZJtXleQpHXTLLnyAdNqKcUyZgiiO0GkUe9hZRujNg
	 icNKJMH1grialJwkPl2rr/OQNj/3D7kh8y7fypvtM/e+2NHOiPfLgNVSq+we2dgiWarbJ
	 UhzuNydrISaBihUomUWGnnpKSNK1eLCnLQNhLt7doXDA2C08IrEeNcPirdlFZ4a+YID+X
	 NNkGD9M7xYZ5oKoGJZLoPpqj1EH9VfKuxzX9muxEPMs5nvf3bzl56psmcNr9gpeHNhfr5
	 tZyxkC4Uj9HaN8RvN4/3RCY8bU3Myt8T4De27u2fdbX3k790pdlBoWc5G6pQ01XHXBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IYkmebZF;
	arc=none smtp.remote-ip=95.215.58.63
Received: from mta1.migadu.com (out-63.mta1.migadu.com [95.215.58.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC76606A31A
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 17:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC76606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IYkmebZF
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+9xexL48jW9DDESnQk4SKubjwBBwQJtDClEQv8Gt++A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793467836; v=1; x=1794072636;
 b=IYkmebZF8kP7pDTwO1ZQhDx83qjl0hr/WxWozwSzKoW9ICA8qBg+8VvKVqKzrMgeOD6U5pGs
 RDOas/RXFf5rFlRFxU1bpe125IAGnBaAbl5th0ywzbb5fiNDROnS1+yKhXUReuOyhPmjlEi19PT
 TidvypWRkkiDytF+o5zs71JE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0e049a2a3887f082;
	Sat, 31 Oct 2026 17:30:28 +0000
X-Mizu-Trace-ID: 0e049a2a3887f082
X-Migadu-Flow: FLOW_OUT
From: Zhu Yanjun <yanjun.zhu@linux.dev>
To: jgg@ziepe.ca,
	leon@kernel.org,
	shuah@kernel.org,
	zyjzyj2000@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yanjun.zhu@linux.dev
Subject: [PATCH v5 0/2] selftests/rdma: Add an eBPF-based testcase using netkit for RXE
Date: Sat, 31 Oct 2026 10:30:15 -0700
Message-ID: <20261031173017.20691-1-yanjun.zhu@linux.dev>
X-Mailer: git-send-email 2.53.0
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

Add a new self-test case to verify RXE (Soft-RoCE) traffic using
netkit virtual interfaces and an eBPF tcx ingress program to dump
and parse RDMA transport headers (BTH, etc.).

The test results:

# make -C tools/testing/selftests/ TARGETS=rdma run_tests
make: Entering directory '/root/linux/tools/testing/selftests'
clang -g -O2 -target bpf -D__TARGET_ARCH_x86 -I../../../../usr/include -I../../../../include/uapi -I../bpf -I/root/linux/tools/testing/selftests/rdma -c rxe_pkg_kernel_dump.c -o /root/linux/tools/testing/selftests/rdma/rxe_pkg_kernel_dump.o
bpftool gen skeleton /root/linux/tools/testing/selftests/rdma/rxe_pkg_kernel_dump.o > /root/linux/tools/testing/selftests/rdma/rxe_pkg_kernel.skel.h
gcc -D_GNU_SOURCE= -I/root/linux/tools/testing/selftests/../../../tools/testing/selftests  -g -Wall -I../../../../usr/include -I../../../../include/uapi -I../bpf -I/root/linux/tools/testing/selftests/rdma rxe_pkg_user_dump.c  -lbpf -lelf -lz -o /root/linux/tools/testing/selftests/rdma/rxe_netkit_dump
# timeout set to 45
# selftests: rdma: rxe_rping_between_netns.sh
# client DISCONNECT EVENT...
ok 1 selftests: rdma: rxe_rping_between_netns.sh
# timeout set to 45
# selftests: rdma: rxe_ipv6.sh
ok 2 selftests: rdma: rxe_ipv6.sh
# timeout set to 45
# selftests: rdma: rxe_socket_with_netns.sh
ok 3 selftests: rdma: rxe_socket_with_netns.sh
# timeout set to 45
# selftests: rdma: rxe_test_NETDEV_UNREGISTER.sh
ok 4 selftests: rdma: rxe_test_NETDEV_UNREGISTER.sh
# timeout set to 45
# selftests: rdma: rxe_sent_rcvd_bytes.sh
# server DISCONNECT EVENT...
# wait for RDMA_READ_ADV state 10
# client DISCONNECT EVENT...
ok 5 selftests: rdma: rxe_sent_rcvd_bytes.sh
# timeout set to 45
# selftests: rdma: rxe_netns_names.sh
# 1..0 # SKIP rdma netns exclusive mode is not supported
ok 6 selftests: rdma: rxe_netns_names.sh # SKIP
# timeout set to 45
# selftests: rdma: rxe_pkg_netkit.sh
# server DISCONNECT EVENT...
# wait for RDMA_READ_ADV state 10
# ./rxe_pkg_netkit.sh: line 28:  9866 Killed                  "$CUR_WD/rxe_netkit_dump"
ok 7 selftests: rdma: rxe_pkg_netkit.sh
make: Leaving directory '/root/linux/tools/testing/selftests'

---
V4 - > V5: Fix err and length problems
V3 - > V4: Fix problems in user space app
V2 - > V3: Fix problems in user space application
V1 - > V2: Fix problems from sashiko
---

Zhu Yanjun (2):
  selftests/rdma: Introduce eBPF kernel and user dump utilities for RXE
  selftests/rdma: Add netkit-based automated test script for RXE

 tools/testing/selftests/rdma/Makefile         |   23 +-
 tools/testing/selftests/rdma/config           |    3 +
 .../selftests/rdma/rxe_pkg_kernel_dump.c      |   62 +
 .../testing/selftests/rdma/rxe_pkg_netkit.sh  |   63 +
 .../selftests/rdma/rxe_pkg_user_dump.c        | 1275 +++++++++++++++++
 5 files changed, 1425 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/rdma/rxe_pkg_kernel_dump.c
 create mode 100755 tools/testing/selftests/rdma/rxe_pkg_netkit.sh
 create mode 100644 tools/testing/selftests/rdma/rxe_pkg_user_dump.c

-- 
2.54.0

