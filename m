Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D6222565
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 00:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468684; cv=none; b=Ay5Oy5iDxed6Qsitxb2b8jAiYRrZMCeV+0a/7KwYajo4x2NQvhVZR5bxVsNVUhk1Qle9GhcxzhSwHDmgHqdmoRGJam0bTB4DClBFtQVdahmm+mbAlW5DrETVxYsdtO+SdA0S7+lyDoZ10G/hbrw2C0WnH8bWUBgMVm62ujrtPsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468684; c=relaxed/simple;
	bh=8Fw2qNNSLeDry4szk2gig5m6yGuj0wWmeEbSqaBSsi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CkzUPz0+ilBSuU0HeYaRlM/xBoDvMBnAFE3fu+cRGv/QLl8Bc0omMptCbfMm2p59k6sHf/lF2qNSwsvGBef6NMXdGQSlkOBIhTSvbrBnV28fr+UlZ3sjGW4EE6XWT9Cd5uhwKbkfsWV/44OAnXoHi18OJRPh9v224qXUipHS+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLINiVuB; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLINiVuB"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f204f6so939192b3a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 17:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468682; x=1791073482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PK0e4PtkqQ5G4jrPyQfHAmFBUAvufJtROUufsHoDiw=;
        b=rLINiVuBzVPrFieOmINzJr8lqxZmroCDK5Ae9xVPl1RgFQ4FBPzSs5dfhaiZ12+BiR
         2pKB8yjA/NBYtEUp9Y3m41YC6qUHtZtXm6Fx/aP+2Wn1i8C5A2fXIdbpF9QZN1g1vaY3
         NDr3cmzcHtc1IMQAnJFarDVnlo0hC9Nao0wXKxaGBY/8RWDGtG424/tImwMxKb9dZnC7
         MEc9rcVbGClllD03SxHM7VOK18yxOP7m+5Q3JZ3SNV83Swnhd4a8aD2nmQgz8qqUdHO/
         jJRwlMm79YDCvJzgM1wSmSLeQBrhTlz1vRfGjcaeJjvEsj0dpvsdvOIdw4nwz3Zz/U+V
         E2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468682; x=1791073482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PK0e4PtkqQ5G4jrPyQfHAmFBUAvufJtROUufsHoDiw=;
        b=pFGqMUhmNSMZpUq5JbfwigBWMDqV4f/TH+qg2Hlzo2Km8zcq2gyl+/S3pXEqfnAbDG
         vp1Jn6rH8JeZPbS7PE6+g1tp16RtPV0sNLl6IGP5sVJdmIgak8TInQ+jwteCKd6OcXLV
         hB0C9ccdnJfSzc2w8asEwQ538YjF2VuUS1F2oQrGa5c035IPJWV+5yCLioVmYKizqZPy
         LFxSzfpdf4+W3SgcLng2JcFtvlukJmyNu63j06jO7x/aZKoyV7sGoSsJprHzU3FygvOH
         NqVGH+7/4Ea0m/C1vhFE1FfoPU6nlS5C79RRBG3XTx8u4csKhJbmAh9KGt8G6H039Ooy
         nlyg==
X-Forwarded-Encrypted: i=1; AKwUvBzbvnvEcLMebp9B4VqoAG5t1lOtGt/qt7Tm6M38+wmbEyscSzdxmQDMQcHwya+nXYCuC5+9Fy0IdMgtyO3RnGs=@vger.kernel.org
X-Gm-Message-State: AFuF++l10qwxXmXRVt40LpFdcLjOGZF4u7Y0VeI4MBFKwJA+P+bprrzH
	8C9y/+S9L9bmhpLe7X2D4wQfB/nm5fpbANabz465AKpge5yDc9QsHVoo
X-Gm-Gg: AYBFou2UyBI+wBjbxORXCiYXRc7ECPxgosWez46zIDiWslcarUcwbmzz70TDQaXboBB
	4m2J/Vdom5C/uEnO2Nt6QdyU3b3djRQ6YYiV2t910ZgBJkkGHnku3C6Z+bIjOV/a/MlOOy+HaBP
	1IFH3j6qMurEkllT8Rdd5eLWZ4sI5zJNTYrzCxx1jXfEloCwO0tLrsGlUZuFfBV2Ce3ZIcAEPNu
	IHdea+pK3jDY+0bHR2YEg6HCVX+uspC+k54xhf53ywnkazWIYp/fwrE12oap3aFgck5RwYsY9O0
	nT2vkLEfMvVTf1Ks4V33OK8XR/KLFrey69TZqXSDkmchG7FbzN8nHxg3Vq7uG/PVVxl3WD/eR0T
	rjgT0rbiYa1/e88ZT50VopQt5NCRTPRWjbGLOxfC08oU5f0l4C/cV1TJrBX2vAJ0AObZGINsnt1
	W0oSC6rqHtJGaRlPPaQDjBf+L3xledeblk5SrEp9DV8ke8jO5PTzqQf1YtVvlThDcobOui5xLrA
	jtx4GTFFTEvWlpz2CFzKZMobnbdfLRX0bCwLJV9lwpLH+XNZ2CYzk2K/zWL2Q==
X-Received: by 2002:a05:6300:8053:b0:3de:1b92:a4dd with SMTP id adf61e73a8af0-3de1b92c673mr6070280637.18.1790468682175;
        Sat, 26 Sep 2026 17:24:42 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:78b6:7bf6:b1de:12ef])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c680sm2698224a12.16.2026.09.26.17.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:24:39 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v8 0/5] rtnetlink: dump link-layer multicast addresses
Date: Sun, 27 Sep 2026 09:24:22 +0900
Message-ID: <20260927002427.4519-1-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"ip maddr show" prints link-layer, IPv4 and IPv6 entries. The IPv4 and
IPv6 ones come over netlink today, with IFA_MC_USERS for the user count.
The link-layer list, dev->mc, is only exported via /proc/net/dev_mcast,
so iproute2 and other users still parse procfs for it.

This series adds the AF_PACKET family to RTM_GETMULTICAST so that the
link-layer multicast addresses are reported the same way. Patch 3 dumps
dev->mc in the ifaddrmsg format of the IPv4 and IPv6 dumps: IFA_MULTICAST
carries the address, IFA_MC_USERS the reference count and a new
IFA_F_GLOBAL flag marks entries added explicitly, the "static" column of
/proc/net/dev_mcast. ifa_index limits the dump to one device and
IFA_TARGET_NETNSID selects another netns. Patch 2 adds a generation
counter for dev->mc changes so a multi-part dump reports
NLM_F_DUMP_INTR like the IPv4 and IPv6 ones. Patches 1 and 4 update the
rt-addr spec and patch 5 adds a selftest.

AF_PACKET dumps returned -EOPNOTSUPP before, so iproute2 can keep the
procfs fallback for older kernels. The iproute2 side is ready and will
be posted once this is in.

Changes in v8:
- Set the owner of every list a device has, not only dev->mc, and
  check for dev->mc in one place when bumping the counter
- Add __hw_addr_count_inc/dec/reset() so a change of list->count and
  the counter bump stay together

Changes in v7:
- Add a per netns generation counter bumped on dev->mc changes and fold
  it into cb->seq, dev_base_seq alone did not cover the dumped entries
- Sample cb->seq under the address lock of each device and again when a
  dump round ends, so the NLMSG_DONE check sees a change too

Changes in v6:
- Move the dump to net/core/dev_addr_lists.c next to the dev->mc
  helpers
- Stamp cb->seq from dev_base_seq and check dump consistency
- Let an unexpected dump error propagate instead of skipping
- Check for an address only present in the peer netns in the
  target-netnsid selftest, the peer and local ifindex can be equal
- Document the ifa-index filter and the zero header fields in the spec

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

Yuyang Huang (5):
  netlink: specs: rt-addr: fix the type of target-netnsid
  net: add a generation counter for dev->mc changes
  net: add AF_PACKET multicast dumps
  netlink: specs: rt-addr: document AF_PACKET multicast dumps
  selftests: net: test AF_PACKET multicast dumps

 Documentation/netlink/specs/rt-addr.yaml |  19 +-
 include/linux/netdevice.h                |   6 +
 include/net/net_namespace.h              |   1 +
 include/uapi/linux/if_addr.h             |   1 +
 net/core/dev_addr_lists.c                | 247 ++++++++++++++++++++++-
 net/core/rtnetlink.c                     |   2 +
 tools/testing/selftests/net/rtnetlink.py |  73 ++++++-
 7 files changed, 336 insertions(+), 13 deletions(-)

-- 
2.43.0

