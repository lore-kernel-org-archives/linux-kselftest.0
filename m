Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2315277CA5
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 06:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307565; cv=none; b=Q7uKDVDtjW/tYgN1hepPcj1WBmqY7n2Rqa4KEZSS3vikEpm1eMB8EGYGHfIBh8TMZwuGYj+gjyS+o4b/0kkplYuvv77VFwqJZFhBY84GAC+lP+UUq4Ij2br1k0bHVKnKHpyExFbAfXW/MH9Qer0YgA8Yk0laC5lzvkHFCJwiDPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307565; c=relaxed/simple;
	bh=F5aaMBz3ntcXyH9DOYL2EeiL7J+djOIAMrX2GVcnn/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+MynGUxc0HH7/4wQ1Tkg1Ue2gKD1dDiPPCI2UAS03ozwraeRAfDdmdRG2HaugFA3oHLv3a3FxuFlh01jj52/hohFs2EC8wnyIPirh/XMVKRJVYpHjZxcFHkv0ttjfWfQWqVjPnslP1Ostkyu7jHU85W5sg8frwhylavqYVYdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFU63/Hc; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFU63/Hc"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bf9466867cso179280e0c.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 23:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785307561; x=1785912361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3KBK6CTQYOIsrhrkquHUtDzN79doVR9bWCDjPdk58I=;
        b=AFU63/Hc8kT4TOSHpD/ZyKIUkYB/X67Pz9RE/dHB0+vyUI9iO4Vm2hN2EvqrwKH5f3
         MAmYKLjviDMW+GPC/4rQA23//18EA96dw9MS5NrqLlr54CrKnTtXVR3orjfqA6nA0QY4
         kIyl89d2XM5hBotg+w1qjUJLPuwxrfMBG8/RJBMXN+dv6FVbjnZ8QY2ZKLkckCIsvJj3
         JVjzGiYLs7KQjzKTeyfBGw5L9wXcrOGN2DrgHa5XUk4UEByJgYnf4BMgesACh2ryEJ1W
         wrjpYoSWaWcPSY8P0dYD7IQQKHfRxQgu2CLT2wf1xCB0ZkHAo7LWsfapc4tGfSMpx61N
         6wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785307561; x=1785912361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3KBK6CTQYOIsrhrkquHUtDzN79doVR9bWCDjPdk58I=;
        b=bMfCblI8IK/fKMwNeopv6ddtpbEgT67KlrPVlz38ZUCSMlUKv98UKs0vft/YyjOJfc
         jYYjE5hNAEM5SiU+IwoCpxU7LmZjzbnOUWStt3dezmuQoH33aiq4pVmRacEP62MZUOP6
         fqWSinwDYkpkx/WyUm8Ch39AyKj+rSuVhejpiVoomyw9WKdVlcL8LUWcGrZB3YqpZfm1
         9/ZjmuOfquB5eh5g/zcs0JzB9qldzivFt56j6bv/lJa7gY6cYRmgwH1sfdbAAMh+VZb1
         qMRDRTlwhKxWZxM6TRuu3WWEQ9GA3L3vK8RdGO2YZRaZYioynKLvevMWIGKA3a9R6Rbd
         axdg==
X-Forwarded-Encrypted: i=1; AHgh+RrzjtORi0+820X/m01NRFtfqpS/n68lKPfMqQdJasinrQL5sHB6S1cB8hyHnkDMyj/0oQ7svuX13PyDMNYPmo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywug3UfbsezdyxgP7w3m4uWNcM1BG6LeTETk1Dtv4bl5ZzFylhQ
	xU5yxdKOptaRjSMq2mg7NUvBVZ8XuqoTZTXribmm4dGXEIu9nrfqwYJK
X-Gm-Gg: AR+sD12NniIjjO+AswQw+U3F5VkMYhGIzOkfNKi/6iOqwiLBKsYuGBydIioCve+KA/P
	46q2b7fNfrPbF0L8PoyN+HGFlSJO+LN0FDI3X3K19Z6gwQVDwkgjxA7P2+jBTo6K1fdox7oZegE
	Y8Nm1LLissBmjuVhw67XXRR5PKo2Q1dzbrO1oV9/xhE/PiIKTco/1IBjxNYMyEq+CJSmWKBW5HT
	3+g6+u7HLaJQNmzd92t/5Jb+efiPzDwfywCzyxuXPATY1mGwbK4Iyc4YJ/d4Bk02VWGK7ghg+78
	rEtMrwos/DtaXrAHYfmeNkmzG/URMOVGxm9/UPG40Zj13uNUgH6eYuWoEjB78DYLJs3IwLrFCO1
	Y4e2+gp6BHL2F3fFuikVVzA8wsGq0GIp4S5QrlN7jnwydJSdyJHE3IYEirCwoTMOdimxrUqGlvY
	gDinsyGz1W7S2aWoCttM/OAUd9QkkwOMFhkJwTMUuYbEXAXRkQg16N
X-Received: by 2002:a05:6122:130a:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5c33fa28cffmr2295113e0c.11.1785307561123;
        Tue, 28 Jul 2026 23:46:01 -0700 (PDT)
Received: from houminxi ([61.170.216.249])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c34ef4dcf5sm1548090e0c.6.2026.07.28.23.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:46:00 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v7 0/2] selftests: openvswitch: SCTP flow key parsing
Date: Wed, 29 Jul 2026 02:45:47 -0400
Message-ID: <20260729064549.3647518-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add OVS_KEY_ATTR_SCTP to the ovskey parse table in ovs-dpctl.py so
that SCTP flow strings carry the L4 key through to the kernel, and
add a matching selftest in openvswitch.sh.

The missing parse-table entry caused a selftest NIPA failure: the
flow string "sctp(dst=4443)" parsed without error but silently
dropped the L4 key, producing a flow with only ipv4(proto=132).
The kernel's match_validate() then rejected it with -EINVAL because
OVS_KEY_ATTR_SCTP was missing for IPPROTO_SCTP.

Changes from v6:
  - Trim unit tests to cover only the new SCTP key parser
    (removed tests for TCP/UDP/ICMP/IPv4/EthType which were out of
    scope for this patch); address Aaron's feedback that testing
    existing parsers was excessive for a selftest tool.
  - _parse_flow() now checks for unparsed remainder.

v6: https://lore.kernel.org/netdev/20260724150624.3457427-1-houminxi@gmail.com/
v5: https://lore.kernel.org/netdev/20260723215630.2502169-1-houminxi@gmail.com/
v4: https://lore.kernel.org/netdev/20260723162503.1790998-1-houminxi@gmail.com/
v3: https://lore.kernel.org/netdev/20260722214915.4128292-1-houminxi@gmail.com/
v2: https://lore.kernel.org/netdev/20260721190648.2713156-1-houminxi@gmail.com/
v1: https://lore.kernel.org/netdev/20260718215437.3257200-1-houminxi@gmail.com/

Minxi Hou (2):
  selftests/net/openvswitch: add SCTP flow key parsing to ovs-dpctl.py
  selftests/net/openvswitch: add SCTP flow key test

 .../testing/selftests/net/openvswitch/openvswitch.sh   | 121 +++++++++++++++++
 .../testing/selftests/net/openvswitch/ovs-dpctl.py     |  82 ++++++++++++
 2 files changed, 203 insertions(+)

--
2.55.0

