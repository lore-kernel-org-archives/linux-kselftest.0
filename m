Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815F3043C9
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 23:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776209080; cv=none; b=FckG3uswbeI3MvmfoE89Odmj1gNnX++2yruHASFsLHrxc3DY/Hbts1VwqPUCW80PxyvfLLf1Tue7nMfka6S8OwUbOC9z7cXZg2cGtCkBxNqmyFgND0IDgiDCeRgloRwnx/Y53Q1QhT0GzCTmG+dRXj/J3XmyyAh+mtlC7FGT6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776209080; c=relaxed/simple;
	bh=wUdrK1aGS/ciJ2GUT+QYJzMtHSiDuIhpn1b9a6dvf4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mvLFA/iWAIZM+yd8wBMRtW4gW9eWzMxUrXxQTGnEQ+g9QcBIrFGXrEMNQw6b1Qirq4ySkgsQGh7LTDV6jKLGQIYbN6ok9NHCeOEOEqW1nuILYtLLAStqh9eFuCTYOg+mieP+nFVgtfH579Ze60vcSXNV6OBtjIOHMwzYNYOXPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOZqvDjY; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOZqvDjY"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so1016612266b.3
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 16:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776209077; x=1776813877; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EoT7jyah6WMfEESCKOYLl5fVA/kN0jcFgC5b53AGC0I=;
        b=nOZqvDjYCblrr4EOg3zt8hFtm+EAzpl471tAaBJAxOu8rkowvrmwYm5ngef/MzREA6
         dWjyezmzdE6S0uxTH2a89lhpDxgqNDDZBFuzRf0ZRfqgUOSXLGp9nw6mvnk5ciOeb/Yj
         4Jc1v9iNPPZYN6PpaV/o3JlNfqlD3VlhispEP8D5tgUyg/YZlVypPw0Dog9/tpeM7pe6
         VOaAo+oKgTMmg1NqZDC+sKr613W4szNaGI3HngFwh3dhn8uMurzDmn2nHAHJ5XmPlBGm
         D8soztRQRgThgzfTst3fov0NYFq1tY8r8ID5m3IREM0/Is7kChvwJgKaeJMNtNLxAB8u
         zWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776209077; x=1776813877;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoT7jyah6WMfEESCKOYLl5fVA/kN0jcFgC5b53AGC0I=;
        b=Cp0xtmnWOIaiJykL/P4ZxMYiLs9jkFCB4wcRj6W+qhfjNaQjW/MHWI962zdL41C6zY
         gXt5O0wcx9N9Qcm4PB3V43a4crpCq5oAqxJnoKL4ByUDuWLZ/+75S97rExY7DOtnHx6+
         ojK9+2X+fsg2kgqyng2kLpal8duskbpUcokU6c+0YuC/lXnBOTpfYMZJdkA63vx29xe/
         64cvx8T6WFG/HBD7xXty9MimgI2otVw8h1TmUB9tvp5t4njdOovpuBU9dOfH9cVefcao
         fmos2ek8e8yQnRJjlN4aIUTIq2S77Q0N1KdUR46LoZrLPPHJ7AT9Ich0qUcBYGa5Pm6P
         zjuA==
X-Forwarded-Encrypted: i=1; AFNElJ8N31Tfo9bOTpK4Ub6pfqsIN077yG8bqcEuChcCQmN91IkuOfElh0PHrwW5oElL8yKyw47iB1ZpBJCnzsW/WdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJgnjSIV/yWbsUUnm1U7r0d+t/QRAW6OV2gLRSPV6udQnWFJrM
	4lP6We0Zfzd9HQNZs0/Yps7XByGxg+YPVpsq5jSAoMiqv1nYkkzNCHi1pog0X/Va
X-Gm-Gg: AeBDietMz4Rx93QNa4xYRms0b62r91Hge0E5P1ADujIGHjNQL0nNvipL5y6dtpoEZ8J
	s9cPbmKKA7b87Y7s2Wtk0fP5rMvNT8xcpFAFhLh0psxMsGpDLCmFgbLMI+0ldSImSunKBxXzmf5
	DzZ/MbQEnKEkXEw8HHq/uiqTtkyjGDaHBiY0OSSw9JgEIw8fIWahg7MaDYa/CCMZKUcRx+MgElr
	5KrmK0r5wlU5LU22OlyZrtSTvmNpMB85p+qiadKQE9HMla6IO1hntKEOa49AnTwfRqsqwq84wX8
	/PJfIm8wJP1ILVruC1knZ8cK92r5uS8A7t2qBc05NKKZzSmrEM0EapnDHAS/cdod8+ah6De11L2
	qzhtilams7wADiOf725Vp2Ezixf1/MwuMr7uLfVRLjqKwY9C1Tcms9qB1WxSg1SW3QiWIFKOHjN
	j9y5QFApntFpzd35u/DbeIhuEXmIdwXX1vMu13+U82CK9HOUrgEfrVWTOrLkpFalTJHujgnBeDW
	s8Y
X-Received: by 2002:a17:907:c80f:b0:b98:45fc:241d with SMTP id a640c23a62f3a-b9d7267e5bamr1145215666b.37.1776209077512;
        Tue, 14 Apr 2026 16:24:37 -0700 (PDT)
Received: from dau-home-pc ([185.229.191.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1a3bsm434032966b.62.2026.04.14.16.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 16:24:36 -0700 (PDT)
Date: Wed, 15 Apr 2026 02:24:33 +0300
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next 0/2] udp: fix FOU/GUE over multicast
Message-ID: <ad7MsSJOuUU6EGwS@dau-home-pc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

UDP encapsulation (FOU, GUE) has never worked correctly with multicast
destination addresses. When a FOU-encapsulated packet arrives at a
multicast address, it enters __udp4_lib_mcast_deliver() which calls
consume_skb() on packets that need resubmission to the inner protocol
handler, silently dropping them instead.

The unicast delivery path and the GSO segmentation path both handle
this correctly, but the multicast path was never updated to support
UDP encapsulation resubmit.

This causes silent packet loss for FOU/GRETAP tunnels configured with
multicast remote addresses. The loss ratio depends on the early demux
cache hit rate - packets that hit early demux bypass the multicast path
and work correctly, masking the issue.

Reproducing the issue:

  ip netns add ns_a && ip netns add ns_b
  ip link add veth0 type veth peer name veth1
  ip link set veth0 netns ns_a && ip link set veth1 netns ns_b

  ip -n ns_a addr add 10.0.0.1/24 dev veth0 && ip -n ns_a link set veth0 up
  ip -n ns_b addr add 10.0.0.2/24 dev veth1 && ip -n ns_b link set veth1 up

  # Disable early demux to expose the bug (otherwise it's partially masked)
  ip netns exec ns_b sysctl -w net.ipv4.ip_early_demux=0

  # Join multicast group
  ip -n ns_b addr add 239.0.0.1/32 dev veth1 autojoin

  # FOU + GRETAP with multicast remote
  ip netns exec ns_b ip fou add port 4797 ipproto 47
  ip -n ns_b link add eoudp0 type gretap \
      remote 239.0.0.1 local 10.0.0.2 \
      encap fou encap-sport 4797 encap-dport 4797 key 239.0.0.1
  ip -n ns_b link set eoudp0 up

  # Send FOU/GRE packets to 239.0.0.1:4797 from ns_a
  # -> without this fix: 0 packets received on eoudp0
  # -> with this fix: all packets received on eoudp0

AI assistance (Claude, claude-opus-4-6) was used during root cause
analysis of the kernel source code (tracing the call chain from
udp_queue_rcv_skb through encap_rcv to ip_protocol_deliver_rcu,
comparing unicast/GSO/multicast paths) and during patch and selftest
authoring. The fix approach was identified by observing that the
unicast path (udp_unicast_rcv_skb) and the GSO path
(udp_queue_rcv_skb) both already handle encap resubmit correctly,
while the multicast path did not.

Anton Danilov (2):
  udp: fix encapsulation packet resubmit in multicast deliver
  selftests: net: add FOU multicast encapsulation resubmit test

 net/ipv4/udp.c                                |  13 +-
 net/ipv6/udp.c                                |  13 +-
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/fou_mcast_encap.sh  | 150 ++++++++++++++++++
 4 files changed, 169 insertions(+), 8 deletions(-)
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.sh

-- 
2.47.3

