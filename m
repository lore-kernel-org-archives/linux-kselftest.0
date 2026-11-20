Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134721;
	b=EOow+1NzkLw3uk1/1aQKK2sw1t+8LfFzDQNjBBoU6uMOizEVey/BkvC9LSYcZnOJvmoV
	 BNLAwqu4H/JECFSRzgYqbeicvOyEnnNDghWqtwJRBuQQBUOe/SKMgQTbaXUsmMfldiC3H
	 3qm/beINTm+MTuLpaekCYnBQgF2qX949k/kPP3AML1dfkdi1HsSSodX8tL4ASc6QN11/v
	 IASmitRClJ1KilMU12wqqWtvVcPzc1HoyTvhnV2SeXhAlIkHP78HJ1qvspv43fKWlL+Zm
	 b/YoM3m4teOk2B4pUSmXoV/eVqGf7lUIMhUQutEshneCdFpX5vgatq2e3a1LelqCIjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
	b=osa9lHP4aPFvMbmHq9xLGEoSnM0vdEQhUKOOGygt3o56sJ+TOia3SKyWlpX+c9gcZ5U6
	 9yfBaZccyZxKds1Ce58AQoz5eB0dHBDbZmacH0ApCxXgFgdkhM67bX9XO2tVHCN2arKJS
	 Rd++mFAHOJN8lQRSvD3tgzjwhbJkhE5yUU74YrNAuAMsuQV459R0xRsLDzM5zi/5WMfO3
	 HFJhlEapTnU/kQMXaNIY32705ahTr1xTyOIZF2J2vvzI18sf877wpdVR2ZC4nxq5GNwnh
	 WlHt0q4PUCtQREh4PMxk24WV90pzrNgybYPRWvrdhVTjv9rhHoqVFrAVxpBo5PSL+FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glVrkyNI;
	arc=none smtp.remote-ip=74.125.82.196
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0B3606A332
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 00:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0B3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glVrkyNI
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-38564b4b017so361464eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 16:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134720; x=1795739520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
        b=glVrkyNIyYlm8wVTiuLIn+1R/pE2V9VJN825nkjbnVE7DzI/tklr0XR6PDNFu1OUjc
         A6P3ZfTwHJQxiHAjmoK4SpQIdS8Ir/katd03VOBvE+4swUu2oA+8IkTyyok1Pjj9/pPY
         jRHRWeNYDZ3yM5EUWHx+RVw95l+YNdToEWVWMBlDmJCQ5nDUi+lZAkU6M+KCBd+2W1HW
         fToXfkJkp8+luUW1MITx+x0oH3VnjO0S4X/xzsL89lshkI/VzuYPu9YudzfVuvXLiO7a
         PI2e6DkQIuvL5sJxpbyOQ9dBGmqKQnp3LSWMA4iJOQsw2EYyE1DA6dSJBL+RP9i6HuS0
         6Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134720; x=1795739520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
        b=LiV5TBEUPZDwsWlJqyzzKIMH6ADipQ/W/+MOY53P6Bic4EQyHFSK5k57RM270scCAi
         fmu/6JT7vp1tU9MBeq4Iz4LwntoNQmJpXCS9HTGaTzKLK857PEHMym4KuxCcD29S/hTl
         A5EsDoDcybyBJ5olTWWUISUMcOvFzzLOWYNg3mUerQMFmuFtBaGsiFQIs1ZRG7n2iLTJ
         z9Vf5HRo/A1s3YdGCwQ9mqxYR+SmOYrtL1S71+6E91jWsDIKnuH8F2txd4zy88yrIyKd
         Joy2FXtkkvQhIAzpGItjGFnZ/cHP0PjzvR4hFziK6drLnN50kdb9G6F3RGEcGT+rowd9
         nY7w==
X-Forwarded-Encrypted: i=1; AL+hErH04xI49sPwMPM4fHrEFLbh1f6Ho5ewUfo+kmtXj8D6LQtQ17ol4V5GKfU+YjXaoOwuU+bGHQ3CcvwkOb2GmA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gjh9wRVq+duXfq0xTDR5HfVfGJEtDIx+cqKvL6H+B63B6OSw3
	AfaTWVX6rl7AxjbpXjE0ZuFlVV2rsMC+kADwDISSFY7xOqGNvBARBcnN
X-Gm-Gg: AYBFou2MOvwotEwVm69d8lGIWsrwIklSp5RNIFMnMwSLphVcPUvYCa1JszbYssJ/r/w
	H27VIC5Jsii8YT2kwVW41bK/ZB+Aw18hYSAJsQrs+lDJobq4bfib+g2IOuhx8XvB7ihZekVyTSs
	xPUYu+bwwUM52r9xqWR4yEbam0xw66xrDYmmuaDCA5dInKgRKBfA7X5YMZ9KpO1w7PZHzK7yUEg
	FQFgasE6DLhYMMdi5oTfd87xi6KLjv1Ak3t/ouO2ZP9iHO5U2N3Xd09CvzHVH31hLVA4lIcsFZb
	ZX02y5ptfmpq0AY2V+UCL9GT28BEMbstvm59anGQch7UZyYFsiTgclUvqg2aWORZhfAkKmn9pd5
	3Gj0hH7tgUv4mrAyMskSSIfKAgAfFXbOl1Thc3oDLi+YRHHlZXOn+Dv2PXo+ObMBNFwPJF2NRHr
	i7zMiFC2dCysCjcucJQUQ3znUDBY74KIq73EWd5p+LJXCN4pbGVexPBFUgf0N7oJFDY5A0vPjCd
	JXShNekQqoHmAIxnsb5BRqS9Q9tzQF6TVYbXvDhIUSy9eMeUeYtb+8GqQFaIOYNH2IK9gF9bhZw
	djwcUQcebRu33q6SENs+b/o=
X-Received: by 2002:a05:7022:7f19:b0:19f:cc98:f603 with SMTP id a92af1059eb24-1b5520d7d86mr2448430c88.1.1795134719982;
        Thu, 19 Nov 2026 16:31:59 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm2242124c88.8.2026.11.19.16.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:31:59 -0800 (PST)
Date: Thu, 19 Nov 2026 16:22:53 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Duyck <alexanderduyck@fb.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, kernel-team@meta.com, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH net-next 1/7] bpf: Keep XDP helpers within readable data
Message-ID: <av-SmgwQhAKI5u5P@devvm16445.scu0.facebook.com>
References: <20261117164700.2157816-1-bjorn@kernel.org>
 <20261117164700.2157816-2-bjorn@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117164700.2157816-2-bjorn@kernel.org>

On 11/17, Björn Töpel wrote:
> Devmem and io_uring zero-copy RX put payload in fragments that the
> kernel cannot read. XDP helpers must not treat these fragments as
> normal pages.
> 
> Reject operations that read or write these fragments. Access to the

[..]

> linear part still works. Tail trimming does not read the payload;
> clear the unreadable flag after it removes every fragment.

I guess this is technically true, but why allow it at all? Easier/safer
to reject tail trimming as well?
