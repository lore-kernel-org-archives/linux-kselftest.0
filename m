Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D4E40DFC2
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886488; cv=pass; b=s3mrf37/mjl2QfiZMsvFCGeFxWC/FiYGyBV8Q5QDxzmNNDkIhRImBdK3sQJF7vxgp6aM2uiR2pVXu7WcvoBXhkBqE9fYva/iUntcKJbPgjQ4YXLYnuDRCukQSR6c+eMsK3tvIYYYX84tnOLw4bkbvi4AO+eusGKMualwtvvetAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886488; c=relaxed/simple;
	bh=SA1vNAl0SIiwT1XVeWiojHnZ7WyhntStWscaAacrolc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDcr6DwSiq2B14wg/LDfW7A1oEjES1xupBLWYc/CHqxK99ifB6E3NM8k/jOvCgrTup3zIxUYPynUAe1PH6N/dic54kipzvuzeqjiAo++TePqM8PLJUVcSEpNBF/osX0hkmdHkvpU0+BQvwc7W3dcWo5Sd1eVVtsbazwPgZayD2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b=BD80Oi6S; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="BD80Oi6S"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82a7539851fso2105731b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 09:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774886486; cv=none;
        d=google.com; s=arc-20240605;
        b=ZfA8IosFwPXh4kVfZB5Z1/Ka/j0DNfjj5PDS0wBxFDPgd2BexAJ3ipLext1UGn9eUZ
         IRzRwHL2R+ne+AkGhImwFJ0AZhNxrigEZBHXSxVSWpKlVwYX8ZrGfNKkdZccIgUHI7Z2
         Gvw81aruDZZTGMCUQSJejSDAh9caB8krzEAJvlfl4dFXDFRnhNZwDjv7oGgSiOP8yon9
         LsX3JVLbcGW+14ysYs36kRY4mjD82GWwyIIV152UjIl3HxLDu4A/wbf42vncTnxKSzrh
         ajBXwLlVKE4vLeufdKlgp5Bu75IM/KkQbjQ3Eh/mcnXMmK/+e+A8upq7Z4yrKNQKCdC9
         vtbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SA1vNAl0SIiwT1XVeWiojHnZ7WyhntStWscaAacrolc=;
        fh=jkvWqNMK3tgI2i4fADQUVQ7hlklQgQD/9/ew2QRoN50=;
        b=egddSE0ZRpZ3sAdsMg4zFbuDbAhSYLLRPppzQ7jtMok00sDhR5tIubDsJUn74evmD6
         peSqXTpjzp6+ki8dznNWTwLCcQVsHcC7jhORBj53eagPbv4V1tjjYvoNATbZgmZ4AYne
         8RITAeKTREmhgbRz0ivpPeREf22DlgI1TjshAAbuKvP5DKKOhhHDRpJM+I6P91dge0FU
         t5mAC/H4tadwnh1jXS1p4AUALidKHoSHwVnKZJiGgofpfr6r+3/hZXlURl/Xjdu0SD77
         WwE0IBzPyNqAwhPvALfCAO/1UYGWo4l8Fp3FW9DRSKrfEjDdSh6ypTPogtqYGVTRZKAv
         K0Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1774886486; x=1775491286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA1vNAl0SIiwT1XVeWiojHnZ7WyhntStWscaAacrolc=;
        b=BD80Oi6SP5173LeDOnYYa1qbXT/P6UXLdu9ixzlIPNQ7QqS6QCXw2ZZ7INhhU3PTZe
         MhCiJ8YZYOOhnyVeCXK2jY7cYAHZOea5LHTX2BBWbU2VY//gECtzLc8GuwuNpoux9sLR
         z1AyUN9ry965VA5q5u/Keh0GdzvlnPhhist2O3DwUtHZ5bRMmXV9pDirvwtP2bmKPaGZ
         WqMtdWw81bBqeSH0SoRUYBRszgCHFy+iKtFnOokpc0AVK03wUepIAO7wj2ElZi73nowv
         CRGhh5vyH18ffiPSlk7ZRUT2iwkVDXTQ8553NprMlODhdBLi0Z+6Jn1C/WinnaWU1fcK
         0uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774886486; x=1775491286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SA1vNAl0SIiwT1XVeWiojHnZ7WyhntStWscaAacrolc=;
        b=M74YBFOXxtkf+miWw8xvjBRk4iZnIoVoWrPZLhvjn2UlAH4dkoKvGeC5cGbYbVVV9N
         LpyJjaaUBvPT1rky86aHJUomnzPxwtHBKJ/pZSw7O1vsOti8RHUE4CKUtHoWTMAZoQIM
         dNq0KFzXqyERtWrb/fRBJ4fxDn+m1WZFeqEIlVGiUNz7iBbwJM6RRRdc78aqx0eV2UAu
         JlVsCLW5RqT/JWZhSM0HZ9+Gz7Io4axZfX9PYfwlbeSGibsngl/NDu7WDozo4vQPWXbh
         BFTAn05YwOuAo5cVt6EfRitlfho7LZVINGlB5kQZSQxVVMrP89Y3VcN8VqaiQnf7SFqx
         HIKA==
X-Forwarded-Encrypted: i=1; AJvYcCWsDT2WOQkBsBmdN9wq5dsL64bAr1nvZWjufiNTTpGDrdySLOkjpvpAFO+uZS/bx1PrL+4gVdHeT6r7G2bp03I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ6LTeAHptlRnHgrUvlSZB74R7IdBBRIbW4HCas5bG3PuADSjx
	wVbzaW0NJIhEtCPOSegybqL1Gca59cwUnSEnVuneRNAf+1WHa6k2vzOgBGLfb7C7gGVP+faPDQ3
	wzK1HtrJTzco0N2lD41DJz/oJkp+yaQxGilXIp/QF
X-Gm-Gg: ATEYQzxCVlGY+6nKkDKIWWdU5QobEJOm0164BCWRdr8Di6wzupyF8VxSh7nXVz0udm5
	KjkJ/8OwBkueVqYjflrN13WfCg+RmjQaP02aiR1h8U2J4dua5AOYfQ7a7+jIsqOLgDgUMjkPIlO
	+FE9S+MicopC67JC6K6M6ppTPjCSX2lyDY9M38PCubeb7m1rXu53G5S1xwnXVZz8ifPj/NxhwOM
	OFW9+Kqox7XW5LiYBQsJyWnXs2pJgs/eJJpGAztvhsBQDWubWyA6GL1PBZSp+MkGA5wJ+Kgb4YI
	mKmCcj1DuUPAgAfxg8Y=
X-Received: by 2002:a05:6a00:6c8d:b0:82a:6d7b:cd3e with SMTP id
 d2e1a72fcca58-82c95e43ea3mr12467518b3a.19.1774886486266; Mon, 30 Mar 2026
 09:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326181701.308275-1-stephen@networkplumber.org>
 <20260326181701.308275-8-stephen@networkplumber.org> <cf7128a8-80f2-4d4c-8c68-2c9f386cedb2@redhat.com>
In-Reply-To: <cf7128a8-80f2-4d4c-8c68-2c9f386cedb2@redhat.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Mon, 30 Mar 2026 12:01:14 -0400
X-Gm-Features: AQROBzCnwG59BIciIlocIyIEGszWFfU0bDPY6qm0X28Xi0JW_3MFhh45-jLdDfc
Message-ID: <CAM0EoMn126L20y4Pw2=6TNOE=Yy0mRPA4TfOC_fGyxJNQTbX+g@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] selftests/tc-testing: Add netem test case
 exercising loops
To: Paolo Abeni <pabeni@redhat.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org, 
	Victor Nogueira <victor@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, Shuah Khan <shuah@kernel.org>, 
	William Liu <will@willsroot.io>, Jakub Kicinski <kuba@kernel.org>, 
	Savino Dicanosa <savy@syst3mfailure.io>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 4:06=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> Hi,
>
> On 3/26/26 7:01 PM, Stephen Hemminger wrote:
> > From: Victor Nogueira <victor@mojatatu.com>
> >
> > Add a netem nested duplicate test case to validate that it won't
> > cause an infinite loop
> >
> > Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>
> > Acked-by: Stephen Hemminger <stephen@networkplumber.org>
> > Signed-off-by: Victor Nogueira <victor@mojatatu.com>
>
> Apparently the new test does not pass on NIPA:
>
> # not ok 364 8c17 - Test netem's recursive duplicate
> # Value doesn't match: bytes: 294 !=3D 196
> # Matching against output: {'kind': 'netem', 'handle': '1:', 'root':
> True, 'refcnt': 2, 'options': {'limit': 1, 'duplicate': {'duplicate': 1,
> 'correlation': 0}, 'seed': 6495514880116664183, 'ecn': False, 'gap': 0},
> 'bytes': 196, 'packets': 2, 'drops': 1, 'overlimits': 0, 'requeues': 0,
> 'backlog': 0, 'qlen': 0}
>
> It's not clear to me if the causes is this series or the follow-up. I'm
> tentatively dropping the latter from PW; let's see how/if TDC is impacted=
.

We should hold on to Stephen's two patches until the skb bits one goes
in and settles.
Stephen's patches change the queue expectation which explains the
accounting mismatch. Stephen run the tdc tests and fix any changes in
the accounting...

cheers,
jamal
