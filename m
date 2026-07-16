Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F331A04D
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 15:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784217558; cv=pass; b=YWVRn9Hu7d2INcT3SgvBAxiwPVHykISpfrl3BJ8jDWrNkDWU6TrP/JJSeq1/zZQ/8cemxLhASZxygn0lS6Rgrxa55JcqvSAH9bf5aQfv4HNAd53pCQNl91KoEoSw3dpClDhVZEQLVLt6qNrJ9/sxMWEqzeV7n84Ig758S8PaMIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784217558; c=relaxed/simple;
	bh=itGbq07Nr/3aREyFCWeD5PlpGayUnNhMCz8RB3pMWi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZ9iN99+wQRAt90/Pc4dCJJ0BbZrdZDDigI8nvxpCDKTq9Z7bS9L0jHz/xKA4+XuO0T/AcIpySdHJAFCPpjBbcEK81iMfLCHJbwWOOHroE+ILnZQ5zVlqGNH+8Q0Wajv4Bg565tmZK+IuCpEoNHDmShWXo8TLuU1x9SOOMTu+ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AioxyDwH; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AioxyDwH"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-80a123ef90aso14935137b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 08:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784217556; cv=none;
        d=google.com; s=arc-20260327;
        b=r52D0/nDXXUuDzynnbvOouXRMktc4joYRZPD/2+sHgG8K0jiIv6Duk0zMc8DJqGKWY
         6hQK5dABUGbAHE4yavWBo4jxVGIf2hRHEBybjg/NNabvByLgJD4csIHR76+x1yONjGjd
         yEziKWNKynfNJP+U8n7BdLqFCcz6F3Qqia8Yx+4enDwjmvLk92g6Tb1eZJLwyfNMpjED
         PMeng3DWnbcbyMhf5EMbcortF6azeS2OVQOX29sx9U2J0qBisRi0wokaevE9aKzW/vCB
         UMYTwlICiWR1zPvzhJUb1nMpLWVRZyjyXRxaZE46frLxfsZFy4+93o7kcAbVOtRYAVPZ
         zUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=itGbq07Nr/3aREyFCWeD5PlpGayUnNhMCz8RB3pMWi0=;
        fh=Xwp4X3Ouqn4PTJ5bAJQiK/zaVAvYW9ghgk5ZCHreXa0=;
        b=iSP6uH82kSZ36W9cfZCezqaJ/nrRlv6povXk8Fd+cxTpS1r3cu+cgbnQtcuBeW/vHZ
         jNgqb7klHHCdr57bbsyVSh+Ed54EHlQ5EdqorPuRIQPL6l2j7wa8kV5nnNUy4VNdsSKJ
         +FCqQcjl1tV3UuY92yUw7+x9wmh1KUqbezOu/802Lnb0hfkO2CcEmhaN42GUwWnUmVMj
         0rwiXhGDONXtIMsY3hZiG9Bx6TKAGuQeUqqI1ts3/jceJLBSjuvqTXsFLX5jxbqsH/Lo
         vDX3fE9gXn3At5NgUCEtRBjZqYW3jIfc6eTviQyugL/FCgfj1o/LQ4Dpxu0ZQ+Zfg2uj
         qBgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784217556; x=1784822356; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itGbq07Nr/3aREyFCWeD5PlpGayUnNhMCz8RB3pMWi0=;
        b=AioxyDwHfE7s44E0tdidloFcwg8NLuGJ6fBJyG9FG3tLIaJVspk1L6gjrOLuRoakn/
         XQlc/EEMpzxPSccnSIUizi4cgF9UP3rVe5Np4DGsp0jcF09zBOVc2vwU0YJU+oWM3f1l
         8BaMeH5aO2Vl7/5jKkGn6Yu2jkjz0tpjdx8MbgFcIv8M4mEvATkhcJEnv3DyoXQQxc5L
         f0I7h48qSTmKtFoIZDQ54EwXnBvmTbNLkdrV9+m89i/GKmuvVii3PoDnqK2qeq5gBg1c
         DAjwXI2cdovqrDdrD72X6F1Rt/TFhSsc8kg9euK6ICItqjXdZB5j/KVecggGCr2zAaKN
         hVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784217556; x=1784822356;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=itGbq07Nr/3aREyFCWeD5PlpGayUnNhMCz8RB3pMWi0=;
        b=C0aAAkdMTs3p8BdU4+deddsTYtAJbyPu/Ogjfzd3JTABioZ9zw388vBdYWajqISW8x
         DTKtrwQG7zGFKzDCKd33XXYoUuvElmgLz227xlYdpPeXbtFkUqfrWGILxTs94caPZzX5
         /PmTGEqRqhoJEG0Kd0ENSMD4sYuPNxk9TyB2OU85pUWBRrnZ3FQ5tfr6JeRz3rGv/C1g
         tXP40rTY0F3UD0g3Qt8iDmkl7nLLJjzVI3ZCPbR9410fyRY2O2vMCXL7TbVLPfWojMKE
         RPB6WalFZwlriZAA021QoWEU+U0a3UZpIYqdZ+yS+K9Cpy5pIaZ1c5MWqFvbjHWqjuuz
         NYXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCxK491j02nxuWUYqcM8bc3drdYu17WBzYVge4J/ks6Lkw7y1wJtXu/PrNZfQwUM/p/4HNvSSEXQgdy4ofv9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW5uXww1n6PJmqyonD/a5qU5cD4YH6Z9n/+gmTQAEItGuz6bkv
	K9ltSeDrkdXIsDlkQDlVf7PWUeAEYF16AeGRblp6XYKM+CUZnzqZ8BHwjYGfZqDTpKWEj7kcYZr
	LMDtwe/43toSt27QOOVHCaFbRNtBsPxA=
X-Gm-Gg: AfdE7clmAw3UY7VxY31AH7l3FzAEFB4lwg7ARLpnJU0VOa12K4++33/J7MIP0XNKcRm
	uHMTIMYCxdNGpEpnIgjJP7E1uB/BaJKJrkMGdXZe6SalRBJksUnVQMz0J5LjruB6GQN3DvhzRP4
	/nGWZJe9spcFkAftSHaMt/0ptlfMxkGSxTynMRN2RiCc4HTrRXHVhAtZR9Fb2Tu6jZtMyQG1yEv
	vJbvGERmgBYk38wVhS8srKpvJKFD2fiEP4pQBM8Lzw/rDCtwPU3PMsNaGdDvY61Azvoc8f2PNdp
	YJtDAzLgiY+YYpdscB+jXN6R13y7vkU=
X-Received: by 2002:a05:690c:7283:b0:81e:bc7a:df50 with SMTP id
 00721157ae682-81ee27da338mr22708687b3.3.1784217556404; Thu, 16 Jul 2026
 08:59:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714190356.190328-1-dmatlack@google.com> <2vxzy0fcicpi.fsf@kernel.org>
 <20260715172336.GC3775915@nvidia.com> <2vxzldbbhsb4.fsf@kernel.org>
In-Reply-To: <2vxzldbbhsb4.fsf@kernel.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Thu, 16 Jul 2026 16:59:04 +0100
X-Gm-Features: AUfX_mzDCiilD7YNKNL42B1YJ1d5u9iOC0w12NRZaSOyWnithGXUwP5aTZQILLU
Message-ID: <CAMw=ZnSCzUY=RWVqK6WxDx5F08ReOpnpyrksZiCLOYFXi0uxXA@mail.gmail.com>
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for /dev/liveupdate
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 at 16:23, Pratyush Yadav <pratyush@kernel.org> wrote:
>
> On Wed, Jul 15 2026, Jason Gunthorpe wrote:
>
> > On Wed, Jul 15, 2026 at 03:50:33PM +0200, Pratyush Yadav wrote:
> >> Hi David,
> >>
> >> On Tue, Jul 14 2026, David Matlack wrote:
> >>
> >> > Remove the single-opener restriction for /dev/liveupdate by removing the
> >> > atomic in_use tracking and the exclusive open check in luo_open() that
> >> > returned -EBUSY. Protect luo_session_deserialize() with a mutex guard so
> >> > that concurrent open attempts by multiple processes safely executes
> >> > deserialization only once. Update liveupdate selftest to verify that
> >> > multiple concurrent openers succeed.
> >> >
> >> > LUO does not inherently require a single opener. There is some
> >> > documentation about it simplifying state management, but the only thing
> >> > it actually protects is the session deserialization during first open,
> >> > which can be easily handled with a mutex.
> >> >
> >> > Relaxing the single-opener requirement avoids the kernel forcing a
> >> > design pattern on userspace that it itself does not require, e.g.
> >> > allowing multiple userspace processes to create and manage sessions.
> >>
> >> Agreed. When the kernel had a global state machine in the early versions
> >> of LUO, this might have been more relevant. With sessions, even if we
> >> later add a state machine, it likely will be per-session instead of
> >> being global. So I think letting userspace open /dev/liveupdate multiple
> >> times makes a lot of sense.
> >>
> >> Also, today's systemd only supports preserving individual files, and
> >> does not hand out sessions. To get sessions, userspace must open
> >> /dev/liveupdate and create a session. This opens up room for one bad
> >> process to block every other process from creating sessions. It also
> >> imposes a need for userspace to add a polling/retry logic for getting
> >> sessions and serializes their execution around this point.
> >
> > Shouldn't systemd open and own /dev/liveupdate? That was at least what
> > I originally expected here, you'd talk to it and get a session FD
> > through dbus.
>
> AFAIK I doesn't do so today. You can either create FDs and save them via
> FDStore, and systemd will put them in its global session, or you grab a
> session directly from /dev/liveupdate and save the session via FDStore.
> Maybe in the future it will add the capability to vend out sessions
> through dbus as well, but at least today it doesn't do so.

I've added it after Pasha asked for it, will be in the next release:

https://www.freedesktop.org/software/systemd/man/devel/systemd.service.html#LUOSession=
