Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67C39DBDE
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 21:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776805943; cv=pass; b=aBQ/+VQG16AoXK2o7vSJ1oMv/vDF2o2UpBTGO/Ens6YgZeBs0d+jH/Ggae3HZCR207HkSIeF4oRlRETsCHYNPqkHOjtYJC7IOMtrZksOe/kfxV00LKpqgIk+LtJZKOig1Emc3KTxn/8o/aFMo3DN8syqt8YtCcAtQkerou40hgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776805943; c=relaxed/simple;
	bh=7HtXPblbsuvKQcLa9F8JHADH0B5A8obSovRJxaTmcEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJagvdfdb00WqyIOPOyU3FoSu2CtFT5FnsUjfWrHds17HOoq1rQ0XPLIsyA+Vo5WzOloFhDjNicXrAoIsvtLmX7Gga0D2ukM+03lASQq7sfLyz0OkxPPNjSxhobHj524mz9AT8P8RMrSf73RyPWzfKW0HUA7hJBCiwgQ879JyZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkbVLyyw; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkbVLyyw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso26418295e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 14:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776805941; cv=none;
        d=google.com; s=arc-20240605;
        b=WiL9H9Unj8Mu30f3NNld5lTcmpeWVrPN5omKwqik5m1zM/UyRP2jvpRci8L2uOSg38
         btD7uizDk2r8x98ZvkDxu1wa7T8I8vjtXlyghlp4hfwUuNBv8HO6Rj4oUPMPTfvPD8Tx
         z+hRbq4mtmx47kA0dd+vua7x8/i07KZ9rectPB+pfh5xpLLVBCPtL06MOmoLqiGXBo7H
         bYPd58EZLBEQzJ+MOzUulp0XM18vjBMfa21NqeXeiV5rFdAgv4Qnp2yqyMVH0Bk5huB1
         IOjVULqTvLAKiOVKSTETx6vOX0TmdGbusyreuFTYXM0tTXJQe3MtUwYnP/hvpFIMPFXh
         R5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7HtXPblbsuvKQcLa9F8JHADH0B5A8obSovRJxaTmcEA=;
        fh=icCjJG33153M5GyEoYgTmo1IGfu7AU4QZSSGH0ablIM=;
        b=bt58suDqt5yEmzEjHb0+GJ8fT9CQlN3+DfrLS2HTgNeO21AOhGGHT/f75T/rRx/DE8
         M3tmZQNBWG8DrN547PioxEupkiPOTXS8ICfmAE38e0Yk4wrYtPwBh+vsKIOgMykRE0xN
         Ge6un0RjrnoCJpgogOeGljbuql1LBhlF/mJMJWdZsa3mO/NLxej7pEQigaSmpWn5fuLh
         dxVo3cPjZy8PfUrF+H8BNaBJS4zEvaSgpKHJJ8tfxma7NhsEwyTsIY03b13sgCiH8tJM
         itay9Mt5lSVetmf/Z9MIfvbpPtTy9bPdiX9qn0E7UbR29EIEBiKzbRpQ/cdBk98Ezk0J
         gwDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776805941; x=1777410741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HtXPblbsuvKQcLa9F8JHADH0B5A8obSovRJxaTmcEA=;
        b=RkbVLyywW2pe/i4FFjsAP7VdfebLNgXH7ZVzfuva3izAtjGOeyqkEo7o3tgUCwpr99
         Z+mOJ3zxtRqvZ8J5yknE+0x8tDTdBDH63F3lGsQdlKjHnDmR+IKw/jBCPSBS9ULrq8HK
         oDn1MtqO+ko0Ybh70mlMMWMAS6+rHkxF5Ax597BNkgWxUwwSwU54e/moXxQ2Eb0SlYrd
         zShZzFNWG6Fv+EmMiQSE6PshcaKiQrmfRext32vmNrsk5vYc/dBZL1yRtq74tjbhk/Sd
         +TIsYR8sqSoL6m4qRdJ2pPR5cp92OFhCJOFsC9+xBcArqFgaxLw6KUIBpgrvqRCQX77K
         hy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776805941; x=1777410741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7HtXPblbsuvKQcLa9F8JHADH0B5A8obSovRJxaTmcEA=;
        b=B3BcpXTDOvMEvr77amBgfEoZkpih+pex6lvkAmIdhqKrgbBPkkPDFnxOVv7B5vl8Hm
         l52El7flCLNkPuySxzImn9RcmWzk0bf7llp0ObUkZN4l9K1V5eqSd1XZX/5z5hTRJxOM
         8KAgJDK1m9wJSXq6psNDxcgIT1/JXxU/nZzvuhNxHZBiRPX9dhuU9zEZnnrMYl4xeRWF
         BQEiQ619JttdueFqQ3eJgk1NVhu1Xr+nYkXFCODcMbN2j15rn9DRKMT/Ji/Ek4/mOYVV
         2UfyGov5MqFO8NZS+4iPwQ+9KGEDwlAb2XUV4CQd67KC9PXs4MM5qcC2uICLhKM9/R3T
         86yw==
X-Forwarded-Encrypted: i=1; AFNElJ+KF5ruBTzhRB741mDH3zjlhChnbC09S9u6PMY9OK9PbxS/fkByb1xibCCtWV1Dv+Lq281reo3k+L1vH4SBMrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Y/Mrb3pvnS6uQb+/jCVcTKQhDIbfVzzHjODToq4YU/dHEZE9
	Ldi6/PUEL5eV4I7yUHsq2JyCz2Msvq4orgHkdiW51iVGR595Iuo27QRWmADgsJCvwBWqFP77tJZ
	N7NFnVv1p86Sgj4vnikz9phZRPXbA6lw=
X-Gm-Gg: AeBDietpnm8knGTyJH7FMP14mf0f1Uw7twiGfPUQNwFUCNpdBboJ216DVQlmQ9/Hqet
	PeM8R6uQDIjT3upYnReNlViKav/Vkj1T+xyMaPX0kNHTPlvY1Mxi2I3uXnbGBx+0JtryGXAa6PK
	Kc7X6OrBWOLLb3Op4hFFA3vLjFTdw4HxS8P25g8guD4t6YRNtg5E4PWkpX8LG9gHFSkvP/vR/KH
	gFiThQZ3vuPN0W+ZZmwXKA5NVghOKKRmr6Bh1ibCn7dXOmCK9A+sQKZKo4aaM0N6SZ04dLwMkjS
	H2IwtgZJMkS5r9fm1kmT4/4byH/KmY86E+HRhKrxG5sdZpzzzVOnS/xwujS+jPZ5pLNQh3ANTww
	ZLk+Gs8Z4I/NuUTPIbdaT8s/yfvY0SumPv1nw
X-Received: by 2002:a05:600c:820d:b0:48a:569c:abab with SMTP id
 5b1f17b1804b1-48a569cadacmr54957095e9.14.1776805940737; Tue, 21 Apr 2026
 14:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
 <aefnIw1Tx_2r5nkS@CMGLRV3>
In-Reply-To: <aefnIw1Tx_2r5nkS@CMGLRV3>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 21 Apr 2026 14:12:09 -0700
X-Gm-Features: AQROBzB7FEGFcLIjJDbSZzRa8uWl-Vr2UW5AqVzs9gp0AZcsBB4lKtYQM5rh6eY
Message-ID: <CAADnVQJQxa+fHM9X8COc60ZMcxF0DMhWbtArg_gPynpbbg55TQ@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/4] audit: Expose audit subsystem to BPF LSM
 programs via BPF kfuncs
To: Frederick Lawler <fred@cloudflare.com>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Eric Paris <eparis@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, audit@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 2:07=E2=80=AFPM Frederick Lawler <fred@cloudflare.c=
om> wrote:
>
> Hi folks,
>
> I was accepted to speak a little bit about this patch series at Linux
> Security Summit this May [1]. I'm going to use this opportunity to
> re-iterate some of the motivation, what can be done today with BPF,
> drawbacks, and wrap up with discussion topics. I'd love to hear feedback
> from audit, BPF, and security folks to work towards a viable solution tha=
t
> addresses shortcomings to allow for better integration with BPF.

I don't think any bpf folks will be there.
Also giving a talk about it doesn't make it acceptable.
It's still Nack.
