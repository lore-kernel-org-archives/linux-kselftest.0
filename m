Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544D4DA9DC
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 19:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673914; cv=none; b=fm3e+1UdRwMRydK8AC3blrM5vJVsdstxY4H1YQKgDjuSXBipQXxuCW7c88cIddmu9tbY9QvKXFsbxAwRzhkqQXjGQdUCmtBHKm0B8SsFJJvrepQZJfMujQI0pM2FgZj/1FuyzV+A0MCcZsi7PgN5mf4F9vJs3Uqh4UeQbHs1ACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673914; c=relaxed/simple;
	bh=zMyTB6Pk5b27ZnL2vF9K0ITpxhdU9JZ/t/JUCeV7Lmk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iahmg5nULwyzul3aCI6LMiBpl/GfN5U9Ap294NeigtzxeRTgNfCYqEFio8ke2/zLxBSohMpzqkKPLeaaMyhGCSvDVWWxg1V5gioMGrsxA/X7+lmKPVOfVKuEr2rYGt7bM9wb98HOX5A03YIBYZiCSadzu5FfsfSw4rhotXv1T/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=PRAnqO3K; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="PRAnqO3K"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-801a8bf8112so511661a34.1
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789673911; x=1790278711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Eu5cwpkNfx0VymMp7XzXaTIYyguHpWthmES2p8y0Do=;
        b=PRAnqO3KaB4eHlLVau06K/pZX4onYwDn2tH34jniv+JchTn56vPNeDdkak4hhQJb5i
         7wZqq6gZAYZB1zhne2p2zaspxGqepH7qy4y4VDq5W1p7uY39vEikZlv15a4oDqV+boDE
         ww138g/7ZirSH7XlOjUKCfVcgvQ65EgMBUDN/ShV7lrlQAX+DqFJIhhcxA2Yj3A5DjSw
         /z/T1nV6JRuhoErEfPVPcoCB+9RsqLRJV2HnDkmmebu7lT048rEwYgdTKpFPenzp34Zh
         dJqe/XP1cLZUphjV3R+5+lXf7GVCu8FKSHJ3mwi4mqb5rhetuJ//4MZ8dI+A9EefWUoo
         8kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673911; x=1790278711;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Eu5cwpkNfx0VymMp7XzXaTIYyguHpWthmES2p8y0Do=;
        b=iSoUVgIBS3fA5F9I+QlezNyNY2JqrIVNLUDiCAGpWRlLFiW/YwfJU8smUrUnz/o5tt
         b0ARJbGlDManLpM6ou16CNzoBo2R5LS8A5v0mgRewli3YIdfX+nidX0GLgc4sf9NCemp
         Ztgwxok4cCR3xeBa+6Y1UUTW3WQvcW0koW9WdQF9OeKPzXTjzYoEH7Ym+MxhORPTtTXo
         82UifZQcOM76qafnjHMkJAvWdgvawSysUnp+a+gKUSIF+UiTEuv8j/dXS/+q1t716rV0
         tZnuNQMPjLc6qDymW7Sq9xAbvshqzLJ+4wIUua8mpxvu6RqGbZe3AWM3mmWpb+VJO4JE
         aekQ==
X-Forwarded-Encrypted: i=1; AKwUvByq9k/Xtt8M+S7p/7NpX/8qoKcOS1RBcM9nmVhfPyVWz1juyI8HRT4lLx2xPNvBqxwUL2MQsVsFDVTWIWn4IrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lgoI67K2XiEk2RT7RJXMrfLAuMFD1xbTl2n8wQ9IV/Z46GAnjr
	ZXTJsD2VKH0rvI+bmCGx61sF3eoJpg/ZrEcE+JZzVm3M4/FsDnmglyk2TGXu8V12TdE=
X-Gm-Gg: AYBFou1aLdT3tw11tX9Lt2+VOxXYMXXqB6kc5h5GpcRQj8VKN5erWbkNOzUq5o3i7kD
	gOoiS+9S2Rqt2QxmJNj9FWfx1pH66zjDWb/wqmj1rventD+Q4DHhykAdolUXBtvwb8gPAbVIylV
	v/pgjuePWYs3PgHskoLJg7Emircqj607BSZCTPveVvd0O38DmPqxy1NWAnH0VMAreqx4P2xWIAU
	vnn+d1ly4yZ5fvURMocRoJjaEhYo/pV+Wp1EIdt8GA5x8z/uKW5b3tJ1DeZCL8lYTo2zfGOdX9C
	xwFh6FKtI/F3p5XrnJ4EmgMY0AmpxCiw0GwnjFBufKwS0WhKLbF6DjNdf1VuKgO1Hqx+BJm5UTr
	SOM+wbsu6oB90+TTDwrTAPFhDP9DWJhsrQDL7Fr8qCN8Jr/IDZQWRjoaBHaIX7D7Vu3wCOPNcut
	43Fhj+uUr3DpwyPDZCg/Ll/BWAPL2Zedk70rAZE8NEKe6EdcEA9uqbOjMP55A=
X-Received: by 2002:a05:6808:5143:b0:4b9:e5fa:8a23 with SMTP id 5614622812f47-4ccf999a345mr258526b6e.40.1789673910696;
        Thu, 17 Sep 2026 12:38:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2632::3ce:23])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d267495sm3576435b6e.12.2026.09.17.12.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:38:29 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Subject: [PATCH net-next v3 0/3] net: hash uncached route lists by device
Date: Thu, 17 Sep 2026 14:38:21 -0500
Message-Id: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK1BrGoC/3WOyw7CIBBFf8WwFkPpE1f+h3EB08GitRigTU3Tf
 5dWExemy5u595yZiEdn0JPjbiIOB+ON7WJI9zsCjeyuSE0dM+GMF6zijDbSN1T1cMdAne0D0tb
 44KmqAHgJUOcpkLh+OtRmXMln0sVyh2Mgl8/F9+qGEBbw0m0iwbrX+sSQrIuvr9j0DQllVEuhh
 E4ZqjI7QWv7WrfS4QHsY1UN/AcTSbYN4xHGhS64KOtK5vIPNs/zG+wAEu0sAQAA
X-Change-ID: 20260820-hash-bucket-route-lists-b8cc27ccd53c
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789673908; l=4671;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=zMyTB6Pk5b27ZnL2vF9K0ITpxhdU9JZ/t/JUCeV7Lmk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBToa1kNsgFjuMhcDZwtGPLybvhKU60PK5pXR+TXJ2QqxsEPX00q/hQNKL227WsN7PU38SJHgT2
 qmzyY4gTGDw4=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

We have observed hung tasks blocked on rtnl_mutex while network namespaces
were being removed. The namespaces contained many network devices, and the
host had accumulated a large population of entries on the global per-CPU
uncached route lists. A perf profile collected during one incident
attributed most of the cleanup worker's samples to rt_flush_dev():

```
99.92% kworker/u384:3-  worker_thread
  `-88.71% process_one_work
      `-81.02% cleanup_net
          `-81.00% unregister_netdevice_many_notify
              `-79.42% notifier_call_chain
                  `-78.05% fib_netdev_event
                      `-77.92% rt_flush_dev
```

For each device, rt_flush_dev() visits every possible CPU and scans the
global uncached route population while its caller holds rtnl_mutex. If N is
the number of devices, C the number of possible CPUs, and R the number of
uncached routes, the cost is O(N * (C + R)).

During namespace cleanup, other processes that issue RTNETLINK operations
requiring the RTNL lock can stall until cleanup releases the lock.

A minimal reproducer is available here:
https://github.com/arges/linux-reproducers/tree/main/rtnl-flush-storm

This series replaces each per-CPU uncached route list with a hash table
using the network device as its key. Each table uses 64 buckets.
IPv6 routes need additional handling because dst.dev and
rt6i_idev->dev can refer to different devices. Routes are keyed by
rt6i_idev->dev when available. Device teardown scans one bucket for
ordinary devices and all buckets for loopback and L3 master devices.

We measured user-visible RTNL latency on a 192-CPU x86-64 host. The test
added approximately 80,000 uncached routes across 256 devices simulating a
distribution we saw in production with 6 devices having 4k to 20k routes,
and all others holding ~100 routes. The devices being removed owned none
of these routes.

During asynchronous namespace cleanup, the test repeatedly sends an
idempotent RTM_NEWLINK request that requires RTNL. It then records the
worst request-to-acknowledgment latency in each observation window.

Results from this test show the median latency for the RTM_NEWLINK request
to complete after waiting for unregsiter batch show between 68-75%
reduction in latency when using the patch.

We also measured end-to-end route insertion cost separately on the same
machine. The test inserted 100,000 routes per round for 30 rounds after
three warmups, while pinned to one CPU. Median insertion cost was
2,069 ns/op without hashing and 2,066 ns/op with hashing. This test found
no measurable insertion regression.

The hash approach adds no per-route fields. On x86-64, the tables add
approximately 3 KiB per possible CPU with 64 buckets.

Patch 1 hashes IPv4 uncached routes by network device.
Patch 2 applies the hashing design to IPv6 and handles routes whose device
references differ.
Patch 3 adds a selftest for the IPv6 case.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
Changes in v3:
- Remove IPv4 and IPv6 Kconfig options; use fixed 64-bucket tables.
- Use rcu_assign_pointer in rt6_uncached_list_flush
- Key IPv6 routes by rt6i_idev and scan all buckets for loopback/VRF
- RCT all the things
- Link to v2: https://patch.msgid.link/20260914-hash-bucket-route-lists-v2-0-29f6297d8a5a@cloudflare.com

Changes in v2:
- Add IPv4 and IPv6 Kconfig options for the uncached-route hash size.
- Keep 64 buckets as the default and document the per-CPU memory tradeoff.
- Link to v1: https://patch.msgid.link/20260826-hash-bucket-route-lists-v1-0-fa9b9f30eb74@cloudflare.com

To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: David Ahern <dsahern@kernel.org>
To: Ido Schimmel <idosch@nvidia.com>
To: Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Chris J Arges (3):
      ipv4: hash uncached routes by device
      ipv6: hash uncached routes by device
      selftests: net: cover IPv6 uncached route device mismatch

 net/ipv4/route.c                              |  36 +++++++--
 net/ipv6/route.c                              | 101 ++++++++++++++++++--------
 tools/testing/selftests/net/vrf-xfrm-tests.sh |  35 +++++++++
 3 files changed, 133 insertions(+), 39 deletions(-)
---
base-commit: 26ee8cd69d46a14b37ba5e512084fe80d730127a
change-id: 20260820-hash-bucket-route-lists-b8cc27ccd53c

Best regards,
--  
Chris J Arges <carges@cloudflare.com>

