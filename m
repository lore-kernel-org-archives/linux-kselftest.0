Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332829;
	b=m//FyM1fFJ334X8JF+sMSN6u3IZPsgWshavQ2giv0oDs+c6iLsJoo6Q4pcd2cI7S3evD
	 Hm/zx19B4DpPM7izdvMouBBWEw9UTHkpJRNf9UjDn/DgHY9sb3Uks8oZaWWeaBLJzM0gU
	 K0W+3PBejPI9YQncZsDXli0/U8m8jms5QDFMnRCt62q1ZnG/AlRI24cSPLBlmJBySEl3Y
	 hsT+64Bf+H+e/C3ZWBiB43BBSAtAMhiuaf/AI7wPg7Bhsc/77s0IkCrZb4J07TzHy/fy+
	 yrqfFDD9sxanAQ4CVF3KH5bHSWZydfIBFXVS144GJOKg/Zl5WZ05pjshJ1DWC14DjQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NlRNOzFMqD+oA5ioFJM2Cv6/q2g0PsbDXyZwiGG1XWE=;
	b=jcM9jOvTzuiJ7TrLW1R6L4Uo3fenpZsY3hluWobpy50XxnoYTHoOTSR8MGKPtHz09ttW
	 ZibmCVrY19b+ozjrqe2F4cwS48dPHaQKs5/k9rleHx6BHUwx8184oyR8T/vgoTfc7fc6J
	 vamqwLn/toW7rmJ4BzoZf5RSNXUE22kKXvF54AaaJVOMNbLOHUyT1rAxwCasLSW1jvWcu
	 ovNq0mFGKhVZDMg4cc6OXusv3NqeQCsACdcKhV6S8d9Jj7jbWMbaRcVoDxPj69YD6dmYF
	 cwv5aO1q0BJTd5u5c8jtpZi8LIlKPP+ZKLMJiwRMMlKutBB6o52gbUBEmg6lU/RXSVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGt5pilS;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A23606A325
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A23606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGt5pilS
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4a76f63b243so1690019fac.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 09:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332828; x=1794937628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NlRNOzFMqD+oA5ioFJM2Cv6/q2g0PsbDXyZwiGG1XWE=;
        b=CGt5pilS48isFlSAeWqtyKAyl3lhLjSOIhXjMbGS6NtkO3vWqcpPx1CKixvnXvYv2i
         Edsr81/6BrRkjLfAryuPAqCuvrpyr94q4va1pAtz5gSSN2VVlTCDtrvVzgW54X2GsvRW
         E3kPli6PwE+4khrytoZedA+F1+COGhhbTsR4oQpEwdSCG7Yuaw8ItkFJAPJjVSO5I3j+
         gMXuI/xymHT5s61uznSEK9fErU7M+mpQV5+uCntjSs3e4i0LaifRrFEmEJBmz8DLljDD
         nmNRKqwROguf3hKRZvyoK6wZd+jspEW1bvDt+CAJPrK+029OBVmM8WSZ6kvXXEhZMKwp
         ZDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332828; x=1794937628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlRNOzFMqD+oA5ioFJM2Cv6/q2g0PsbDXyZwiGG1XWE=;
        b=aOgoVicJ4vbLXZKG6c2NRpNezqEghj8RJ+PyXTSyGQ5B/ba4tMj/91Cxv+d87x/0/k
         UAiRCC8S1mAMfpyehAmWbgPePaJvdlElzMFmSD1ilGZ/C3L1MRqS3nvNR+kmVvBFSW5o
         eNSAzixO/yxr9Iu6FMLiaJFnFHtksGKkJtTO8cwd6VK0S6MR+0LDCz4Sl2YnyswJIPmX
         g5X5r0/oDAIK0sHWvJkPskR3ROhuTj8o0afhBDcqojIpUzqFhHjNLM4IFjPkytAjXnwD
         T3pFgTdWbRzTUvzaQw1zogD9xBMLpw8DCxm1pFhFcFwpkruJ0MRvIeIuH+aovXT8WVAF
         V0Lg==
X-Forwarded-Encrypted: i=1; AL+hErF6Eyl4e6QhSrlsqU6KDrsF6QBDnwVfnsUb2EoqG2jjlmTjs+ZuqJ5K9gevihTJ44a40mDGmCQaj7+KCWMhlow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8uiWxThiAKAq58h7twpwtPja07DerDdpvAn4lpDvrZCQ1TYt6
	QqC1ETSsROdrIoKRf6iCb8iVpvNmivvDoeVTyqRQscsu68b3doi8gMJK
X-Gm-Gg: AYBFou1/LpHKT3eCn898F4iJf0lQhhZr/eu2ZnweuksShB1yAJ3UnCS4VGdn8DkkfHN
	GFWJ0unr3y1RBsmXkZhQwf98MNxkUyPB3MxjMIYZ8QxI5Qoe3VsFnxo1/HWKJgB+ddUfX4rfZxh
	bwtmZ3CiCGKgXhnZf1bmIQ4NRZd5hgDHSyYoXJxibB+btf5wDd4cK+3igCFz6fKHyKosStJfEcQ
	3HxfFk2WHXsPGM5Molow5aNqBx3Yc6Zv0kJODPELO2aCJRh0BsHq5Z6d8CFCm1Md0ixSTVLN7zy
	BhRC8Ip46bN/shmdGgclBkd4SaZGu172T1E5cHdXZG4LMMNMgvDsCp0EGerP9+NH0hcV3ZCpM2h
	aPZ9WOSMSK45RbZpPZ8JOKPSdrvIupEx828sz3HwG+1a6COQl2vL14C3yoMv58lGBzUkHVP4SLm
	+A13TgEKYsnhtWexZgAhkwez98UVYidGcAr6st0jPzmwLNC6fduK2bT3ZIMDpmUSyOQ66Vt6KAB
	xchhEMYYrxR9G2b0rccIkCoITJ14pQT/AlayrQ0F6f6L2IIDScmQOIbqI0Fe2ySiQxNZDrtT6Ic
	pwg4+MhyeVmVrEgfZcMrYY5r
X-Received: by 2002:a05:6808:1902:b0:4ca:97b8:62e7 with SMTP id 5614622812f47-568728348aamr1436286b6e.3.1794332827698;
        Tue, 10 Nov 2026 09:47:07 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f2faf5sm2667315b6e.13.2026.11.10.09.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:47:07 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Paul Blakey <paulb@nvidia.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Shuah Khan <shuah@kernel.org>,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 0/2] net: openvswitch: fix a feature leak on a failed change
Date: Tue, 10 Nov 2026 12:46:49 -0500
Message-ID: <20261110174651.972936-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ovs_dp_change() records the requested user features before it calls the
update that can fail, so a request rejected for an empty per-cpu-pids
leaves the datapath claiming a feature it never enabled. The tc skb
extension key is a reference count shared with cls_flower, and the code
that would keep it in step is skipped on that path.

Patch 1 fixes the ordering, and drops the reference on the two other
paths that take one and never give it back. Patch 2 adds a set-dp
command to the openvswitch selftest tool, and two tests that send such a
request and check the features the datapath reports afterwards. They
fail without the fix and pass with it.

The problem turned up while the YNL spec for this family was being
written: describing the ovs_datapath set command meant reading
ovs_dp_change(), where the ordering stands out.

---
Changes in v3:
- Patch 1 drops the tc skb extension reference on the other two paths
  that take one and lose it: a datapath that fails after ovs_dp_change()
  enabled the key, and the reset that runs for an outdated user space
  instance. The description separates the users that hold a reference
  from the ones that only read the key.
- Patch 1 records the features last, in a setter that takes and drops the
  reference along with them, so the rule has one home instead of four
  copies, and no caller holds a snapshot of the old value across the
  update. The datapath.h entry says what the bit means.
- The recirc round is a test of its own, so a kernel without the option
  reports one passing test and one skip instead of hiding both, and the
  skip reason goes to stdout so a run that skipped it is not silent.
  The EOPNOTSUPP number is read from python, because it differs between
  architectures outside the base list.
- The tests also cover the reset that an outdated client triggers, check
  that the datapath keeps working across it, and use datapath names of
  their own. The reference count itself cannot be observed from user
  space, which the commit message says.
- The selftest cleans up its sandbox before it reports a skip, the way
  the other mid-test skips in the file do.
- The config fragment selects NET_SCHED and NET_CLS_ACT along with
  NET_TC_SKB_EXT, since the tc symbols sit under them.
- set-dp refuses to send a set when the datapath reports no features,
  and reports a bad pid list instead of a traceback.
- Three prints use f-strings, which keeps the lint delta at zero.

Changes in v2:
- Patch 1 limits its closing claim to OVS_DP_CMD_SET.
- Patch 1 names the reachability and the effect: only CAP_NET_ADMIN is
  needed, datapath_policy does not validate the per-cpu-pids attribute,
  and a disable on a count of zero warns in static_key_dec_not_one().
- Patch 2 treats only EOPNOTSUPP as the missing key and skips with the
  kselftest skip code; any other failure fails the test.
- Patch 2 selects CONFIG_NET_CLS_ACT and CONFIG_NET_TC_SKB_EXT in the
  selftest config fragment, so the recirc round runs in CI.
- Patch 2 sends the features the datapath reports when --features is
  left out, instead of clearing them.

v1: https://lore.kernel.org/netdev/20261107113403.797779-1-houminxi@gmail.com/
v2: https://lore.kernel.org/netdev/20261108123424.2825403-1-houminxi@gmail.com/
Signed-off-by: Minxi Hou <houminxi@gmail.com>

Minxi Hou (2):
  net: openvswitch: do not record user features when the change fails
  selftests/net/openvswitch: check that a failed set keeps the features

 net/openvswitch/datapath.c                    |  34 +++--
 net/openvswitch/datapath.h                    |   5 +-
 .../testing/selftests/net/openvswitch/config  |   3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 126 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  60 +++++++++
 5 files changed, 214 insertions(+), 14 deletions(-)


base-commit: 8373c4e8863ac5f5120d200527aca9880330f343
