Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422A434983
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123873; cv=none; b=WDmejnDmUnrt+WvIXpjEo8pW0pDU22EB0KsY3w9V7iGuCpSGbcsmoux1RtZPSuZ48My7L3U6N6JwbKjGowW2NqCXUSyY5HWK/mSIWwmmOOYVC0OxrqbCvCw8QQl15xgMSULcvtl5w9e5unJ6MShg0s8tq01wHc9mZZ8tDUTSIJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123873; c=relaxed/simple;
	bh=rJpzhKBNri9c5UULZ56nVQy/rVD79h7nHatgwn0HBTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PvGm9/A+ZE1MkSzPNoYvS9dg6xwqiRjlJvd4lJMBzwhCVv9M1W0clZkC7zeAy1TVjnna04e2GNvqQm09LIiNkqm9m8e6Elgl3z9VJTlEeOtsjgGSxT+xaJ+PzqvVF47inNzCbHjmJWUYPadUmsHzmNW+dvB7EChGzgDYZ+FgRb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVelHYmS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVelHYmS"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso559729a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 03:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789123871; x=1789728671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3ODOEOt2OmT3owcwJIlSNokTBKqpEmCWa3Dh35Mcpk=;
        b=bVelHYmSaet8xa+VhqcxACQ+7wEqnbsQ5q8UVZy83A24fbt4TRYnFT1KUvl3/Hqd1/
         75329ZZSVLaI2P6TFJJrQPkfudaD+YxwRWc2nPRftwhDCjARZqtE5vMWWrfXfLc/OhBG
         VeCdPUDu5/MRyy6W5h2yDORj81bs/dw4ZwKeYIJNk3B0zT3WwF7Ldb6m7iul3E/JuHW1
         9oknnM80LuUEAQZPlBB4s5gE+JlurkxK3S4n9MBIOr0ygzm8e+Udzy4PJBWAx4R2IB/y
         H/txExw4qLYFgz2oCCnzuL/Ip1Iss6L9faiqF6fS5tVyvSr3boF1jTB2UKL3rWTiKFMh
         s50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123871; x=1789728671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3ODOEOt2OmT3owcwJIlSNokTBKqpEmCWa3Dh35Mcpk=;
        b=ldoR0e855q464p5DDFniCzSdwEeBs6iLBphnklqYmErGacjunkOtFhVeo4ZOp3/s+M
         zcic/Xt5+NaG+L1YhYOXCggQxlgtW7a/UosB7W6zVPoyBgtSOjiZGRroYySGtg3kQLGa
         C/iS8P6L1IzoGWYdSKeUYf6DZF8IdXRZrxcEdAQDPrgNj5Ub8zpDM5sDaB9W/8xgx00d
         uI8eCk2pI01tDnyxFeicFBh5Fh1bGVtgwtvjRlw4bbLWtIQ9Jg0rgHyNOZOp1hxcSSoW
         gdNPnqzk1KClCTQxfYZuY7ISdHKFgmDH+FT1F4XLnAi+v6yShPB75t1q4rWowi4Fd+lo
         O+LQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9G1eFpovcgk/XpiRAyS41jOaK/0IfdhPriynWKhPCBE38vD1JHhCILnjf7DFGDPLjatOsOfXbhh4IV/peO28=@vger.kernel.org
X-Gm-Message-State: AFuF++mxrzJ1aAOnFEU1a8GBOliAd2fVARKhXxQZ8Q3wmHXykC2EqTYr
	7FlJHFH/H765/M8Jn3eAoyoHCri+cXGpWaxPJbtR21+NHYA8q6S8Sua/
X-Gm-Gg: AYBFou1A0MK19vlsQx4AT/+aMhkNqCXm/mDSx/4ownMaDaTSsU1FZ8RfJlL+LK3sjr+
	QfU4KC3HB85j6CIQNtNNkOccOgDy7e9XeUfD+GveKQrNER7+F/T9t+19FmpnLKIujlwOr6Mfj1I
	sTTmJFf1AgjO4qhJzt9BqsnE0knlFV03crkbnR0GZMI8mAiEGqIDIiZu91ztD/37uYkDUYNyvhw
	UDWSePTpmnrVANqrqJf1f090ZuShjGmMdwmY2eGd3C+IxzFYXbXF0yzJ7Vmd3RRRimiDyqtIgQ7
	FSrkFcNuKjszYweqql8+jn77VucNzdyYRqO44UcNd7hMrBOnvF4v4nVDbf/dmGJaR220RAogmRt
	pq8ka2rSy88B7//x2rNmMBYFemYZsW0T+zCtJN7iZJ8z7j0nJpouo0GIE0KaMXL+c3KmbiqF9Aq
	Vxdl2JrG/wF8zO72AEpo8IUtQobWqdWyoAtdnrL2EGGXQ6p5wOCyL3F9R9scH36LvFSCd61kmBV
	5g/jwFFccZho3zHnbp/zc1HEELv2u/bj4U4R6QuEmog6axRiMhdK3+kQvBjeQ==
X-Received: by 2002:a17:90b:1dc9:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39d9c0b79efmr6645363a91.13.1789123871146;
        Fri, 11 Sep 2026 03:51:11 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:f7e5:8b43:47c8:5245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm4876004a91.1.2026.09.11.03.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:51:10 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v4 0/4] rtnetlink: dump link-layer multicast addresses
Date: Fri, 11 Sep 2026 19:50:59 +0900
Message-ID: <20260911105103.7771-1-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"ip maddr show" prints three kinds of entries: link-layer, IPv4 and
IPv6. The IPv4 and IPv6 ones can be read over netlink today: IPv6 has
had RTM_GETMULTICAST for a long time and IPv4 got it in eb4e17a1d915
("netlink: support dumping IPv4 multicast addresses"), with IFA_MC_USERS
added later so the user count no longer has to come from procfs.

The link-layer list is the missing piece. dev->mc, the addresses
programmed into the device filter, is only exported via
/proc/net/dev_mcast, so iproute2 still carries a procfs parser just for
that. This series closes the gap so that "ip maddr show" can be served
from rtnetlink alone.

Patch 1 fixes the type of target-netnsid in the rt-addr spec. Patch 2
handles RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET and
walks dev->mc under netif_addr_lock_bh(), no RTNL. The reply reuses
the ifaddrmsg format of the IPv4 and IPv6 dumps: IFA_MULTICAST carries
the raw link-layer address, IFA_MC_USERS the reference count, and a new
IFA_F_GLOBAL flag in IFA_FLAGS marks entries added explicitly, which is
the "static" column /proc/net/dev_mcast has and "ip maddr" prints. A
non-zero ifa_index limits the dump to one device and IFA_TARGET_NETNSID
selects another netns, like the IPv4 and IPv6 dumps.

Patch 3 updates the rt-addr spec and patch 4 adds a selftest that
checks the filter, the user count, the global flag and target-netnsid.

Nothing changes for other families. AF_PACKET dumps returned
-EOPNOTSUPP before, so iproute2 can keep the procfs fallback for older
kernels. I have the iproute2 side ready and will post it once this is
in; with it, "ip maddr show" does not open /proc/net at all.

Changes in v4:
- Reset the resume offset when the device the dump stopped at is gone
- Use a tracked netns reference (put_net_track)
- Say ifa-family must be set in the spec doc, drop the AF_UNSPEC remark
- Close the netlink socket and guard the checks in the selftest
- Drop the Fixes tag

Changes in v3:
- Report the static bit as a new IFA_F_GLOBAL flag in IFA_FLAGS
  instead of IFA_F_PERMANENT
- Support IFA_TARGET_NETNSID and test it
- Describe global_use accurately, it is also set by dev_mc_add_excl()
- Fix the target-netnsid type in the rt-addr spec, as its own patch

Changes in v2:
- Always validate the request header, not only with strict checking
- Use a single "with" statement in the selftest (ruff)

Yuyang Huang (4):
  netlink: specs: rt-addr: fix the type of target-netnsid
  rtnetlink: add AF_PACKET multicast dumps
  netlink: specs: rt-addr: document AF_PACKET multicast dumps
  selftests: net: test AF_PACKET multicast dumps

 Documentation/netlink/specs/rt-addr.yaml |  17 ++-
 include/uapi/linux/if_addr.h             |   1 +
 net/core/rtnetlink.c                     | 174 +++++++++++++++++++++++
 tools/testing/selftests/net/rtnetlink.py |  75 +++++++++-
 4 files changed, 261 insertions(+), 6 deletions(-)

-- 
2.43.0

