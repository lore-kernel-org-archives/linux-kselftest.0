Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773710;
	b=aJotI/XInKV03raAxZGbMwbaPCuSUXH9/fwwRE56HWbEeWwDMRUYhTW2CjlmpGzU4vpg
	 OlWl5FB1Jd9zBep8rLEWnJtGG9Ldb8OiqrqvsGX1Mek9yfoI9DOrjmqLSNsbNTG84MuAW
	 0JqpRSTA9E8k95H5Pim6/RlevT8tHNw1f1IfXeS+jOCzTXe4kjiHRM4ehwI41fxNVQieZ
	 dPV4qK10tw4WYjYLoBoZgebXjfyNVgNRfzeoTy0XUwzUhjUHAwSEXgR5zXFlfJVBx4D7Q
	 PjFdrOCaVDeW47CjqzQKm94keniy+Axw5cUjyoarknH8PnZMqQYuzTrRDtUL46nSY+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773710;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=6LuUG7F3kfFmRHIylqR3PfTCOEnYN6Az7QPeQQLrxUc=;
	b=qXTwaWs2NiTSdE8NlT2hb3sHWXtG+8vaN2A+H+80CmvdEUt3E2n+tHh+qqN7fVEZL6wq
	 sdG5Rj5ojTJOoUNa4wEdiAw2wkitykDeimABTv3sezk+DLJ79cOCUbaCdVku+g3q8ft1X
	 gmW9d5B3rlv1f0UhlHrhuOOaTux6U34y2LRggCJ5KH8v1vSO9gO1kpvs0zPc3h5Uestd1
	 RdrthvIRU7zO2l9sB6XsJ/4yUWyyBXUVP8bUQgs8Jl4DaKGQoNzqzVIESlZCjy2iGJKCg
	 ykDTetQHhl34Om9fZGDW4fjX8E467GoTvTbJWkNonoZrIYEgM2bzEVOwtDRhg7dB5AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=S8jP3vz4;
	arc=none smtp.remote-ip=217.74.67.63
Received: from smtpo63.interia.pl (smtpo63.interia.pl [217.74.67.63])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228E5606A33D
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 228E5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=S8jP3vz4
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Fri, 27 Nov 2026 11:01:45 +0100 (CET)
From: Slawomir Stepien <sst@poczta.fm>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Cc: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Dudu Lu <phx0fer@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Tianyi Gao <tianyi@cloudflare.com>,
	Octavian Purdila <tavip@google.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Slawomir Stepien <sst@poczta.fm>,
	stable@vger.kernel.org
Subject: [PATCH net v9 2/6] bpf: test_run: Set frag_size on a copy of the rxq info
Date: Fri, 27 Nov 2026 11:01:28 +0100
Message-ID: <20261127100132.1977890-3-sst@poczta.fm>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127100132.1977890-1-sst@poczta.fm>
References: <20261127100132.1977890-1-sst@poczta.fm>
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1795773708; bh=6LuUG7F3kfFmRHIylqR3PfTCOEnYN6Az7QPeQQLrxUc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=S8jP3vz4BkqRmMif55jPczxiq1b7h0biMmLLisdiXgReEN//CTHnGnkCpw+bRi7jX
	 QlIkPT2SO1HZFG9K6K34jTwJYzMShpFvYIe5vPo2zeJKXE3Cd1YOuI6QYUfphRfhSq
	 93TL1umpFMw9r3zgDIsOzhpsgXbrzAE9I6rxw7QY=

bpf_prog_test_run_xdp() runs the program with the rxq info of lo's
queue 0 and stores frag_size = PAGE_SIZE into it, because the frags it
allocates are full pages. That rxq info is shared with generic XDP on
lo, whose frags come from skb_pp_cow_data() and can be a part of a
page_pool page. After a test run, a generic XDP program on lo can grow
such a frag with bpf_xdp_adjust_tail() up to the end of the page, over
the data of the next frag in that page.

The store also comes too early when the test run picks the rxq info of
another device with ingress_ifindex: xdp_convert_md_to_buff() replaces
xdp->rxq after it, the frag_size of that rxq info is 0, and growing a
frag of the test run fails with -EOPNOTSUPP.

Keep lo's rxq info as it is. Once xdp_convert_md_to_buff() has chosen
the rxq info, run the program with a copy of it on the stack that has
frag_size = PAGE_SIZE.

Fixes: 1c1949982524 ("bpf: introduce frags support to bpf_prog_test_run_xdp()")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Link: https://lore.kernel.org/all/sashiko-outbox-223211@kernel.org/
Link: https://lore.kernel.org/all/DN3QVHST3PUQ.3NINFUW0FL9IW@gmail.com/
Cc: <stable@vger.kernel.org>
Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 net/bpf/test_run.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index d6c9dc62182e..1d89b6f71a48 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -1349,6 +1349,7 @@ int bpf_prog_test_run_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
 	struct netdev_rx_queue *rxqueue;
 	struct skb_shared_info *sinfo;
 	struct xdp_buff xdp = {};
+	struct xdp_rxq_info rxq;
 	int i, ret = -EINVAL;
 	struct xdp_md *ctx;
 	void *data;
@@ -1417,8 +1418,7 @@ int bpf_prog_test_run_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
 	}
 
 	rxqueue = __netif_get_rx_queue(current->nsproxy->net_ns->loopback_dev, 0);
-	rxqueue->xdp_rxq.frag_size = PAGE_SIZE;
-	xdp_init_buff(&xdp, rxqueue->xdp_rxq.frag_size, &rxqueue->xdp_rxq);
+	xdp_init_buff(&xdp, PAGE_SIZE, &rxqueue->xdp_rxq);
 	xdp_prepare_buff(&xdp, data, headroom, linear_sz, true);
 	sinfo = xdp_get_shared_info_from_buff(&xdp);
 
@@ -1426,6 +1426,11 @@ int bpf_prog_test_run_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
 	if (ret)
 		goto free_data;
 
+	/* generic XDP uses the same rxq and its frags can be smaller */
+	rxq = *xdp.rxq;
+	rxq.frag_size = PAGE_SIZE;
+	xdp.rxq = &rxq;
+
 	size = linear_sz;
 	if (unlikely(kattr->test.data_size_in > size)) {
 		void __user *data_in = u64_to_user_ptr(kattr->test.data_in);
-- 
2.56.0

