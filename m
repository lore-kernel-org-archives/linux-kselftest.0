Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8093FBEA8
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774459714; cv=pass; b=Hdd501IJE4t5LpFZVmJvsCl+Dk5E26szN8H5kqpKrFaPyiJzUQFf++NaI7RviVH8PCVjLI9RYEK0pG8652fImVG8HZW13GYY5dBMK+JzlbLxp65NCNxRz8p9rMHUHzOo1hXePx1D+Bg15ZheSG41FUuLNS/1RW8sVNNf1cFmSfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774459714; c=relaxed/simple;
	bh=Rp8fxQCLwFBn0xp4OYUEop/+U+Xl4C79lXLfMQ92/H0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBQ7IOXK1yP/3XxRUguAvMnjsOn9YXEelRUBI/NwT6HFiFmkOCKQotk8XT/UfI+HbYCG+N7klEaW92CFORKHv7Sl27zFVTwRDsU+jRZ6a7/r386xpTW86jbw5yVr+mkHNhE2ecy7LRunsCcEogEOfOob0wN68PWyIa4A188fNn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rp7+E8kC; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rp7+E8kC"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50b2d6f9d00so1434021cf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 10:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774459712; cv=none;
        d=google.com; s=arc-20240605;
        b=bJOZcbX3d9Bkk8zLeqft66LbftWRC9Utt+wfbw0utmRAqTHfVN3BCQnNuc4/AHsFLe
         8FGoa96pwE3SvMbI8NSy1TAJLslEx0CmTNTE8x0pWPo5CiUeuh66/IR1yOqylVmqkv7X
         JZt4VChxe//WJ3jEzkAciNubglreiMT8MMLFs9hGUYsQInh5txcArfylwm0W2BdAlYZT
         ywPSnoSVUMXdGlpVDKLXKDh5bU0Cz1OD2rMcSlUKbPH5iWIcMcEwaZ/zNGRihChhecvF
         TTkkHEVLM73P2d84XzC3rHV4fSmgXTh2zGnf+ShNT6FNFc4iFitQfcUVHSi6J399N0FE
         jk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rp8fxQCLwFBn0xp4OYUEop/+U+Xl4C79lXLfMQ92/H0=;
        fh=T6oeGFjiO5ZPX9bJHIl4Az4JEb7LTzlXJDeoUw1iTew=;
        b=OzbElwUMDRMJy7WiQpYlrVF2V3xiMFEfY9HPC0/p5aiv2qih4yUDGRlUOBq4XGpFK5
         z2EKkwtWrFaOcHMEoJUiHoaaJoF2pzlXDN9iQgFVUFAIyB4iZcdhwSMQ4BuXTFcXGkPT
         F4eXsQ4yXuE5GtnZIaqvtXttQP1sit87VBMrOQ4RoWjSPUZjhT4xeShyaoODtJzDpjhP
         yKa9TE73cCiBqkCSyUbKBmCucXBfu0NZK0E1zB4e7cG+FVRjnhDGJX/L2minJBYfa5ai
         3r4oVdbTpXIQTlS5JSWynPeKe/TNuIQOhAW/Z2I5dd33Yg1t2XR9y5rDiMgWMNC2l1Sh
         nvJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774459712; x=1775064512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp8fxQCLwFBn0xp4OYUEop/+U+Xl4C79lXLfMQ92/H0=;
        b=rp7+E8kCEuPUq0JBHlll9SFHWVtlbE8k4LeRN4BGvRGQJlWIkczw6mjh9E3omnNdc/
         1SB7u3dO5PKUuulKetzTkgjBgeIibALTZue7TjoobnTpyVbe3/0IVOlc6hpCSG1i0NIy
         YlzwmZAHSCri/2EcPE7IBcDdb2PXZtwfcfxCwQ+xZAGaoo+qKFF11DL31mMKavujMivY
         gseSA3PKRf2OrzHaN6AIzTWXCzt/h2pu267si7G5s/RoZr1Zv666wUU1WEF5MWP7DKhU
         TQNu090DonI+1JtC2LhNj5HwEK0Zg6dTy0ZWrCcpbNejcQGwmiyoNd4yJ+9KJ44NuHa9
         RwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774459712; x=1775064512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rp8fxQCLwFBn0xp4OYUEop/+U+Xl4C79lXLfMQ92/H0=;
        b=UnSFZSneuWE2RMb8XrX+e5y3Dssy69vCQbPshpsT6KRNwnF5i1hqwabntx7Vkg7YgY
         8EviBXhhAonzoQciO0S6SDtyeFJb4Wne99aACyfdvm1jk6E5F1e1vz8yRrN2yvMeH0IG
         rAOe50tLqDraBT7LLAa8/NgLMYTOz7vonc1NZtQVDjBnpkcpicym9WcpKgwpzW2fBdyr
         xDn7x7BpHDARs+6C4OLtjbjf7E2CYWyVUooXvK/6JNFCRvPX40vNXVRkUlOirwuMDAte
         Gwyl3X888xBdDRFG8gmQrjGUEsQTb0IgjxIXUA6C0Iac46Dy+xUzfz+CAoD0XtvWIbPj
         kRug==
X-Forwarded-Encrypted: i=1; AJvYcCUw8tzdRKSzzttPRW43JLREc2+2NwtAfjAUNVIzS5AWawqs+NP59KweWdP5g1RzsWNcTGga5hV1ee4+aFPnSuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0LipqGiQ8M7L2A+KyXbFLcPJwS2LxFy5+VPpiCxcZuPnuJAjp
	WQWXjlUTKfi0p4cX2K0gg1aQigaQ/sywIJAKQET2H4tatMmncQW7zvjRoisB0xCbSpy/h7oxO5B
	GgiA/whsiPLsL9dEhTGWFtA459xKucnpHnBXNph+T
X-Gm-Gg: ATEYQzyhydsXj4oHXwUymFmnWY2DndexwJKu+N4Q3Pr08gVLycGWYcwvicQOR8yRK3b
	c/GU0sivfvSGP5it63Eb5apqjFuonm15DeGRQMSJ4XmwmUPWMYyeF0vd9sNPglZs1ywVdC/xBmq
	53q3GntN3jbXm6rM+Fz/n3+PSAM9/aAzjIwRDtZPUn4hwe5NKeK6zCcq45Uuj2U0Cmp+FFBkq2a
	pc2caEmnAllqWNNlfyO/9+6gNBdxTH4ioBAgOAbciAvmCW3TqsA1bQFqIOQLPIQ2EaqSpe7x1ll
	eZiCo3xyldUJCuxnLee1sVTRT0dvGmlZ3Xg=
X-Received: by 2002:a05:622a:1896:b0:50b:567a:e91a with SMTP id
 d75a77b69052e-50b80e0cfdcmr65591631cf.33.1774459711578; Wed, 25 Mar 2026
 10:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324205301.1361608-1-atwellwea@gmail.com> <acOVlten_N_5evGX@gandalf.schnuecks.de>
 <CANn89iLJJ3EF2-qe4AWJN0teh05x0PPJjOAfB0uG9rNZuJUZUg@mail.gmail.com> <CAN=sVvztL+bc2So8F9x50yQypyLEmEm5bWHzkXOOgdPFLG0MNg@mail.gmail.com>
In-Reply-To: <CAN=sVvztL+bc2So8F9x50yQypyLEmEm5bWHzkXOOgdPFLG0MNg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 25 Mar 2026 10:28:19 -0700
X-Gm-Features: AaiRm50fdH06bEwfDDCcCnkrWJrbx95K5zRP_Pq7KPdPEhsnTZViwCSo52qmo54
Message-ID: <CANn89i+gDhN-Zo8=WaAuhWGhDG-00tAuzE5XpGsPT+pOESX-ug@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/3] tcp: fix scaled no-shrink rwnd
 quantization slack
To: Wesley Atwell <atwellwea@gmail.com>
Cc: Simon Baatz <gmbnomis@gmail.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Wesley Atwell <atwellwea@gmail.com=
> wrote:
>
> Hi,
>
> I still think 2/3 is a legitimate fix. To clarify, I was not trying to
> claim that 84 is some magic number in the abstract, and I agree the
> packetdrill is artificial.
>
> My point was only that, in the constructed case, the old code can
> preserve a scaled window that is larger than the currently backed
> receive space, while 2/3 keeps the stored window representable in
> scaled units.
> That said, I am probably missing the reason why that is not a problem
> according to the feedback you all have given.
>
> So I am going to drop it here.
>
> To be clear this has nothing to do with social engineering, just was
> trying to fix something that doesn't need fixed I suppose.

We have limited time and many bugs to review.

Your series really lacks the signal explaining why it's needed and why
it's important.
What real workload suffers from the current behavior.

Thanks.
