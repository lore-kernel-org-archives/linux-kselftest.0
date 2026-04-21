Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0139A2BFC60
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776793115; cv=pass; b=lr8E3p8Hzm2psB16JlIIKxquxrq/QEtWxSJ07H5K0BWqa5qD+aJah4RJ6CPSIebQDegHkYBN6dT1iFtKZqaD+5S+fYslUpe5bdzuBrwnSUmGpGUTNl7tBc4ut5y+3eadD+ualHWTz5jchsFlM2LR/Kytg34kKsYBQRi2kFHjK98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776793115; c=relaxed/simple;
	bh=SZnZR6xff9RM5goVzYDgSWzr9sSSzdIU3mFZLeQjaZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kko4sYWSWCWMXxn9v8arAlnENNqgfy58HjIu/A8FXBf3pKken5/PGSSh4INrNRk9Nv5wThrVxwlMfbzKqq3AN1LlEqyyPk7kC2PJyRKds0VMNLFx2BeNS/JDelhcs8V89qrQGSUeGSeLLTgQpGNNrcHkvbOfUtDGloPE25+9+0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YD2oR0BP; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YD2oR0BP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ba922426c5cso286958366b.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 10:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776793112; cv=none;
        d=google.com; s=arc-20240605;
        b=PEvlFLKUeYaZ4esdiNDSEQCAXzk5/gfa/P9Pwh1rjZRSKse9USlZ/vSXQHv0/2BNFU
         dTg+u7BgpV+JrhKU3J5upy9DKEf6MRSbYX3mCFcwV1yOqiW75wfdyb+KFntKImsCRGWr
         Tau6huW+CAPolGlXGZJhV2Tdit9/wRoEQs0fPDMgRee0aqMWNBGFOsXPKyAmJdOSVC/C
         bPw1x/4fo5dhQI6N/4di8mQsUevLMsnnFHCj42nRWvfIOVRIYvDm4nV1tWt/09ZO9RFc
         79KOFpyKacWpg1vL08oS3aOKbSni8mwNvm3wuUbkEmeVq/Yy74lMNwAWTvwgzns7cqke
         usRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SZnZR6xff9RM5goVzYDgSWzr9sSSzdIU3mFZLeQjaZI=;
        fh=09JxdbyoBbPJWx1yU9QNZ4eJ94VQoy1/26KQO7XWOTQ=;
        b=MrhP7ViTsJI9Nm6fKORPmnEH+QGDg1HzbovnB+53kJBXrho1KGKsXD5dqeTq7aazzv
         NJBiSOMKH6gNjMzQSkNbzaM96feaZtgEAqdW/NgSnA+jtIcDr4Mw7UeJqxsnJNx8AQZg
         JsXP1POg2V6yI59M3krpClcRbrijikrJSHqe8PrQSZ5BZuGoXDDfukgIIUh9YjC1/+Br
         SVZJzayPJRnW7lZNBJiH+OiA7TDqrutkiKHl3EdJkZQEwNDK9b19wnZrqaUofxVA4Ghf
         5fxJQj5gfPwbnIQtOVLiQNJrtOQaWG8ojGvnkUGITKQsAoiJwEPyc6ZvYndMe7GdEdah
         cu+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776793112; x=1777397912; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SZnZR6xff9RM5goVzYDgSWzr9sSSzdIU3mFZLeQjaZI=;
        b=YD2oR0BPi6wk/dUg5L5MjZqsxRdBR95YFbyOgwGU0x8t2bMOAPRSsgyRcn/PsBRx9N
         xjFIefLzYhrQTsYrEUJjRp3/c1m2Wlu0NtH5H9ou+x7zo0TPsmIH8Ef66A4dpdAblusO
         MI5CWEOgDL98lH5nPGmUiIaiuslUwbR/+vRt/advRCC5ePcTfr0gC2DUfWbVMn6dJZ7a
         6RMLehJ24NIMCgeN3Vgn/VfrCL3txIUao61XclfiAZzK3QPMZGXPm8anyYf+L4/+BA5A
         991QzS5RzN+VjZkKyOvW/iRfA9e6IcwAqali6bVkfJ1ZngLtCPwilw6Wi4ebaDtupFOA
         duXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776793112; x=1777397912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZnZR6xff9RM5goVzYDgSWzr9sSSzdIU3mFZLeQjaZI=;
        b=jPilRtqxPkbDsqEGCvKH2lccqrOGefBlv6myBPJB4AASlfgYDK1Sh3UMLm2vTtRhXt
         aa2VGbOxzn9+JwZ/YaPsxzmgifiMjHF66iictYH/bYDnwXnsoBeRBag0meK9zH837fPl
         amo3su9iBdXVoQKB3fhnFTMdASLovrOo7Nd8dp4vl46qqSswmq8No07lDL0rV+uG0mjP
         TjafsNykN09CYoogZZVarSLo++jYkgU9oArUbU3cyAxHGovVPwJ4PB1eVUgzqtZ6Pj/V
         0jg0vMCTiM2hDy1Kj8irRjva4KKeJxRRejlSixf+VIibc3zMFxMti1oP2TjHRfGuOOrP
         ZYvg==
X-Forwarded-Encrypted: i=1; AFNElJ+S69v6xvkQUWBuIBui0T/kDZvgWhNDgeVvhRpU1pQgz+aJm7Eim/zRykTAWkDasPRsQpfmZXyBDa80LCkDee4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBWncQtPqRip57gqNodjQPX+kpkFEpJyCSL6YpNxnoARhTxLdG
	WzwnsbkWvG7IQtzI0UZTf5WEM8aaVbAO4tN7wxf/I5fjwOsg1PG9nJ43QWAPMfQrvMBLxsje+Xw
	sRGCUhvMMU5BXd1w/X3IOaFnm9ZjTdvw=
X-Gm-Gg: AeBDiet3Dm2Ij5R2RAAQPs0ua91qwznt5bvdy0FAyxp7Fx9jgbzeYswFfLKI6FpZ7LN
	Ud8dr8RN5gMuaTOmYPDCOB8y4P6PER+krFARaFXAnMiNThM9wvpMVAtjA+Isa9oVjLbnc82udSO
	0A3/AsB+4LiPE3kuwf63VhdpzsObP5ilbPFX+VA/5ArmZCPeypfUC9fk0yPu1+Vcg1w8C2oxAK1
	sb348FlhCcXUjBe46JFerKcwnPfygX2FHr0R/Pyn4kcEgcslWUFXbHyCSWLgCG8/vemdZPaNDjM
	mSdA81itaY1eIFIU2GxQOTUs0OINQUedMoVHy3FQOou3oMod
X-Received: by 2002:a17:907:3f8a:b0:ba7:b198:7d35 with SMTP id
 a640c23a62f3a-ba7b198818dmr503855866b.19.1776793112143; Tue, 21 Apr 2026
 10:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203063357.14320-1-linmag7@gmail.com> <202602041817.3967F048D@keescook>
 <CA+=Fv5S=XxDyNFdqhR3p_wEPwGEpjfE+Rqk1h1JJhactWFib_Q@mail.gmail.com>
 <CA+=Fv5SZK0eaT5Y_a-eTdZacFEcp36rF1YE=tyooDuVpZW=uOw@mail.gmail.com> <202604210947.C4D4020@keescook>
In-Reply-To: <202604210947.C4D4020@keescook>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 21 Apr 2026 19:38:20 +0200
X-Gm-Features: AQROBzD_czgDbhMDDFHAMaPvE7silGhZt6Bx5-z7E6I_tlnN5wHuhvwGMOA776c
Message-ID: <CA+=Fv5R6+aKQi_zmQjAbMquEZgsm46j9y68Q4MNijT206BYHXg@mail.gmail.com>
Subject: Re: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
To: Kees Cook <kees@kernel.org>
Cc: luto@amacapital.net, wad@chromium.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"

Hi

> It looks like the selftest changes still need to be landed?
>

Yeah, I took the SECCOMP support patch through my tree during this merge window,
I was thinking that the patch for selftest would go through your tree?

Regards

Magnus
