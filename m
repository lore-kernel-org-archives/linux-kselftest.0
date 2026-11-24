Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543180;
	b=KJbgXeR66WB5L48Y9o/9vOiNg3sy6k7BE5EDgCDXG1MS3b5CoBqrXmxIDk+CNU7Uhwks
	 LJEmGrfcsvgSFqGsYDS+De9zSlQIky/gaUFjoojs963a16yMysATQhSYXwQcCzxZIhc+g
	 nV+oKaQv6OheBh/KRffj5o2zxwTCp8/Y1jwWwjBaDXtMqTzxontOlGnD2JZMvi0MUzc+z
	 tZesPcaNZ46HFRWJwmL8SpXd1HCsJMqO0r0Zj7GAVmu+ztSDmXED7NkIwPl1QvtutmYip
	 oDfCyogJgpj4Z37JceQTH7ErJWIp2oYdctGUafxVoheTc8iWJahpoBOdiDXlMp9SHow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uaTj/IgjFnkwmASVrKkLUw8romAE2cVY2R2st4Lr99E=;
	b=pgJg8LUSyiTNRWrH2OghPGtG9oxEXrCeCeWuaJr4IeUhKjfTOvV4FFqYF49s8ch9zqes
	 abWiYXBVY5Nl5ByxxNj/ifyKQ/H6HsdUEgj8nv5rmwQrOBOlYTNWlNcNNpblrVyLqLKM6
	 5QkpRAbWa5N8ahF4azUKgDtlvPA4MX20jgevyamopvcvKgxnN3tHBd6BWviTwnSN4wvHx
	 Li4DOGgane74MgPFs8uRLGXU+4wEbZz41Owm+EsAvVWSzTeqgIylFUQaJ32N1Bru4TbcS
	 4FV5M9/jFv7t0DnEb0vNhNJb/S+i+vCGRbBcbCtLurjOkmaHQ9bdmcx0mH1dEsVHyMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ablhK58t;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F10606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 17:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F10606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ablhK58t
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so5304160a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 09:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543177; x=1796147977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaTj/IgjFnkwmASVrKkLUw8romAE2cVY2R2st4Lr99E=;
        b=ablhK58t8MX2Gx9UkaoIkzL9AwdBhG+jhN7/JyA92ASWxcX3KuQRaPXU/sv2p/Doui
         LLdVv4w2HJP3jvDcSLlkR4x0f8lxYbu2Th76mnUvU/1//q548yfXfPf1y47o0t/nr213
         cx9qQE4fdbqjJTN3b7qTXmJQWEChes/ZHF7nVn3lPKUZO+BXU4yK5htEeRzA00bLNlbm
         Rexd5gkY+Z30hujxDUGmX6ycFjtvJwWguQ0qIa/LbA/5TLbclZWcNh3mZUtjFnPIx8fT
         JDnsdEg/PGybouR5+vOCHt8e5VCYcnhMNGBpMblnEPhIqr/ThraupuDOkUyqhAwu5NfE
         nKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543177; x=1796147977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaTj/IgjFnkwmASVrKkLUw8romAE2cVY2R2st4Lr99E=;
        b=qCLZAY2uUGxWL8FgAKao17xUkKn81tI+k0BIG4Yb2flnpEUiAVW4gRzNtPgAIpnNB4
         5XcR7BNGjDkTYGVx74rY6enUtCZ+ibjEFrbz25IA5mW1L0vb02UDo6fjeWftmUzWyVt7
         D1WnFYk8Yj4IpHWDTBWsmvHyZwtIwt5XHbmvJEQzu9kZXnxQ4cExoZRiY68xFVZnqN4Y
         ek0kPVgsgyZnrpq4M7N3JnGUWwzDzvcap41cjaqk+7xwhfEj2KeBCnkK+oX0YU4EFj/0
         pN2Tmzi5X0XebagGd/M+LRld9Dje7MmD016nnprjEbrfxw8jjabkYh6DNdh9818TKQ/G
         ZjjA==
X-Forwarded-Encrypted: i=1; AL+hErEkq5jx9SC0X9OXoHidbsWlwniaPD7NKz+RWPCUnrpaT2xyn8JlcKeSJGKexwyuDD2fOWzwuKp6cz+QV34MHJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nAk/rnn/wpciPnsLfucTq7i+c6MaZ9RnfbCwEt+ebovjQO0N2
	jm/DSNrnWXaHaEzwAPvgGkIhExWeX7EcajwXIUFVIx/KykTR8s+wohgfOXoK+wCpDJA=
X-Gm-Gg: AZFdTZdVz/TiH9ZCZzpyj7A/UE9LOruwy8JyaVYRPVJpYuy/cvZ6URZbs1V4qiZofv7
	SfhEws34DQM+eq5mon1nx8eHLx6dvK9nkPxLhDM4qCsWld17K3Oz2wnjBKIKKJpzLbZJJa+UNer
	9AkOpBhq9q8QOPU47Xq/+a0j99I/3Wk3PUIfaMnTFSloD3SlQUIgH9ASdxIkLgEOizrcs+Gwy76
	7ch4uxHmWqbsG1ViL9qEguleRoENoR08WDY/8Lq7rb46MsYe84z+Exz2DFoC25dzG1cRfwnCzYk
	CHQDqQoOP5xv9YvvUqgT8CdkXdpYV87SD4z8pZP0/TECaXqR2Pp8prQ/a4/qjVo7yqJEGSiwDok
	tuNefR8H6k2Xqoo7pUmY5DT6dCbKjMqIxDkBZn3nEdOoNQZI/zakDLaPqeIJGj8/rMHgcIsYTyg
	gPsqCWVgonrG0a6I6qLLV7zc3unbhYBujp1V8LuO5dx5qEsJEZ777YsNNlNwVEgklKqAm/bkGmo
	FN1l4Khl+g6s/pLY69rY5e75QH8NSnMgni7GszIXwIHujaYIRaZxqSINGAYyszfdJLuVU9vKVMU
	kw6zpxtEBQ/78oeSLpy4q17P/bWz/2T3A4OZq434J1mw33c=
X-Received: by 2002:a05:6402:2389:b0:6bb:1e07:2eae with SMTP id 4fb4d7f45d1cf-6bb1e073294mr273795a12.9.1795543177340;
        Tue, 24 Nov 2026 09:59:37 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.59.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:59:36 -0800 (PST)
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
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Layton <jlayton@kernel.org>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 10/11] netlink: specs: rt-link: add veth attributes
Date: Tue, 24 Nov 2026 17:58:23 +0000
Message-ID: <20261124175824.60470-11-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124175824.60470-1-tianyi@cloudflare.com>
References: <20261124175824.60470-1-tianyi@cloudflare.com>
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
v3:
- Add the maximum of tx-extra-headroom (Sashiko).

v2:
- New patch.
---
 Documentation/netlink/specs/rt-link.yaml | 16 ++++++++++++++++
 include/uapi/linux/veth.h                |  4 ++--
 tools/net/ynl/Makefile.deps              |  3 ++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/netlink/specs/rt-link.yaml b/Documentation/netlink/specs/rt-link.yaml
index 81b58633911d..c7967a9b3cc6 100644
--- a/Documentation/netlink/specs/rt-link.yaml
+++ b/Documentation/netlink/specs/rt-link.yaml
@@ -2368,6 +2368,19 @@ attribute-sets:
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
+        checks:
+          max: 512
 
 sub-messages:
   -
@@ -2427,6 +2440,9 @@ sub-messages:
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

