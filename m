Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022501;
	b=1ae6VjrFBvN5aQqmbCQP//CZ7pRE+wuimn/uJwXJgIyx+vs4XMt/YgjUFDyJJmOXX8SR
	 RGRSZ0Mml+dmqveCfCscMdNDvpXLztxtMwb5Kja1OuGRdZmye5Unn6kPl6XugwTWjcTL7
	 s2HXQvK4WCf4Dg7cL4+Rbf3zNWeEv4nBp3QTa4OrzCwW5WJU4hlFMvmTHgfBEdCSGD2y3
	 LkcNowE3Gcy0O51BtU3E1vaiE71hSpEdfLbI8KOKFWf63LkV3gFVdCoHV+q5crLlm64Rt
	 Utr+tVRLba+/GreIt3KHvw36vt2v1iq5YlxNarpjZ5gwB80CMwItPAQZVh8gPM20qjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VkggOucJFSnP1j6WASfBWMjYH5EMpvybzz/tRlKtLcI=;
	b=ak5kusceskrHb6qzkiWzY03BRIea6dik9x7H8E3Y/SgKsN0U4xi7pIARo62CPfBR6DDN
	 EqRMEZFT0pLAu4DDopVcaZYtpziQDWWNL29w2AFOaXk0/OGyaIx4059XCRybXLYWyIdDN
	 ON1GRlM70l7pAqaOf+dJaKl6fj/0bxzSahj5q2Ev6Ng5qEKV4oUXBA5c7TW4OBn7rqeMk
	 wboZ41gGnEBiLYhQz5YkgKXmEvaDGrw8esNHceNmDZD7vS6P9GbgSMiMt3G6V77e3EmPU
	 4akvQT+DfNX1qddRRfVM2ZqnN8QwjpeLTLxWQm4LNc775CknRWjT0UIc0XvVpFo+eRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="W/nXiDzm";
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044D0606A32C
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 03:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 044D0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=W/nXiDzm
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d30639709so164224466b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 19:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794022499; x=1794627299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkggOucJFSnP1j6WASfBWMjYH5EMpvybzz/tRlKtLcI=;
        b=W/nXiDzmA9s+DR3NlHl+dppC4za1wuSNExSVetoKsGeVq9TX2cr4dmwT4KPSZmD9Bv
         62CH1RcibIuRzuPNtARkS0uDjHo4EFJVr1nPhL6XldWyyyWBFJO+UF96EyeZGB9D3mvh
         pK9+b0yIKhaiWwancN7i/HoBUvMDGMESAyriaAAaWbY5JWt36vsl8uH00jIQoywWG/O8
         LKLQP8EJt2YeLwFjixyRn2MJVKmZnSKa2FVu0tp5nKsT6TaWLWi4nUJKdsvI10dMNK9q
         LmrwY+jDYv/oTAC1SjsVjMQRpqQPECXq++TpYbF1mLY6hgaH9TpVGEyWMXyuHyCszHGj
         rNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022499; x=1794627299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkggOucJFSnP1j6WASfBWMjYH5EMpvybzz/tRlKtLcI=;
        b=glrPIpWIX9IYsrqAQPF9/EljxwnpEeT0aqv3FnqJ3uHw8BSyk16TzuGF/LSTzuD9Aa
         SVGxwbfiTC1ZCJXdb6aiSdL3ZObUEGDfxIQeJyCHVOygmjL0ajVsKHHDwcurrcPy8aaU
         NP7/DSveqeHZb6Iy2JA0XM6lqwVyHdyVwoF7y28ZXf0PP6s9pCy3qc5clspMQR28vcGs
         8070pXIRZhJIsHKuWvDuIn86KorkfuEOzaoFkXeAqH4wILX+arJma4CHRllN/r6uQviR
         coxE8aMwmpujZP1yKuaILwL1BaeU7su1MapHtO46ksjhUDHSrEzB7YFSQ+eJDON9y4HJ
         5OZA==
X-Forwarded-Encrypted: i=1; AL+hErGpldEVOKUVHxeIKs5yMUjXhv7W4jGAS+TRNaP/YwCJ3oTf1jupN/Y9pcYqDJhatocbHeXWNoimFyI47vHvEfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z94ZF7g1a0bJiJ0CzeVkM9RV26HRsTLHwLkchhPEwPuJ8WHnTZT
	KTX5vL/svaK4l+TWeoqYHA1WuoTPb9hhX+THwmVXG8H5RdFY7La4LBDPgbHf1WHOUPE=
X-Gm-Gg: AYBFou2/8HnAs7lLsBmGmEM6ye+Cak2gO46ykikyW8pRvvBAxSSfckPe+/IdO1f8X8n
	cRFJPXTTmuiRRO4QYz6VA8ReqmL1zDmGKlm+wh0+eOQpS2+okPDrc7AIy3s1PGTmzojYkmcLDle
	SZ7a4MQ+3VTl7EaiZpThsXofa1lk9zxtPW45ueNRqOGzcG7XRxCEIH3MLcmvlgLkP1FkaaRn/Z6
	77658G3+6TuTbfJ4m0SUjz+VlBSZPhgWay+0QGKKkyZwm5cboByCm9otW2QF8rGNQUS6n+W9bLn
	X2QPAk6u1wClYvrzDcZUzWbirLPkdiRldMfepTkewpLRMee4HM3jMCBMriyzeq0oNoBwYnV4PE9
	gRlMX/qDrVupRVCM07jdo0xZa6CnJVDhh22oZ+XJQXD6Xm/Efro/69BHAhepNpXhkiuIXxo9T54
	+FsPVZlUsfssoPBHKKVCu8hfvtrn2ApHjECiPuWj1G6PENsAeYBsmw0wOkKIMMSXjm77RKMnFjv
	1WGQyBoXQYunnoRiZJ+5fs1nw0GzuWs1fkmQMFFMMY1Wd3hGujYNyvg6AB1vXT0DPdV5Ga2eiQT
	7HyMrupj29k+y6jUgC+pnp1p+q9lXXhxZvg/JYBEwQGCdHS20Q65ks+dA123MPo=
X-Received: by 2002:a17:907:c0a:b0:c29:4fcb:2886 with SMTP id a640c23a62f3a-c4d34c501f4mr355461966b.39.1794022499437;
        Fri, 06 Nov 2026 19:34:59 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562e00dsm121104166b.21.2026.11.06.19.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:34:57 -0800 (PST)
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
Subject: [PATCH net-next 7/8] selftests: net: tx_extra_headroom: test generic XDP on the veth peer
Date: Sat,  7 Nov 2026 03:34:26 +0000
Message-ID: <c3ef837dbae861382863369d44fdf06cc245b0eb.1794020868.git.tianyi@cloudflare.com>
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

Generic XDP copies an skb with less than XDP_PACKET_HEADROOM (256 bytes)
of headroom. With tx_extra_headroom set to 256 on a veth device, a
locally generated packet has enough headroom, and generic XDP on the
peer no longer copies it.

Test this for six senders. Each one allocates the skb in a different
place: UDP over IPv4 and IPv6, raw sockets with IPPROTO_RAW over IPv4
and IPv6, AF_PACKET and AF_XDP in copy mode. xdp_helper -t sends the
AF_XDP frame. The peer runs xdp_dummy in generic mode.

Extend tx_extra_headroom.bpf.c with a TC ingress program for the peer.
It records the headroom of the test packet. On the receive path, it
runs after generic XDP.

Each case sends one packet without xdp_dummy on the peer. Then it
attaches xdp_dummy and sends a second packet. Both packets are
allocated with the same headroom.

If the second packet has a different headroom from the first, it means
generic XDP copied it. With tx_extra_headroom 0, the two packets have
different headroom for all six senders. With tx_extra_headroom 256,
they have the same headroom.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
Native XDP on veth also copies an skb whose head is not a page fragment,
so it still copies these packets with 256. This test does not cover it.

tpacket_snd() and packet_sendmsg_spkt() get the same change as
packet_snd(), and xsk_build_skb_zerocopy() the same as xsk_build_skb().
They are not tested.
---
 tools/testing/selftests/net/config            |   1 +
 .../selftests/net/tx_extra_headroom.bpf.c     |  44 +++++--
 .../selftests/net/tx_extra_headroom.py        | 107 +++++++++++++++++-
 3 files changed, 138 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 23b425c12db5..1c13d028edff 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -143,5 +143,6 @@ CONFIG_USER_NS=y
 CONFIG_VETH=y
 CONFIG_VLAN_8021Q=y
 CONFIG_VXLAN=m
+CONFIG_XDP_SOCKETS=y
 CONFIG_XFRM_INTERFACE=m
 CONFIG_XFRM_USER=m
diff --git a/tools/testing/selftests/net/tx_extra_headroom.bpf.c b/tools/testing/selftests/net/tx_extra_headroom.bpf.c
index e74f44afbe56..98f0d57184e7 100644
--- a/tools/testing/selftests/net/tx_extra_headroom.bpf.c
+++ b/tools/testing/selftests/net/tx_extra_headroom.bpf.c
@@ -5,6 +5,7 @@
 #include <linux/if_ether.h>
 #include <linux/in.h>
 #include <linux/ip.h>
+#include <linux/ipv6.h>
 #include <linux/pkt_cls.h>
 #include <linux/udp.h>
 #include <bpf/bpf_endian.h>
@@ -27,20 +28,28 @@ bool reallocated;
 
 static bool is_test_packet(struct __sk_buff *skb)
 {
+	struct ipv6hdr ip6h;
 	struct udphdr udph;
 	struct iphdr iph;
-
-	if (skb->protocol != bpf_htons(ETH_P_IP))
-		return false;
-
-	if (bpf_skb_load_bytes(skb, ETH_HLEN, &iph, sizeof(iph)))
-		return false;
-
-	if (iph.protocol != IPPROTO_UDP)
+	__u32 off;
+
+	if (skb->protocol == bpf_htons(ETH_P_IP)) {
+		if (bpf_skb_load_bytes(skb, ETH_HLEN, &iph, sizeof(iph)))
+			return false;
+		if (iph.protocol != IPPROTO_UDP)
+			return false;
+		off = ETH_HLEN + sizeof(iph);
+	} else if (skb->protocol == bpf_htons(ETH_P_IPV6)) {
+		if (bpf_skb_load_bytes(skb, ETH_HLEN, &ip6h, sizeof(ip6h)))
+			return false;
+		if (ip6h.nexthdr != IPPROTO_UDP)
+			return false;
+		off = ETH_HLEN + sizeof(ip6h);
+	} else {
 		return false;
+	}
 
-	if (bpf_skb_load_bytes(skb, ETH_HLEN + sizeof(iph), &udph,
-			       sizeof(udph)))
+	if (bpf_skb_load_bytes(skb, off, &udph, sizeof(udph)))
 		return false;
 
 	return udph.dest == bpf_htons(UDP_TEST_PORT);
@@ -67,4 +76,19 @@ int push(struct __sk_buff *skb)
 	return TC_ACT_SHOT;
 }
 
+SEC("tc/ingress")
+int record(struct __sk_buff *skb)
+{
+	struct sk_buff *kskb;
+
+	if (!is_test_packet(skb))
+		return TC_ACT_OK;
+
+	kskb = bpf_cast_to_kern_ctx(skb);
+	headroom = kskb->data - kskb->head;
+	count++;
+
+	return TC_ACT_OK;
+}
+
 char __license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/net/tx_extra_headroom.py b/tools/testing/selftests/net/tx_extra_headroom.py
index a4db5aa7268b..f94eb29a25d9 100755
--- a/tools/testing/selftests/net/tx_extra_headroom.py
+++ b/tools/testing/selftests/net/tx_extra_headroom.py
@@ -4,17 +4,20 @@
 """Tests for the IFLA_TX_EXTRA_HEADROOM link attribute."""
 
 import socket
+import struct
 from pathlib import Path
 
 from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_raises, KsftSkipEx
-from lib.py import ksft_variants, KsftNamedVariant
-from lib.py import ip, tc, bpftool, bpf_prog_map_ids
+from lib.py import ksft_busy_wait, ksft_variants, KsftNamedVariant
+from lib.py import cmd, ip, tc, bpftool, bpf_prog_map_ids
 from lib.py import NetNS, NetNSEnter
 from lib.py import Netlink, NlError, RtnlFamily
 
 ATTR = "tx-extra-headroom"
 MAX = 512
 BPF_OBJ = Path(__file__).parent / "tx_extra_headroom.bpf.o"
+XDP_OBJ = Path(__file__).parent / "lib/xdp_dummy.bpf.o"
+XDP_HELPER = Path(__file__).parent / "lib/xdp_helper"
 PORT = 9999  # UDP_TEST_PORT in tx_extra_headroom.bpf.c
 PUSH = 20  # PUSH_LEN in tx_extra_headroom.bpf.c
 
@@ -143,11 +146,14 @@ def setup_veth(peer_ns):
     ip("link add veth0 type veth peer name veth1")
     ip(f"link set veth1 netns {peer_ns}")
     ip("addr add 192.0.2.1/24 dev veth0")
+    ip("addr add 2001:db8::1/64 dev veth0 nodad")
     ip("link set veth0 up")
     ip("addr add 192.0.2.2/24 dev veth1", ns=peer_ns)
+    ip("addr add 2001:db8::2/64 dev veth1 nodad", ns=peer_ns)
     ip("link set veth1 up", ns=peer_ns)
     peer_mac = ip("link show dev veth1", json=True, ns=peer_ns)[0]["address"]
-    ip(f"neigh replace 192.0.2.2 lladdr {peer_mac} dev veth0 nud permanent")
+    for addr in ("192.0.2.2", "2001:db8::2"):
+        ip(f"neigh replace {addr} lladdr {peer_mac} dev veth0 nud permanent")
 
 
 def load_tc_prog(dev, direction):
@@ -175,6 +181,71 @@ def send_udp4():
         s.sendto(b"x", ("192.0.2.2", PORT))
 
 
+def send_udp6():
+    """Send one UDP packet from veth0 to veth1 over IPv6."""
+    with socket.socket(socket.AF_INET6, socket.SOCK_DGRAM) as s:
+        s.sendto(b"x", ("2001:db8::2", PORT))
+
+
+def csum(data):
+    """Return the Internet checksum of data."""
+    data += b"\0" * (len(data) % 2)
+    return 0xffff - sum(struct.unpack(f"!{len(data) // 2}H", data)) % 0xffff
+
+
+def ipv4_udp():
+    """Return an IPv4 UDP packet from veth0 to veth1."""
+    udp = struct.pack("!HHHH", PORT, PORT, 9, 0) + b"x"
+    iph = struct.pack("!BBHHHBBH4s4s", 0x45, 0, 20 + len(udp), 0, 0, 64,
+                      socket.IPPROTO_UDP, 0, socket.inet_aton("192.0.2.1"),
+                      socket.inet_aton("192.0.2.2"))
+    return iph[:10] + struct.pack("!H", csum(iph)) + iph[12:] + udp
+
+
+def ipv6_udp():
+    """Return an IPv6 UDP packet from veth0 to veth1."""
+    src = socket.inet_pton(socket.AF_INET6, "2001:db8::1")
+    dst = socket.inet_pton(socket.AF_INET6, "2001:db8::2")
+    udp = struct.pack("!HHHH", PORT, PORT, 9, 0) + b"x"
+    pseudo = src + dst + struct.pack("!IxxxB", len(udp), socket.IPPROTO_UDP)
+    udp = udp[:6] + struct.pack("!H", csum(pseudo + udp)) + udp[8:]
+    return (struct.pack("!IHBB", 6 << 28, len(udp), socket.IPPROTO_UDP, 64) +
+            src + dst + udp)
+
+
+def eth_frame():
+    """Return an Ethernet frame with ipv4_udp() from veth0 to veth1."""
+    src = ip("link show dev veth0", json=True)[0]["address"]
+    dst = ip("neigh show 192.0.2.2 dev veth0", json=True)[0]["lladdr"]
+    return bytes.fromhex((dst + src).replace(":", "") + "0800") + ipv4_udp()
+
+
+def send_raw4():
+    """Send one UDP packet from veth0 to veth1 with an IPv4 raw socket."""
+    with socket.socket(socket.AF_INET, socket.SOCK_RAW,
+                       socket.IPPROTO_RAW) as s:
+        s.sendto(ipv4_udp(), ("192.0.2.2", 0))
+
+
+def send_raw6():
+    """Send one UDP packet from veth0 to veth1 with an IPv6 raw socket."""
+    with socket.socket(socket.AF_INET6, socket.SOCK_RAW,
+                       socket.IPPROTO_RAW) as s:
+        s.sendto(ipv6_udp(), ("2001:db8::2", 0))
+
+
+def send_packet():
+    """Send one UDP packet from veth0 to veth1 with an AF_PACKET socket."""
+    with socket.socket(socket.AF_PACKET, socket.SOCK_RAW) as s:
+        s.bind(("veth0", 0))
+        s.send(eth_frame())
+
+
+def send_xsk():
+    """Send one UDP packet from veth0 to veth1 with an AF_XDP socket."""
+    cmd(f"{XDP_HELPER} {ifindex('veth0')} 0 -t {eth_frame().hex()}")
+
+
 # A local IPv4 UDP packet on veth gets LL_ALLOC_SPACE() =
 # ((14 + tx_extra_headroom) & ~15) + 16 bytes of headroom. The Ethernet
 # header takes 14 of them. The push reallocates if less than PUSH bytes are
@@ -200,6 +271,33 @@ def test_push(send, hr, headroom) -> None:
     ksft_eq(bss["reallocated"], headroom < PUSH, "push reallocated the head")
 
 
+@ksft_variants([KsftNamedVariant(f"{name}_{hr}", send, hr)
+                for name, send in (("udp4", send_udp4), ("udp6", send_udp6),
+                                   ("raw4", send_raw4), ("raw6", send_raw6),
+                                   ("packet", send_packet),
+                                   ("xsk", send_xsk))
+                for hr in (0, 256)])
+def test_peer_xdp(send, hr) -> None:
+    """Check that generic XDP on the veth peer copies the skb only with 0."""
+    if send is send_xsk and cmd(f"{XDP_HELPER} - -", fail=False).ret == 255:
+        raise KsftSkipEx("AF_XDP unsupported")
+
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        setup_veth(peer_ns)
+        set_hr(RtnlFamily(), ifindex("veth0"), hr)
+        with NetNSEnter(str(peer_ns)):
+            map_id = load_tc_prog("veth1", "ingress")
+        send()
+        ksft_busy_wait(lambda: read_bss(map_id)["count"] == 1)
+        before = read_bss(map_id)["headroom"]
+        ip(f"link set dev veth1 xdpgeneric obj {XDP_OBJ} sec xdp", ns=peer_ns)
+        send()
+        ksft_busy_wait(lambda: read_bss(map_id)["count"] == 2)
+        after = read_bss(map_id)["headroom"]
+
+    ksft_eq(after != before, hr == 0, "generic XDP copied the skb")
+
+
 def main() -> None:
     """Run all test cases."""
     ksft_run([test_default_and_set,
@@ -209,7 +307,8 @@ def main() -> None:
               test_survives_down_up,
               test_survives_netns_move,
               test_not_inherited,
-              test_push])
+              test_push,
+              test_peer_xdp])
     ksft_exit()
 
 
-- 
2.56.0

