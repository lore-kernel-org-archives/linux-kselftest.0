Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E6A3DE452
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349302; cv=pass; b=jDLh6tn5MiOIZIMY/ZrN9n28/NJVqLddj75Gy1zbdUaUDqwu+N02sFtUBMf6OjeYvscAQJipy/m4qxzFOLmVKJ7U4iXNjG3lxCgNeLTxMeVltAJbT2RiAtnDqCwXli9kOJ1CtOknEUXRj9wb4amIYOQqHfYZvyJcg12krtHDq9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349302; c=relaxed/simple;
	bh=MPSStrB5WQZXjuD8LVCQJRe2/QVXDyCuUjmphyPyAE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=GPqajYoGVz7/Ogw6B89TG6IBSzlzNtwkqZjowSQ4n7+9yjgPEx0ISv8RCP1i4mHSKNf2GJl0Mrd4uTzUbtJsZ1ovMM3zTWFL9UL2V4GqjOwbmThk4y2Y1Q7LDNAigfpdCTu5WeIwAO2pgr4aUVLVd1bD7WeRTZh5lhiMb5EUY44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+O+I06/; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+O+I06/"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-953acf7ae20so459100241.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 07:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776349300; cv=none;
        d=google.com; s=arc-20240605;
        b=kbUDjIwfLk4k7WeZ+2C2SIdUGKs42gqBOZ9kLIJWpw9ICMbv6Lz45cwlbmmv89MuXS
         QSSdfXxaXiWeqdVnK2aEFuu1Bvsh1P0LoZC+SZ4FZkGsL33vv4S+6iwouqi2g3pAzlmG
         pjc0wkhJ6hgcHbu3CFe3XQDHYb+aReURtR2xkSa226VaZK/fxfNpHVh8tnm/ThrVs7Kf
         gy2FrH8UfngpZFQ9a1fW3scSoEs0TlAODLh2GI7penH9UIRHELZaqc4ojZmJJvwu4+Pk
         wCABCVBQLxSkbCpFLW01FvTKtlCPKychWIqN1fzzv0ZhMAPl7C0vTtiXaphPfF+hJVig
         7s6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lO8+zS1qnuU0zyUegMfTKGfj9Y7WBTQIob4jJAeuR1I=;
        fh=oBPkse7hcQlrgH4Igyxwsk1H6JA3370WIrSnddG2o7Y=;
        b=J6se1UjK8vkEgbc2ULWIWRo9Mwclt0GZU88x0515R7j1Y+EZfWz1P8YMtGyOxvYHuk
         d/WoUpuipAXyrs1ltVLJStpgO6al8pzR9h6Nv/Si8ZlUzNZ11K77Ejo6s+6ENrzPGXik
         atc0gHRKSyVc7WxRJSO+AO5UpODD+QAhJeDIk8CKwcYmSHZgk53DVJ+arlVbfNVkuFMZ
         zR3H85B4Uxde/+5Clq+mKlf3YAq1StVJm+1Jq8BUK4C1gVzgxRKdFm8IryClVDnW5xDY
         mQDOaXrAOn55BYOTPqQY0UC+oPzuCylk12c28cjv4LYURh/UgCahdIjj+owyyUZJncQy
         JSUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349300; x=1776954100; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO8+zS1qnuU0zyUegMfTKGfj9Y7WBTQIob4jJAeuR1I=;
        b=S+O+I06/bsndk1ren2sbM0LafnTLke5s/YTY8d+xK85qFvLskc9abtgZQTAAGdHXkW
         gQ8OcqsAvXDSUsE/qTNg9RdNmoee/lFXrdR4ucPesp6PxtFUHBJnk2opxD4WhF7p39fM
         JbLJG4K9nLOk1IWPQT6/9UECkqMXhPWZBwfmOtBlB/tDpW5BKsMpvE9DTyB4a3Knto5N
         O6ngJcs5AXuxkhGkB6nfrl1OMvAfh3fOP4DF0wVQe0Q8EJ96obTWMCn/Ykaj1QnqTfbR
         Y28+pO3WR3EhH13uOiaw9rJINIUVvIgJe+Bk8hsVZpSq8xjX+CnPVc9rKipwxH98+XyE
         eXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349300; x=1776954100;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lO8+zS1qnuU0zyUegMfTKGfj9Y7WBTQIob4jJAeuR1I=;
        b=H6+56gYFhqsZ4kpkCNiZCuS85bTo6wmREwR+u4OYKkPACkpfS/gr2CALDG7h7aHpAM
         FGOhin6h7+Ob2bZ9vaDNdocfHuEguJjGAAW/SZ4gVWghc3VTll7BcuA8dXs3mDjRCart
         UcJL9iwgIxMe7qoNE4fbvWfP2u8IZkoLlV9Riaz4sFQSBqhKGavaA88c1IMq+h0lsRSN
         jYMSR/mq+qALWhaul1x6XgzD9kXEmyF8DfkU7eF10r0aegFVOioqedReSsEKsNYPFIpz
         dPAUTI6jVjL1NDtlpr0w1IvdPBtnNqisAcVm6+pL99RR+TKr77v9W44/6Py8jXgiaUm0
         JuPw==
X-Forwarded-Encrypted: i=1; AFNElJ+xmtQmrxMveq4vWfRKlQc769r+14f+vZPm2LX0hLf8bKCfRzDpvvBJUSauG7OxVI2HpqL4g0iOtqLQct/zvzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziitrRRL1lSgNW4/nVnzWWcPIoCgb6JFQHu4JKfKVCdziDD2GU
	590shAsH1z9Bb/Vs1iFTpJ34bdZbUOs7Tj8Ml8CXrECgwtW58cOtvrSwGLVce2DIESRIDnqwYMf
	tXUoNryE0ePPy+WK15ToGLdlkWXRTRcg=
X-Gm-Gg: AeBDievgDAvuiv26Q4GB/OKZ7Xa3Yzixumg+ZWa6yOGjvOvLFOAgNID5PGI1iDleN1l
	v4oNnWKwkLK1ZHVzc1TTRlaCFFbUG73zot3tAC9b2JWc15mXPFeJvV0yvgeMIto97Wdfglwf6do
	DF18WCKoB1aAUFRhp/LF0/QwIFcjMOC2hLXimL/Usjy5G5l/wwWHWQTHCcdcO5QhRcvH9N4ae1A
	FBjuQIAJ1BrfvHHZu/bGvC1ycTsK06Gk6mlM2tn9Z3/dVy5c8+6IkwWnOTTQMCn+CiDXathRaDc
	KtHEj1MPRSbu5KY2MObLPUpF2mfwoOofnu/J5sXaQA==
X-Received: by 2002:a05:6122:608f:b0:56a:8f7c:49aa with SMTP id
 71dfb90a1353d-56f94725c32mr1843622e0c.4.1776349300022; Thu, 16 Apr 2026
 07:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328172314.45807-1-dorjoychy111@gmail.com>
 <20260328172314.45807-2-dorjoychy111@gmail.com> <aeDpIgfDaIKEaBcL@lt-jori.localdomain>
In-Reply-To: <aeDpIgfDaIKEaBcL@lt-jori.localdomain>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Thu, 16 Apr 2026 20:21:28 +0600
X-Gm-Features: AQROBzCVSNvQ07toCtw3F1sHPLg5Z_-nre3iq90Dw0MflD8nQqdsL_RQ56rFZc0
Message-ID: <CAFfO_h6pkyX=uN5uoXda6toTtT6KsahfBNBLom9i21HdZ7JOmQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] openat2: new OPENAT2_REGULAR flag support
To: Jori Koolstra <jkoolstra@xs4all.nl>, Dorjoy Chowdhury <dorjoychy111@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, jlayton@kernel.org, chuck.lever@oracle.com, 
	alex.aring@gmail.com, arnd@arndb.de, adilger@dilger.ca, mjguzik@gmail.com, 
	smfrench@gmail.com, richard.henderson@linaro.org, mattst88@gmail.com, 
	linmag7@gmail.com, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, davem@davemloft.net, 
	andreas@gaisler.com, idryomov@gmail.com, amarkuze@redhat.com, 
	slava@dubeyko.com, agruenba@redhat.com, trondmy@kernel.org, anna@kernel.org, 
	sfrench@samba.org, pc@manguebit.org, ronniesahlberg@gmail.com, 
	sprasad@microsoft.com, tom@talpey.com, bharathsm@microsoft.com, 
	shuah@kernel.org, miklos@szeredi.hu, hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 7:52=E2=80=AFPM Jori Koolstra <jkoolstra@xs4all.nl>=
 wrote:
>
> On Sat, Mar 28, 2026 at 11:22:22PM +0600, Dorjoy Chowdhury wrote:
> > diff --git a/arch/alpha/include/uapi/asm/fcntl.h b/arch/alpha/include/u=
api/asm/fcntl.h
> > index 50bdc8e8a271..fe488bf7c18e 100644
> > --- a/arch/alpha/include/uapi/asm/fcntl.h
> > +++ b/arch/alpha/include/uapi/asm/fcntl.h
> > @@ -34,6 +34,7 @@
> >
> >  #define O_PATH               040000000
> >  #define __O_TMPFILE  0100000000
> > +#define OPENAT2_REGULAR      0200000000
> >
>
> I don't quite understand why we are adding OPENAT2_REGULAR inside the
> O_* flag range. Wasn't this supposed to be only supported for openat2()?
> If so, I don't see the need to waste an O_* flag bit. But maybe I am
> missing something.
>

Yes, OPENAT2_REGULAR is only supported for openat2. I am not sure if I
got a specific review to not add OPENAT2_REGULAR in the O_* flag 32
bit range. But as far as I understand, for the old open system calls
we can't easily add new O_* flags as the older codepaths don't strip
off unknown bits which openat2 does. It's not easy to add new O_*
flags for the old open system calls since that could break userspace
programs. So I guess it's okay to add OPENAT2_REGULAR in the 32 bits
range anyway? (Also lots of code paths take 32bit flags param right
now and those would need changing to take uint64_t instead but this is
of course not a reason to not add the new flag outside of the 32
bits).

Regards,
Dorjoy
