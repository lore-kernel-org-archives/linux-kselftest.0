Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022504;
	b=duswJr+eNHYwlldFzAX0KCdEhwAbCTuJrxBdlfeP+N5XvOL7J8yp4GXUf5ehyym8DE6L
	 PmOPwMMRnn1VLPbDMUqCi8tlMC0x4vaXpbxW8YFbSrwuGUOSgBokcF+pG1IkdRbmPuvS+
	 xYyWtfaEq0UuzEPGGwC06dvvFZkTZ5SuUgmHnb5Qo1yjwUBC06pVK9klAvWMeyCSp9UQP
	 +LXjkJ1Cfi3maHukpCoY/lmunUgBGDBd7xJn+fJdC0VDIYViXClAbhOTWLwAoMbN4mwoS
	 QgmGpr/KG8LbUfspvrjwC+txYHVMRJqvqcYer94YqMsiZ0teithAiD/N/q2oOkK5wlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y2Cswb7mk/fWftpb46x4/HWwEQMmKQ5VhCwrWS+t9Nk=;
	b=TUY+m4oig1u6WSYgXL+Oe9ZuEMQrIjNON+HupZKVEdW5v2Pf3nIzKN+aofD948Kmajiq
	 ku2dkGRe87VIIVZTdsCtOCaPJaN/7GftSitHFL8V7gH/iptycEz+uzPA1Mt++zzLtVKQo
	 jqOz+dGHH3bAFdKj8ULUH3XWa9oW3i4wChlwWeiySHxxrT6OIUN9G/dkdpbb4o3fEOKzl
	 YME6pIvSW0Ub5TPYD71vQBl5kOAR+pH/TUzxDtKB/W+66jpvRs+KLXkOb5Rt5c2Z3TgJg
	 xOoJY46mjDs44qNHLQQsI4V4weKRXlAnJwz+6q6hp2l8s/KijEwh0L7Wejny9bbjZtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="TPsp/agT";
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD90606A326
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 03:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD90606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=TPsp/agT
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4ced671398so159618766b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 19:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794022502; x=1794627302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2Cswb7mk/fWftpb46x4/HWwEQMmKQ5VhCwrWS+t9Nk=;
        b=TPsp/agTern2Jjik6AxsBYARpOCeOflkig+YBk4Z6XMaQW4d+YOCuPhnay55gc50XA
         fOG0x2AfPerRl6VXRPD/qqWNwMpW4Xw0W0Zz7gxsGzvLEEiMTLXJ/n5lnPlGiI+u7JO3
         QnDxl9f0vdxuhPMci7OrqLpsCCjIuxSYVgN7RfXw5f4Sl5hVFof6LrBqnD4EMIXMhFpv
         JmFPKCiRAHAkCNiJ++34KDNVkh0h17NouO6KXL/lfdrjatFgGgQ6Z09gF2kW7Au1+KY1
         9eE4+IUuArTGFS1ZasTJ9rZWoZ0RgmuOGmhfkT1KEUlv9IrNJLUt/LSCpS9m1+jFgobA
         7Whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022502; x=1794627302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y2Cswb7mk/fWftpb46x4/HWwEQMmKQ5VhCwrWS+t9Nk=;
        b=2HBpt6NbHSZ5xWEWqWo10g9TcDSxLwQ/Sjo67SyTnP3Oxn8RaA0xFv+l/oKqaUv/W+
         yTjIa5Q/UET/iQSIeI6T9rvxsx4j1SCiu8V09kftUwHjY80vGroSkuAc0qR5hAHotwtQ
         wL9eLIgsPi/q+b6uhKP6K6QbDMCr1QNK0wsb1b5+lEXb6g0/+C5SZlY8tcD8nQVXbC+C
         TsCrQOGRyyCQZJBwMX4f6THsPfGtdAoLASb+XOWFtGYLubFXdU4Ur/I9+FPSlJad+41+
         DMVyr1S/HmIbR9yALleZsazIy2RGHmPzpmupfslXzdF6giwSpU+mduEQojqXTXr1f4CK
         9LpA==
X-Forwarded-Encrypted: i=1; AL+hErEjneUCaWZh0bA/EJahVWP8hwu1NfJHsw1TcQV3zdqFlIMzWjmtQbRHja4+/oqg1UIotkWIpSgLL9/OKWUUVxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YVKgd6oPzT1BJdLXaxCwSe4B9uHfaWcRm/OPgJUx28QxundL2
	N/AxKuC6Y7s3Cw0lkG2iLgbpao8Yb6CLb6Bb+1e8haE9kVf+YVfvYL2q8g11wb/2fdw=
X-Gm-Gg: AYBFou1ekJpqZKH/xQYnPQlxZd+qAftNGT4/CbA2UnmW5fSqqSI1c5gYoj96tbotJL2
	FD3xjXQ0HJEJnXxuMlNFz9k9l12BBFqhe0wY5ED9UtW8bXqW1JGwZaEDmlO97bjXJ517h2TxWiM
	pjVftjlE5mfrX2CVrZfyWbDmZ8yBXP/02aIKS4nEfYgnVcMEmmJna6G2T2i/edeiJYQjdTTQ/AV
	FPQD2PSqOmP9MAxunX/L5qlb0hb/pfgkjCGW+IIfTxaXvNadiuPJWP/sK6mSQqsozz34LvfOZ8/
	PQ979THNNHQvM9lbGbT/4dLDToAvu++jF3Dlt2fxsy5a0qxhnvpTrwzQGymtCcBZ8XoGuhLxBhH
	u+uy1HOXvcvRZ3Pu/UmR6/c4SKHBkqi6ER1JDjI5dlhIDlvL7R4XN8R5J69+3UJ+CnAU5AE6Umu
	PWPY90Jrgak2gQ8i47Rq5VoEpYKnBGOak7OdCr2wAsENv5PFW2BWr45HDnTGKL9ik2R/GzxCw5U
	RS/s2dfMXThiq1HdpjtxrW8RthRs37NtbdEVgf2PLUm46ldLhgV4httkX6VFMm5wYVNT4NzXuje
	ux4UH3LZbs1qi0R9/Wr47xOL6nUvSssOgUyjDZFFSG6WCmdT9YIUJPhcpqBQlf4=
X-Received: by 2002:a17:907:ea7:b0:c46:cf73:bdf9 with SMTP id a640c23a62f3a-c4d35446bd9mr357150166b.21.1794022502674;
        Fri, 06 Nov 2026 19:35:02 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562e00dsm121104166b.21.2026.11.06.19.34.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:35:01 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next 8/8] selftests: net: tx_extra_headroom: test veth peer at creation
Date: Sat,  7 Nov 2026 03:34:27 +0000
Message-ID: <73b9d23a4190cdd02e89d3a2ce8a1a21ad5feadb.1794020868.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794020868.git.tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
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

veth_newlink() parses the attributes of the peer from VETH_INFO_PEER and
passes them to rtnl_create_link(). So one request can set
IFLA_TX_EXTRA_HEADROOM on both ends of a veth pair. test_newlink() only
covers a dummy device.

Create a veth pair with ip and give each end a different value. Then
read both values back with YNL. With a different value on each end, the
test fails if one end gets the value of the other end. The YNL rt-link
spec does not describe veth, so ip creates the pair. Skip the test if ip
does not support tx_extra_headroom.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
The test needs the iproute2 patch "iplink: add tx_extra_headroom
attribute", which is sent separately to iproute2-next. With an older
ip, the test is skipped.
---
 tools/testing/selftests/net/tx_extra_headroom.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/net/tx_extra_headroom.py b/tools/testing/selftests/net/tx_extra_headroom.py
index f94eb29a25d9..8a2284f1b343 100755
--- a/tools/testing/selftests/net/tx_extra_headroom.py
+++ b/tools/testing/selftests/net/tx_extra_headroom.py
@@ -141,6 +141,19 @@ def test_not_inherited() -> None:
                 4, "vlan needed_headroom")
 
 
+def test_veth_peer_at_creation() -> None:
+    """ip can set a different value on each end of a new veth pair."""
+    if "tx_extra_headroom" not in cmd("ip link help", fail=False).stderr:
+        raise KsftSkipEx("iproute2 does not support tx_extra_headroom")
+
+    with NetNS() as ns, NetNSEnter(str(ns)):
+        ip("link add veth0 tx_extra_headroom 256 type veth "
+           "peer name veth1 tx_extra_headroom 128")
+        rtnl = RtnlFamily()
+        ksft_eq(get(rtnl, ifindex("veth0")), 256)
+        ksft_eq(get(rtnl, ifindex("veth1")), 128)
+
+
 def setup_veth(peer_ns):
     """Create veth0 in the current netns and its peer veth1 in peer_ns."""
     ip("link add veth0 type veth peer name veth1")
@@ -307,6 +320,7 @@ def main() -> None:
               test_survives_down_up,
               test_survives_netns_move,
               test_not_inherited,
+              test_veth_peer_at_creation,
               test_push,
               test_peer_xdp])
     ksft_exit()
-- 
2.56.0

