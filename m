Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AA12D46A2
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212564; cv=none; b=IIgAQW+ROTlY9xgVplRDcTxnaF0+OQ/KdFFsd9PiGrWt9dE4FP/2WzZED8tkTi8LYCCe9po/ggFKgHjrEAgL3kn/tDqmPEv+FAZncEcygn61Jc20wceE6sHW9g8xWxkouSlkt7DqN9DzVUVr/y+kDumwlJX7jQS8kg/iSj1Kb/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212564; c=relaxed/simple;
	bh=fo+ka+e7DyZ0vYffx795VKA6Z0IzB7R7d8hCIfxqj/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6BpsFMtIYh/qjbvGw4cj2GdXygkA9C3UlV8n/2DZr+HJ/a5CWxnHwTzAds6qmwQRR5DOUpUNDo308a1Recz6SpztDcBoFuKTox19MOztHSja0R1VjjayrCuoum3WF1ZaMHV2+ohX0wKONjKCvM2AcvE7uQGqoW36174PrMiv5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s+SgcAjI; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+SgcAjI"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so859050b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 18:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790212562; x=1790817362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JRHkICcEW356Nd8YsrUdnxZJQypy1ozHheTKr0HaJo=;
        b=s+SgcAjIY+f2NlENesgCg3b6pTQwpBPb2TitiSfwEdxbjuRXzTyNzRNncsi1xFPmQZ
         5TqIOi17IRQVhYz1tdgLnR6cdMu4cXYpZrvSXqSQju2+bzDSxFJBBA7qrS39Ej+TJM7O
         aQXrcPmfo6sHP7c9IrVwFuGcWC5dMLskAaUF8hIgNzjG+GRu2AxAcqUJjlsu5wTlwYWc
         mW+v3qaID0ftOz2ZPAImOR7ByUCLu1sjZxwY3DsBqLLXnswTFMDRzpFoXF+zd3zwvJKW
         zNIO6mAUTk0mV/OnktA+dWfAC+2vusx7UtYqjic5y1ejU6BYtjb+uDOLZK0YxjzFeH3F
         1Afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790212562; x=1790817362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JRHkICcEW356Nd8YsrUdnxZJQypy1ozHheTKr0HaJo=;
        b=LH7CJBRChEwWDEZxTEJBGCzqBUReyhwN3oZDZzHMCWaJFU4IzAAFX/FodoMMv2R+SR
         SgIpmN7w8MOluADsTD7CRqTI/NUAV8j24OUjqnNUTPq9jXhb255L5BPJSVAaJuZpm7wx
         1Q/vReQqMLg10XA8Tg73NfEndL/Xczb6+nD6Zx+aiuaFB3CkfyjJqW9sbqyD0PKEuAIh
         5NQ3LWMHAcJ/0DSDolPfEMsvXNa51H6KrlWfK/BlaTM0ifzS6p9abTOcp1TMhud/HeU3
         wj6hkfkhkaw6x5jOjrFnDNljv+GlvCa3M+XApn9UEdIxUcsiG7e4eoPXvdoMJOia9DSs
         y+zg==
X-Forwarded-Encrypted: i=1; AKwUvBznWh5wbKpnQisGp3jHfc0toRruIlbNh4EldKQkp48PnxfLLcgTvk5uTczBVqGz7j/5xyq3MTQaFeO7ginPaYE=@vger.kernel.org
X-Gm-Message-State: AFuF++mds57nP4PEqYDsMzrY3QK4E3kVf/bmjzy/5HbIH9MpQK4Kxch5
	yyhB5QMhDDMek/AeypX3svLw42Q4Y0HXabmIPgMHTPvzmU7fANaRCe68
X-Gm-Gg: AYBFou2J2qprBwobKmy83LGgiJ2yLBpEe41zZsEwO8nbtK8e5DStjbWHjztzYsj1wVd
	go7jDVQeNZ1Ron3xj92hyeXkZeKfFfbpaVY+O/P9oaryMJG1jmumjYZsS8HnNmHb5Xa43yluKQB
	WWo7dtdGF8VP1jjXSgcZtTfUBSsR+P6or3wWzFofPVepWitasJT3gpKi5vT1nUukjhejL46Lqaa
	lw/PhdBgoOSI2sb1KtVAHlgtmCDXkdasLgAaOEj/qGyT1FiHDAVT5R0yOylfso+DcZIaWQewJl1
	lBg8KeV8QS1oz/iSlFEd3lSGL7quoXwZjKtz1qiJ24nGG/JWlZJ/3g3LMfwRMngw1AIaiPOa3k6
	CA8iBI9zEuK23k1vCZo5vSBPFDwHTD24m8OXsJCJbCFG+bWfawWNg/0Jg0TzvCh2uqYBTGSvqQ/
	GwMqy/hTe7+i0DTJDUMcm4PJGmSCq6Hv2HgVglp2ib5svMk/MBzUwixZgWOM6/F35thXswMTCRB
	pu2nyWPFC4LxHeoGyg0fOcYNhl6GrGYXqQ3FEyZ28DURicmXwArm68lAhOLKlqkAMLqHERuA+Dz
X-Received: by 2002:a05:6a20:7f96:b0:3d3:af66:9f61 with SMTP id adf61e73a8af0-3de0e73a730mr872377637.27.1790212561937;
        Wed, 23 Sep 2026 18:16:01 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d5794sm1741392a12.14.2026.09.23.18.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:16:01 -0700 (PDT)
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
Subject: [PATCH net-next v7 0/5] rtnetlink: dump link-layer multicast addresses
Date: Thu, 24 Sep 2026 10:15:49 +0900
Message-ID: <20260924011554.3494-1-sigefriedhyy@gmail.com>
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

Changes in v7:
- Add a per netns generation counter bumped on dev->mc changes and fold
  it into cb->seq, dev_base_seq alone did not cover the dumped entries
- Sample cb->seq under the address lock of each device and again when a
  dump round ends, so the NLMSG_DONE check sees a change too
- Drop the Reviewed-by tag of patch 3 after these changes

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
 include/linux/netdevice.h                |   4 +
 include/net/net_namespace.h              |   1 +
 include/uapi/linux/if_addr.h             |   1 +
 net/core/dev_addr_lists.c                | 216 +++++++++++++++++++++++
 net/core/rtnetlink.c                     |   2 +
 tools/testing/selftests/net/rtnetlink.py |  73 +++++++-
 7 files changed, 311 insertions(+), 5 deletions(-)

-- 
2.43.0

