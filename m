Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BB63644C6
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 07:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483953; cv=pass; b=pVEOVH6TmOhgjNMoOWb3foQ17dXuApN1XSldA3riW1tQdselJYPfi4eZMSQrGH50BDkAdZSWYRBW6dMr0+y7yUoCYZa3ngYROAEwwbCzjWaNblGvZ2txotO+rzmXwOgMlOe6sZFDQ8pCzx4YT9L0v1xSk2/9JowuXocgHFYNMCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483953; c=relaxed/simple;
	bh=0tq7+QO/zX11vt1mSguxtzM29Iyxssr53gaIc8N/SOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3BQk3gmCdVTw2Skcq0WWHeR1HRYLipFmsuEKBNFuIYZs9kR1rA8+YI0eiZC12IvKciP9cxHOW7mXf4MjhI0wKH1XMGWm0dLCuuoXOfZwsBynOOh6abKvKeEDw2H8RALsUnwwdEVlicxtFo9Pt0h76+ap/POq8csmt5FiqCbCS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=igXfiYAU; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="igXfiYAU"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50fae4d1f85so47851711cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 00:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778483951; cv=none;
        d=google.com; s=arc-20240605;
        b=ZITiZBAuwf9qfsbWasfdDmmdUuBIjWSk8d2CmCwvVcVplnHyUouFLTY2js6ZxINa5e
         qE2yiSye2XH7d4LLaD6RhPaNKAJ2V6KYkluflEJflkwc8ScMtjH1CqVCqeymsIyZO+KA
         DqqS4JVXTY69NifiP8BryD2/F2ZK+hS/c06lwCxUS82zrQA8i+vbwOFf/ciWl9BSpvfT
         NjlijM2+lBE5lcdvtWSmIf0xzxFdimOUh8A+0bbxzqDNfabPg2v7qm2/0J6sSv+Mu2Hh
         oPqr1jCNJ3BMEuAM5OPR8s9wAQLeLVdd//TDQoHsgZQYSoeky+uzXAuCncioDKXPXrXb
         5nXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pzjX5aZytdYjc4ATBvAkFaDuhTJ/jrgQQEMmC6Ei6Yo=;
        fh=nFI/StxRIr1UTF8JWdB7bcCoBSHBlYrDVI/pKTPaLzs=;
        b=KjHY59LLXFwQ0MBePugcg8R8okbIrRcJQIbi+KytLlCxCn+xHo/FXF8rVSqoJWWWZG
         zlcfmGc+lyja2Dbjv1xhuXx0srFDmgA17NVxcxlNLCbDBjtSK9kgkcc1FEimU1L/2o9G
         vYZdXKtKVQSIOLPYN7+Zms0PhxKoz0GHMFM83H+N1fZpj149TqgJcKYh4YEyI815nC2k
         ltW4hY0/NUt1CLT/Zr7OTe7ZKwoHUkBn8BkC3ZM1pYwDG+zr/69s2iqqDtdAizMU1w4c
         RpepE1XuHaxa6dkASvRffciM9yfy6RGrwzCrAerISb263eIpyYDTd1B6vwoNpYRQfhtz
         Xz9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778483951; x=1779088751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzjX5aZytdYjc4ATBvAkFaDuhTJ/jrgQQEMmC6Ei6Yo=;
        b=igXfiYAUbXEliRGqN8I7qjh56av/7yNp63Jtv8oxc2nu0ZVtTm6XT5FiX4yWztASS2
         /961gPDdw+zGvR7R7CCkwWNQOF8M/a+pSs7vY/nM68KUioN+lXF/oNpCfFl26s8V8BHF
         Ud4mpP87w4jdi6AsGa89ua7OAjg9Afg0R+2FYZvI9CFbWMFu6kVW6t3ba2MPrMgJa7DR
         xgIqN+qlX8zydSv3SFnqCV2HvoKn6hFjr1w8VtcYRGnWiV7vuxTUA68t7bwFvFCOYCzU
         y6iTJ+yXpZGEv48Ero6YCU3DAcvIPuigtJPJl3w0oGg4gEz0fNR4qLRSy5wyKcLVWNTf
         1zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778483951; x=1779088751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pzjX5aZytdYjc4ATBvAkFaDuhTJ/jrgQQEMmC6Ei6Yo=;
        b=sxTsY7yhrnNktTISJshIpTcVe0qRBvenDePBT3NRS4Y9dqD7o5JrDQDWdepZOE5MLP
         +YZHmgjAhOl7k1Ub8GKTWPRDmipt3s5eYnvAkkL/UfH7HERY4LMgZzdlXkUxFveOW62t
         qRj6eGo+ZBnNiGvA1Ewe0CPc9bbx0xpHmE1SQPKD0m404fXZCF0te2JF2d527uWadV9j
         kE5OOFJRmdBcwSJ+s1J/pBsCT8tlJpRMinVywrt/d+MYmTvm8hqaLJQFURBdH0YYe/tJ
         n2obWCMrCATiRA8qd2TeNXFWzxaZD04cxm2d9zqdlOlS/qT5zaK6Jhd1EKGXZLsnR4P8
         25Ew==
X-Forwarded-Encrypted: i=1; AFNElJ+cN6tkDPQEzs3eawjBrBHOtgJHQey4ZbLmEFbey28PKXaxqo1bq20yvkJynj7I+FrdLB15Ao+dfsQDrBdEwdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2DI0Wb7NtbuDfclSDfldeNxeRzOWGLs78r8lyLb1ynpJy3wTa
	z4iL1uu/vVs0L7z4IIaPbEqQ0yvRMPTsofMfRQAucL6u+qPPs6let+4n7RmbDGeN5EOGMgRmsJm
	XbYmqPjQkA49MmuJ5Bx1sYj2SHfYoea0yrNSuaUkN
X-Gm-Gg: Acq92OHxuCjfNRCetdeVMn2bkpyCG3Qbi8t5w6Ayrb8FNYP/AfR9XOQA6YSEwfSR2sq
	SvfDX0mK87M7L+RW+QRu4Qp4Gfn3449Elownpd/w2XrvvjcP4g7epqF3/OaxsoJ2tFMA3VxvMvu
	F7NXZ/xDzmarIRE5sEN3LYYYyZTuaZzL6zw6z3NnJyjHWREXqFzqXB+yKZWR5N+O5TG+rsNfgG4
	c1nssbD17xfXmHHgfawWwjBq9vxL227MWfEYP2KPf/9URtHqmQyeWNd8tVOeO+P6a10cj3p1zEB
	Kgnadc0dq3GSPTMOVaoCp+/931FDLZrg5xDXmd1tN3l+hOKq0KSMdnh8S9Qr7/EwjzOwe9mms18
	/IWLGmDz8LANpqKcny5DpdrA8OQsis1FOV4kJUeA=
X-Received: by 2002:a05:622a:647:b0:514:5d88:8296 with SMTP id
 d75a77b69052e-514621d0e45mr321046621cf.52.1778483950919; Mon, 11 May 2026
 00:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507154806.18635-1-ankit-aj.jain@broadcom.com> <20260507154806.18635-2-ankit-aj.jain@broadcom.com>
In-Reply-To: <20260507154806.18635-2-ankit-aj.jain@broadcom.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 11 May 2026 00:18:59 -0700
X-Gm-Features: AVHnY4IXty1C5WxwC6jVyVP7UV6kJQcgN3ykDWabEzHXjKxZoGtorArf6iJ-G9c
Message-ID: <CANn89iKs3KLo=5hhUEH8OEG8p7_52g+fsrwYYNW=GzP+k7WW-Q@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] tcp: protect locked SO_RCVBUF from Silly
 Window Syndrome
To: Ankit Jain <ankit-aj.jain@broadcom.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, 
	pabeni@redhat.com, ncardwell@google.com, kuniyu@google.com, horms@kernel.org, 
	shuah@kernel.org, quic_subashab@quicinc.com, quic_stranche@quicinc.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	karen.badiryan@broadcom.com, ajay.kaher@broadcom.com, 
	alexey.makhalov@broadcom.com, vamsi-krishna.brahmajosyula@broadcom.com, 
	yin.ding@broadcom.com, tapas.kundu@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 8:51=E2=80=AFAM Ankit Jain <ankit-aj.jain@broadcom.c=
om> wrote:
>
> When an application locks SO_RCVBUF, it disables TCP window auto-tuning.
> However, the kernel still applies dynamic truesize penalties to the
> scaling_ratio.
>
> For small packets, this penalty drops the scaling_ratio to 1. This
> reduces the advertised window and causes Silly Window Syndrome (SWS)
> along with 504 Gateway Timeouts in applications like Tomcat.
>
> This patch bypasses the truesize penalty if SOCK_RCVBUF_LOCK is set.
> To prevent memory exhaustion from large aggregate payloads, the penalty
> is still applied for GRO packets (skb->len > len).
>
> Fixes: a2cbb1603943 ("tcp: Update window clamping condition")
> Reported-by: Karen Badiryan <karen.badiryan@broadcom.com>
> Signed-off-by: Ankit Jain <ankit-aj.jain@broadcom.com>

I still do not see why the current behavior has a 'bug'. I think it is
quite sane/reasonable.

Your selftest does not show anything wrong IMO.

If you want to avoid SWS, perhaps the application needs to _not_ use
SO_RCVBUF with a value smaller than the device MTU?

Applications using SO_RCVBUF with tiny values can not expect kernel
behavior to be stable,
since rcvbuf management depends on metadata size, which can vary
between kernels versions/options.

If  a kernel change is needed, I would rather enforce a sane sk_rcvbuf
floor when the MSS is learnt
at accept()/connect() time.

( TCP_SKB_MIN_TRUESIZE / SOCK_MIN_RCVBUF definitions )
