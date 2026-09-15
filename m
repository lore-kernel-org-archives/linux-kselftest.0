Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994553911D5
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437834; cv=none; b=JOAfzcKDhZVOzkRTvAXntFlJW/OZG4+15VgJ1B4kOARlDX6/VKZqLoVqCMUWbUzvPjY60vHrBbAs11C6Sk9n2Iiq3sDN2iLs7kFjrLy4ASynXj0ZvgwZkayKPg6JjkwlpwPtocVdBvNnZmgojgs6FLc/FpE2sO4Xrux/WbrtcFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437834; c=relaxed/simple;
	bh=JgaBDVDoKnFGMBsoykQUObj1fKwGTTRoSO2K+xSF0Zs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e3nMuWMohbDTyizzgh9kfSih4UYI6oiCXYhWgfns4FyXVmFcq0oXTQaahjOSxYeshRki4nvQH3lGYz4CHP9wbqxRPUSaYzrgrUPAdul0uKdGD23kRv4RGs2TsquF0kmpeRis6RZypaQe6XhJQuQAd3LWCwHhP9rjsXyjA7PzvII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=QzVKId6j; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="QzVKId6j"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8073433285dso1476019a34.2
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 19:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789437831; x=1790042631; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ThI37hgFAFdUitmoIMbo/wItgp2t6jGr/YBfRuURbfE=;
        b=QzVKId6jIa5U6TTE6mZpS1dHXGsMt1EK3sCaerzjVmqlg49SN5dLXsHl9cBQ0iJO5c
         EKujpzl/+J/nfCjjWNhGZtz+OPgbg7L8dQCojJSrHTxCU7Tffo9ANuNP9qnJrAbmovXB
         yyAxZwGvPFyklJ8SyWJQnecWYzQY5qQd/TiLlnMzEiEEw+bOHU4v0Vco0VW5FetgNG0Q
         Y0dhuUBNF6oWzG5kZDMNavZBfxUD8TQR3SHoyFRv/A6+IrbQ7AYQOVuQjczTXLWKhaDv
         U799BtfLurryN59KTKW1IAtO+5j3NRyUbtAWHTMnYDSqSjiWs6Z1tb19IfuIKaQjiOnT
         L/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437831; x=1790042631;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ThI37hgFAFdUitmoIMbo/wItgp2t6jGr/YBfRuURbfE=;
        b=VBFuaMagky5w4LmPaCcsyZEZo0N/c8KtEmhez72LAzE6wQCcTx7xEG47SupdKgSzvF
         bQX+qwFMQsgNnxOm1CDyMZAdyoToCHqfO5wsW7nOVGcxch9HXzhX3eRxe940yCTQ+NEo
         aGml2U7vINQEbTZ2HgnMYfvTcFXxz0App5S6svq5xQ+QgD0kUDM6mBqNXK4RPPTX2XU2
         i9RvpC+LeIvGmwhTZ+LvStIAG3xyT0IgkVufMLzyM3VcXKo4/9VwNobnNOvMbz8mNmzF
         +qtHz8cWKdZUhK2HAQs9dDPCamVZhUiZGtrHrIK+OukfKPlxoe1UBaio6A6qr4+EKBYt
         oO2w==
X-Forwarded-Encrypted: i=1; AKwUvBzt6VaPwW1bOZoeK2Q6xTPbwmQTDNpb3+9BhiCj7EZKr5FRKyzL8mfZR6eeWH8dlvrU3uD2owYDKeTdNZHD7+k=@vger.kernel.org
X-Gm-Message-State: AFuF++n6Ld1A0Up3sD0XaQjSHbnBZ9HYYdG++Vol4tMRYpOrmnraGudj
	x0IJKyWEbeM/Gb7Q7AQRbYGGDh3TcpmeU3FDKf15OK+ZH9QYu/Q8cD9AQSdzYD0CAlk=
X-Gm-Gg: AYBFou1Q6wPS8ffMhCS7YUgIfYh/e1/zsFPb78/CtaglXFSSb6NJ8c2pX4si+aZtfAz
	bmYJAAzdHo1tTx1WGObW4R/j0ajsUMGsO3TT564A5GRXWKu4UeSBRfah/wqXLVqGZw58qcU4v14
	JVKZsZqt4k3u8RrxM6hgsbu1dsP+bK9wXqccANHbXa6jZ4bToNMLwfrDzJABet8jXeE2oFzYJuW
	4JzhOF7qhhbb/EQ/7a18D3s6oL3vQ5n8dD4D14OF79Jjv/jwCmLIq+bjQzd5hmDaxLIQIRRYqVQ
	hWXCnqFkdI3BUOY7EvbM+5JTUMXCOt57uc+ghTtqSlQXaDDj1j02cgGGvSQ+4aZnH4Qr8K4jsX5
	Gr4cOniOByp14Wj1IYa0E18H6bSC0fXKBK3ibCkpIJV+GFZhnaPj1s4gczEnnTClBfE1pJGhIum
	KyLFmxRlFPhG85CrVoCy/Dk+CyxTHUnroSoxwtit+QlGJ+5YbC0vl18St74fE3Yop1F22v266u
X-Received: by 2002:a05:6830:82ee:b0:806:7f87:b22b with SMTP id 46e09a7af769-80899163170mr3626979a34.18.1789437831386;
        Mon, 14 Sep 2026 19:03:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2e46::49c:4c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-804de582afcsm10795696a34.16.2026.09.14.19.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:03:49 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Subject: [PATCH net-next v2 0/3] net: hash uncached route lists by device
Date: Mon, 14 Sep 2026 21:03:34 -0500
Message-Id: <20260914-hash-bucket-route-lists-v2-0-29f6297d8a5a@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHanqGoC/3WOzQ6CMBCEX4Xs2ZpalB9PvofhQJetrWJr2kIwh
 He3oFePk5n5ZmYI5A0FOGczeBpNMM4mIXYZoG7tjZjpkgbBRcErwZlug2ZywAdF5t0QifUmxMB
 khShKxO6UI6T2y5My00a+gk1hS1OE5uuEQd4J4wpeszoRnH9vJ8bD1vjtFX/3xgPjTLW1rFXOS
 ZbHC/Zu6FTfetqje0KzLMsHWdTC0t8AAAA=
X-Change-ID: 20260820-hash-bucket-route-lists-b8cc27ccd53c
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789437828; l=4528;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=JgaBDVDoKnFGMBsoykQUObj1fKwGTTRoSO2K+xSF0Zs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLoRP4eSxxgE+HHlDhdbVYuU0iW8vOeJZStp9In6mMnv7jUBy61ObK9HJazWCwaxnecmn8YWRv8
 RMVDO/AERDgk=
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
keyed by the route's network device. The bucket count defaults to 64 and is
configurable separately for IPv4 and IPv6. IPv6 routes need additional
handling because dst.dev and rt6i_idev->dev can refer to different devices.
Such routes use a separate per-CPU list that is visited in addition to the
device's hash bucket. Routes whose device references are equal use only the
hash bucket.

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
approximately 3 KiB per possible CPU with the default configuration.

Patch 1 hashes IPv4 uncached routes by network device.
Patch 2 applies the hashing design to IPv6 and handles routes whose device
references differ.
Patch 3 adds a selftest for the IPv6 case.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
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

 net/ipv4/Kconfig                              |  13 ++++
 net/ipv4/route.c                              |  36 +++++++--
 net/ipv6/Kconfig                              |  13 ++++
 net/ipv6/route.c                              | 102 +++++++++++++++++---------
 tools/testing/selftests/net/vrf-xfrm-tests.sh |  35 +++++++++
 5 files changed, 159 insertions(+), 40 deletions(-)
---
base-commit: 879e280b8486d4612ad1aa050d6fada2dd80cf1c
change-id: 20260820-hash-bucket-route-lists-b8cc27ccd53c

Best regards,
--  
Chris J Arges <carges@cloudflare.com>

