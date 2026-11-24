Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543152;
	b=fJIGX/j/oY6BIR/xWh2OIrJj/fuKwv6psWbj3sGvPM03dXxCYvtbmmwsBicbPpsitNvW
	 vnXdEk2yNiItNN48cIePlPDDKfnJc1B3hGEnz3H0FDg1MrBmk2nbZWTTZ+mwiK3d3k8y8
	 WHJmSotKTXvO50n/5T8QLrYLHQWgXnjzQEoNXWfbmeQ6V6SUC8w6H6Edsjn0Z0ykk/7Re
	 R7tXOT2WJOA33F6F12RL7LRYpteh4248I5Av6wH2GqBI6S24l6p3bwHTNYwfIz4uGyOKG
	 W1Hk6hiKEdmTlVd3ORUdxxY/MIGjZUK3sEfJXvcAY1zZKYqSGFViZz3EUes3V+Ab19w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6glrrO4iMtJDIDWR6sOQoTne0bt/qURyzBuSmuqJvbY=;
	b=X2ijtoxkG1D9ItEVvY9zzk+LhVvRZHyasMnH1mDGjpKAMG2TjETBw5CffMVo8oFZb4sD
	 EIq+TgGFLNxyyvGrqwPdFF8BFTXGj2Iipohi18c2Si+j91ojn0ffumMQSTda0sgNbuYG9
	 6kr4gdjxnVQXKBshaVlQCAVSUKm9YMPv7KSJBOAGB3iRad1eOQRg1Jpr6aqsjD710qCtU
	 uXmSdw6fuca1PiQ4oDYtD32bFP9u4R7r94pd7Lejc2MwciOH1NjXW1WU2XWk3Ex486Ojb
	 XCuHYzsFrjF77E4gP0XuOTdL5a2yMc9UD+cYycxPasuCbxhoWPpzA8BXHlc0R9cIz/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=TKGIOCLt;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3927606A327
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 17:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3927606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=TKGIOCLt
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so5303655a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 09:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543150; x=1796147950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6glrrO4iMtJDIDWR6sOQoTne0bt/qURyzBuSmuqJvbY=;
        b=TKGIOCLtAO2CK8L6MARiBYgpiGwWdwUIEZTJuQPfMpmjvHsqEh373/6ow+9Oe/CeQv
         +aL+BMAKCAd8sO19xGcfS2WcdbFMGMyeo+VcqQ0IKpaPTeCmhsYgXlnJGjlbfU20iKBY
         kzpi5FLILRQPvkOcU5HT1VzksZj661Opl55g3lS6SRvxNvnIT7yhth4nsbgWDXVJovwK
         Hr2Zx6ilS4MKQbKVaKuFUh5vSSupqrQWR290SgbARco/o++Nr06SliEXHEqEcaFmekpL
         UEYOX3Xw+bWAreA1h6vAIqvw/VioAr3XZsJdjAcd3aYdMyk+xauercUtkavDaElmvdbK
         lL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543150; x=1796147950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6glrrO4iMtJDIDWR6sOQoTne0bt/qURyzBuSmuqJvbY=;
        b=pWYb4Aj7zIM5NqzvmL2vDjYEW4V5hSRSVKC5CeNW/Lxdmc9d+8nXRd0h9joUX5npw5
         3hqo5xdlNjiiK0aj3bvhFvMXFPF4fMQz3zlAu66Xov8ikh9l1THVIv9WLHCF6DACugmU
         qouXAPhoNhPFR/nRrXlGSPBZVDi4FAZK2QkgVKelN8dv2xRID0cDJSRpkmjVZL4PO/GT
         QJEZnGP+KJSA9/9GJZPPm2HaGmAoDklYw75M2aoR5wb5bgy3Va/qe/jv+iJBDTwCE+Nv
         AVY0Cdoxk7yQFmSJ00zNsJSY49kwC78Z8J2eCMWOrnl+2YQPcMK2JoBZkPeaXs/yKPI4
         BltA==
X-Forwarded-Encrypted: i=1; AL+hErHDoeuQfDvRvc/D8w0GDf8YX+kiINUNHS4osqwZzFFjOvWgkwZBhppG5VGvKoR9ukVg58jYN/0CeJzhFnyqioA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+udiNzxVNtgS6+vBc09Xr2P64G6FzOygoWXmVACqmQ3HCVaFxs
	qn4uSP2gAb2xPKItGD+LcP53H2XDF/6NfrmpYkitzBLtqmNfFjwEN3tyYiZtnuE8RXM=
X-Gm-Gg: AZFdTZecnch+xx5BC0kW+U5M32gFezBFmZ9aoisWQwNpSkUm35JSXNMy3aTycx3I1FK
	BDsMLbSbS26QF7ZgNeb1hdL6dBrgXc+laPJdgMKsx3yv0TVZRsAslw8O5i0o4KG9qHvjWGLFQMq
	0TvrEP7AXjhoRR+5+Ro9HH9GLu0NYJjbXfF28ljqJgr8li7SdNerwOtbvWb7pikz3EuzS/UpVfe
	ERJYUadHsRkVpMi4t/HrAnve0cyDMd9qMXCrke+3f1SAj3ar7fwzea6Q8jsRNfWqxnEn+yFHwf+
	3VtNqOHw7TCP8+wZk0FkAzRIqviNq8+1d2FG0u64xXBOv7Gc6aHG/6odCH+yNj7jGmi7EuvbEBn
	yM8ZLfu39xB9j5IO/kcyar5y0uFAqAhTHrGC0l2UtRRA6yi/d2Y3uTQV7bnbIqcVoAhVsmnHTy3
	7W3HrJKEgTKTxYq8M548nWW3PrhvWX4k/lRwBVOfvuje5f5dUucX3pX7qYraem7l166DOpfxKfv
	rQrmZmTpkCPyABS7uqLoHIfinYo4B2BgMViJQA0bgAOhQqmsonB3lXvGqgcs8zvBTvQ8/76GVwZ
	8KtHLcoUXiPsYGPS+jw6R3RjOLIBXZmzYoWu2vhkrlmf6iwK
X-Received: by 2002:a05:6402:42c8:b0:6ba:9b7c:d897 with SMTP id 4fb4d7f45d1cf-6ba9b7ce6c6mr6139701a12.33.1795543150231;
        Tue, 24 Nov 2026 09:59:10 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.59.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:59:08 -0800 (PST)
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
Subject: [PATCH net-next v3 06/11] bpf, tcx: Set tx_extra_headroom from a decl tag on egress programs
Date: Tue, 24 Nov 2026 17:58:19 +0000
Message-ID: <20261124175824.60470-7-tianyi@cloudflare.com>
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

A program at TC egress can push headers, for example to encapsulate a
packet. A locally generated UDP, raw or AF_PACKET packet gets only
LL_RESERVED_SPACE() of headroom, so bpf_skb_adjust_room() reallocates
every such packet.

The kernel cannot know how many bytes a program pushes. Let the program
declare it with a BTF decl tag on its main function:

	SEC("tcx/egress")
	__attribute__((btf_decl_tag("tx_extra_headroom:64")))
	int prog(struct __sk_buff *skb)

The verifier parses the tag when the program is loaded, as it does for
"exception_callback:", and stores the value in struct bpf_prog_aux. The
new field fills a hole after freplace_link_cnt, so struct bpf_prog_aux
does not grow. The verifier rejects the program if the tag does not
parse or exceeds NETDEV_TX_EXTRA_HEADROOM_MAX (512 bytes).
tx_extra_headroom is then recalculated with
netdev_update_tx_extra_headroom() under RTNL whenever an egress program
is attached, detached or replaced.

The egress programs of a device run one after another, so the headers
that they push can add up. Their tags are summed and added to the
headroom for XDP on the veth peer. The total is capped at
NETDEV_TX_EXTRA_HEADROOM_MAX.

Tags on programs at tcx ingress, on tail call targets and on freplace
programs are ignored, like "exception_callback:" on subprogs. An ingress
program does not see transmitted packets. A tail call target or a
freplace program is never attached at tcx, so its tag is never added.
The tag on the attached program covers the whole chain.

Only tcx is supported. A cls_bpf filter is attached to a tc block,
which can be shared by several devices.

Suggested-by: Dragos Tatulea <dtatulea@nvidia.com>
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v3:
- Document the -EEXIST failure for two tags (Sashiko).
- Name the packets that get only LL_RESERVED_SPACE() of headroom
  (Sashiko).

v2:
- New patch, replaces IFLA_TX_EXTRA_HEADROOM for the TC egress case
  (Dragos, Willem, Stephen).
---
 Documentation/networking/netdevices.rst | 15 ++++++++++++
 include/linux/bpf.h                     |  1 +
 include/net/tcx.h                       |  6 +++++
 kernel/bpf/tcx.c                        | 24 +++++++++++++++++++
 kernel/bpf/verifier.c                   | 31 +++++++++++++++++++++++++
 net/core/dev.c                          |  4 +++-
 6 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index a1c12ca704d6..280ad3bf5559 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -463,6 +463,7 @@ values:
 
 * ``XDP_PACKET_HEADROOM`` (256 bytes) minus ``needed_headroom``, when the
   peer of a veth or netkit device has an XDP program
+* the headroom that the programs at tcx egress of the device declare
 
 The kernel updates ``tx_extra_headroom`` when an XDP program is attached
 to or detached from the peer, to reserve the headroom that XDP needs.
@@ -470,6 +471,20 @@ Native XDP on veth still copies locally generated packets, because
 their head is not a page fragment. ``tx_extra_headroom`` is not updated
 when a bridge or openvswitch changes ``needed_headroom`` later.
 
+A program at tcx egress declares its headroom with a BTF decl tag on its
+main function. The value is a decimal number of bytes:
+
+.. code-block:: c
+
+  SEC("tcx/egress")
+  __attribute__((btf_decl_tag("tx_extra_headroom:64")))
+  int prog(struct __sk_buff *skb)
+
+The tag of the attached program covers the whole tail call chain. Tags on
+tail call targets, freplace programs and programs at tcx ingress are
+ignored. Loading a program whose tag is above 512 or does not parse fails
+with ``-EINVAL``. Loading a program with two tags fails with ``-EEXIST``.
+
 NETDEV_INTERNAL symbol namespace
 ================================
 
diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index fdbf638300fc..bca6d0b960cb 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1952,6 +1952,7 @@ struct bpf_prog_aux {
 	u64 (*bpf_exception_cb)(u64 cookie, u64 sp, u64 bp, u64, u64);
 	u16 stack_arg_sp_adjust;
 	u16 freplace_link_cnt; /* counts freplace links extending this prog */
+	u16 tx_extra_headroom; /* from the "tx_extra_headroom:" decl tag */
 #ifdef CONFIG_SECURITY
 	void *security;
 #endif
diff --git a/include/net/tcx.h b/include/net/tcx.h
index 23a61af13547..9ab299ecd902 100644
--- a/include/net/tcx.h
+++ b/include/net/tcx.h
@@ -164,6 +164,7 @@ int tcx_prog_attach(const union bpf_attr *attr, struct bpf_prog *prog);
 int tcx_link_attach(const union bpf_attr *attr, struct bpf_prog *prog);
 int tcx_prog_detach(const union bpf_attr *attr, struct bpf_prog *prog);
 void tcx_uninstall(struct net_device *dev, bool ingress);
+unsigned int tcx_tx_extra_headroom(struct net_device *dev);
 
 int tcx_prog_query(const union bpf_attr *attr,
 		   union bpf_attr __user *uattr);
@@ -193,6 +194,11 @@ static inline int tcx_prog_detach(const union bpf_attr *attr,
 	return -EINVAL;
 }
 
+static inline unsigned int tcx_tx_extra_headroom(struct net_device *dev)
+{
+	return 0;
+}
+
 static inline int tcx_prog_query(const union bpf_attr *attr,
 				 union bpf_attr __user *uattr)
 {
diff --git a/kernel/bpf/tcx.c b/kernel/bpf/tcx.c
index 02db0113b8e7..99da16e13981 100644
--- a/kernel/bpf/tcx.c
+++ b/kernel/bpf/tcx.c
@@ -46,6 +46,8 @@ int tcx_prog_attach(const union bpf_attr *attr, struct bpf_prog *prog)
 			tcx_skeys_inc(ingress);
 		}
 		bpf_mprog_commit(entry);
+		if (!ingress)
+			netdev_update_tx_extra_headroom(dev);
 	} else if (created) {
 		tcx_entry_free(entry);
 	}
@@ -86,6 +88,8 @@ int tcx_prog_detach(const union bpf_attr *attr, struct bpf_prog *prog)
 		bpf_mprog_commit(entry);
 		if (!entry_new)
 			tcx_entry_free(entry);
+		if (!ingress)
+			netdev_update_tx_extra_headroom(dev);
 	}
 out:
 	rtnl_unlock();
@@ -119,6 +123,20 @@ void tcx_uninstall(struct net_device *dev, bool ingress)
 		tcx_entry_free(entry);
 }
 
+unsigned int tcx_tx_extra_headroom(struct net_device *dev)
+{
+	struct bpf_mprog_entry *entry = tcx_entry_fetch(dev, false);
+	unsigned int headroom = 0;
+	struct bpf_mprog_fp *fp;
+	struct bpf_prog *prog;
+
+	if (!entry)
+		return 0;
+	bpf_mprog_foreach_prog(entry, fp, prog)
+		headroom += prog->aux->tx_extra_headroom;
+	return headroom;
+}
+
 int tcx_prog_query(const union bpf_attr *attr, union bpf_attr __user *uattr)
 {
 	bool ingress = attr->query.attach_type == BPF_TCX_INGRESS;
@@ -160,6 +178,8 @@ static int tcx_link_prog_attach(struct bpf_link *link, u32 flags, u32 id_or_fd,
 			tcx_skeys_inc(ingress);
 		}
 		bpf_mprog_commit(entry);
+		if (!ingress)
+			netdev_update_tx_extra_headroom(dev);
 	} else if (created) {
 		tcx_entry_free(entry);
 	}
@@ -193,6 +213,8 @@ static void tcx_link_release(struct bpf_link *link)
 		bpf_mprog_commit(entry);
 		if (!entry_new)
 			tcx_entry_free(entry);
+		if (!ingress)
+			netdev_update_tx_extra_headroom(dev);
 		tcx->dev = NULL;
 	}
 out:
@@ -237,6 +259,8 @@ static int tcx_link_update(struct bpf_link *link, struct bpf_prog *nprog,
 		oprog = xchg(&link->prog, nprog);
 		bpf_prog_put(oprog);
 		bpf_mprog_commit(entry);
+		if (!ingress)
+			netdev_update_tx_extra_headroom(dev);
 	}
 out:
 	rtnl_unlock();
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 5e4700fda66b..e241ee20927a 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -2683,6 +2683,33 @@ static int add_subprog(struct bpf_verifier_env *env, int off)
 	return i;
 }
 
+static int bpf_find_tx_extra_headroom(struct bpf_verifier_env *env)
+{
+	struct bpf_prog_aux *aux = env->prog->aux;
+	const struct btf_type *t;
+	const char *value;
+	u16 headroom;
+
+	if (!aux->func_info_cnt)
+		return 0;
+	t = btf_type_by_id(aux->btf, aux->func_info[0].type_id);
+	value = btf_find_decl_tag_value(aux->btf, t, -1, "tx_extra_headroom:");
+	if (IS_ERR(value)) {
+		if (PTR_ERR(value) == -ENOENT)
+			return 0;
+		verbose(env,
+			"multiple tx_extra_headroom tags for main subprog\n");
+		return PTR_ERR(value);
+	}
+	if (!isdigit(*value) || kstrtou16(value, 10, &headroom) ||
+	    headroom > NETDEV_TX_EXTRA_HEADROOM_MAX) {
+		verbose(env, "invalid tx_extra_headroom tag '%s'\n", value);
+		return -EINVAL;
+	}
+	aux->tx_extra_headroom = headroom;
+	return 0;
+}
+
 static int bpf_find_exception_callback_insn_off(struct bpf_verifier_env *env)
 {
 	struct bpf_prog_aux *aux = env->prog->aux;
@@ -3264,6 +3291,10 @@ static int add_subprogs(struct bpf_verifier_env *env)
 		}
 	}
 
+	ret = bpf_find_tx_extra_headroom(env);
+	if (ret < 0)
+		return ret;
+
 	ret = bpf_find_exception_callback_insn_off(env);
 	if (ret < 0)
 		return ret;
diff --git a/net/core/dev.c b/net/core/dev.c
index c1788a18f0fd..dd34daf5f3b4 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10692,8 +10692,10 @@ static void __netdev_update_tx_extra_headroom(struct net_device *dev,
 	if (peer && dev_xdp_prog_count(peer) &&
 	    needed_headroom < XDP_PACKET_HEADROOM)
 		tx_extra_headroom = XDP_PACKET_HEADROOM - needed_headroom;
+	tx_extra_headroom += tcx_tx_extra_headroom(dev);
 
-	WRITE_ONCE(dev->tx_extra_headroom, tx_extra_headroom);
+	WRITE_ONCE(dev->tx_extra_headroom,
+		   min(tx_extra_headroom, NETDEV_TX_EXTRA_HEADROOM_MAX));
 }
 
 /**
-- 
2.56.0

