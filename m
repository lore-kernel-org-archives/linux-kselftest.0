Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795098265;
	b=zW3TPXg9xMzd0K+4D1beik188aQrGqC+1D1kWZX36hoRWvjx6CBgZ3fRs2FJC/FkHzsL
	 bW/T5M70PogOPA3MPNsjeDqtKawc9dAmxEWc18ltLwMRMdZJvS6EFHV5Tp4Iw+2Su+WH7
	 lQaiFgt/SpKxmgMZUPs0VNuDqzrmcnz2fvG6zERYsbg/XT108UW4PTERU7tVjqWg7UdZB
	 loNCeEUfeiJg9NwmcH5Kq86baw0ucYNEcmr5Inv1tK7md5DDxsMx7UNKRW8WLZJb45Gr6
	 ns3YdeZc19wzb2ItdPzUa9wSzYOdIkNc+jzr+0XhVzpoIP5U7xfAfV0A1m4gS42x+Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=o5n51x59sxtfs0bspBXfBjL3tD09TlDgiTXE1CgF8cY=;
	b=AQftuMPR5FysbIp8+NZR5EC85qH4YgyPkh6cd66y2Wkij+XGNVEctho9WxndCQjTF+7O
	 jf/yzTd/7qzk6+aDlNV5GLY+y4SDSsbGCJ/FOPOuqSc7BopuCBX0BWARIcv6eglzvSgoC
	 DSVzfeVD15YhVFawSkE+a3OHzsF3mHIKosVan6rfK2R5s32wTWAiPGxW3OOiDS8MtC/Ai
	 zTACnbUyKc+ah1ub1x59bpYamdN20j+Ke3xnxonAAUoVVBWDtEMPDDu8Aa4fm61RemcQn
	 W+yQRcH3841RMxlmikBGRECGy8IZv/Zy+33UkksijG3L+Oj34bO1Mi8UsGtWBr1isSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Jky2d6gY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDB7606A32C
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 14:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BDB7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Jky2d6gY
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6ddef424972so1914323eaf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 06:24:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795098264; cv=none;
        d=google.com; s=arc-20260327;
        b=ElPPoLK9QDWY9OuMuhGbMhuHMAZZL1f8ph9uJLmIZjKB+6u2+RtU3p0+x3Z4I8eeZF
         B4B7rN1dYuM7iJD61Ym9Fnr4vXism//Vb0XqRAOSDWVJeEaWM7XLl8wWjh07+/MSDt0W
         fljEtOd+s0Cwr3TbN023jGOJ2BfL1+1b0KHycLjAensENTcEJwqCexq9WxA2DwmuMH+S
         PenuWIk0ZIuDTVOm7wHCsT0d8v5NLO88PORW4N6F5kOr3WOd9peJSTkVGNmGHDiABtDP
         gP7S/Hg0lfkSMlBFaqWB9H7p9iDI9NXReQNCvX1fX2/5x9Rbjw8F0zaw2S9LF8CH+a3N
         +zGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o5n51x59sxtfs0bspBXfBjL3tD09TlDgiTXE1CgF8cY=;
        fh=HJ2ePke1co8UlGtTekeKiZ+9Gu9ecAktbcOoajB9vqg=;
        b=j9aP1eHNrxyJDtVkSTmM+/1B4bwyvlCwqc8v2NF2kjABUs+vCZUBFOIbvILbzn4aBy
         vhPSmk6KcfzrmI1VVF0CnmLHd8wh0jrV3+UGdoEr0RnC4x7UZPjsD3MFOEBK/vK8Xplv
         mMi4OIz5ZiyDS473tZYJK6dYqVzN/v4mnRlU+7Wh8/NUdtjGjuzk6chYoLyL+ndmXwIW
         zH09JUpCRktXfnydQkgCVVCqJFgtgp5xzAyjiSAw+WczcoJzIWOFiXotpxXmW7j8Mvxh
         uQFBw+Js7fV0SWItKCPotZQaIHJi7qXanBB4ZnYeQhRFn1/+VIicLLM2pzEExUNRR788
         ahZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795098264; x=1795703064; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5n51x59sxtfs0bspBXfBjL3tD09TlDgiTXE1CgF8cY=;
        b=Jky2d6gYO2im7zgXjsRHuw8jDBLvJEUKKauPO49apSmZAHtopHWUGW9waTKeDU6oKi
         OG4FE0LJagiop3Ipbm8Y/2r8NDw0FCzRIeDflqWcnhIfSDPNNGxg8CNqtWMA5cpHFUjm
         wh1tshorNt5nlQE1S5K/GOFnCXDu4SvTkIVT8x0YWtEpMzdrJy517oWZCwAVxfd37wXb
         HLe9cPgjg5pLGDXWbiFckzf4pRFHqsBmzAhvZLitWyefhCShnu7ojrM9P8qaZG89nV/1
         4HEEKYxlco/Ghvuv3qIXR4sM8vTlwA1gzjO8a+MX5Miw2zqc0x66C7gYW8AX5CSU1QpW
         E7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098264; x=1795703064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o5n51x59sxtfs0bspBXfBjL3tD09TlDgiTXE1CgF8cY=;
        b=qSUjkEXV6BFRSTtra97ireizGfKqeHkqDoqUqCwqtud15Wi4FLPIBf45lIBeYPEWwF
         il4oSiptScUaKuBF9LmwMsUyEAEX9Ilh5QZBuawbAoZpYh/Q73HNPPRoSeINXX+4nqSl
         tBSQ3ZnpL4pURptD+Lch6B06vqJtu0JD3fINjBMAFM6Xnt+SSp+6FZBRDP1kbxEuNTMW
         6S7xTBhYzoxIZeJPtozUla1ViuRLAQ3/YVuIrAPF0aWWbG/S2m4VwuUFEk4tzD9qxTBB
         AOqy4lzGv13nDVuqTyzapXO+YMW01jvqYajNccG+E4sZswt/05LVEjPFxlFSlLbOceTs
         R4kw==
X-Forwarded-Encrypted: i=1; AL+hErEp8mfMauM+hJolcNqQjzLVFNb7raMybFqMn6b5cCgh42Dxx6a98r4mIjAUlKodR2yiFyhDbXg9PAW21MOGdp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9651k/80iCR4u8jb7+iEzu6V3TsoDn85Vu92C9D7zEGfiNhh9
	apIXAnklgqSwY/+Heol6oPFF7UZh89tl5xcAbTsAkR95nbbwQ+K8yeT/7D4XnRrTtDj34QWydxu
	dwSckEsZrzp5YdjLOcrSrK9KE53t/rtozGVsbspK3+A==
X-Gm-Gg: AYBFou2Gy3AeXsXxHJciD/OGnOTikKajZJHHW+mBJX3dCBlOR+keelzEXXxXwhNCavh
	2cclxy0yFR/SWAl4BWMnqVW4B9SyM+8X1ix1aXaSllC6wS/6VaswGzqhvH45yOpLYFWwE+gzeRd
	YUwTx2koyLi+EOTRomc6CiYgEaf+uOzStHmEDI4upQlipYndT2ypfegEbkZUnHq7+KpcAJcpQAn
	Avm6hC41R3oNAKv9NTN7twzDWiV0PIW+sWRiaL7AjGPK2PUKh7hHD1Vm9i9vUU+U2/ckvOE90/l
	hR9yj2IE5Vc7nIbFtZFeWSJwr8AWoeMajL7yk4O8DvnJbF08HfyW8aE8KxRyS+FIvXdy3A/kt4H
	AQbkgsm4m4Z1EyCK9VWJgEMpV8Kmx2sK7rps9PE+SsRNRdrLiZtidpL/sfsU/CXYYlBQAxrafzy
	MziFMV/9x88w==
X-Received: by 2002:a05:6820:1355:b0:71b:193f:2eb1 with SMTP id
 006d021491bc7-71b193f3492mr4490832eaf.1.1795098263194; Thu, 19 Nov 2026
 06:24:23 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119133032.2015656-4-sst@poczta.fm> <9a5a1487a4676381f4c3d98cb5a22f50e2f54d9d4ec7947891c889b64ac12693@mail.kernel.org>
In-Reply-To: <9a5a1487a4676381f4c3d98cb5a22f50e2f54d9d4ec7947891c889b64ac12693@mail.kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Thu, 19 Nov 2026 14:24:12 +0000
X-Gm-Features: Aa3M54pU7ZbLxGTK6OUaJJJ5wSY671yMAwh7XMSPppG-d1bHhduINP_cjWCI05s
Message-ID: <CAG4wq-favnH37jS2=a-aJwBgQOuW=KTsM-vJWp73PNDfFq4=ZA@mail.gmail.com>
Subject: Re: [PATCH v7 bpf 3/5] veth: use the frame mem type when running XDP
 on an xdp_frame
To: bot+bpf-ci@kernel.org
Cc: sst@poczta.fm, ast@kernel.org, daniel@iogearbox.net, davem@davemloft.net, 
	kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, maciej.fijalkowski@intel.com, 
	tavip@google.com, toke@redhat.com, aleksander.lobakin@intel.com, 
	ilias.apalodimas@linaro.org, lorenzo@kernel.org, magnus.karlsson@intel.com, 
	ihor.solodrai@linux.dev, edumazet@kernel.org, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, memxor@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org, 
	martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 13:54:58 +0000, bot+bpf-ci@kernel.org wrote:
> Is this Fixes: tag pointing at the right commit?
>
> 718a18a0c8a6 only reworks the skb path (veth_xdp_rcv_skb() and
> veth_convert_skb_to_xdp_buff()), and does not touch veth_xdp_rcv_one(),
> which is the only function this patch changes.

I think the AI is wrong here. Before 718a18a0c8a6, veth copied a
non-linear skb into one linear page, so no frame with frags could reach
veth_xdp_rcv_one(). Either way, 718a18a0c8a6 and bf25146a5595 are both
in v5.18-rc1, so the choice makes no difference for stable.

Cheers,
Tianyi
