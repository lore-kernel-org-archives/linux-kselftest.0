Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442985;
	b=V8ptOGEBCc/OgUaicMH/AyzIngrEt4Nh1GkDUjgTB5+GRmmBckG6gGWJ0y6w4yls1Ip8
	 5PBz0JWpUT0HidyGxuLGMGJb4TwWMElm3kw6cRS8MDdeoJPCFl7X+ugFJTOLOk8SeNYOj
	 qEWPymBBjG+LIco10VY/cyicd/GLDPcoHaMf9VvERTAMHOW69OVYTV6OmHUBRaTWakBbi
	 PDyBch/2SBlSPIuJErlvkMB2k9Hq+RGXMRWjPs0+9jBObfwginqJSAEJr06vE8hwgAH0Q
	 s2tXFQCojrw49ZmgVHep12xfhdmio11RLG8yFloJZb5j8rMRCyo269uxsf3n8wuI1mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0bvDk5tyLJ5TwCATr3/cvszAQOWSZaHFXbKMbS8WnfE=;
	b=WcD6IKKt7zdQao9umkt3xHu8xTbJVpblPztIcotWTXAxZ1Qu0UIyTeuYku1804BXMZu9
	 sUsxmNflbJVK0ZbEJtJhRC7a/1cd1MA4AFPW5cZ2XrsX+l+sL1icHtw/z5RH0l30WkArc
	 IgTDTfzEcsPEVJYplh+6nXuZ3mkZEn1RGyZygbwKjjwyws837JHzZ7wPoQAZwxCYAdktF
	 iniQIbDOrLgctTmUDivE2O39c76begVXXcbeq+xxmUqKPOTBf/XBNyqhwfxjIGu6kBL3X
	 RnaoXAc6/uYc38b3002DDWW+k3IjYfcMo7fVU0bQP9leCSuPC+AEuXYhlc9urj/II1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=T2k610q9;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A928F606A332
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 14:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A928F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=T2k610q9
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so3954446a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 06:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795442983; x=1796047783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0bvDk5tyLJ5TwCATr3/cvszAQOWSZaHFXbKMbS8WnfE=;
        b=T2k610q9dq6ABxK10/kvUfovzJT448peNpB8dZUFJ7a9M95oiFWIkbejfgpR0jq3ps
         JmdtTO2qbdhrvAtfbsYXLVSDSj3iPLnoYA3AX20Nc6N5ilB23Ve496FNeGcV7q0NLeEH
         zwQuebg7Y6bLkIXAEUPHH+uSwfuw6ufCyUCvbhBU9NiUlyP57IAHmhxTFNak3+iNQoEP
         lOkgQOTDkr075zM9+0efVaR+ZKdXXN6K2z0jb78i2cdgl3LzuXCqes7vTBoEVLPtsHd8
         ZLjf3wMWaNh5pzx2RJwOE7G6lW3A4YPzGRKoRnnaO9HNICIVLd+xvK5jcsu4sWPpH5S5
         uetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442983; x=1796047783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bvDk5tyLJ5TwCATr3/cvszAQOWSZaHFXbKMbS8WnfE=;
        b=RwoGreVrs6umRVqZLnf0vGpAgaPHaeb4a+hApixvN9zztbdfebDIPkfZn52pUqV5ne
         w5+DVJidJ4BjjUhKdb660WFX5Eo8B58Uz1gM9d56AO9Cv2LMwvxpDMY7zORewsaS4jGS
         3VsCF5o+2Awhj0/dQIFe1Jm7S1vT2dSxAC7euIEzaSQUjLaPI5U9l1/qraN9N/2vfDgA
         yqKlV1+aPinyFZSMzp99KgrEkLyH/NRwpwLI5rxVxJDnB2gef13OhFmrTsdrRErWuTX0
         QppyU8WKzAzUmF9OHjDLo2zRfCDKZP2NGpQb5gxcyuCimPXjPnDUSz3fcaa9GTPV8+BV
         BBcw==
X-Forwarded-Encrypted: i=1; AL+hErFRGACF9Tt5eTqNZ/sLobvKYkr0RazYAuB3GXcFSTbkwBlfEe+jP0KHz36jOIN3c87QLjLB48o2m1FT2nPpezM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/TvmoRga0jrvxCw0WiwSx8oAYYvuldsqa6BoERl/P1mPhSEUv
	mjT9Oeyny85j7Qq/n1dI6YjTLTmlJVAzuU/GvCP75n00fbVfCbMJ7YzGaZ6tirZ7Duk=
X-Gm-Gg: AZFdTZcjreYADyX95U1o4ZkV6rMnXTkNO/Yq3vUMaVpBzYveWLAk6WWbRClcA4HG+49
	n9lxW2Zr/kTiXF21LL+xipO/uiM326Ae3iAV2Xba4Vzd2Xk1EOPmWILwd8k3LWplhZgpKTiJ00i
	xqThmN2nVKn/FPBF6Hh9n1az8So9+I+p9twwALkvhrYaAW7ExXFPdCkHuhD3LZU1SwJDadeWXbK
	Nsr7M3EhON8gp6DhpJTq7SLJ4zEndOH9lx0gUYQLBdNGv7mb50raF+DMY4dSLs7YoFwdBmqKif1
	VRP9H0AYOO//vdtwxA1sMWHrK6oeJOB6OphfJDcKOU+kp0zJbwVdTpugxICgviqFF3U4i/o9TtW
	rIbJw+PVWlOYEyn/SC229ZFu7bNFbi+1bw0TJYgF1xJenrWt1nV9R1d8gsvJtcRfUDsp2HDtMQH
	UTaXJ2uxRT1Oi4dEMJkRz6tpT41oxR+Yr5Y5BBT3Dy44YLgmSjUgEWfGgNQZdhBrAih2t+n9Em6
	aCrOeDAZM1rNnTxIgNyKFAgcxXvKngteU53PVXXPW1xIrsyEM253LaUxeO6n/gxRNPjeCHZnDD9
	LyipXQeo4PmHW+lA08uolhDB8fkhcztnBJahsHzN6zDDKR4=
X-Received: by 2002:a05:6402:3223:b0:6b6:e74d:407e with SMTP id 4fb4d7f45d1cf-6ba37eb9c1emr9126325a12.36.1795442983003;
        Mon, 23 Nov 2026 06:09:43 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36d730d1sm5419955a12.0.2026.11.23.06.09.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:09:42 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: hangbin.liu@linux.dev,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net-next v5 1/3] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Mon, 23 Nov 2026 14:09:29 +0000
Message-ID: <20261123140928.13688-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121182217.4609-2-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com> <20261121182217.4609-2-emmaonana18@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Omokefe,

On Sat, 21 Nov 2026 19:22:15 +0100 Omokefe Emmanuel Onanaroghene wrote:
> -ip netns exec $NS_DST ethtool -L veth$DST tx $((CPUS + 1)) 2>/dev/null
> +MAX_TX=`ip netns exec $NS_DST ethtool -l veth$DST |\
> +	grep TX: | head -n 1 | awk '{print $2}'`
> +ip netns exec $NS_DST ethtool -L veth$DST tx $((MAX_TX + 1)) 2>/dev/null
>  chk_channels "setting invalid channels nr" $DST $CUR_RX $CUR_TX

I ran veth.sh from net-next on an arm64 VM with 2 CPUs, under
"taskset -c 0". Without this patch, this check reports
"fail rx:1:1 tx:1:2". With it, the check passes.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
