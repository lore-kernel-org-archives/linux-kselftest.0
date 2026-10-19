Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438836;
	b=QYU3xQO8gJc6t5/5VfWS6xTy3gI4qmKLzn/2EWE7mJH3O7uQCfCX/HxFYXxYaoA2VYu3
	 Nx50P3dsDWg0N6bvGLL28PIvv8z7wWzjjowQqnLB/n/xc+syaWfIRbr/9n2dFV4HdY2P7
	 4KFQo8TzGj/CfVtTKI1Mg9CNLXV0FZrRyfy+PQqyq81pVyCjdzjCyyq4HxnyJ9xzZKlzn
	 R71cpqsbVLhIPeBZM6mrhkak68RCuNQF6rhlvr/IlguOGyX0unYlWLff+GOK26czeV1Dp
	 126KQBuhpHv+2LFZRh0VBx3U8C31DHA92aE3ol7Heg0cP+yHOnZYAR2C7LiY8BtxMtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=jCMFezbT/OjEFJBH7XUEU5R0jVHmGVvv13z7WJO3X3E=;
	b=B9+UTTl3rMH38nZBQ3e9JE23GovfaJJtjGq+Oa+bYh/KgP8kV5BsZLaHGtMJWOwIM3JL
	 VPXVheEsbazgneovQgnYZ/Slk6mw90j106zNhbskwPtihMUr2HYX8xmbwTCRH7v4clTrn
	 wH/wSN1FbqIeQKTMGgSxADEJ39hS/a0+NtO9gNhobquzlUeBIFoZSLRVByRGiGPfF6QpB
	 17IauCCrBV+rWd5+2puuqZQj1J9A8cb588XztxyzjtlLKJA1xAfNEml9Z7QqvKkDU0e9Y
	 B3c8PokJZXrDC7ObOQp1xL6xarbSrwNLZIkMCHqwHITT1hvOPm1PpVpqrcqvf8mx/Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AwKLsCH0;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27705606A32D
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 19:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27705606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AwKLsCH0
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so1174296a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792438835; x=1793043635; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCMFezbT/OjEFJBH7XUEU5R0jVHmGVvv13z7WJO3X3E=;
        b=AwKLsCH0eCBDjV+uPmQSwL4hPhllyt3bz/fVOAvm5/kXUvXjTfvH5ZqqwpMjcpWh7X
         JNTxMbWNTnOOwfXbMPriw8L2OXABTAKygX/SZvHJZ1HUu28hcBLfI3idDkgcBZthXgRY
         0eR+LXFb7SEPUh1Yf59T1npD6SMgsMin2amGbSD84ao89WhG+Ue/0EqTaQfQaqACnz/+
         W8o82Ko0xYys8Vw7SK4rYh768XCtXLQJMz6T5e+Ji3fgRQjW6XAAltPMFl7/V0vapMPw
         M/XEL58w+kM5QEI3wTtJJHMYu1JG/ZgGFaiHo2zb1UPw3+bQKTRzCt16qNpTGAPufCbR
         OLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792438835; x=1793043635;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCMFezbT/OjEFJBH7XUEU5R0jVHmGVvv13z7WJO3X3E=;
        b=Shx2HnJFlo2VmsR88HCMwu6JsHgaGrOpf26rmBn1AaBinUNfFX1QTm57zNAkSfqODi
         shSQ++kLptu2tWDCODI3+Ogd0OxNFg/C8/XFMRr6/fWlHxfKFodM5mIQdDZhnsiIGou7
         olblQ6ag4telKdSIO3wGiCpP0ymQ15gzARTvPJYntnN0wMl3c9N2i52v8Ba1t9Y1wX12
         2bLOAb9q6RfM5tocG3NW5gbsKqkXqOYDpKqw/r37xMHUJzZn6R4fFuIfKOdRH9nqsHz2
         NRyokzAKflDGpCRkKDcDdRzkZZsfcV3VPN5HxmDhBJ7wZ1YKh5CP0KYUhC+XEaP6lq0i
         Gc6Q==
X-Forwarded-Encrypted: i=1; AKwUvByKNZI3Cq9Ecr6lRgKScOqyL+mCWqak9GsXkPbO4RM33RczgQigJlXBtgh7HH1aUP+KXWamU2BXyJypwzt1lP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwITTZwjkqj1KM3fmaHsA7Af/Zw8K797GztF3XxVxRyd/y3bTi
	HKrXDhfdXa+lN/gElCxqAKlY4hBgdOZ+s/cOyTiXolUuMG9xU03ie9G1ApyOMw==
X-Gm-Gg: AYBFou2EeU0uH+4L/8+t/HZzt4zHaZqINo6LO1A7leznYPxh3mDmiQqwBp7ISedujTF
	PxXtsn2lzdVDYRGUD9V2rivH3rpuWLfX2kEbhz+mj7IFZiyOLoPb5d1dG4eRRlarR5lHnyV2qJT
	oWZcL4jpRqgP6XGUZZtJBt04BD7VBx6I7UleZwlo5Qp8IggVWpbLqlsZlyxwTIzVhNLMIhNVJ1B
	y2QIDRdOK7vXME4n2lBI80I0uaeSjg0du2pY3od2nAQV0Ay/+802FpwkiUHTnYKimq6W/ysDOdD
	AQ/lm7DAjqzv4VLOza3hByyL7ykAMcG6HkxSRS6NpJDKnqzK9gUk8Dy1sv2UgIRRetbFz9Mns/1
	FhNVfmVGP5CyAwi7tI217cgsVqplQ8jBrlcpk90K0z5TeyPkQEGYd1b1eLdu8KAS/2sLfGq2gKu
	qXCnp+wYftsBdujV8aGsIF3m+yn5/PGb/P6xVlGFjZAouTwaTu5itUVvVPt4kMSF1/dKPe/L/hQ
	cVTaPJdr3z3XYiAB9qXa+u3+ramV7o1t/LXUGoeEfNTSuKdu51h9aiNmPIhMeIHfnE9VUPFTsom
	o5iGYVrT+AFhlA==
X-Received: by 2002:a17:90b:4a03:b0:3ac:6e91:3f14 with SMTP id 98e67ed59e1d1-3acef134d44mr8271080a91.22.1792438835344;
        Mon, 19 Oct 2026 12:40:35 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9942956sm7478188a91.1.2026.10.19.12.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:40:34 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 19:40:33 +0000
Message-Id: <DM92JCFA4X4U.30MTDH0KCPTJ@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Lorenz Bauer" <lmb@cloudflare.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>, "Jakub
 Sitnicki" <jakub@cloudflare.com>
Subject: Re: [PATCH bpf-next 2/3] bpf, sockmap: Restrict iter-context
 sockmap updates to iter/sockmap
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <a9ba4549-4bae-4516-85ef-ee38f13551cd@rbox.co>
References: <20261016-sockmap-update-limit-iter-v1-0-23fa946db59e@rbox.co> <20261016-sockmap-update-limit-iter-v1-2-23fa946db59e@rbox.co> <DM6O08VBRY20.1PFUYACCZ38JL@gmail.com> <a9ba4549-4bae-4516-85ef-ee38f13551cd@rbox.co>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Oct 19, 2026 at 08:20 AM Michal Luczaj <mhal@rbox.co> wrote:
> On 10/17/26 01:52, Alexei Starovoitov wrote:
>> unix_state_lock() in bpf_iter_unix_seq_show() was added only for
>> unix_stream_bpf_update_proto() called from the iter prog.
>> iter/unix cannot get there anymore.
>> can we drop it ? can be a follow up...
>
> So we don't care about having a stable socket state while iterating? Which
> is the case for iter/sockmap, but is unlike iter/{tcp,udp}.

Not sure. Is there a value?

> I'm not sure I see the (stream sock) issue above. psock->sk_pair holds the
> peer, so peer pointer remains valid during proto update. iter/sockmap is
> safe, because sk is held by RCU. And for iter/unix we currently take
> unix_state_lock().

got it. you're right.

>> Should we restrict it to ctx->sk somehow?
>
> I recall a discussion about having BPF helpers accept only trusted
> pointers:
> https://lore.kernel.org/bpf/CAADnVQK_93g_KkNFYXSr8ZvA1fYh4hoFRJCJFPS-zs4ox0HhAA@mail.gmail.com/
> Restricting only iter/unix seems better?

we just discussed at bpf sync meeting that it's time to
finally remove plain PTR_TO_BTF_ID.
Otherwise we keep hitting this bug everywhere.

in the meantime can we do it for this one arg ?
Mark ctx->sk as PTR_TRUSTED in sock_map_iter_reg
like iter/tcp and iter/udp do ?
