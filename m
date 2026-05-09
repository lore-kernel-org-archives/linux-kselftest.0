Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8772E7635
	for <linux-kselftest@vger.kernel.org>; Sat,  9 May 2026 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778334883; cv=none; b=gF/jITccRp47pktTn0uBYOp03YZpgwtrn4ilWc/1iLzAFw79c0HH7tln4zMnnqc2yQNjbilk7L712Yfj0Ut0OxjcWLt/ov6zkbUH7esxDRK3Und64AA+gzyEtgvGDTRnLy+hWMGrADm73nB0GODr1qIZIKm4Oy9ti22AbUY0HUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778334883; c=relaxed/simple;
	bh=s8RkVMXZemdiQoY9pW2xt6lQMdfxzciD9VpqmjCZqG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=De20D5l7qDjxwH1VETP+dsotKW6gGV6yCHyVOBLjpvj20O0tgYrN3fF4FS6/qwH/An4nX9kdHFDgDKBFXPywhLiq6G2pNFicXHq2fjxDMRqqPXooxOB9XDvr/StiOk1uylwCjl0vZLYpzXKKIGry/rMafoh4l4pp8SepRDKm0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5FOyxK3; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5FOyxK3"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7dccda31d3eso784231a34.3
        for <linux-kselftest@vger.kernel.org>; Sat, 09 May 2026 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778334879; x=1778939679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ig3nNhx1sG1zAlt0z0P6AoDxT9sb+Afm13UJ76h7LOI=;
        b=F5FOyxK363rSy+tnjU9lJHrRqAHYr9QVfLQ5X+CSc5PERZi9HkXu7NxafMsdbJ/v96
         En2uscGTFDryeEp7YleU1meJ3IDTfmFRycFOyNNSamD3IWV12Wi+lfWNAbg4EfVN5p0J
         v3nfmvmANyF27YXHPAlL6z/qQlxByQiMJrG+xzbzfDzv8Py7KS8TKABpzJLbAWwmSLV0
         e/aRB1FXAMqCZZOSLUC6FE5uUliznUcNzoDXADEbx1ZwmM76rYU3B2Ah9Y4DaRyGevbA
         Cm+/wDXiAh/F2bcrH2MrNlueIqARDBjpP6LikO9di24rXK4RRDICgl6opKoYT8fVetix
         URUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778334879; x=1778939679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig3nNhx1sG1zAlt0z0P6AoDxT9sb+Afm13UJ76h7LOI=;
        b=q35AEXxLYWlp3Tnixk/lvhbnWipjx5h5C0ah4tvSVa+BDzpTh4eJmZdLoRIXhBcuwj
         v3T50eEc/sObiHifLGSSN+vqxQr+JqrIJ5ktBVlD4FnoakI2vzHgxqmmiEAmP9QwX6GJ
         nEKIlI0UH3QjBalugf3eylIuisFF28ULt0r3mX7HAOqS4CtJpoVYjARFu+czb2ryl4uD
         Gt2+z6AiA4aVaIHSrUNFA5xlX+a4oVTj3xDqNX39meTjKWk/c+sPZgeILNrsENv/YmuV
         rDuVeG3PUBrSX21AhyOmaMDskrlFx85h9x+loqA4Fjby7ZpbgnancA4Awm5Cfl3LJqWr
         /SPQ==
X-Forwarded-Encrypted: i=1; AFNElJ++SC4xTQz78ulDmGCbmMQPxRtYCV25kpimLxIN8QBpADQ20x4uZIHndB0xEBUXZBZI3JlpWCq3ugelcwFiFuA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2lcJeg8qtCbsoE2GIdSX1KUPw00ogPt/xd5996pu/88/tiN4o
	G8nxbPyan1Ak1LeDnmxW8nMRuTnV2xltd4Si/w+Ah8/ydgIyQ+cSi1/p
X-Gm-Gg: Acq92OEuDkpoJihYMjBntehu6gnChAg7+o/scCtyHYuwIr4IO03qrAjsO7pAzORUCrw
	n9g1jk+ii3qO36Vg2eXpov1EmfyceUdtvwrj95bthh5V6sAOPQEANVkII02OVTanynKNEqpIrP1
	osHV24PVlEDHTbKB0CnXLuB/19f2B8SSiEyWtRi5gC5Yo9xknpBAURt1iX7a3iXHj66gPgpuvbL
	b3/ljGeNd4g1ukkKWtJ7yZ/vTkW/h5UdCKbXTE6A6IW/4Fh/idCbrwCQpowzVw7KXh2IkSnDwyY
	+b06wsPbjAz8vMmTe9aRrfQOjYiJLB3vrvtFwTJyV4mVzGdlgGm+UwIYOpom3fG9QF9kqEcoUmz
	SdkmpBZVL/E9xYiGLi5cyBqIZU8kbS6/Hz5XJYDxMUyKaxS2ePrFFFzVaYRqdeYCfijbqYC6++8
	j1f4zABmagQtpGBcp71KREgi5x+w==
X-Received: by 2002:a05:6830:3697:b0:7dc:cc70:7788 with SMTP id 46e09a7af769-7e381f3b7cfmr1526122a34.7.1778334878643;
        Sat, 09 May 2026 06:54:38 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367c04e66sm3098110a34.8.2026.05.09.06.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 06:54:38 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@redhat.com,
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
Subject: [PATCH net-next v9 0/2] selftests: openvswitch: add pop_vlan test
Date: Sat,  9 May 2026 21:54:21 +0800
Message-ID: <20260509135423.3433910-1-houminxi@gmail.com>
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

v9:
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
 .../selftests/net/openvswitch/ovs-dpctl.py    | 322 +++++++++++++++++-
 2 files changed, 390 insertions(+), 10 deletions(-)

-- 
2.53.0

