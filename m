Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052350;
	b=wRzRrKC1ZTiRHjk+8RDcxw2cUrDymNoqVPZ4lYDhgCvce6LDXKnPly0c0FZZc1EktO/l
	 02XEpCRvoYSx4c88UDt+qvLoU5/ciWVN2yT+CqbvWEB7jq3l71u/IqUMwBMhC6L+mO/SC
	 mL7vlnb4SEM1ebRIiRKrXr9OxqSBCzesEUuZqf2u048pLL8qEeOed26bwDjbsszNjN2lq
	 qt6ZiTe2FWc/UwLRkK3pboaaiQTEPKiJRSVb7Q3B37c5n80IIObmw20sMfRFVXwHuKwqd
	 jGdCduMPzbltTmxCZ+c2gzFrgWI0OVkSxLxfzMzGGk2llanQHppTRH24NfvyT/i6msQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z7qXRKp5SZinXOoTS4Hu0OjgCXPeE5hw4AaK2FgUeD4=;
	b=DBW0rQv74btBzX6+mTkYE/Z0eG3sHNJk6ac3eCdWYnU8pG6c08uxuHmEwqBDjt4l7f7A
	 pTDL9djSO1dEd98T7pAmDMBWXFh+HhyrX97jpZNS3/BK9NOBXk8TZ0l3oMvQeOvjrvup0
	 SK1Hdh7mWQmlYwKzsRSM8bEVPnOryXCVrtPhWY4B3cZhEvUoTrAH3drPnzNFbmf8lDqcZ
	 3s/CE4F5GKibRtjkl9yd6qg2fEuLAYEvGzKOip+0SkuQ7d2tTQF7Nth9+ytVQrO5vsHwt
	 AW5PP7PsfhzIuYLLbf47HVAlFH8mq0/pM9h+ggX72Jt0Zs8ZcZ9yZFOIxDWIPX/l+OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=LttS7ehO;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77860A2618
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 01:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA77860A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=LttS7ehO
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5126505cb3so69303766b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 17:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052348; x=1795657148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7qXRKp5SZinXOoTS4Hu0OjgCXPeE5hw4AaK2FgUeD4=;
        b=LttS7ehOHe22GxKUfz3V86dN1Orih0pj1MfLLknYUWQ0A7nfKW0m2VJyPK8/qVxLB5
         aY9TjKabMRh3Zj8zYdyglhC/g1u3w/Br3YrQ1X8+L32qCWqE8ww/uTysr9ZHLXw9M0j1
         dQPhlQ1F5/N8jbEL+PQyCAAHFF7uCNEDRT5JrPc1WwYdmhk+nwmAB4+J3WZml2+d5p0f
         7k/xf2oWQ33Jss5YSUFDBHrWINe0lnun4cW+rkOM7aJGHllqqHP4Ojp8ZLB6WBG1q0Gc
         MsZInUHw047fvZj7H+M8uJspu/KedpUx5VsxrpTjwpPLs2QZcfurh6MDWV9EOiPzNGg4
         rPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052348; x=1795657148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7qXRKp5SZinXOoTS4Hu0OjgCXPeE5hw4AaK2FgUeD4=;
        b=oF6OcNMdz63TnBlLwWfq97MM2aJCA5sQcTGStWmaARLMuJc2nn/rT+q7rJk2uBVD/X
         UauAx8a6ExaLyBHAZ5VeAeMdpSG5lvFiBaYymqTCr0+r0WQlQukk0lSfkGEbsW7kjLpJ
         cW28AZ/OSU+USPVIv1UVaO7nnJk/g/Sknypkxtfrl1SMtj5Kh4ATz1+FWdifTl5I8/eZ
         vmK0HRc33NqpQkJRFrPBbp3UgSqyefN/ZnY1o+JcPi+vwfhwHKNCJ3FGSgnpj0oiQQxW
         ol+fs9fhECeUZe7V6LY+2imCoaiT8Uc22lju1xTFRF5BML5D129omjYpNyY1txbrczVj
         YR1w==
X-Forwarded-Encrypted: i=1; AL+hErHA4/pQRy3xUOjKZkUp1SZVLnhiXkQcIrGN39rRjPiLbmo+me/670O3br8a11frWR13NvEDX8yks/dNwxHGPgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KA62MOF+vaKFca73Jv2sQe5gfXyTkYNNHHO0c6Wj7yA0T3kUf
	QL6vlpHp0E19q2nxa+15thZvirCvnlMocCHEYBwfXvdNWFRUtoHvxNCVTHsdb6JFqww=
X-Gm-Gg: AYBFou3IrXrCFtMZZpM8YWAvZlN67AHc5Kc+Ep8S/yvFpe5HGEXzfxsKchW8+HSJTb4
	GZ3oTRgweautsgsif58YSD7S1q/G4JfqdStPPv0U3L1izpdiEM3ktIeOit2PZx1oKbd8pWxEouc
	9lUBKXRODiziCEzj1pQt/DOuaWXCNOfibvcPMgGUcHDXZ31KvbgRKdTzsGgeRi4lYDrBpeN374f
	ifrqI01DwADN7i2FauxTeLfHkoyMuru2wj2QEO75lkV0echPXu/1O1hLwdXlYGN0uTf75x97PJB
	e6l76dEtCnLy561Ns46ZHm4YkO0HTqfIKG2iZqGT/0rGOKDvfCTy3SgzF5oaSuJpfZMNHCT3Nx3
	vUz0feUYef6e9TW8vM1BO5CakgNv2s1/mS0BNvXhsEBIyg7s26GhtKVKH15lJXsVax96kP/5s63
	6CNp+sEiSYKZwnRnBZMbxi3I/rZIkRo5S6e60sASMMAWqPcmJySPHn9RgDwjbfTuW1+nWgXuCYz
	q7MhVUpZ2S/GQ0zkLaxi9jnQaqVBvJ3ip6T9i028rtI3ByNYSUFLR5tTjfy3FOZKddPFU6vTvRl
	FDGmgwZE2Y/6ew8WD0sKngvGI3Gzh7jSokXuUqsOKFq2oMsEdpCNbvFXSw==
X-Received: by 2002:a17:907:d409:b0:c50:5802:f665 with SMTP id a640c23a62f3a-c510e199db4mr418626366b.15.1795052348318;
        Wed, 18 Nov 2026 17:39:08 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4080sm59785966b.16.2026.11.18.17.39.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:39:07 -0800 (PST)
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
	Stephen Hemminger <stephen@networkplumber.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Remy D. Farley" <one-d-wide@protonmail.com>,
	Amery Hung <ameryhung@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Anil Kaushik <anilkaushikwireless@gmail.com>,
	Demos Ra <demosthenes.ra@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Joe Damato <joe@dama.to>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Li RongQing <lirongqing@baidu.com>,
	Louis Scalbert <louis.scalbert@6wind.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Song Liu <song@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Wang Zhan <wang.zhan@smartx.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Zhou Qiuyue <n0ps1edzz@gmail.com>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v2 10/11] netlink: specs: rt-link: add veth attributes
Date: Thu, 19 Nov 2026 01:38:29 +0000
Message-ID: <20261119013830.36935-11-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119013830.36935-1-tianyi@cloudflare.com>
References: <20261119013830.36935-1-tianyi@cloudflare.com>
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

Describe the veth attributes in rt-link.yaml, so that YNL can set and
read them. The next patch uses them to test VETH_INFO_TX_EXTRA_HEADROOM.

YNL includes linux/veth.h from the source tree with get_hdr_inc, which
needs the source header guard to differ from the installed one. Prefix
the guard with _UAPI, as commit 8066e388be48 ("net: add UAPI to the
header guard in various network headers") did for other network
headers. headers_install strips the prefix, so the installed header does
not change.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v2:
- New patch.
---
 Documentation/netlink/specs/rt-link.yaml | 14 ++++++++++++++
 include/uapi/linux/veth.h                |  4 ++--
 tools/net/ynl/Makefile.deps              |  3 ++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/netlink/specs/rt-link.yaml b/Documentation/netlink/specs/rt-link.yaml
index 81b58633911d..36dece251778 100644
--- a/Documentation/netlink/specs/rt-link.yaml
+++ b/Documentation/netlink/specs/rt-link.yaml
@@ -2368,6 +2368,17 @@ attribute-sets:
         name: mode
         type: u8
         enum: ovpn-mode
+  -
+    name: linkinfo-veth-attrs
+    name-prefix: veth-info-
+    header: linux/veth.h
+    attributes:
+      -
+        name: peer
+        type: binary
+      -
+        name: tx-extra-headroom
+        type: uint
 
 sub-messages:
   -
@@ -2427,6 +2438,9 @@ sub-messages:
       -
         value: ovpn
         attribute-set: linkinfo-ovpn-attrs
+      -
+        value: veth
+        attribute-set: linkinfo-veth-attrs
   -
     name: linkinfo-member-data-msg
     formats:
diff --git a/include/uapi/linux/veth.h b/include/uapi/linux/veth.h
index 04cb408e5b3a..d22a29b1bbb2 100644
--- a/include/uapi/linux/veth.h
+++ b/include/uapi/linux/veth.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __NET_VETH_H_
-#define __NET_VETH_H_
+#ifndef _UAPI__NET_VETH_H_
+#define _UAPI__NET_VETH_H_
 
 enum {
 	VETH_INFO_UNSPEC,
diff --git a/tools/net/ynl/Makefile.deps b/tools/net/ynl/Makefile.deps
index f8850444d240..39abd83c014f 100644
--- a/tools/net/ynl/Makefile.deps
+++ b/tools/net/ynl/Makefile.deps
@@ -43,7 +43,8 @@ CFLAGS_psp:=$(call get_hdr_inc,_LINUX_PSP_H,psp.h)
 CFLAGS_rt-addr:=$(call get_hdr_inc,__LINUX_RTNETLINK_H,rtnetlink.h) \
 	$(call get_hdr_inc,__LINUX_IF_ADDR_H,if_addr.h)
 CFLAGS_rt-link:=$(call get_hdr_inc,__LINUX_RTNETLINK_H,rtnetlink.h) \
-	$(call get_hdr_inc,_LINUX_IF_LINK_H,if_link.h)
+	$(call get_hdr_inc,_LINUX_IF_LINK_H,if_link.h) \
+	$(call get_hdr_inc,__NET_VETH_H_,veth.h)
 CFLAGS_rt-neigh:=$(call get_hdr_inc,__LINUX_RTNETLINK_H,rtnetlink.h) \
 	$(call get_hdr_inc,__LINUX_NEIGHBOUR_H,neighbour.h)
 CFLAGS_rt-nexthop:=$(call get_hdr_inc,__LINUX_RTNETLINK_H,rtnetlink.h) \
-- 
2.56.0

