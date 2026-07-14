Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8E0352C51
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 03:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999963; cv=none; b=NHRUKrETUjjBmARhV1mvOKvXxRzovGHeS4MwcDeqjSvRuyhZpc2W2y9pWTPh9/BpkcTqTj0TGG+L/qQ9O/pkaubEZIKCvUXE0sGh6NDIGWPMYcR1tlHqJzRJ1ixpY+njpaQEkwT7j3LO/V83shnP3Kv4kT54SMargujnoB5BcKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999963; c=relaxed/simple;
	bh=5l6nLVdO88+2acJsOr1UCToSieAPDX3Bwyvphb8xIls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqApxaAymIvH4sk1a+aCqBk/5CDHe/6K044WUTO7x0W2cQelriVuj+MgX9PT0KSY/0pHRJANC744hCCt1c+kYIxmtCLGTNj4yUflUz4uoAjWdPCYAeNSDke1prpelq06NQeE8Ey1ZDHAve0xLBGs6CigEUQUALp3Z1gWPhGLDns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ArqdH1rX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ArqdH1rX"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69a50189d25so6703982a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 20:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783999959; x=1784604759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bdiM3wGZvU9W32ITVwJWXfEY5ZH1jUwmribSUCxIuno=;
        b=ArqdH1rXOesSkDeZcyrn/gwmYeGCPfhD9ycpZxDFlq1zBr3byohbWaORK5xuqH9P+i
         Kp7BWm7ILY2LeTUxrHADGfcElxoWDlnPpBhtJ9OwCTU5hkGqqiTWQm0Ywi8VvSYSQhx4
         +Cg5J5j7gww51+d9kU01an3h1a3e4Rabush3KBhThPMvWOTRQiNcoknZwBpdgg/mzsTi
         QmsDm3aZlF/Affo/XDS+kP0YFn2VN/nccOxyxycivjBO/FYoSzCL+K9til6FtgxEq2Qd
         WLyI7qrwMz4UBX9JArXVYtfRCWB0a9sca3WoLrGIZ9Q8L8TRKbN899ZQjDFxMkn3yxz7
         Tg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783999959; x=1784604759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bdiM3wGZvU9W32ITVwJWXfEY5ZH1jUwmribSUCxIuno=;
        b=NG0yCUDSVBdtaIm1s/GCnLLeIJAQZOpUwIi4UurIHsqbPUiBcYRauDH9O7YgOWRBf6
         kTrfyismWYW0r+C7yk0wJsu7s65+6JUa0FVcPQxxMFoIU5hhtoZ1QDA1N2CQSz4tR8TY
         +vdbGVyutyKv87u6dQGQwy98wS6ITW3l213AJohOBW7AYIUgJb460fMzQqM3jeX+DaJu
         U3ltujJ8EhCQ9QpFfcSGEceMZJuQAmHB41C2WEVU9qt0EcTi+BVgS1mksJwB5dT0faJg
         509XVmPsecaHcEWZwyN/8plM9lTIxvBt8QwsEo+eYHRMTo8Oxej/zr0aiJSmJyOpm+VJ
         HKwA==
X-Forwarded-Encrypted: i=1; AHgh+RrhXShPCc2WuVbr3OP9D/M1r44vVFaVtHHwqhM67/O9tdp//HCw8Z/YIHHajY4JpCUVuAB7otrN713HsRgj3qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YynrkFFE0YGC2t+750oztVH/w3iNbofmGMpGX11z7LeMeRUdG9v
	DWpAl1GYkbwgpGFe499N05Yn+b3IIyTKwE3VJuFa6eLwNDXbhn7WETVSqOQL9TV3lA4=
X-Gm-Gg: AfdE7cnVkpmD1DwtNYZPzB7vSquTvyfM8Z/VFW/TU00sc7sioR1cb7CizI2u2fIZFQc
	TNNGHdc4W/0/Dier3YnBoIDdP94n8lW0BHllihZD5ftB8jcUHuC8Aa4toZbC3vdgPjjHZ8sv+QI
	+7gy3Xx6GvfzHSL8ZCASDL7l0e2x1CZfQzflQ7t4KVL3tbHD+UQ+xn6LRuLTnAfDJ0hQPtL4JJO
	ZjZxgiy1qZRSv9qS6hb47jK5wnFEmkffYXakMvn6TcVMeme40owEmOfUAqdUplLpe+5nPqhKt4y
	BSKQyJXHoK7RMLitJYevmjhZslZKxJ1r1g1F295k3C+b4i+LL2K8qqeaC2l/antOe1qDXCJmm7B
	KM98I5MSU5ZP84qWz8qnt4i56Kh8nx1t2UNpZpvvQEA/MWw3j7nfJWX1IzKlh46LTcoB3Lz9Fe7
	UmJKwzkE1AhMGgRO2m2gUe6OidydLQuXXGpE805jHga+A=
X-Received: by 2002:a17:906:f587:b0:c15:e8c8:34f with SMTP id a640c23a62f3a-c161e84b4a7mr493269566b.13.1783999959174;
        Mon, 13 Jul 2026 20:32:39 -0700 (PDT)
Received: from u94a (27-51-48-151.adsl.fetnet.net. [27.51.48.151])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb2b79c9sm14334466a34.22.2026.07.13.20.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 20:32:38 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:32:29 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Eduard Zingerman <eddyz87@gmail.com>, 
	sun jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matt Mullins <mmullins@mmlx.us>, stable@vger.kernel.org
Subject: Re: [PATCH bpf 1/1] selftests/bpf: Enable BLK_DEV_NBD for
 raw_tp_writable_reject_nbd_invalid
Message-ID: <alWsBzShn4sgDRl-@u94a>
References: <20260713063513.215781-1-shung-hsi.yu@suse.com>
 <08508d2133284d49e1da297895c85cf854a97bf3.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08508d2133284d49e1da297895c85cf854a97bf3.camel@gmail.com>

On Mon, Jul 13, 2026 at 01:47:18PM -0700, Eduard Zingerman wrote:
> On Mon, 2026-07-13 at 14:35 +0800, Shung-Hsi Yu wrote:
> > The raw_tp_writable_reject_nbd_invalid test relies on availability of the
> > nbd_send_request tracepoint, which is only present if the selftest kernel is
> > built with CONFIG_BLK_DEV_NBD=y and the kernel built from current BPF selftests
> > config lacks.
> > 
> > Without it, the bpf_raw_tracepoint_open() call always returns with -2, leaving
> > raw_tp_writable_reject_nbd_invalid test always passing without exercising the
> > checks bpf_probe_register().
> > 
> > Cc: <stable@vger.kernel.org> # 5.2.0
> > Link: https://lore.kernel.org/bpf/alRtilWhKw4zzMkI@u94a
> > Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
> > ---
> > Not sure if fixes tag is the right thing to use here, so use the cc
> > stable tag instead to get this config change propogated to other stable
> > branches to make stable BPF CI's job easier.
> 
> Shung-Hsi,
> 
> Thank you for figuring this out.
> I'd suggest we switch to bpf_testmod_test_writable_bare_tp() [1]
> from the test module to avoid the config dependency and let
> Sun pack all of this as a single patch-set to simplify backports
> (if such are necessary). Wdyt?

Make sense, that's probably for the better.

pw-bot: changes-requested

@Sun can you make sure to include the follow tag for [1] when you send
it? Should give a better guarantee that is will be picked up by AUTOSEL.
Thanks!

  Cc: <stable@vger.kernel.org> # 5.2.0
