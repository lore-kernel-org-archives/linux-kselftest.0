Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4F5379EC3
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 03:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772507650; cv=none; b=jNY/7x23vrtNEH3JUvHi9D/JmkT/nGl3dxS7lnJNcEb6fBKctukYQoGr7/91kiMylvfah2VywlVw1LG3IH5ly+VgufXQEWlv5IDpJGTz23leptb5ut7Xv7gvxiDMZezhljcENITOl+OIQliOZ+pKMGyVynCtE+Ozfy8haAfqyZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772507650; c=relaxed/simple;
	bh=K6AlHqnS/7kLdIFnNna34u22cqVsdxLjKhDZOmX1IRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7YSMNTvcbvn/fWy6fW9SSFh7NAKirkrrtlza762ZitCHBc7589dvj8MLxGLbFePaHsA1dkOYtF8LL4bmFg/P4+rM60jPqVvBiHB1F4hGxrgAJc3nejLoLKR+85eK3xcK24JKsF5VsvvS3b/Ti+u2WFsYcQTj2YELpEukYnwvFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GTSv7btl; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GTSv7btl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772507637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D6qexQ4j4clxuPTGBn1CJqco2P+dhoqeOUpk4a5MPl8=;
	b=GTSv7btlK5h+/vJ12pI9d7njPVIQnnv25FLqSae2M4+6pmNky961IYEPZNQdh1Jj1X7c9U
	KF1VzAWHSCEkkaNLBmJiVFXFKNZm/Rm1+L6D8vLxY4EFy6JKgnvbGjDH5/hirqjpb3qdqo
	GtmBLG3+8PtClmYm7GeMD28jidSGYqA=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: jiayuna.chen@linux.dev,
	jiayuna.chen@shopee.com,
	idosch@nvidia.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 0/2] net: ipv6: fix panic when IPv4 route references loopback IPv6 nexthop and add selftest
Date: Tue,  3 Mar 2026 11:13:13 +0800
Message-ID: <20260303031318.339716-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

syzbot reported a kernel panic [1] when an IPv4 route references
a loopback IPv6 nexthop object:

BUG: unable to handle page fault for address: ffff8d069e7aa000
PF: supervisor read access in kernel mode
PF: error_code(0x0000) - not-present page
PGD 6aa01067 P4D 6aa01067 PUD 0
Oops: Oops: 0000 [#1] SMP PTI
CPU: 2 UID: 0 PID: 530 Comm: ping Not tainted 6.19.0+ #193 PREEMPT
RIP: 0010:ip_route_output_key_hash_rcu+0x578/0x9e0
RSP: 0018:ffffd2ffc1573918 EFLAGS: 00010286
RAX: ffff8d069e7aa000 RBX: ffffd2ffc1573988 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffd2ffc1573978 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8d060d496000
R13: 0000000000000000 R14: ffff8d060399a600 R15: ffff8d06019a6ab8
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff8d069e7aa000 CR3: 0000000106eb0001 CR4: 0000000000770ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ip_route_output_key_hash+0x86/0x1a0
 __ip4_datagram_connect+0x2b5/0x4e0
 udp_connect+0x2c/0x60
 inet_dgram_connect+0x88/0xd0
 __sys_connect_file+0x56/0x90
 __sys_connect+0xa8/0xe0
 __x64_sys_connect+0x18/0x30
 x64_sys_call+0xfb9/0x26e0
 do_syscall_64+0xd3/0x1510
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Reproduction:

    ip -6 nexthop add id 100 dev lo
    ip route add 172.20.20.0/24 nhid 100
    ping -c1 172.20.20.1     # kernel crash

Problem Description

When a standalone IPv6 nexthop object is created with a loopback device,
fib6_nh_init() misclassifies it as a reject route. Nexthop objects have
no destination prefix (fc_dst=::), so fib6_is_reject() always matches
any loopback nexthop. The reject path skips fib_nh_common_init(), leaving
nhc_pcpu_rth_output unallocated. When an IPv4 route later references
this nexthop and triggers a route lookup, __mkroute_output() calls
raw_cpu_ptr(nhc->nhc_pcpu_rth_output) on a NULL pointer, causing a page
fault.

The reject classification was designed for regular IPv6 routes to prevent
kernel routing loops, but nexthop objects should not be subject to this
check since they carry no destination information. Loop prevention is
handled separately when the route itself is created.

Solution

Patch 1: Fix the kernel panic.
Patch 2: Add a selftest reproducing the crash scenario.

Changes since v2:
https://lore.kernel.org/netdev/20260302051132.66314-1-jiayuan.chen@linux.dev/
- Simplify the reject check in fib6_nh_init() to only match RTF_REJECT
  instead of using fib6_is_reject(), since the loopback promotion
  heuristic is handled separately by ip6_route_info_create()
  (Suggested by Ido Schimmel <idosch@nvidia.com>)

[1] https://syzkaller.appspot.com/bug?extid=334190e097a98a1b81bb

Jiayuan Chen (2):
  net: ipv6: fix panic when IPv4 route references loopback IPv6 nexthop
  selftests: net: add test for IPv4 route with loopback IPv6 nexthop

 net/ipv6/route.c                            |  8 +++-----
 tools/testing/selftests/net/fib_nexthops.sh | 11 +++++++++++
 2 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.43.0

