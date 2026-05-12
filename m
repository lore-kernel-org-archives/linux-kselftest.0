Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFAA32E696
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 06:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567955; cv=none; b=LphfaIW+pAr3kS3FYsrughzYckx8meU+x9/fMqJaNJ8DB6779OtgXhCmgkPdfJCHpbbhpIrJBE4TlMdFz71E9POXCqYa2Jps2nk7e1tkPvNlCjeGnOpzW2v6gVmL4V5P9dzKPdot1gaQHbEnFopMCScxue8u76hMxmd+JITva9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567955; c=relaxed/simple;
	bh=ReCO6+bh7wS8iJhfio0QbKq7IFDuLtB2Nf5u/s3X6+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyjQhKiCnWG7kt9JRFfc7KaodQM14zPNjFpEuf9gXmVubThSyyMoKrQZQ1RiRugwfLW1spEZOabeyPRm5YmWRvjpIZylZ7ERT9AeKTrtGm4pTzN6K51ydlLKqtTosNN6HLX7NBu/6lMg0/LmdJ2q1cUjXqxp7hrFAjv0eXRng1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0zT/NuK; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0zT/NuK"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dcd689829eso4668376a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778567945; x=1779172745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZihSXzk3m4ncPT8T2SwT5MxO7o0tjFPGrpvOfDpq78=;
        b=N0zT/NuK1wSWw7Q97hs7GhIGkxoDTzWq/eiD93nF3tLcRR7SwCtYtZILXSQgC0lUw6
         QYOJfOkCPQpVZwj0/rZY6bvXQeJ0e7oBxaJdODplI5z9bkRxo6MLuE2LjV3QzTrkCUIQ
         j4zPPaqdzh4gVBKRK8Vg3bJ1eCp+tZsqpqCNUWGDhGieyqDtmcDMbGlUQ9SuCjApJZz/
         BbkyErpeSlVL/ku1QHf9E7oqNdYtN4Kwq21oxqiJyY7L+Q7hnK+N9g0BXsDvam+6FppY
         Vz2zM7/MHi0BNZBXIOKGoI+zoBvofzJUV+SoOQKhEWsAUv62h+/pNLSmzNTsVQ9xHc/9
         hS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778567945; x=1779172745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sZihSXzk3m4ncPT8T2SwT5MxO7o0tjFPGrpvOfDpq78=;
        b=E6W+AoTaOT4nI3C4vSvlWj0QVk+jB/mBI+9AMhi/P6fFuki9lJbrYiEN/FwCuqI+Ka
         LBYmgZAWfLhGaGM3EagQLQoP1Vb2XkcbMD878dmYH6PjQy/byyiKN7vjmaP1TJ4BVZQ/
         /HVXxo2psvCUKioMKKDfz9VBxIEv6bLLD7gDmssmXVkgxSfbaFhBsg1gihzl4Hy1k1iP
         5k4pt6flpcawnphekdDQds947Uz/XEUaLMXwnQAUmmb4Vwu9THZZTAjvXCLBQidPiGeI
         7znCeJwrcW49naIcrecpC20UAQXrFtkdkl9AkIggSiOrfURBu4moAMv90OnY+EL7afel
         moGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+M1Nt2z+j3XuHuqP5y/8IDD0tNKdTzwwRqatz7kddHnUvJjVt5VlNpbmhHQxm0bmwDWZzL7qv/coH+JNL07wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4FJWlJy7pSSLA8IRcjWs7p3X44hpZVlT+AlJtjmID3qEmvDj
	/nnu8JqBdO9cUS8LDoFUNqNVc7D5KSkvPvMHO72CvHjOwPZLMFkQqcBt
X-Gm-Gg: Acq92OHdqewtFVmN+J9LwCRxu+bdmt6qshQZ6gugDI0wvoVZQuGkLpzlngs9liwYQrV
	93EzO5UOmRJrq6ArfB8Lb79FP5b5eH/WitXrGEQhX9EtESIbb10mW2Fb8KbAft53vFQXtSADwTD
	Av7B2V3Gys0lTU8HQ+L1BkRe4ZlRCNbjdnjnMikV8+aVtZGa21rj9wX8hzSDjR03UCRP1Klvmw8
	CfC7sy8XyV2exWKjBJgyZiHTi0onhOHA3t5B6UicKnUtsqGphznpIRllQpEOm8AWIpD7BKpq1mp
	9jXhTdTQT9T4CWebnU0RigbOljv9ZwN77bDEGxKrSaQRjI0B6r3OZ4DWzHcYD3OdZddTsfbooT/
	ZndDZ0nUyWqUINC9+EG6a89AL/DQCbQFaUsWxe6JPCwPTscQ/ro7MsmentW6w1FW5T+qUNqUB3z
	RSjskWQ/cZp8TAh8Q=
X-Received: by 2002:a05:6830:6281:b0:7d7:d504:cc6d with SMTP id 46e09a7af769-7e366839eafmr12638704a34.21.1778567945479;
        Mon, 11 May 2026 23:39:05 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d9d788sm8183783a34.24.2026.05.11.23.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:39:03 -0700 (PDT)
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
Date: Tue, 12 May 2026 14:38:48 +0800
Message-ID: <20260512063850.1133046-1-houminxi@gmail.com>
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

