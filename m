Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612693BFAD0
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 18:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041945; cv=pass; b=ADWHtfJVYBqPsk+P/nRD2YdiyizSV2l8Ko+Vt3j9YohB6C3saKiGnqEXALy9Jn5gQ5AoHBAYfxJQ4Y+GpCGloHnNi4Sk4EsxVyNJIf+SRbUDBYCjNhUjxXdhwZBkipBT8llVsQKjb30i52JX1//ihIoPDR5E0/HxqA7VezWwv3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041945; c=relaxed/simple;
	bh=de5JCYycT9XMebZgSgL4FUbLSZcYTscfvpLUwqXfOZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJNjcI2Fz6Fb7rOPrfi3pvVR7TIgnoD5F4VTiTmZQagn815W0o5//6sLZbt2xcOSrxLzyVZD3RqDszop+B2lmOxDAaTP7CSFX2aStMJ17Q1Ss227G/mcC4/QBcShWVdblo6NnOYFyI6Ky1IY7++vjBhDM8+1FVxABsLLAl5zBlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=DgtZQLYN; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="DgtZQLYN"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8485b358552so2304379b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 11:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786041938; cv=none;
        d=google.com; s=arc-20260327;
        b=REO9PAXDv0Hg8qLZcn/e8PbT+upfOir9kFO7+ENvaxSVD6+mSHC/IMTpfnzodB06Zj
         FldzEhbv5k4SflgoDZyfJMIkHucPiEkozAYQGp4V2r6ROGv2uyytey9in5W6oGaAX5UR
         NlQTptrU9BiJW5l82zdFY4g9t+gnje2MOVPOFbPwfSTxgEPzSfQ+vEqTbt6NOVD3IJU5
         RIxYeonHfy4+LTIFYgVHPCYKEbEKg5Uvk9TxrCDtbCqKSnGMpr7aYdp3A0WorcIHN/3A
         XgDEIt3gNMcG9Z5nRM2r0fSJBLqae7RIMefcR20kLBaJzihaRzy3fyd2+4Fx2rNW4b4J
         1YXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DTiPbsyj0cZyuyHgSf/xXpq0YFIKQg3L7+3p9Oiu6a4=;
        fh=rp0Cpidk3cg6Z0RiF8IcF6p7KM/8bp0qNDaZj+D+Gng=;
        b=U8l02nnbkp+Ju7XZIGYzM3dTEXljqF/5ec1pIhdJA9iWBqkJ8f+L0Ihv7ez9c6Ktp3
         c7mmI8FBwE8nsxZloN89AVl1LWgns26ycBrRu2Pnqq0kjMm0EEmqNGzAiwVoYt4WiMkN
         KhDGQ2ZB1o6G5XqMAI3WQj+M+HFC7vYYFh0YpfC0Mu3Qa24Gzjv7dPLo5iIV12XcfUdK
         qg2MpkxRs1ixB9TRSI5n/id+YK62LiKYzyV+tQwLXRlVTUQmIXpyaUfjPmXk/rcT+Bez
         XvignW4zgQRXSlpwK9V+QkRGTTx7QsVbH0iTlPosz4Jt4BXyW9HO2/N69XzD0ROimLmv
         BW4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1786041938; x=1786646738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTiPbsyj0cZyuyHgSf/xXpq0YFIKQg3L7+3p9Oiu6a4=;
        b=DgtZQLYNM1AHhbErv8VAdewM9WTyglG+DKnfhQhF0F4p+15ZDud9kMtaAjBiTJAIgy
         65GR6VQPqkgNaaaRqiCyZqci4Cj3ja5wHrfTTtZKkinVWcEVSVZLBPeevXKS+8BVDaZd
         qttJ/xujUmljy85fhhsj3vnZ5YeQeXSaar7As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041938; x=1786646738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTiPbsyj0cZyuyHgSf/xXpq0YFIKQg3L7+3p9Oiu6a4=;
        b=jjA7YsWorUM2dFmwlDVpGP6oFMLrTw/3GerSzLduZDd9EiGZFHZvMe3cRN/hz84s4N
         +rMOI1sQC+mYisZK861X4Wr3JH8hew/Y9ZJ4WztrclGB9lottXMD3CKDmmlJ7o6fdKl/
         jL0O0Mxa1OH+QHiwUyNKrao3A/YF8m5rLCQbkYSZhP/kRe1d/ATLEUHl1pteVFa/TDhN
         PvxF3gYmINFh4cUXdjGSyzwfRMD7CvWS3997zr1AMSTKmGaichuHN3GPk+JyXhGwRV/e
         +SFdPW4QBeLMaXySdDWQ6vdQd7Wz2ehhsqTf9PCDjsxLe65KOl+wWKhNrJFXHSWzHkve
         v5fQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKiCjRhU7r/Eo+vXyWQSN5VejthavlckoobLZVhZS3tK055KmqoEENUBysILwYWQ+JmaFqn7DRayh39WXEM14=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqF64/esWOd5EMjpKPvIQ/7CRFsAllyQohUO3KUcu7yvLEdr9D
	GWCbQ2K3/KTgiwwvpz93sEBCLyvQbx9YXGsIT946Qjyaeu3MPUtFHJUQt16Ka3kOOGdVEsHjnd0
	HSRpycZoEbefW+5et2XM35zZTNbc8aEqDp0Qn0tUU
X-Gm-Gg: AR+sD12Lfgf3YvexuzOFe3zl7rcCT5C+x+IktlvK80fAVZAzh7C5PShn3GJmVHt9wsE
	qKK49yrSaOnx1JaVOtzfEvNSA+6kaUS2pXJWQJKPY590o0K6dcuPko1ipSoBDh77+5bP/44KLHv
	RpfP4Gg3W9brq9UivjfzqoaKc/t0BOLhmpvC/JqO/rT8cvOYrS1xAvQ2NbcFEU2kIdLh5ehRCJx
	vgxvp1y+erEUK6jrdVnbIKaAbE3ULd2X51+SY9cT77BLm1go3o4NzuPg3/ZzI7qsLA2ssgKuJQ9
	SnFZAaC8ei2ShAr7VzmA9H60d7APqWFmdtQ0MnUhZ5ohCw==
X-Received: by 2002:a05:6a00:3012:b0:845:40d1:87fa with SMTP id
 d2e1a72fcca58-84f2e017f3dmr20415499b3a.25.1786041937952; Thu, 06 Aug 2026
 11:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806101235.809370-1-hj351016@gmail.com> <20260806101235.809370-2-hj351016@gmail.com>
 <86bdf738-6b23-4a13-870d-8f3403d806f7@mojatatu.com>
In-Reply-To: <86bdf738-6b23-4a13-870d-8f3403d806f7@mojatatu.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 6 Aug 2026 14:45:26 -0400
X-Gm-Features: AUfX_mwrvyto5FLhWXg8_Q3fLpeDorfL0uu_IFlnewNdmaDVZpSxIHylrKINpXQ
Message-ID: <CAM0EoMnMHjq=G0PaHvDs9yJ9Vv0uJP=h69cbV11LNiYG_o-O_Q@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests: tc-testing: add act_ct test for
 malformed header handling
To: Victor Nogueira <victor@mojatatu.com>
Cc: Hyunjung Ko <hj351016@gmail.com>, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Tao Liu <taoliu828@163.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 2:43=E2=80=AFPM Victor Nogueira <victor@mojatatu.com=
> wrote:
>
> On 06/08/2026 07:12, Hyunjung Ko wrote:
> > Add a tdc case covering the leak fixed by the previous patch.
> >
> > The test attaches "action ct" to a clsact ingress chain and injects ten
> > IPv6 frames whose nexthdr says hop-by-hop but which carry nothing after
> > the 40-byte header, so ipv6_find_hdr() fails and
> > tcf_ct_ipv6_is_fragment() returns -EPROTO.
> >
> > Before the fix act_ct returned TC_ACT_CONSUMED for these packets, so
> > tc_run() never reached its TC_ACT_SHOT arm and the clsact drop counter
> > stayed at zero while the skbs leaked. After the fix the packets are
> > dropped properly and the counter reflects them, which is what the test
> > matches on:
> >
> >    before:  Sent 476 bytes 11 pkt (dropped 0, overlimits 0 requeues 0)
> >    after:   Sent 400 bytes 10 pkt (dropped 10, overlimits 0 requeues 0)
> >
> > Assisted-by: Anthropic-Claude-Code:Claude-Opus-5
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
>
> Reviewed-by: Victor Nogueira <victor@mojatatu.com>

Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal
