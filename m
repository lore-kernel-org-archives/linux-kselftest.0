Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7CF233923
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 01:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350350; cv=none; b=iie7+IL6QkUZBSeiA1BQI/7aC9/D/eJfYnqUJoInbEqUT4M8ZVQJFyT23GJ3Oe84/8z2PIsPJhZs4Y1oxcJ24Vv2ZG8e3BPUbYvWzOAsHTSO4OR1AAi9UeZmxlduDb75DRxAZKmoc7ZpSzp9N95B+M2jfScbDnqDcJppCVBuJC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350350; c=relaxed/simple;
	bh=7AN+51LlF3bcXtQGVd7Fj0d4POHYx2tj53sbahfN5Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SeRUC2F7EhUF82aoABYq2hMHEYv22Lqle447mhlMiTP66wz9jsW2FRS0OhOZMiE26WyBPjxM9LynXi4MLO/arOSgNw8lx4R5voIUKLMvuuBBbToiACNfzsxqfICcCkFMLa7TgRMLo/G0Ae+rNTApS2Lp59w7vO/F5PE0qpB8yZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9Sb4On8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9Sb4On8"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so614387a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 18:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789350348; x=1789955148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXkr0qtNX1TIaAFXwEelUT+kftOPKorlmCKYL/cX3dg=;
        b=h9Sb4On8kImIecdYDc6kS/ZuIHFoK0/WDMyZxQ7hpg8xNdx9IJRpXBe3WizYM84Adp
         xayfftTzOIfq4mjB2G8H39zocGiAF/4XmTQ6mTdXz1S3ukpJtPJErbt86xX8kxGnXwSE
         HduGuHNZ1mHTmdxy0nAYEfMWmOF/s5ofW51hPLWQd44ZkXQqbRIz1ls29mSMv9HXz7kJ
         Amh8Hf7eA3Xg7CvBqDivLkxH7jA3G1qev2dRKpf6Ck2Qt84KxE6VZerse7TSWsaT1Rxm
         azE6aCPDMbHB52YNDcjliNr/sKVUXUhtLDYt9Ph3ffKpKVQ2BJ+Ujw09h6zdWEUKZqza
         lTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789350348; x=1789955148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CXkr0qtNX1TIaAFXwEelUT+kftOPKorlmCKYL/cX3dg=;
        b=SW6PibRMBMTM2xXN90gTsCpchMlcYzflBPihi2sPeyciSQ27FQbw7Rxfr5CpVueYjl
         uzUqjUtQeScMESCYGAV4vW1QMGnSNsW7bJMEgI3R1/TfCzZE6Q1E0iLRVCDaR1Vkk5LC
         AHb9YGzD0G19bd5fscbp1iMJNJRA6dNBLm8eDxXxglsH7tIGZwD4ZHZ+1mEOBMWhKElb
         OReltxARnwGYD0+W0iONT2FRLrLIkv4mLgfbmK9lN4a1RyKLG4pB5uLD9H2gtNXaRx8d
         s6S6cqIyWysqFL9RqZeCGmr9kY5tcD0gDUXrfTFToMn2RfZCKT8KlsXcHaw6mIEdWtzX
         cdYw==
X-Forwarded-Encrypted: i=1; AKwUvBwp1VQxPi/Ao1fk4TABo7R/3jWL9HmrayCU3aM+QVE2FASCk7iijKnM9FXvQLgt2gmFd9Nl1DyoLV1lB0x7eKM=@vger.kernel.org
X-Gm-Message-State: AFuF++ksa9OoDS6Ty4v0/Fk0QRpDIFTJHDjF0/kPknVdlCzQgLWAwsbH
	DAKN9ofNF0OPYSrfeMJoejPI4jbSVU1re6O+mKaL4ssBYGb2arVTp+Iv
X-Gm-Gg: AYBFou1IWU+xLxmiEoFuqKeGGDmct9Cx7Yr4FdEiX6nhjGv4B1KE63Tnw4oMvoxyFi4
	KlEmHrttjS0tSA0VuhrTE1y7zoTsnY2hUNl9VMuvKAozaaNbRBLk8RLn10uEK2NBl9euk9Ib+Mu
	MJZPyJUPrUptILDE/3z7YkShNV3WF2dA95mR7jJcftNJ6MpwMrYOzJVSL2b5w1DmR6caCECrjr8
	7wHXVSThA6ZcSWW0YjSveYR+ruwBmM0VDQi0rNYbrg2hIOZ12ELZNjZKnBkWPeeBvx/RutB7ucA
	qjFFQ7IgJ3je9CXxBZGDzhuzvfuBr0T9hXtYLwsZFufe7TcIIkkAQXMR2XbgBuFiDXRa8iVFFcg
	oJ4JOx4S2sQFET5V0wMwe/cA4RDFr+hykwkUxpcuc65hhhiS3pvG3MkojDagBBwNVIScAtaDwZI
	nA0lq7L13QfghZZc0Ya5JGgJM+T5sFZOxdd61sXb9YUNZZUrF5QzgU308OHZ8ubapEzu4funPk5
	t9ucCgoH61TDAO6C5eKaL3+h7PCy+7Kq93UnuoJtBP85P0=
X-Received: by 2002:a17:90b:4c0a:b0:398:ba46:1d9f with SMTP id 98e67ed59e1d1-39dec4e1a4emr501507a91.13.1789350347843;
        Sun, 13 Sep 2026 18:45:47 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:fd07:4a24:951e:c85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d1056sm17513403a91.7.2026.09.13.18.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:45:47 -0700 (PDT)
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
Subject: [PATCH net-next v5 0/4] rtnetlink: dump link-layer multicast addresses
Date: Mon, 14 Sep 2026 10:45:35 +0900
Message-ID: <20260914014539.5015-1-sigefriedhyy@gmail.com>
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

Changes in v5:
- Filter the target-netnsid selftest dump by ifa-index, a new netns
  also contains the fallback tunnel devices

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

