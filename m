Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BAB3E3C52
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247812; cv=none; b=jAErdz9sm3YWj7oh87sL+dhqXloIvhj0G/Ropbq97S+/0Pj5TygzYU5Wu71ygZDSwwrmVBPjpMtp37gtmbff4p3nJ/WAdrsvBxQG/eMxScxmBfRDIypo7a9oKrYyfrHIoc7gQ8yuvJRckyRmopm6+t9eL5JF/Lw2k79ucAhOAO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247812; c=relaxed/simple;
	bh=7GcLZw7DySV9vySSdmClyP6SHFI+S5gcBR+KuvnhV7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TKDeQ5HnbRTRD1MLRSoQGHEgw4QUgfxq+0yi1125Xb7QcBBY9edLBJZlMR93A8UQ2pzbISJeF7vR7XLbldUTRA+1FuPdbAti2/okRfmzzg+Yh77bsK0d5qGKnB1paeEsCMQ728ijtVuoRelJY2bxlPPOrMRl4gL0m/jXi3MPaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCBgdAZT; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCBgdAZT"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-42fbf95cca8so1515169fac.0
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778247809; x=1778852609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iq3rziezZOyZlc85+/KkZ62IiSWPXFI0NfzP5OCCW9I=;
        b=YCBgdAZTfUNkZcEN71izgW6JeernhiFd5xsOvSVWbjPuPmcGP6vaqNsEe/q9Bc4Dlo
         QumnYH0lQz3il2n6sVd0nnQOwXawWljgnwggPDQ4HP0g4gbnQRuRqYMqrBWo62L2xanA
         fe4TwWymuc0r4AsbCf7ZA/AfW6sHIRvONMZMkWCLo5Qk8sD1br3MUv0glQFgc6bqt9bD
         BSRzvFOvu0yLjWaGEN/646uB2QN4VP5BpYJO6czPlC6kIlFI7bO6D37pQejRsSyGiu7C
         IoggJn4LfQ6hJq3kSqm9/ueVnTIsLsn7dpilOuZUy4wgz51syHvUIJissBVQ4C+TxAvK
         /Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247809; x=1778852609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iq3rziezZOyZlc85+/KkZ62IiSWPXFI0NfzP5OCCW9I=;
        b=WVe/uJTvdC+5tSBpnrwptWSQiP+oUmdY3fVs9ISVi1sLTezN/yRSaBXnwkt50pcxZ3
         eUNO8rSW/JM4HSxUJ8A70ctoGIdjk+AlDklX1V5VYH0XFpeb9sN571KU9rzpEeEb52Vk
         RHr5f3RN6/NxhR5W1whYVgroO+Uu0boMP9r/fR4s/oi52IIAf3EJSJpWyS+0p4Lebsrx
         Zncn7cLlNlnpEyIIrxhXF2SFvk+5md7XGk7AwrCNt9N/0kY82SMa+2/OUmqFvAv+p82H
         TSyp21ezkjUVrg7GA7kR32lfeuts+m8f15aQiKfFwxWZA2oNuU0YqV13jVORkKcmUUDg
         pVjw==
X-Forwarded-Encrypted: i=1; AFNElJ82sP7k9BuCAXL8m8z/BPe2eBuA/hDtFHYOhBptPvLRdu1fqJacUUuowPbiAfUYcFqU6Q7hTt1ee/OFFluE/iI=@vger.kernel.org
X-Gm-Message-State: AOJu0YywzTUzWozNI7t1dwrBq3d7vYD/lNkoehKA+cf/l7ZGM37NW+uj
	43Go+AfWj8CuIfJZE8ZQLncysZclKH+PiuZAFJFwd1Dji2cfjDmeIF/z
X-Gm-Gg: AeBDiesTaMX62tz1+X/1c65MRlLoT/8qkz2O0JAnPEAknBNF1MQoAHrvatqq8kNYp6z
	Vsy1MUOtk0c37dXKLj8Tjgi8hsAK32FGvdYjZYKTQiFtDigCd+dLiRAtAlrx13f7dxy4GV1E92N
	yqFcMqIJTNX2kXJXC6lsxp1c6OQj9zHVcBTdZnnhI6bGoKa7Tttteifwvw1RWs7gpb6PqQ1VsAM
	5+VHVuEYfqUDHf+e29vVYiilg+qdXwq42LsyyQfDNN2PMPgrvySgsAdjDLkPlwZJKaq+Oo75S8x
	Y4J1cumuHczCLecZMXPRLWwd+y94x2dMbSyBvDpZaem6vLhLS0DnWmXenvs9Mgt/rlIPG/ZTnNA
	GQy26n638VsD75phM5ZA3zx/tDcs+AgyuhiVyrBrHyDu9i5GJKSyWIo7CPETNOSJAJrZLXXF34k
	JfrO2ieMk2HFbX0Hw=
X-Received: by 2002:a05:6820:4b0a:b0:699:a391:44cd with SMTP id 006d021491bc7-69b25b787camr1402565eaf.23.1778247807957;
        Fri, 08 May 2026 06:43:27 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c76cc4sm1119108eaf.6.2026.05.08.06.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:43:26 -0700 (PDT)
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
Subject: [PATCH net-next v8 0/2] selftests: openvswitch: add pop_vlan test
Date: Fri,  8 May 2026 21:43:06 +0800
Message-ID: <20260508134308.2857449-1-houminxi@gmail.com>
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

v8:
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

