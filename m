Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051584;
	b=CuewNdQetJpO8ejhrd95MgyfCKFQxqU7fGjP4Hp8ICkzs54QNnXXU+dzrmVU4OeFVyxL
	 Qf7H9EtoMvMiGR45O42XMSlGmtp6QjTCeiR6+TwmbRbWeFf5i0b7LxJZQUy096HbTNvy2
	 SZjdNcOLvzH/jfdYK6bLAaiie1MvKbmd5U3IOXX+jh/3F/mb73CXQgXaciFRO1M3a72bZ
	 mtUtGS54GkfHQaFbK6jT4L4sbtlKLslKOSgxJA15QKDqhSqyL8GRXLgKOX7SdIO83u7FH
	 YXpe4PsgiyLXiSQuz5wf78WQchq5Cz/A8aoJ8GcX7xX5iq1h8yH/ujOo4ASi/QTnR+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051584;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=S25b244wTaMqVJjFfln8keXH6fPLP/cirrhFiRLHhew=;
	b=St6qRtHvZJgtvjWymFF+3LDJTMaYyTNQoWxwD/U+FnQW+iJpz/rDDo8NdCKVWYhGJjE3
	 J13/N5E6RcN0DNJbq63T+55OgDBDuGxrowbGf7VqPoKjiBBI70MmE9DeVEGTkLzsgok2W
	 7rLQPREjnHrOULOs3UkNLHQHZT6taM3Pp9R7o4bNuIUEZFX/NUq9f9CfSBF9VVJG3g461
	 +ES6pyEdXwzMgTRc/uIvm1+g3VRYEVPdinu51BM/Z1g7eolXhmGGD5SOFu6XkUwz5k7Pn
	 Xo1Lys5pJuPreeaa6Kg1IGrfJaxTBfjb9j6Mf3jRYdKQWGe9onSn3xvfUsKHVskpLLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.36
Received: from mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5D060A382A
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 21:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5D060A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LVUzn4xBpWP3HV1084cxZXPEcEqRbTp4ZtSvD+kaGOk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793051571; v=1; x=1793656371;
 b=eZIU/Wcp8IfRCktVUwJSLfW7SUUgdsNW4D978XQVeMPCD2QLQW+TAi2vP/4W1mnKYU8QhXJQ
 xdIm8MTwWPw7gvUIo65OgSHx3wH+wW3sgXPl0E/x+8U7Qstk2YXXYpqaKLqTegCmHFm8VP8Ww3m
 EUMwyaXiRLyBsI4vBt3efhJg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cadc261c74d7667d;
	Mon, 26 Oct 2026 21:52:51 +0000
X-Mizu-Trace-ID: cadc261c74d7667d
X-Migadu-Flow: FLOW_OUT
From: Zhu Yanjun <yanjun.zhu@linux.dev>
To: jgg@ziepe.ca,
	leon@kernel.org,
	shuah@kernel.org,
	zyjzyj2000@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yanjun.zhu@linux.dev
Subject: [PATCH v4 0/2] selftests/rdma: Add an eBPF-based testcase using netkit for RXE
Date: Mon, 26 Oct 2026 14:52:34 -0700
Message-ID: <20261026215236.60054-1-yanjun.zhu@linux.dev>
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

