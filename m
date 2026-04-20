Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2DA20468E
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 05:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776662004; cv=pass; b=Ndy1jVxehiQOyf+SBMKe0Lt2PjbTwc/hvBS5ZFGRgLTL3XshUc2AjmoIx9PkSaw+XNGdtpo5OPVU1nTm7YZ3km6pHNIQhomQRBOw/LxtsEngbf6FgualJGYIGJYTii1lij6x4lS5Ku5D1CGIkTUemnQDJoPKjP0GyR1yQYIGSQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776662004; c=relaxed/simple;
	bh=lfk5vO9NllLo/pVyxpp8Fa5VLC89H3d8HvkuOkLm2t4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRkkOcRdhwqN2f7NqfXFQ8qGPuD5aaqqxc64fhUP9/DPwYUEpzdetNVhaR5GwSNBdDwR1c2nYmxl8Pcm1pysK89usfLOrSyT6EL0JHjvXc7pi5d2R3NGenuX3A9B2jGWY3+XtmWNUyl0SKCN5qq/ze8WkLbrPz4guFSXY3VVOaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXeOOphF; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXeOOphF"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so3956542a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 19 Apr 2026 22:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776662002; cv=none;
        d=google.com; s=arc-20240605;
        b=NEKM+tZkqNpwhcgJwVjqfMZwHVsisPQlELy0CM098gwio2pgHEsrQv3cXVdLKoqyuX
         47IPuLUmXiM1BgzWAY0CgCjzIrkRS4vWkeTiH/6bggmkZ0KIBuMnd0nCfHqID7Lk545y
         iZ6gyGfNBu2gk6NwWqJcbJDBvhZKnJA7rFUiZtDNJVNZNJAx5H9XgCsBBlbrTjCVu83x
         AzqU/jso03qp0jOxQhlPtqChG9ZQWd84rzfc+FBcSVHAa2HvLoWJuHHoCTkXlBF4OfIw
         hx+OrIUaxxL4PfEthu2xY5b2+gHV26N1bTlbBPHi9YkoPH7VE72+sEUn0rcGks9GGN8z
         sjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lfk5vO9NllLo/pVyxpp8Fa5VLC89H3d8HvkuOkLm2t4=;
        fh=yGAbZnP5EXSX70ycd6lZdBklF8UL+d2+QYCjU1Ek3s4=;
        b=Qeapedb2NS3Uj5lEDx0E9ohEOs+Q5gIP2Azt8ak6S71BF9cqsraJafVTUWU/Xs4yGU
         flOC5HWiVfgjV5c5jClyn/ePkpAaPdP95rT94C5WED5bdMv7odTtcYu2F/aOdWdOirH4
         DFNMRtCJPNL2bGk6xYKb/uMc8Pisafsy+EDOpo6SwXKwGcQZumRKzn+igGuoNtPhEOg7
         PznNp4WDqnLB2mgUAqLDM3pvNTjEIp3iR4rQzXTqgYRHYXNKp644VGXJ/vXrtYqm1Ufy
         VaeDfcbX3X5Zug4RRI0UpmVV+4o8JuZJt6DlOyDf95DCUThcsv0OoxrcmwOKvsJ2vT6g
         Xg3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776662002; x=1777266802; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lfk5vO9NllLo/pVyxpp8Fa5VLC89H3d8HvkuOkLm2t4=;
        b=HXeOOphFynL5Onzgd2GXTVKzZ2s9SIG5DipcQ4+3xoAXGVh3Kzu4IR0UWnqOoQMzLz
         OX2i1ysz9SW8vwpt0yIi4F1GfIwLh3SiJiBYHgr3/ZOs4OfA65o0rtdN5KE9lURtmbLP
         tYNk5eSiI74+Xw7bsEZVqASRmvpCaOT+qO3hYHbhf3MtfmFOSWXAPDjwptq4lEOSRw7z
         sGEakri5KGueJ8Oj1wuTvxTpcu/CF2T7dvd+VlegHpoxGdiqNOVpKaLiS3lSFkDRK1i7
         jHWpRMAPaKmIUPzhevRJm6DYoCaXAP6gOY4fav7rm8328OKQ+d7yTIVV+EaiM/VAV6cZ
         tzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776662002; x=1777266802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfk5vO9NllLo/pVyxpp8Fa5VLC89H3d8HvkuOkLm2t4=;
        b=UAdAwrPGLr8NpoGAMRRhVRmhllEaExrw+7yO1coqHszS3vF4vaOjjEFzhj5sqt5ekI
         y+OKUOIsvSCZVK4PATIfHJPh87wtyz/baUOrD+ZInncn8KalIcr816pO0tQRnRZn1lpN
         BFthVg9xCws/vlbEtZCdfACQ4qa0R6Jqn9bJoK6V2YC4wFS+aVJa1eEJdPHqXVOIFJRb
         GVfzcqoX/NxfZcCbNyIBivdHw28oVxk11aW2hpLRxgY7L1Y0yqjSYI13XqsM+tGPNRuS
         edxQfrr4Cy4kD3oCQIS+nNiFnB8S3HwkFZHFbZ2VcNT4jbcsC154qAon8R3cMfhGw1cm
         1V0g==
X-Forwarded-Encrypted: i=1; AFNElJ+r7yTPooXtusKxwELOBJmNC/ZISzG/XxD6Bs9HmwQSpGBRGjVU5D8lIgQFgDbpC00sEYiPfVUtgB60oaNkFWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBX125oOlswWPZFmPk3HknYSzZHeNbMM/D55+VKy3uTebmgY+r
	roFi9NWZhqdfe6QNjgLzUMyv7F2qP/NTjF6lWcnv9NmO3Wt9jGLYFRVgOvKyJg0ijUTNiZ9k/Aw
	7tgSBWS9grnALfZ+0n1EwFaPlZy340ns=
X-Gm-Gg: AeBDieu00NLioIMx7xyjNcYF6G3O7TOrkDxNS348SUPIGxCAlUaB+AXT4vI1BS1C9an
	4W2qVOoi4LEKC0wi2QpyFaG4w/S6X/NPUrQRvOdkCJ5pMlOF4YnKtSNWIkav5q8NqoDSOdue8In
	Krvcde0dtdOcb9I7+Lq50lpnMUTyTAyjWDPmexLaL+snBemeyWmATfrqqwxrGV49KKT9wTCrPME
	W1rYyaQN82rPeA0OuM9VvWN0Y8/XqrLCQl4LmGeY5vzy5yjGxtUp13lAaf4MQEnFskAL1T/GqHX
	OhqQC10FoioL1ODkYgaNXNqzRUxr4vqVfxnudujXv5KtYmaC1XU=
X-Received: by 2002:a17:907:7f9f:b0:b96:db80:ea59 with SMTP id
 a640c23a62f3a-ba41a91e004mr579706666b.28.1776662001437; Sun, 19 Apr 2026
 22:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203063357.14320-1-linmag7@gmail.com> <202602041817.3967F048D@keescook>
 <CA+=Fv5S=XxDyNFdqhR3p_wEPwGEpjfE+Rqk1h1JJhactWFib_Q@mail.gmail.com>
In-Reply-To: <CA+=Fv5S=XxDyNFdqhR3p_wEPwGEpjfE+Rqk1h1JJhactWFib_Q@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 20 Apr 2026 07:13:09 +0200
X-Gm-Features: AQROBzBeXCArrE6jx0ALcUOGLkKhbjvGqyfUr2n94u-mLQvH1UXdJXQ9JFoCbsA
Message-ID: <CA+=Fv5SZK0eaT5Y_a-eTdZacFEcp36rF1YE=tyooDuVpZW=uOw@mail.gmail.com>
Subject: Re: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
To: Kees Cook <kees@kernel.org>
Cc: luto@amacapital.net, wad@chromium.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"

Hi,

Alpha support for SECCOMP and SECCOMP_FILTER was just merged into Linus' tree.

See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/alpha?id=55b22075f7840ef48254886758976531fe146609


Regards

Magnus
