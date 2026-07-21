Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3E8367294
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640817; cv=pass; b=cMqxgKEG8ruABEfaNZb/ewcIbUyql28RvajN4RQMdfiYuKR6vm9l87pIs56FumYLlxOszgXpPtiMTSWUCJLx2LlXl40/ZIxF171UIC3sw+IsDRoPDyikq1LbfjjcplHnO59J1MxrMoJB9pDdGksyd0BrPm38lhnqAZcK2GcMYbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640817; c=relaxed/simple;
	bh=rNzrvZM88XZhJ/ibbATDgXG7xLkMNA1yYRwnbou2tjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfhbqIdxgmiGAC5A9NqAFaDaHrMaG6E3JCy8uf7o7akfkqKLproK5Z/HwRsv2WXeWXlXv24E+nPFuzdBet1HwMv5PUWQ/mpC0YTwhhxR87DYUqRHvCmx8ZF/jBBBUpsVEEWwDFXuPjqtjbH/aL3ScpDkAvpkVFtFOy9+ksp5blw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtlgC4zl; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtlgC4zl"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba320so11192074a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 06:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784640814; cv=none;
        d=google.com; s=arc-20260327;
        b=UbBYc8QUcFVzfa1GU6Fom0VIwImcJnyT01s/YTFeW45SB5q/u2r6bPvRSabxftCYV5
         lFo93r4wjgmAKdQ0l8RZFCo7NP0S/c6O9HKmdks1mvdior8lv1KTPLCVd1cMCY610YR7
         RJ9AP4kvefTPSNLW8xnwCX1AA7mAHxh8T4N054dehGOYsKMEpY/qEpau01FGN20w5yYh
         r2p0jbF4qpHBFjc7Fp4qpZzDClsoUIt0OCh76cOYkDYOxGxVkMxIte08kN5kTp1DSpjC
         cyRR170B+jvHumFKz+EuVPGcErw21+qHz/DTrvy7CRF6y7uoCNKlP+8zHdoWedyI3siU
         5Inw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f1XXWrkonfhWp4x9b+npN+8YhmLz2dbbZnMxAHV6hr4=;
        fh=BA0Z+jQRbh7Hw5V65Qyxo988q/xR3ElFI5xsouqk5fE=;
        b=kiy7syK0f1ikFHp9R9qTn0qV1qsJyE0YnTLa0hprGke8w5PkG96heQeR5lBvvVLxZR
         y5zh1/k6ATbDuUr18QLcs9v+R51fh3nAw2CUMmRcGVdWzfligl25hPquEEkv5f68VXOL
         1FRqqgGSDa7/YrDMgTt+zGz8dSNzlVbjQpkUep/8wuxqa6wPyz70gqkHdecVFC3xksMx
         uEt94d6d1mzva67sG68AK+m2m/pK2eX+C8NYt9C/T6f2nKgJA/zgLtNigO8d6TQdPtvt
         tcN6XHCReexv3UnG/+lGNsMzqG13MwpMei6J9uXnmsAf/y1U7zpyL/GGlpGrxSyeUNAq
         LQUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640814; x=1785245614; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1XXWrkonfhWp4x9b+npN+8YhmLz2dbbZnMxAHV6hr4=;
        b=jtlgC4zlfPLzaLm9or0mJhs/AcM65EgvldNSFFFHmXRew3NPDVeAzNG5ZZVH7HsJ0X
         lph7r6AIIilafFXFi7UX4bK7LSs35SbauWVtXz3PtrABHTKTpz+12MQ98/USNxD/IGRb
         y8Dkw+hj1lNenm+cxcbxYXZXuz7u51gHndAAnsuH+ctY2N4FNWZhoSEYBuO7cpMUQLhu
         C+XKe4MfkZBvqp8Hi35M3Hd/lOUn2D/9ADImySUk8lYz3tpnEf1jS8lYvXUQfFItqRQk
         sfDUGGoeDPvg+jUpDaj2eln4aqyechg0qIqMjDDQkICusHsdKj+RyIdU/0y0Pidmki9u
         k2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640814; x=1785245614;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f1XXWrkonfhWp4x9b+npN+8YhmLz2dbbZnMxAHV6hr4=;
        b=lcwT3Etyobox2caB4pK06xoPARpFZZX2gCmvIKGbUSkDGmtura2x3rzR3GLu6RNMzF
         Zc6VfQpfPWnaJ0Bvd/lALdarCpnJ0h4vR2+QQVbqOeRQa6GcBMXA68RJYcAGENhqeJt/
         T9Wv+/bzFRU9LjJcF4gK00wZEzDg7BDjkHt6NOYOLixLMp34PwoYYrGzUgmNqAkeUJYo
         a7yGUnuk1MnzG3ytAKYrilrXbIRGl6pXc9d2kIIamWtMGO0uiR65WXJjtB0gDp8ldfGP
         m2MAo3g1+ZRoa4O8Mm7d7LMgoBU2V7sew6wnTBGQzJLNsu1rv4DjtaSvGhGDAl+wtjq2
         sq/w==
X-Forwarded-Encrypted: i=1; AHgh+Ro1bxkzreSqqYeumo60H+KVfDGeNhOPGiRyGHj1h+IX+t/RQ9eMXZXUDANiviue9rHh8or3311gChZdiV6X130=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9mfqNIwtOGp5H7oZoSsFE7OOdus6pyiFMHQn2cE0ahRG8GI9c
	1cycL8IPmR9b/ctqKwn7tBC0clYcziGvEEgebeMucsSKaa61uUiyU+fBXqOUEhIQ3pbmMIvV4l8
	oLdbzOAOL+Fryq+w3keC92dY3GOjfkps=
X-Gm-Gg: AR+sD11uE4kRRbfH8rchGCCYxDNuIat+S9VCJFrVbjUSWZDi9vT91o/0IxaOJ3S1FRz
	M9zuTyMCRSwxDTR0TlQ2q9Wym1T3THKjve/OLGHVLax9mfy9+jtCQE5vprtMPGaswXAzTri+GPg
	9NFy5JQ9t1dZRDS/g68wtXa+/BJbXtsJIlsJuDW/5fdj8w+6RPAem7L/M2TS8+gBr270vUCbocm
	ultHy2KjUfbh14BsYVDa7sQ6mn560nLI4hrszRWzywSR53Er5C+9j1+zVnYqGk=
X-Received: by 2002:a05:6402:40c7:b0:697:eb97:a4ed with SMTP id
 4fb4d7f45d1cf-69e64dd54d5mr7238368a12.7.1784640813894; Tue, 21 Jul 2026
 06:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-6-luis@igalia.com>
 <CAOQ4uxg6WHG1S4--ZN7dsEnYOKY+q8y6qCNYL7=UE+=9G4-+GQ@mail.gmail.com> <87o6g0o5kf.fsf@wotan.olymp>
In-Reply-To: <87o6g0o5kf.fsf@wotan.olymp>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 15:33:22 +0200
X-Gm-Features: AUfX_mz9yUXAR3es9RA7Uhh_aBNVWfJzCtuGsyVUMkBx_EfvpbZEeVo4PEoSjPA
Message-ID: <CAOQ4uxjTs5xh3-bMOOm1s9j0LiKchtVj+z0ZzK=EEepeR+uweA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/5] selftests/filesystems: add fuse ACLs caching test
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"

> > I think this test is already covered by
> > https://lore.kernel.org/linux-fsdevel/20260713220932.413004-3-amir73il@gmail.com/
> >
> > If there is any missing coverage, it could be added to my test,
> > assuming that my test (which tests a regression) will be merged first.
>
> Sure, that makes sense.  I will make sure that any addition ACL testing is
> added to your selftest.  To be honest, I saw your fix+selftest only
> *after* sending this RFC :-)

Fair point.
TBH I didn't see your test either because I was too busy chasing the
ACL cache bug ;)

Thanks,
Amir.
