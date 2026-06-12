Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB953A5453
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247461; cv=pass; b=QGyY1PF21REmZ+QqoV8j9kqIM2szn/RO/2jZY3Cv2VW+DIxCsBU3V7E4TE/vI1sIvo6Viyr51c1wBM+6S5IBLlj/ayoszPDE8d4mgsRE+jyN5SSMD90C/ArcTM66ItBAHtJZLKzIyCE8FgzMQU7mKGmC1wB1VUqNszIRyE0TN5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247461; c=relaxed/simple;
	bh=lKIPvMknFSjE5D3g1xxyCLi2aju86fxE9FpB18IoWzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3mT50AbmOIEWKIVoOxVPSPfnDqvphy+NgIbNWJdTDuXIatQObLo4y3SfGZ27adT2cRMC+Yfw3U63jWyqjiNpgctMbW7j6rArGnsOuSY2thWiMiSECUSfWzMcKez4dQrmOtlY5+fHbpairnp9ngJfPGYpUt0QILrlCmLaYg4VA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVdwvZlP; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVdwvZlP"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so1175921a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 23:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781247458; cv=none;
        d=google.com; s=arc-20240605;
        b=gtXblnc4fQQlARTC6zrSsenMbCM/9q9Ri4y6O1qhY5XnCMl8f5naahcXJdvfrwqaJq
         uCaj2cCZ9Q5CotM4+cxtmYaZN0Qku1Mnov8E7zL+pV8lBObZpWI79ZVbz6MGDYNmleJp
         Arw6jQcviNwdSOK/5aGSdB5J40lD3A1h/IYHW4dL+L4zM2C6vum7DuQcWgnc5MbeNons
         vpPs4JqcPHSj4D6SBMPHvWNUm4vZgGxjIQevtxpt3t4v6jGhuWM1LxJIXSM//xCQbDm6
         EiM+ZGtZfhI3Vdv9/QZ613+Jqv0trbJfJ8HxWrHAy2Sq+qms+pdUUrrX3Ar9sXg8boZn
         QFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lKIPvMknFSjE5D3g1xxyCLi2aju86fxE9FpB18IoWzI=;
        fh=BnoAdgp9cUaCjjg/XH0LXt1EeayfkyUJSz6b97Tj8IQ=;
        b=X5JeD6hN0+WFwTcLzz7sQlJFsqDm/JHGj3JldMYHZp1f9Fn4cLuXe+RxWMi8MtQ0Xl
         wzlDGuU1H0yJyeMqEOOcqALruLb/Tip34Z5GSgDCYnOuvyKy9gWkVMP7ef9RAUxEEd/r
         VVyO+WS7Y7riFzSQIxA+V2U8DG6ZvtNxcycmNyritooGKWBJzkuuAeeCKGEJTAGwdPWS
         h55r7XlSTpgYe51xhf/2YKi90gDiiFoi9Zosj3M+RZn1fWaprwN/rCwfroggEhbTIzs1
         1APXqOgj0rHisZqiIEESU/lcVGS1iK3yDfx7SD1J4ilNknFvuK9QohnQVLtoVeHWsJ1N
         T7DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781247458; x=1781852258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKIPvMknFSjE5D3g1xxyCLi2aju86fxE9FpB18IoWzI=;
        b=TVdwvZlP3eKEj5V3RArkPNDpfcJoinSuGgsGZzoFdzeOk2uc5vWdt/4UyJK840ytPw
         DQb8ZkJrWBH4Ycs8iLmcTzOHcon55/QAA3g/ylfkuWbRhmCU5/HeiDTHt0XlUdXmbb/i
         gzn19iUgKFBV4tQAWidlc+kNqJa+sWPW0EQWY0PIotnm+PLi0FCEHfnQuadxPKKwz8bT
         rsZtVtkS6kNVAK/9law2VdGBEulxNAkyQ82nWcF5/+5IKrS6BFXhLuGQExQOUBp63BL5
         V7st3Q3nYGFqrJ3w5rk4zDWU8RXjjCpJ/28R+PXzfYUOh6N0QsrbFqeIeKULihgDG1q7
         eygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247458; x=1781852258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lKIPvMknFSjE5D3g1xxyCLi2aju86fxE9FpB18IoWzI=;
        b=V51aftJ09vqWR142oOCCgf0EyNax4V0tm12U/Y+rQwTTrAFGiMqw6VIHth4ZOhNFql
         rRkFeY0ExOmfCkTEfQGCuAM4QjtWNGQ/zEZVNVy3zOSakgisdlwvE/OB9/5YJkFTsMBE
         Yye1ojCmCfNGVUC2sie3FbCwgYmlEQRbg1i+1fTLjWeLJ30ph1NghCj3UHhoMDvqdXMY
         nWoCgyZjm0nxDpsjPD2z84ux0JdQBzCOwK7zum4g7T9Woc3oBJGGqBr65EDkssX4KJpP
         yPnkShKDFNdBH3e8JnlY5fiWb5nxnAcEeBMk3kaifxfSlvZpYaI3jHzCx3COfcsxjqwc
         JdJw==
X-Forwarded-Encrypted: i=1; AFNElJ9AMPMAZqwjrGe+dbR3N83zzyzlFobwU+JgvAiqacKSkO7jCvOznD0va+ydhV61UOhzZGv1TXubpAwbzkYulQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+4Fxe2SBIE4cvny5YjH3mAWOBXJdWy4g5BjslrB4YKOiebkV9
	3Zkxko3ccdcM4aEpoBabxoOHS7+1f5LsRhlWpSmRWxwH/aTMYie1Kb79GHOsecmWJaqTEr+5PLx
	e3x2l+9c1bzr8k7Ekg6rF6s31NDv5n60=
X-Gm-Gg: Acq92OH6hUsDosxFHaENjfifXXIq69FwefHwK8xvYbqvTAZZFoBZ/0dBSvV0kbucNZQ
	Kc64BuDIUyKOfdghNTLoHorRlBHfR7PftazhKKHTnrpK8so/0Ik0eBtDCTvt9fyorPZ/2g4H1zW
	P+Xb6sznqa3tubJxogDvwLCOVw9qxACrfOTdpX73yb47x+PI5d41jj3lb2k8kyb+ylgSER91ODD
	dZr4+ZOdTXiimgkUIUwuiQUL39d6+tCNrZZXqNM7jl/PAHnzJIT9mDyYasclYfqR3AGWu2FF9t6
	sKL6g8Nhe+Qd9lHklWEtcIEYN4ZiGTDGg4R6wE00GQY4XoA2BF8=
X-Received: by 2002:a05:6402:530b:b0:689:6c2e:6cdf with SMTP id
 4fb4d7f45d1cf-69378177712mr619365a12.22.1781247458101; Thu, 11 Jun 2026
 23:57:38 -0700 (PDT)
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
Date: Fri, 12 Jun 2026 08:57:25 +0200
X-Gm-Features: AVVi8Cfpy1G0RZXF5eSSncQcJBRrkN88SHt7N0V04O8PiTWBgGHUAU_5EcdO9RY
Message-ID: <CA+=Fv5T-CMVrZMSoz-LiqQo_JAFhOZu9Wm7JTgwcdV=5kRMVGQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
To: Kees Cook <kees@kernel.org>
Cc: luto@amacapital.net, wad@chromium.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kees,

Will you take this through your tree? or do I take it through my alpha tree=
?


Regards Magnus

On Tue, Apr 21, 2026 at 6:48=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Apr 20, 2026 at 07:13:09AM +0200, Magnus Lindholm wrote:
> > Hi,
> >
> > Alpha support for SECCOMP and SECCOMP_FILTER was just merged into Linus=
' tree.
> >
> > See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/arch/alpha?id=3D55b22075f7840ef48254886758976531fe146609
>
> It looks like the selftest changes still need to be landed?
>
> -Kees
>
> --
> Kees Cook
