Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283049;
	b=YBJ0xE/u/MSPr5STAObmRvWTfZvDkDlPZWkPQiiL2bL9l73yaTw67F/Nz8W8I2VY6fZu
	 SgT3y4ydWjT0N1Se3or/Bkml1CPmFYBDSBT+EBCCvcWLU40wQFuxR9uviPxlfcsRon7b2
	 Eq44XrnAK96TX41HO2gIw5SBHMxyhKnzvgSTioDiGH348SjeJRrrso//nb13f1bLzfP3x
	 eB9a00zKnbcfe5y9A/LINQnMhOFuhKDaZ4eUnocIvANUvneVWYXghxfj9jlT5plTy8vHY
	 Qe9qpppUX2NnS1Ax2Wip/7OjX4gTzxsh5jEtZCENMD7GDfdkCiXUsJZ0CKmtZHSnqkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L0xaW/62AQgxFhpajczQ88yBj65kDwjYHTXkn62rfdI=;
	b=BMRRDb7zcdi9iiSO127ayG1+3vONAc0OOgtOvwDu3pgqEsaw3EKVpnAkoGfTyDqfgU5v
	 vneeQ34MpaMHXOC33wst2t+Ixiqz7Hkv2M3PNNErB/9jA8GEx+QIP1GJMYtitbhiHK03M
	 DymjB2eSY/yOj1sD51cwlmqCBZIvVzPux/vK2raHYDOsa85+blC1zosH3evnItFgne7TK
	 d7mdOY6nOZOcUhvJpCmH3HNAj8kwvoEyLPDZhH7COM5zbKicp4YWUUHtsX6/KTESa37NI
	 nE5m8dl0AZZzpnvb0egN7KsAGarTXzeG9O1wAHSYSiLJLBbGYBlfXKuYjMFdUM+yK4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=B3UO6mYx;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D1260A2600
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 03:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D1260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=B3UO6mYx
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so693125a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 19:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283047; x=1794887847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0xaW/62AQgxFhpajczQ88yBj65kDwjYHTXkn62rfdI=;
        b=B3UO6mYxBrwbI4EnQx2MJCfYep/7lzLJy9J27S0G6O4GvtAuldRznLGKrqfTHxZKwy
         8pAtP29K6ylA0zEHKeGYXZl1w2XVzbwIam1ss5NxCX8JGel0U2a4/TGaXtIpR0G132A3
         SIjYqB5LYtz5aXQMa7VQHXjfgmJr3DFNg2bM/m4fG7KjNqLt2FW6m7RDwNDQASs5rDSZ
         kXe3in7HjpLK7qHJkb78nOsZ3g1a7uDFw77n7dsnwPZbZ1CFq2cf20jyuaq6hsoc83El
         MitOrxLYK+ko289aXFEf6w8Z4VKwqe8agX/YQQyNSRqsQLap+MgSPkjtzgAl0JWzJaWj
         k/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283047; x=1794887847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0xaW/62AQgxFhpajczQ88yBj65kDwjYHTXkn62rfdI=;
        b=guDOfnBlLlg/XG2aJNXwiO19kWeEMqtsd/Mxen0kqYlMlePqjco978TQEDvKiVpHEs
         davQsAAjjOTMLIPVZUkVapDnMiOLHprUKo4MKfAg2fcj5Jr9jD/TWZvwWaS4+eTvIh9o
         RLGZ++U5qau0x2uxBGs1alvkI82ROmdE0ykmy96cqwoXH2BCVaQxQWF72KV10PTnlyfU
         ikTrxIotzt35E3v4mxVM0VDGFpjUMYKtpB27mtXa8ETZIrp4kF/svRnE3L2E6O32fWm8
         NhTiY6GZmOWEmlUc2MUHNgCk7xBeF9wfsydYYA3vrCsDCdFCbJpSJ8X0GXk1G6sv/mtp
         IwTw==
X-Forwarded-Encrypted: i=1; AL+hErF9ab/agj+ez7F+2/NveLPqzXGSWclEam+Zl1ET3TaG2WvoUnHvP24+RuYv4Usbkvcejnos/cTua8dE7uPQqhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kOmqB3REMKQrI72YKVMquC5+LBwlU5biVYwLmTts3e9nNEYhL
	xflzer5VZ2jYgAQZHjdhrwISx66ZF9njfmorQWBIqLCFYnE4PaPGBdlrkWaMGptlzdM=
X-Gm-Gg: AYBFou1biWCXY52C/2OErt1QwV9wbvhKtowxackdTDQ1Do2cM0yQOVswCwgx684ix5v
	Eo7YsM9db3qL6eTkohuIq6S969QRMq4bhb82tOqvweNa2p/+jWVsqn3MgFwUx7usNmXfbCtMCc7
	j2mtxpsCPoRLWCQXEBOrKP2nPbpkcpg/LRhoTZAjJvgJweKG27VImxZG/OmDOWwwra8bCBu4svv
	MOqz7RS4r8srekSUes/kFoYwfKTrLU5SUFhdyXk2AEg3ABZvjHr/v80zbvUSE1lY1Up9LqkubUr
	l5L0+i3pcLrOVYhMQAazy4dMAXoIhOdexj2ZfUNumEZY4ajMlmj3CCc0RacYP33IoKpDq615Qvs
	p5wyLqrJxxImz5qqvglvJEbvgW9Z138zpKRdwPdYP+rDonRDvM4FU7ozxpoJZF27rZ82xxGHs79
	ugK8XDLMMebfMvfEdzt3phUDBcJk/lYvnWWFT6tYj6nWyxGs0e+Zl1MqGflpGSPbfH3zE2ksjms
	CbWdy+rm75mDUiDmms+sRsC7bgwJWeVK5HZKknjMLPiC6wemeSMWPzmhCtBLdKadEYwxfW6QUKn
	TzyZeoyJ2TgzTPT9LP26s0MnW9/SpnnaCXOmGwW3CphvyGsFrFZLqC+Mhoxayr10wZTGUB/a/LQ
	AGm18PLcm
X-Received: by 2002:a05:6402:c4d5:10b0:6b1:d344:c62a with SMTP id 4fb4d7f45d1cf-6b756ae6169mr667065a12.30.1794283046684;
        Mon, 09 Nov 2026 19:57:26 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:25 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Vladimir Vdovin <deliran@verdict.gg>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Tushar Vyavahare <tushar.vyavahare@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Chris J Arges <carges@cloudflare.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	llvm@lists.linux.dev,
	kernel-team@cloudflare.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH bpf-next 02/15] net: dpaa, dpaa2: clear the skb core extension flag
Date: Tue, 10 Nov 2026 03:57:00 +0000
Message-ID: <bff7f72c7c28f67497e23a6629b9e4db74332da6.1794281983.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
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

dpaa_run_xdp() and dpaa2_eth_run_xdp() move data_hard_start to the start
of the buffer after the XDP program runs and before XDP_REDIRECT.
xdp_skb_ext() then returns a different address from the one used while
storing the entries. These drivers have not implemented the XDP RX
metadata kfuncs. Hence they now clear the XDP_FLAGS_HAS_SKB_EXT flag
before XDP_REDIRECT, and their redirected frames carry no stored entries.

With the A050385 erratum workaround, dpaa already moves data_hard_start
before the XDP program runs, so the entries remain valid. The flag is
cleared on that path too, to keep the change simple. This can change
when dpaa implements the XDP RX metadata kfuncs.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c   | 2 ++
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index ad2d8256eb8d..4cafc0b84dc9 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -2654,6 +2654,8 @@ static u32 dpaa_run_xdp(struct dpaa_priv *priv, struct qm_fd *fd, void *vaddr,
 		/* Allow redirect to use the full headroom */
 		xdp.data_hard_start = vaddr;
 		xdp.frame_sz = DPAA_BP_RAW_SIZE;
+		/* data_hard_start moves, so the stored entries are lost */
+		xdp_buff_clear_skb_ext_flag(&xdp);
 
 		err = xdp_do_redirect(priv->net_dev, &xdp, xdp_prog);
 		if (err) {
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
index 7227a35dfaf2..fcefdc9daf2b 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -472,6 +472,8 @@ static u32 dpaa2_eth_run_xdp(struct dpaa2_eth_priv *priv,
 		/* Allow redirect use of full headroom */
 		xdp.data_hard_start = vaddr;
 		xdp.frame_sz = DPAA2_ETH_RX_BUF_RAW_SIZE;
+		/* data_hard_start moves, so the stored entries are lost */
+		xdp_buff_clear_skb_ext_flag(&xdp);
 
 		err = xdp_do_redirect(priv->net_dev, &xdp, xdp_prog);
 		if (unlikely(err)) {
-- 
2.56.0

