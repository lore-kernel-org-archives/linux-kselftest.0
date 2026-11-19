Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099390;
	b=p2QnC0v4ke3Ic6hS/RS0Wvft+xLGcpVT3jS91CXuL6PhPVQUCFu++jjtBwyG9Wa8q2vz
	 2AF79mfKj+qQSiOHLGF2SuaQYSMZ103UvfxhLX08ciqbZ5MhxwIdRdiyNpL32LiqzVwqX
	 Yw+kBQQHtxXXJM2+OekyboZkO5ZN+gvSnOrq+Dsc2DPj1tEDzPmxBJBnThyhIC/hl+z1L
	 vGPzKUer1HrIW1W1A1kwcHDwe1Z96H8ULrnOuJMW3ulWqu3oLlhEx7BHvni3AKtO+nwb3
	 pm2jh8ELz6OvQlMCJcdTVjiRjXzE3z7EUR8I5pr1Uh0jmnPSVsdKMPUtR94ZW06zLvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yiNGMOZ+T2aYXndxp6WNW2Z7eC3xgYW0cACgi8Pfxp8=;
	b=qsX8R9CBymzx+BesFum5ahaGjooQ8fHOxvNtLRh70GGaAhnNQeR5WeEBiBwy8HqnfVnb
	 B9InTShkEkgPFJfYSwvq1k3r4sH9kQrpWn0EKq+2AumZXmoDucRJ8TuwWTMBTjtuEtwN1
	 aaW52j1ZGsSEo9yg9JmqWKVt7YglQrUFaqNHO5tpTNT9wY89Zsf9bLD3Vpl8ECgbiaBhE
	 ltokr9onsqKo5UuhKJbmRaSYjudg2rwnRUlQlfK0GQ1AzGUvHWN5LEB6hpdfd57NU5ogz
	 cO8NlruyOivOVN6EP/U/KWWRhDHAQuf19RPGwjqsQZZYDlLhfBMxLGwf8vkMIAQkGWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCfnoQPq;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC53E60A2635
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 14:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC53E60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCfnoQPq
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2920860c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 06:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099389; x=1795704189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiNGMOZ+T2aYXndxp6WNW2Z7eC3xgYW0cACgi8Pfxp8=;
        b=GCfnoQPqg+rCDFqYxBpm9AKziIf+db5ejrjN3XzIAVXwywCajnXzzh4eEwiI/gLxIZ
         p3UK5+dBJyUS386omtr4Clr/kiVXlfjqXMJ0glNBhMIymhCnApZybKHV4TvVXOh3Nv3u
         SpL3s6Jqd2BcoXEaaK72PMwWGlRZAogU1UNYitXhG997WzgzRAjMgEuQRqOtrT1xkf5u
         2RpdW2VwHA0Kvp9GEcqpN6VByZQ/nN5N24VOXuNR2hdxyy/eEAXMAn1gYbVTaHxUcXiy
         piaRAyK351lHRur5sX87av2ea7Afg0SQbGMaGezLO3veV16PwqNXXK4r34aNEIyyESz6
         U54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099389; x=1795704189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiNGMOZ+T2aYXndxp6WNW2Z7eC3xgYW0cACgi8Pfxp8=;
        b=qoBqbvP5+yNUNTudQjXrUc6VFsDeukp98UDMVbUssbnlHzdIhYu5dgvB1MBR5uDzl7
         k4e/c+HDAzRSfkidapp18r/AbHLc5WFMJLWBzEXkt3KMXHwvR0JqWJBXNQFJDpHktcbD
         BGIEobmywsuNws/NioxVIcTrR0IeV/uU8PZWoFvTujFzkOVIMpS3POD4u+916Wlz6cjx
         dEg4rrUEiLoRpOQM1S2fFQUyl1I3qGxfph1d5YItIKFxvF7JSI5zDLsNjPChHoYBVSKQ
         k1p8q2czlDMr0e14R1fiDmQ9k1apeW7O9VC+oH7qlpsKHZ7infZRzws/R7Rwd57OEFns
         OSYg==
X-Forwarded-Encrypted: i=1; AL+hErFWFOwolD0u32ZuGrfGRGe9kXqckAA/G6hyxbmD8JmG0yCf2zO88ZVfboU214gj5FgxZbX6shzslv0x6ab3KNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wJ8g93B6jgjKmIZ0ASCFSRO/dRgeVYIADdJpiXoWE4H3byGFg
	M6B6D3hLo4iEC0/ITpyt3WnXU93vXTHkcdFOXKmdy9r/0J3o0ZeJgUcX
X-Gm-Gg: AZFdTZeA4XcBI9TYsYHY1Qng0sMcYd5ko9rxms0KNevzc+FKpb8f5yhLcw9HzQcB1K4
	oB1OMIokOu2J0ltv6iZoEU8yvK78QCVcsV0q8tJK5TtHm8dTmeOCkkuM1VkWe4+41msLnY4kS3A
	qxkZglZxq0zBAN6qsFDoTqxxiCWPnOrvLIY4VUPNT4fEU9ugiAYCl9hBWwsi6bKwKWW8oehna/i
	7w4xAjq5vkwjo7MCluE0nF2fMNw2a5RhaTOw9xQkWGaacRLmD2R2zfxioFAmP+HAhdjq8a6KIzT
	OE1xr7JTYmf99ZoV0BJVVo+01QPK+sfzkAl7ElKPk3mSBhq9mzRq9BT3zUFpdpH2USFsv4YaEF7
	f0STjChy8pZ3OvoGY+vB3RMr9QPF2s7JNjIhtBI7md6KftEXoCneNMTWM5DUStj2SqoP12LZAXx
	2YJQRaFMM+5hN26cDJee+6USiBCpeovHSwiIUCkp54IMEMfsorfoh5cg1ajf13E6D75dTuaCVBQ
	3MV3OhWrlIIvbSd8DzLuGe9mWORrW6ahOVz31+mEhuFRGDoOaspCQCwLEgFGuyMIpJhm4s1FhPz
	wKflpbwR96AoIb5cZfJ72wPOVwafSmywb0FoxfaGdM8WlOXrLw==
X-Received: by 2002:a05:7300:cf98:b0:382:7375:1306 with SMTP id 5a478bee46e88-38280a38654mr5978419eec.14.1795099388796;
        Thu, 19 Nov 2026 06:43:08 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:43:08 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 4/4] selftests: net: check padded vnet hdr_len in tun and tap
Date: Thu, 19 Nov 2026 23:42:39 +0900
Message-ID: <20261119144241.360238-5-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144241.360238-1-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
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

Add tun and macvtap write tests with a 512-byte virtio header and a
14-byte Ethernet frame. A hdr_len of 256 must fail with -EINVAL
because it exceeds the post-padding payload. A zero hdr_len must
continue to accept the same valid frame.

These tests exercise the common header parser through both drivers.
On the unpatched kernel, each oversized hdr_len test accepts the
packet instead of rejecting it.

In x86-64 QEMU, the patched kernel passed all 105 tun and five tap
selftests, including the new cases.

Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 tools/testing/selftests/net/tap.c | 29 +++++++++++++++++++++++++++++
 tools/testing/selftests/net/tun.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/tools/testing/selftests/net/tap.c b/tools/testing/selftests/net/tap.c
index a0c9418132c8..bf5d36cf73c9 100644
--- a/tools/testing/selftests/net/tap.c
+++ b/tools/testing/selftests/net/tap.c
@@ -425,4 +425,33 @@ TEST_F(tap, test_packet_crash_tap_invalid_eth_proto)
 	ASSERT_EQ(errno, EINVAL);
 }
 
+TEST_F(tap, padded_hdr_len_exceeds_payload)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	struct virtio_net_hdr *vh = (void *)pkt;
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	vh->hdr_len = 256;
+	build_eth(pkt + hdr_size, ETH_P_IP);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EINVAL);
+}
+
+TEST_F(tap, padded_hdr_len_zero)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	build_eth(pkt + hdr_size, ETH_P_IP);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, sizeof(pkt));
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index 34de2580e32e..525fd588d916 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -683,6 +683,37 @@ TEST_F(tun_vnet_gso, vlan_tcpv4_gso_no_csum_64k)
 	ASSERT_EQ(ret, len);
 }
 
+TEST_F(tun_vnet_gso, padded_hdr_len_exceeds_payload)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	struct virtio_net_hdr *vh = (void *)pkt;
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	vh->hdr_len = 256;
+	build_eth(pkt + hdr_size, ETH_P_IP, param_hwaddr_outer_src,
+		  param_hwaddr_outer_dst);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EINVAL);
+}
+
+TEST_F(tun_vnet_gso, padded_hdr_len_zero)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	build_eth(pkt + hdr_size, ETH_P_IP, param_hwaddr_outer_src,
+		  param_hwaddr_outer_dst);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, sizeof(pkt));
+}
+
 FIXTURE(tun_vnet_udptnl)
 {
 	char ifname[IFNAMSIZ];
-- 
2.43.0

