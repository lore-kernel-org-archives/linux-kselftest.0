Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6603F7876
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159762; cv=none; b=dLvogNzbajzQNHHKSje1kZvNzabSvxM5M50UlVl4VzQ3haBCSLQZXndqphK2OPlP37u+P1/0/luxwLKnfYL1pHS1SUncZTODAYV2TZ4MRoje7LIlsZbKKlmr96kd0jQsBoQFHCAcUBGzEIv9RmCkVm6R26YQThBKJ4ScTsMLGws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159762; c=relaxed/simple;
	bh=GAJMcz8BWL9uaAoIKrjqh8nuURhEgi33jD5g9qzyjtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TAtYdIo6Qckg7GJTkRBuSX6qHtGnsmMzuiErLH2QoLSDO4ePIZqxFtA4kwLYex0XDk8NP5MKZC33rpAWTa2QXWW+uAYlzbpoirON4ffPTkr++fBCaLbQT2DjPLzuJjgM5/J1L9FGZQQ7daGgX3CJS8By/J604dlgVb1HfC8ZZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPCtNcgV; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPCtNcgV"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dbccf6a23dso713337a34.2
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778159757; x=1778764557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRvWNkmel+YHvL5LZc0SrAVa4019euEI2glulSMITOg=;
        b=qPCtNcgV8JZtMW82QSx7h5HphHH9bLRHp5Zgf0v0Pti661q6oDqinTmNSnIzHicFCt
         /W8Luuop+k9UBVS2j/8nRrwnBBoRVHKTmNBJNE6359i9tQCPavDHRq63a2x1XSF0FZAy
         iKZFtyKabviVc2nJW8LlVGjEKiwdQm/xG0cUW7PcgHo+dvXMiYpX0eHZ5LqWGTFep/ln
         obb/NoQSLK0YIRN+brG4g0anWC6G7t+AzVRhXbaSTzR3gYj4ewgIunnE8UtDMPCoghOU
         FnKAEkz1J0tqf9GSbafq1Zx6ftf+cg/r9CLpy8AyM4TLV27NXriY4BsoTVS2rvcKtaSP
         tX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159757; x=1778764557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRvWNkmel+YHvL5LZc0SrAVa4019euEI2glulSMITOg=;
        b=NWkrDmAlOm2eZHU5eyHdojIAnSjNSx0evlopQAH2rLnzxBkBhB8Dulg8bUq4oTfR2z
         PHRvYflSU+zRWtwBApg2ErCNKIekuVeJpYYbWQWQ8i+5I/s+BRlp6FiKtj9FHzROotAe
         cftcIn9lCXjWDgCWUb+ziwmYkXksD/LFtJc9tdPSwS1up1mh5vhGvjqslnwhfS7W4uW/
         iWx0GTg0JnLgOJ5BfuMlwqYH6zgPiC9FjqSPXSexZDeEm9DvFxVPloDDLUX5Bk9WCkys
         bUS4AZEymy9pdTrJewfF5vHdl6VRE4W3ZwMRyGybLm1irP3PUBo+KAcdohzN6q6LGgyb
         GY2w==
X-Forwarded-Encrypted: i=1; AFNElJ9hnUnCLmh6IlOz0YFUihkBuAl7qPMDAWt5Ve3PmeZFOdgOMW5hL+jEVDr8ul8QpbX2ue5hFGh77aMcZvc4wYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsAaxCwTjuDfj3hAiQcPD3LJgWw1Gtmej2blmzAiDt1BkXcYJs
	KTLozT+TkX7J2RE35FOwkYEz+X51Fm3bgCH6yVMWj4KH07rOqaRES6vY
X-Gm-Gg: AeBDieuuprXVyShPk+pqBX24P4YvlAiKiG1RjogzozASiNjbmd8Tfvdje7Px6ieC4zr
	7etHB66YRSNCrmY/OjLxCV6nsja2J+DZxlMwzQtjqF2nB7HiIaz+QMlKlL2Q5MJJsUjYUXBvZJo
	vd5J88FvUyh4mACa1UCBGOkNPx/13z7iboVldA069kn6FyVyteWblIhpLkeyazx2bKcDAW/yaYN
	ePSQwVtaug0iEdLRILdcmM8jQcaJ7rTr7pxnuGHgMBEOnsr897vGdibBmYZF5K6CKw208c7eslY
	8bOwqFs7Qx50rTXC8XePzUxrmUt/gaTaO8eVYDwFdc6IBU5U8aPm+wMZ3907o/lEsO4ibbR7LD4
	qqtMaiLuLDMxMv6Dbrf6C6wWIitgpbbCyHttu7tf6yOO9jfmqNh6U+8+3AkLpE5okrpMJxn9yhE
	hfbvGk5u/AsJ15KZVqz9JA4RhTDXucLP3ueS0l
X-Received: by 2002:a05:6830:6a88:b0:7d7:d524:bc8a with SMTP id 46e09a7af769-7e1def078b1mr4464120a34.9.1778159757284;
        Thu, 07 May 2026 06:15:57 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deca826dbesm14047117a34.12.2026.05.07.06.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:15:56 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v7 0/2] selftests: openvswitch: add pop_vlan test
Date: Thu,  7 May 2026 21:15:39 +0800
Message-ID: <20260507131541.2331771-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
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
validation) and removes the unnecessary MAX_ENCAP_DEPTH limit.
Patch 2 adds the selftest using purely ping-based verification with
a push_vlan return flow for symmetric bidirectional testing.

Tested with vng on x86_64, all OVS selftests pass (including new
test_pop_vlan).

v7:
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
  - start_capture: || return $? to propagate ksft_skip correctly
  - on_exit: moved after resource creation, not before
  - ping success: changed from NOTE to FAIL + return 1
  - VLAN interface creation: added || return 1 error propagation
  - netns probe: distinguish EEXIST from missing CONFIG_NET_NS
  - sbx_add: || return $ksft_skip -> || return $? (match sibling tests)
v2: https://lore.kernel.org/netdev/20260501133924.3100680-1-houminxi@gmail.com/

Minxi Hou (2):
  selftests: openvswitch: add vlan() and encap() flow string parsing
  selftests: openvswitch: add pop_vlan test

 .../selftests/net/openvswitch/openvswitch.sh  |  73 ++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 322 +++++++++++++++++-
 2 files changed, 385 insertions(+), 10 deletions(-)

-- 
2.53.0

