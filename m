Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9619F384CFA
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 07:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569745; cv=none; b=MJgcpCAn6VXjZTi2sL+NacSFb0ZncaJAG/ICN3b/VO2xNrYzS74ndx4W7uZBz3TbxqJhObP3gWHNLxAjTWcQOZCDpzao/amwtV+lHjNCXJD88Q09Hx1EgONTI3mzyPTOffFPDNrwzFsLOuQLq4oKVOiyFRHhLe/RmriLVXsVT4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569745; c=relaxed/simple;
	bh=gTpTMvSvFJ8GP4FRzcczUt4KNmNWQ5lbqdKG3wswn0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ac3oM59kPJ9j8X99ekwfQRdqEf7cy5lrC3p+nk3P5PIizR9Dnb2THnb7wR/x0bcIuMW3vOSaO+N/XJpavbhcXBRyRZmgTkd/2ndkt4qCWVjFD5wZaBQ+fdTAPoyNANPKkY3ob2PVdLHpmsrV1K6nB2zvjV9XwA8Om+wj1r28l24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrS2u+ia; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrS2u+ia"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7de7dc85b74so4441952a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 00:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569741; x=1779174541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGMIjlJ1jx9Y1YzrayP6UPnE/naew0CuHij3QAkOKtw=;
        b=PrS2u+iae/NXDEH6CmKUsQ9ep5OU4W9F9uebtx36QZ8qHHAn6rX4bL/U5Iq7M7kE+H
         lZ0EgEKClixpjpnoCF9zsU5vI9Hw2+ZLwsGPDn+d5BJhlV+Ot64LRDRTm9uP2gxu6X5p
         llMeWYZQ6u6rDqVg6q/J5bY4y1kvIPVhkPxHPpF4akEKXSPMD0o3JMZ0kND5UWjrg4i0
         7ttP/CAz54FyR7ySuOqBjUwsnut/aNkUlXNcaGkeO3AAM38WJAe6IwA7wa36rlFWtWdm
         8DprbovPxi5H9pkot7O+dMTh5+HWegXYSTGN12MXtchyUq/oyojPr5BtAVZs1cgVgRTF
         Tw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569741; x=1779174541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lGMIjlJ1jx9Y1YzrayP6UPnE/naew0CuHij3QAkOKtw=;
        b=MHQ2TkFEEHxX3IR3sTopIm03HBlR5Mx5R+Ga9XfPZL1VhV/EJ0fDkTLVMoUQyXXnkZ
         rrIVCwSjrm8P0vM/8ClMA/ryFuj+EVJlulMLJZQsQz8khDLtFFvA07RDGEnwZHxBLRSJ
         pxEX4b+rfiuR+8o9KXl08Ly+H/WampajEQoS4b2zoQuC1RvvF8jPZQwJy2jYcsKEF9gN
         JpZpRlttZnJKmxMg2x8g4sXPAlbgtz5wKSHQmH8teeiq2zHbdVMS3EopQquobS/xNpyC
         Th9peiVKvKgGnIF3VL98wnIoesdR9d48e7r9PJ+SlUQqKHhNT0i8ll6HMRDu6aeuKJ+m
         ST1g==
X-Forwarded-Encrypted: i=1; AFNElJ+x4C69OPNDTx+uH/plX1cqWLfln5YNw3eLp145B9y4KzV8CxXhuhLo0xCrtcrOH97egjHCKOU9n2QMLGOP32Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7aIb8qr1u6+iR9pyi0X+bEucskZJslStqur7eUDKAaqW60E7
	L//5rM/FUj2RzD5zPrDQswQNY0XIauf91Tcz0QVJ0N2h7Ei2aFjmeb+w
X-Gm-Gg: Acq92OFbdGbBGZHnkL848fqbLZx6YgwvAN9YbOAWuljTfmmamF/5JM40xzSQQXiOSlx
	ZkYEXFtw5FMypeyoPk7A4nHIF9qdH6tDhq948xL5UAMe3IacaxxRnApDzoqAubs27/HQpUvNgiC
	+T4j5mrxbRLrksWyqFekZtah56/YksuSYR13+Kuz6VPF5OOKJ2UebmDdP4XXm+FJ/qXsLUY80+O
	v1CVKPFjwjsnQhSeYEhZfGbuJ9xvFPb+NY2wVeiC2NDxGmbO4t4RWsl/QG7vuNrqEXNEd9Iufo/
	gGQPVprLp+iqifN+Wlm1Jix/7mFLhbHKuwSUjuaL/6r3L6PegX0OhfnrGI52pwQzQEByAsVnGNl
	Z6Jkv144NvhCcIQ07Y3XvaYEtI2uTqYrV9Rn2b3GGJTgUYQ2GUGC8HO4D9sKm9L+aBd4xafEyuC
	3q8q4M7C5urs4guWQ=
X-Received: by 2002:a05:6830:d81:b0:7dc:cd0b:58ba with SMTP id 46e09a7af769-7e1dee8f954mr16403178a34.4.1778569740857;
        Tue, 12 May 2026 00:09:00 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367a18481sm8417658a34.0.2026.05.12.00.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:08:59 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v10 0/2] selftests: openvswitch: add pop_vlan test
Date: Tue, 12 May 2026 15:08:39 +0800
Message-ID: <20260512070841.1183581-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260509135423.3433910-1-houminxi@gmail.com>
References: <20260509135423.3433910-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test_pop_vlan() to verify OVS kernel datapath pop_vlan action
correctly strips 802.1Q VLAN tags from frames.

Patch 1 extends ovs-dpctl.py with vlan(vid=X,pcp=Y,cfi=Z) formatting
and parsing, plus an encap_ovskey subclass for safe ENCAP NLA decoding.
It changes OVS_KEY_ATTR_VLAN type from uint16 to be16 to match
the kernel __be16 wire format.
It also adds push_vlan action support (parse/format with range
validation).
Patch 2 adds the selftest using purely ping-based verification with
a push_vlan return flow for symmetric bidirectional testing.

Tested with vng on x86_64, all OVS selftests pass (including new
test_pop_vlan).

v10:
  - rebase on net-next
  - fix masked VLAN dpstr round-trip: use tci=0xNNNN/0xMMMM format
    for masked vlan() output instead of vid=X,pcp=Y,cfi=Z/vid=...
    which the parser cannot re-consume
  - fix int() base handling in _parse_vlan_from_flowstr: use
    int(val, 0) for auto base detection instead of manual
    0x prefix check
  - fix commit message: remove reference to nonexistent
    MAX_ENCAP_DEPTH constant, clarify "encap parse()" scope
v9: https://lore.kernel.org/netdev/20260509135423.3433910-1-houminxi@gmail.com/
  - rebase on net-next (resolve conflict with 05416ada37aa4
    "selftests: openvswitch: add tests for tunnel vport
    refcounting")
v8: https://lore.kernel.org/netdev/20260508134308.2857449-1-houminxi@gmail.com/
  - consistent error message prefix: push_vlan() instead of
    push_vlan (matches vlan() and encap() style)
  - unify encap() error messages for clarity
  - add empty-string guards for MAC address variables
  - remove slot number comments from encap_ovskey nla_map
  - remove explicit modprobe 8021q pre-flight check
v7: https://lore.kernel.org/netdev/20260507131541.2331771-1-houminxi@gmail.com/
  - remove slot number comments from encap_ovskey nla_map, keep
    only comments explaining differences from base ovskey class
  - remove explicit modprobe 8021q pre-flight check (ip link add
    type vlan auto-loads the module)
v6: https://lore.kernel.org/netdev/20260506131218.1880852-1-houminxi@gmail.com/
  - fix non-ASCII characters (em dashes) in comments and commit
    messages
v5: https://lore.kernel.org/netdev/20260505124957.1239812-1-houminxi@gmail.com/
  - add push_vlan action class, dpstr format and parse with range
    validation (vid 0-4095, pcp 0-7, tpid 0-0xFFFF, CFI forced to 1)
  - remove MAX_ENCAP_DEPTH constant and depth tracking (bracket-depth
    counter in encap parser already handles nesting)
  - remove start_capture/stop_capture helpers and tcpdump/pcap
    verification -- use ping success/failure instead
  - remove modprobe/netns pre-flight checks (other tests don't do this)
  - remove ethtool VLAN offload disable (unnecessary for veth)
  - add push_vlan return flow for symmetric bidirectional ping
  - use ovs_sbx wrapper for ping commands (consistent with siblings)
v4: https://lore.kernel.org/netdev/20260504123713.555461-1-houminxi@gmail.com/
  - fix all checkpatch line-length warnings in new code
  - fix pylint W0707: use explicit exception chaining (from exc)
v3: https://lore.kernel.org/netdev/20260503120946.51869-1-houminxi@gmail.com/
  - encap_ovskey: MPLS type "ovs_key_mpls" -> "array(ovs_key_mpls)"
  - encap_ovskey: PRIORITY/IN_PORT set to "none" (metadata, not in ENCAP)
  - _vlan_dpstr: cfi=0 falls back to tci=0x%04x for round-trip safety
  - encap parse(): check return value for unrecognized trailing content
  - vlan parser: boundary check + raise-from for exception chaining
v2: https://lore.kernel.org/netdev/20260501133924.3100680-1-houminxi@gmail.com/

Minxi Hou (2):
  selftests: openvswitch: add vlan() and encap() flow string parsing
  selftests: openvswitch: add pop_vlan test

 .../selftests/net/openvswitch/openvswitch.sh  |  78 +++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 324 +++++++++++++++++-
 2 files changed, 392 insertions(+), 10 deletions(-)

--
2.53.0

