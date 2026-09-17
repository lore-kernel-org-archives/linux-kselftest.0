Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4A533688D
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 00:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789605031; cv=pass; b=Q8jqCqa6UE4APugKUdkW4ScCZ2RDkva7bP1CMT1FIkmO2Pyg0JYfBLJuObeZ8586W4q6EhIbaz2hROn2k9bmk8fbp5S6Pd4DSKXH8PFcKmNQU4qoXymCemUfHIArOyMA4OtTSixh0aJYIdstWU6XxJgLsdpxStdK0cJhzYYM+Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789605031; c=relaxed/simple;
	bh=tlmyzNUENvNb4Oylh+WHiAZUPw2m3n5RaX0zH+LuxaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjmwY2WYpYUT2GhLDtQi4z7+AFXjPGRvKbJ8syqF2eAaibSEq6OHmF0aFIcecOsiApwkY/UQcOEUGWRjYssNBNFMm5XkpTRmVY2GG4XpPePiwRIS8iPUnmlCohawX/Q+2b2xjNKYTnUPPYCuEzkgtQbs+6GBxvLgA1lR1KaR3QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYvz5cCa; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYvz5cCa"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so88098a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 17:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789605027; cv=none;
        d=google.com; s=arc-20260327;
        b=nXgI5lgr/xTk69F05XwmIvN1CP+70iB3dqjCRQK4AKntg1PkTG16zqXXoPuEClFG3g
         P2cUuFNv2m795f8QbrTfPehHHyUEXRoXVCQHbBooJ/RInt7inKJ4JpFPgxX5mXBgjDi4
         4znSMAUAkT4CFFcSe9dnXaLkqHQlG5jlzrbX8rnCCO8rftwT/TxAzxIiV4gYk6988bN8
         1EvnVPlbpXyZTG1ukDGJiDPArnUmIIb+0b28wWK/LVvdOiEhBDatBAEUu7tNDiyxLOAz
         H2EvvHbCqk19EOnwa57abLmBYzHRZT7IjMxBJhpz6Skuf6QWsFozO47JTvTFyLO/gB2t
         aGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nH+1D62/vONjE3NQ4kwcRmw4ufbdwDd91huhFb0U00k=;
        fh=FV1mtHZh2ZOsA4Ah77uQP+bKDm/MsOxTnMCePc3Ycqs=;
        b=KNVXMyKB++xdhTjqn5lN1a8ZMuL1LGhGTlP8e1EfbxHCCrPu4dII9mSvtOgIWl1bE1
         4+jNleBCykcHe37Wo9ezFs8RYCih5ymJIiD8vSCRcWSBH0izvqiErQDkyLy1K3qVgE8F
         s7yD4tYFN5a1jGfqK7kB4T+r+ADrote6A7fSat1TdPnpAIX5SFSG3i+ZXPYhyfgdgXHr
         Vof6de14tbiWDaJNXY1W7FtWW0zLJX5nbM4uIpKFL7za53yarcqq43ZsldkBZN7YEELg
         Hw2k6qm+QIg7LzCWBGTniiJdE5jNGSIBCVVwWdvv65GP5NDljBmezE4ZJT01wHl34IbS
         HHAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789605027; x=1790209827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nH+1D62/vONjE3NQ4kwcRmw4ufbdwDd91huhFb0U00k=;
        b=rYvz5cCao9532scJdPg8dvAXksLLWHZC8u/uMD+Yl4rpF5S2Olha51c6mQFPgD1Qhg
         9mzvjgRE+OAMLsa5Az0N2pU2eMAtjjGRm+vKNo6llTGrjPC5iae6TXq/CWk4WwiWp/gZ
         X6iePs+W6uecExiRhYDtyL9qeONmnGGMOtWiRGP5ioNSPzfi99oLwoJzzgyXyxutZByo
         KmW4RRR0p8gZt7jl4r/yxWr15vO4Gn7vgqe4VzOYItSj8xxfsKHQsnjSpfnNGNnM1Ty3
         0lxhL7/AU3cSXUluSVHELJMZkGSaB4iSnXos+WFUsOyCGr2E35L4N5zgkJm5kPYTrs84
         DANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789605027; x=1790209827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nH+1D62/vONjE3NQ4kwcRmw4ufbdwDd91huhFb0U00k=;
        b=MvKyQOr5d/Iw8TNx/g9z9jf8Al+agvfsIXpunZvGhMrRTnPhRHbe7zHogGlfN0rPZF
         mjnrZGp4tghgwRGBthDaTZcAzlh0PpaSEITBmhe0JtpskIdTlbcYlnY73Gs6esYjWf6a
         Zaw6RlEuHUS/6OTK0B3xsodniRPCCi9kqRcIEcC96HvAJtz4UEoOj5zxpExuO2pHCNyh
         Eod4+LByd/iZaeuj97XyUFJnkMN40+JVMBTGLLZ6UgBf313Ijs1D38hKNAUHgEyXb+tO
         XJgiYzKM2BnZjnrX83d88XlcVy06NuMoFrDhowGSg93reTN5R+vZgvmwRGa7mfqiv+QB
         eDkA==
X-Forwarded-Encrypted: i=1; AKwUvBw/4UfVlrP1jTAKkpg7WuSFFWFEj8f0MIB7OKC9TBTo1chtWw2hM2KMw0FBBCWO7Pqkqx/emRJIwBsDI7JLCHE=@vger.kernel.org
X-Gm-Message-State: AFuF++kXRz6qRWgdUs++r9sYUBToPqZlUfgnS4tiVeKHiN+eVoX2w6Ij
	8HRO82zj8ETG5DC9SrFBz5cPnGAEz+pY5b0Z8PYZ5arpb/7NZoiUeOpItnPYyr6wX9Z2hdc7rN+
	KagGpZ5aehAvV+Pbwi2tu390yV97Qiig=
X-Gm-Gg: AYBFou1odkkpUMrmNxbiPPf5Hb7jw1vW9JbrLYE/8XhB2ELBgRvDU6zzYC+1jqoEVVo
	WzdYMKQmlms9wyo9x/cZDY6YCK79hiaRSIPNqPpu9+8Nzo1EKiYzns7Sihk9otoSV8lVYa7KeR4
	pK0ww38J6dX9TEXPpWeR52A2AiyR7Ebu0Cxr8hvpdMvF8IBqxH6JJwqa1Mq0JbNNAcuDK8Dy1WG
	cz+PoiurVMxo9C6IsBZW9axUzLzBB2dHnWapiGcraaFocz8xfkVZkPloe0Knw/ovXAySYcS5BtK
	IpuavXUJ7xYwIDrnt+XeS/Sjo9Z9BDTNqMOVR7tPo0BBKdEpSvHPaOUy3uEjfw/DqGByo7UkOvH
	hnj7fAHdjBRsicx2oJeImNMK99WagxNzEFH0on1jhOg==
X-Received: by 2002:a05:6a21:3315:b0:3d0:9590:7148 with SMTP id
 adf61e73a8af0-3dd5f5d86a1mr12651151637.17.1789605027369; Wed, 16 Sep 2026
 17:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-4-vineet.gupta@linux.dev> <DLDKI0ZXYI7H.1XQZZE2RCU7IF@gmail.com>
 <4ab75099-0e95-4fee-81da-6f4198e3e6a0@linux.dev> <CAADnVQ+N9tzBJ0Bbvp8_8QvR+QcCP4ej5CgV_kRHt=iw4BANSQ@mail.gmail.com>
 <202c45e2-58ba-4ad5-a234-c90703031f91@linux.dev>
In-Reply-To: <202c45e2-58ba-4ad5-a234-c90703031f91@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 16 Sep 2026 17:30:16 -0700
X-Gm-Features: AcwNN1XLUhSaujLVZNDBYUznBk2B1PEMW-Z99HXDCfKhyI83tPo-EfJkONx0oj4
Message-ID: <CAADnVQ+Si9Au8J_j2nt+ZzFq6WPaz8hpmh0n=_dFysZmSOeipA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 03/13] bpf: track low-32 scalar equality
 across zero-extending movs
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 5:08=E2=80=AFPM Vineet Gupta <vineet.gupta@linux.de=
v> wrote:
>
> It ended up with full testsuite run parity - after 4 incremental patches.
> But the pattern of all those patches was adding some predicate /
> special-casing to reg->add_const
>
> hunk 1
>
> -       if (src_reg->add_const)
> +       if (src_reg->add_const && src_reg->delta)

why? It should not.
My point is that zero is not special.
It should be handled within the current framework.
All these extra hunks are not correct.
ADD_CONST_32 logic should work for delta =3D=3D 0 just like
it works for delta =3D=3D 1.
