Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585101;
	b=3AzJ5alUFLHfRBfpXU6mCfdRTDlcJQabK2Z+96db+oPHj5M1ZfZkFTV5VrF0HZY88e5d
	 fLQiIOtdNbv9AHZDrPLfB6rYY2CNUqrcGsfCAHDjjEyWJUeHoqe/V5t+6fFwrjCYOsbK3
	 skM8nuz6gWt2PxdqJuPrUALgzamQSTWi2kezMjZfqSEyEgCoDGatevDWrWuqrfgTidfGD
	 xwI7XsLG2r1CnWRoLd3XyzOQwJw9M5TQuLDiEkJudRVd/OfRMZI9nKGQM1sct65NvA9KW
	 J05g/iXV2Rm4Mwb+lIgwKbIvQd9lve7AQ+dwZ4WV5yUvjkSWzJcfbWRuZIc4JuARFpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TMge1KZhkzflUPq37SUzuANAcbZI1Ky20Kr/K+1+RuY=;
	b=FzlQFlEpAp9C7j2qIDz1tC/NJGo62Xa0S9EA2PcwGsdlVTlgKpmpglw8SbikJ3avmZ4/
	 CS6oPrAuWX8MBvh0FQJ3KoVHlruj2b0Y33VTw0AjVUeVPD3HB1CkHdk1Oo/jNnX2MqLAP
	 IyHOJeRgCxuyVwzX73aTnRfkCldZF1iPqj3j9USuwC+UdJ3K9TAtb/5TR7E1OWoLSU/ms
	 NTkpgUEFkXWpdrRMwTz7TvQuAVPdkjnICoF9eT+mwt+/56w4J0K2dW9Y07mR5zXr4Li0i
	 pxu7Q05zCRhqmcuilRVbMIWGpyVVZE6F1+owMSjCeMwJS90UpVOP84T8uSLyIDT2ZsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsIrkHVw;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B60606A323
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 15:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B60606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsIrkHVw
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b6b22be970so394550b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 07:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585100; x=1795189900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMge1KZhkzflUPq37SUzuANAcbZI1Ky20Kr/K+1+RuY=;
        b=IsIrkHVwk3sOwDFWukhADIcG7eZjy1O8dfHE+ZtEZWOAM1nYz7eqLAKD9V9C6YlKje
         L66+oJugaR95Srt4UDM95zSXuIC2gdrMNhNA52F5dV5t+s0u+U2j3VkBlgqp+5IRr8ZV
         1EEJ/9LglROgH7diGBiKmum/bOL2KB+Fvdlyz4A9KXYxyes981lnE/V7kcCCBI8M/XZj
         0r1LPLqTmW1u372Io0hSoePgn7mbNpQVyCHq/54DUE4zziOLWvdyHXUvAllIWw54+75b
         GvCHDAmpP/2IJzE4UCrX8QxkIoyArQWTcRSxEiLFPNOgFhpcRFp5ecOEeSorL1AdYpBp
         J6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585100; x=1795189900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMge1KZhkzflUPq37SUzuANAcbZI1Ky20Kr/K+1+RuY=;
        b=Sk1kvcy8soNC9VdGLzY+JlfTmo97da7LGQd3xBzwvtYC6k+sPPONV5q+au28mI6pXR
         NoU0W2/Up6bj2fCpDn5/JL697X2uBRf5fsMfzUpguhLsYP/872z32l9evfScB8boL1e9
         B1yseBlqMi+/tWaZHV624F4R5f0MQpp3raYcqkM9nuPMzGrnMroaN8F+WW7YKbCVZpLp
         9HSJXnVtQWzpfWHvYnpMHO59TKXOS0Ns5AvMu7X8FtyZJDxwc6W4xpHCQnZBL6wKuc3o
         EJ0rowoyE9pSQHZ43wBT6i6uKw96LJlNoyW70dHn3mqO2aZrBjKwkQO5lV7Jo6e2PYnV
         Ko8w==
X-Forwarded-Encrypted: i=1; AL+hErEeFpdKTcKlMwquAa/srjrzm4bd2YFXgCBGYRn9Xs395yTWkOrYN2pYeHiR/Hl7+E2FdT01B4T2PRoipqbnfTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qErFXASPZHofxqcH836XEcMPHVVUtnWL+XVnlWXeXhkwUy+vo
	KEhMVk3u/bBzT0lQyTvtMAuWsYwb5BgOymg60Sn1USKsW9VRqTl1Q8/0
X-Gm-Gg: AYBFou00QHSaS/CU7XvECKcmhT+F8ZuE6UGzbRsFLslPBnTTmZK7/mJ9awnHvI88njt
	enCGXJJ4IqV30X3/7RzaW7q7Ub3lY/gQfOddavwTgv+kJaku5pgZs5x8NZRQtUXkjmYTleVBD8P
	JihkdsLKZluqwgP+MrWUYVi/uCSEsp3n488T+u91ytkhsGgX3YncVD+8OTNF+y0jCZfhx+EAjNE
	GTOx3AO1a/FnFRHmdlu2G6JZ7PSylHekQHdP8+BDCwLEptVl8YWYMRxf2AYbQ9FqoX3tEp+HgXC
	y76tOExKCCCUG5vameX9pU+/osKgd4klV9HMNjLWij8o7zmTCTBlFYKjkj1x0j6wAEEmCgwW6ma
	/YMiUXnv1tOQ9EO4kSR7bqUsUEMo0kdxiT3aXrHTXCIswX4rHfrkH2thVczRdnbZIGLKc1stt3s
	Zd1GzopOsTbCJnGEuYz9/XqnPnWm+0fhwQ1NsFxErbKoBNXTKb11Dxc1hC3UbgW5P8fSPaIADXN
	tKeQ4sbIIdRxphLHduEP3VF7C+VMRH6Km0r23iSLLR9AT2nE9RqY9IZ8/zerjyKiHIPvzc9dWo7
	qkbkvT4e8CtcGC2PFKJxw/f7I1GFsTSeoxDtkh7TeZO1mPha1sQDZPjowL51ExQoCiCBjw3Nzfs
	ovtE=
X-Received: by 2002:a05:6a20:4324:b0:3e0:c955:cd5a with SMTP id adf61e73a8af0-3f7a9ef620cmr2898908637.68.1794585100018;
        Fri, 13 Nov 2026 07:51:40 -0800 (PST)
Received: from localhost.localdomain ([219.95.157.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc160a17esm1634075a12.3.2026.11.13.07.51.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 07:51:39 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v4 0/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Fri, 13 Nov 2026 23:51:31 +0800
Message-ID: <20261113155133.75090-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
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

When a learning VXLAN device snoops a known MAC from another VTEP, it
rewrites the remote's IP address in place but keeps the remote's
dst_cache and remote_ifindex. Traffic to the moved MAC can then use the
route cached for the previous remote and be blackholed. Patch 1 updates
the remote the way vxlan_fdb_replace() does. Patch 2 adds a selftest
for both cases.

The selftest fails both cases on net without patch 1 (8 of 8 runs with
1, 2 and 4 CPUs) and passes them with it (16 of 16 runs).

v4:
- add the selftest (Nicolas Dichtel)

v3: https://lore.kernel.org/netdev/20261111180001.2475-1-ilskdw@gmail.com/
- use my real name in From: and Signed-off-by:

v2: https://lore.kernel.org/netdev/20261110153020.9635-1-ilskdw@gmail.com/
- also update remote_ifindex and clear offloaded, as vxlan_fdb_replace() does
- add the IPv6 link-local case to the changelog and a second Fixes tag

v1: https://lore.kernel.org/netdev/20261106144406.66035-1-ilskdw@gmail.com/

Zhefu Peng (2):
  vxlan: reset the remote's dst cache when snooping moves a MAC
  selftests: net: add a test for vxlan snooping moving a MAC

 drivers/net/vxlan/vxlan_core.c                |   3 +
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/test_vxlan_snoop_move.sh    | 161 ++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100755 tools/testing/selftests/net/test_vxlan_snoop_move.sh

-- 
2.54.0

