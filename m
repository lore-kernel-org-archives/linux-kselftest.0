Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734403;
	b=5V3LzeHmjCICS2d3PPdPbnokwzlM4SRUvkUyn0v6h6jpTv8ToSpiE5r44OCk01DPp/T7
	 kFHEGeqgxdyNGB1m3cFdaNrmBo6hCF3riRmPthfDqsovt++nsM/eHjLGNcwepIBF1kO8c
	 JL3IyKi62RmASZ3F2syHpErbQjG2aTrcl+Gfy9PH9WepBG41N22vFXKHyPAe7XKTkIVW0
	 fyfD5SmqRIT8UGifWaC6xtLubfI8y+hFE8RcgSDN95wfYaKMesRAVxlc7FAe9+JNurs05
	 ehfOGv8A6ciglirqL4ByXWoYanb2B9UvbJ9wWpzdHYctWO1db5o68Nglk58NQKOJRhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+/+IILrbOopOCnLme60t9BvjxsRF8IeSCPeaXgfCLpA=;
	b=3qWngK/6FcMjsY8wNE+NjYodbEIZyKh4eDPp5wK9j4d7zsX5JM0rF2C4eGOhqXyxsSbj
	 HkcruNvcK3/itbWSIrxXPSihZbpgI6ewjuLGpTC3AlO4BDmru/haCz9BnflqRrFWtpRHc
	 LjmSIqIGuONUWBpvGzhXyA6KVigGcuJtlx2uVCLRYnrMXFECkg8Gc1Y6fmY56yldUZvjM
	 Prhf4Q9QY/udi+aV4oOuuan4SIz+Ayhv9ftVOBP0CuGkJTCIVOXjlOwfWyas06QoWQ+Oy
	 Eti+idkd2lVktOatu4akWIwhOir66IdXgTNZtajq1u5HIflH5+nQ50sygwlNfzw2eXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLOlwJ3e;
	arc=none smtp.remote-ip=74.125.82.194
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B518606A32D
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 19:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B518606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLOlwJ3e
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-36a2551d7b5so1157793eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 11:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793734402; x=1794339202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+/+IILrbOopOCnLme60t9BvjxsRF8IeSCPeaXgfCLpA=;
        b=RLOlwJ3eELPPVZT985+ArtXPGXIAXSmgMhCqBjHZxWtFb81U4qfxqdHKO7E/nNFVxw
         +dWZuJUojEVNTMMSr5KEdRvo7Cu9/yOSG6ezN/5Mux3zoIBZJRn7HuQhmQO8cjEWuFcn
         7B+dr0mHGcivIrJbc2TbAHxL6fnVSWKdiqpw3dR1Ai+Z00xelMsZB+8oiopozrvxY48s
         NxMmo6tT1bUUPZsnVT3DXrh3kOutM6RWm/fJDNUWJLQl4zWtaRmAEs7cYVFHP1j6QNIw
         2TF9jiU4d9i/1vFgoS5Bbd1I/kcGnNAvVjYWdmt006xBeclMmbCc/J5GiG579Fx7M1wQ
         BcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734402; x=1794339202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/+IILrbOopOCnLme60t9BvjxsRF8IeSCPeaXgfCLpA=;
        b=PHNwJHeB8xsukFBMNo3KPnm4hZOimqiTHIei/NHUHdHtGH44prl9mksUzSUQM01urG
         yMkZkd8FbA1Pn9/W4LSO/7ejW0UQLyX4HHhbpNc8bL5KJpfKBi7yJEcEdvtZyAiwFtJC
         QcLE6bSuxFLGiZRSotjQQ+hjGLcRn87+5XzEhDOfiMjf1A9qRraOVkqLK1RSwXFz4360
         L38rnLxaVfgmaA1ndIbhy3+xxRo71qkaYutzHvaek2FNUK8XtU6ZIenXFRMIxjIKp6Ex
         RwZNT55eiyZ0cn9oc2iOEo1vAIwe4A2JZlkmRxRrV/DMFVYecAy/hkqGa4VfCFDuUbcW
         hK1A==
X-Forwarded-Encrypted: i=1; AKwUvByjw+D0goO9Ds35XAYHZ79W5W3TQdOZwSCc4aRH7FaIcNQzTobmKpn/M9xbt0II5dyRGYUW4YsB10BgyBu4yn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y76GZQsuOTs+fy0oTd9i6qcVN/zxV9aO7CzuEKvZyuK1o/gsY
	qD3bl4kI8/EEya/nI+28TlweDMkF+wyl+St+YgJQjjok/VTx+RdKbUA3
X-Gm-Gg: AYBFou3cIrGLRekvR4sgLzetGWWIK/CPHNefT6ywZnisv52HpxSjGqCG39FJXHvIsqt
	kzQPYyPJ78GZiHNIvRXAKoo0LnnPc3XTSQBa5mI3WDvx3ycApEnX/5Tf7PZ5Ktvd8+PbzTS9IuC
	UlDBZfK0jDmDqtJjGmSg5727leiheNwiX7eNbZizB0nCrwmxdJWSBTNraCuaDLiFzpyxQbnD4cL
	Lws4NLSpEs7UjxkGVaXf6ufJQiu5hCCZVHAZIGBmszlvbnGXpgprnMzP8cGIFiLbxyc5D5dhcRE
	BZfH3Fpbt1CEPmqe9NjdGOH72PwiMByAqIM6g5rflkeSe+sBfZ1m/ZMrz8v8+GKTHsoAGmmQ7Pu
	I5dbXpEDyg2OCPLRonXwLd/sLDfxzzHGqGwgw6ksqXas8GNU2nPQgSclQ+umKApUVxv13o0S5fw
	pC75us8flYoOA/JpLZrnf5sf3PEExfzOZmsNy/kONNH4st47EM8YYoNhdc8AUOKDDKiR6yk7MpS
	8ciJ52pnM6cn9Qz/Oq5y/+fLt3UH22yNA8UQG1M5pQMY+zorfmBZO3pY0scOsekn1kJWmY/0nra
	x0AsT/bFZRJgLrw0dE6nUA==
X-Received: by 2002:a05:7300:f293:b0:361:a195:c46e with SMTP id 5a478bee46e88-36a2fd4c964mr24744916eec.1.1793734402208;
        Tue, 03 Nov 2026 11:33:22 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6f::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm238153eec.9.2026.11.03.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:33:21 -0800 (PST)
Date: Tue, 3 Nov 2026 11:32:10 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com, 
	kernel-team@meta.com
Subject: Re: [PATCH net-next v4 2/7] net: cap sockopt_expand_out() at
 MAX_RW_COUNT
Message-ID: <auo2s-G1DHiLK-hH@devvm16445.scu0.facebook.com>
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>
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
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>

On 11/03, Breno Leitao wrote:
> sockopt_expand_out() grows the output iterator up to INT_MAX, but the
> MCAST_MSFILTER getters converted by the next two patches rewind it with
> iov_iter_revert() once they know the real reply size. iov_iter_revert()
> refuses to unroll past MAX_RW_COUNT:
> 
> 	if (WARN_ON(unroll > MAX_RW_COUNT))
> 		return;
> 
> MAX_RW_COUNT is INT_MAX rounded down to a page boundary, so a caller
> that expands into the (MAX_RW_COUNT, INT_MAX] range and then reverts
> hits that WARN_ON, and the iterator is left where it was instead of
> rewound. So does a caller whose optlen already covers such a size.
> 
> Cap the size at MAX_RW_COUNT instead, before the early return for an
> optlen that already covers it, so a size that could never be reverted
> later is rejected up front.
> 
> Sashiko found this while reviewing the conversions.
> 
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
