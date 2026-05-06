Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E061B393DE0
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 13:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778073161; cv=none; b=dE182mV2S9US5sz+2mexHWzMnmneyameK3nbQ+USzXg3SE1anVxj/JgjM2eAAGZTGAZJ9twTOHbQpiTn+XzyEkqXk4nCQ77FZE+l368OX0rtsBjHMtE4EghAc2HCjR3kCgcFdv6FKUu3Xd2b2SnT3z0NtQQNuRjK7Iirq5odOZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778073161; c=relaxed/simple;
	bh=X83K5mM1jYGkqZrBfO1Wt6FMuY7O2dGmxCA5gUpRXP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9kUTslHcVOlHrg+AhYefnmfV9M0A6UWIaZZRAF+/MwzD7ayBqbO6MEhqLGpB5DyyUavWjOAOKEL9cRTUGX+zyS22RhcyhTj50iAMfRsYA/aYNXv/f7C94vCEkNDi6rau7FEfjnZpkj293Z8VRTfRmKn0r1d7AXDnTST3psFvzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/U2DIKE; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/U2DIKE"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-404254ffe8aso881138fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778073159; x=1778677959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kTEQSdm9N3Asj45KWJ/X8grv642fa/qSFTK0vp9knYo=;
        b=s/U2DIKEBP1H5O4CDwuuuR2Pr8w7yhZHpVdnzpOb77xI9lG/W2ksUET5RLClm3M7zX
         sz02BEefqYvil1c4ZRCPTeF2aM9jwWnAfBKemI2fPynvbbwanvOZzvUgZ6RAg1WVTaKW
         ONqGz3qeQf1eIWejbgECv4AEqLRvm4/NXFTE1WT6rP35ERTEq9Z6Xc/3OZhdGdqVAWml
         bAZwgPzONyhwGwvLn2gfExFz1qRF+j63Rvd+Tns+7+0QraHPM8/HMvOQNV+Boqh83o2K
         XK3AX3MoIA8PRYyyVVqWzpJh5TTywmfEaIDHfNHPMd1ShVbBsTt3eAGZ9GZ093A3bXcp
         BoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778073159; x=1778677959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTEQSdm9N3Asj45KWJ/X8grv642fa/qSFTK0vp9knYo=;
        b=s8kjhnkIIX66ZhtULBwJGWeJTGO6j+abwMS9JBi2tvunHGZA8xiK9s/B2cI7R08Tmm
         8BbUQy1QczVjM61Z8sIH8yF7EbCBfIvsGb3/EGS2JKr51ip3Tc1TwbhtcYjhIC5y+kuZ
         HB64bNIxPIR5TFVLSpebl7VtQ0th8apdKeLYu3/N3atBPv9ceTy3847m4aZ9Ioo/2d97
         e9HEKMuleIUYkf54uDwUcrdQzEOoamwCMjtRv+XOYddOte5n9sCM/371C3cIPnU9Uwiy
         rdLeWxu74dJE/Dyls5SRp8b0dvML+ULxTwphiQapITpacpoy2JhudykiCnLEdWWI1kYX
         7T/A==
X-Forwarded-Encrypted: i=1; AFNElJ8FhU5DTDvCdZ19yHcwdIOaoMSefVobZUKMIWt9VeypUW/SF8mOdcYmFDeCK77ti9GDzj5WmMNZE6WEDyZ8YHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpX+3Cmsq8TZ2SOiliSuX6rGbaq7Z6s5XW37eo4siOnD4oZ0Up
	uBWjzJTDigf6IsQZ1WtErKO91ZH/6LffKnwP9KbD6/9bFrGgbd/FPyMlx1bpNRmAF40Fxw==
X-Gm-Gg: AeBDieu8iMQoflaEEq0+s8VbWOzuk6mMmfn0dLCXHHN2BC/dyZpNdwYtvejtwv2ZY+r
	US/k7C1PdnyCK8VxZVRdOJAnWVbjUwr9WuU8NzBaSjnGxv0HANckm9nnYSPIM2rJuTgjsdonvWT
	Z1pe02vzNHvKE79sbbIw7rpi6Ypj4zPbRkM7r5NASs4q9VmkKyZ6qOrFqWAYEapKVkZoF8VEuQ8
	JE17fNIIab3XOJf/4zquFfQZVOAu6zbcCU4Xh7oMZO7ZhcwTieh7d7oBJy0kKWW605SLZpfQsi1
	KwMBpmRwdrGckL6ow95OlR5nxs63eC60uLijuZyeXIyO7K4QpAm8RE1LKij3BIeI7yfTdpxgHQm
	kSg2Mssd5CdrvgA2FeJI1vA8CWe1w2fT12xNDmd2A/E+dTArIMbhZf8lYOu1p0/Ekcpk5eMElk/
	aWZz0K5yVINIMMXXYJacN+isS9+Q==
X-Received: by 2002:a05:6870:c04:b0:42c:b9d:8987 with SMTP id 586e51a60fabf-434f993e8c8mr1573181fac.10.1778073158763;
        Wed, 06 May 2026 06:12:38 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-434548d9decsm17327859fac.3.2026.05.06.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:12:38 -0700 (PDT)
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
Subject: [PATCH net-next v6 0/2] selftests: openvswitch: add pop_vlan test
Date: Wed,  6 May 2026 21:12:16 +0800
Message-ID: <20260506131218.1880852-1-houminxi@gmail.com>
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

v6:
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

 .../selftests/net/openvswitch/openvswitch.sh  |  77 +++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 322 +++++++++++++++++-
 2 files changed, 389 insertions(+), 10 deletions(-)

-- 
2.53.0

