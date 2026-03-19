Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584D63D6662
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773963818; cv=pass; b=Rxc0KwnATRZYnSeVxPQ8lVLU5b85LuGyTD3u9bUsxfpft9yYHE2OUzCcDgpwSxvPlAg5kRJsQ8HW/tpemC1lxNwU8wAouF+B+aelvFseqp/26StyTh/vkBTdHzgSR9ox9lfkfeEKURxMyHJJSmHGp8XMSTUub0fb0LYSEIA36GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773963818; c=relaxed/simple;
	bh=VTxRX+AGKykbXJwtykp/HSXepAAcrtHUIjosixpxHhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cP+2AcfG/CgCgA2onW27HQ3oKZCd5ryFD53hFRUqVEn8LLhmmIo65z7rNCG67ziCPLGzf0l4dVgnVOHSOfSn2+HXFMWo+4hkhsWqvPsUuVECkr36D24U6fACQqqe7gvx2cOfpCN5ceOAnpFDUmZkcgzP2ktOpb8J+2rZCPSOhCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dtJNmnmH; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dtJNmnmH"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a12c19affeso941059e87.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 16:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773963813; cv=none;
        d=google.com; s=arc-20240605;
        b=KRvt9KsnN7EX0yaaUxRRm1XBuv2oJ7L9KBqXPnZT+ybyHYLtE2Tet73G2HfGQU0o6Q
         hqFD3P/of/mCLS7OyrbpYW4h3iFqYYtbcDA4iRcH5AIgsLRa/GM6g5nlZmbA7oIn/m4s
         uUQN4GGMvWhD+/WerVJ30RDvztWC57U90b+rqDlq3fYmAo0MAoBePzOuObk7Ut0uLs3E
         U1CSEj6Q5kSenEwu+kroHMH7T197LMc5Wo2yV3Xa/Aw6z4NKeafk9IGiCe/H5A7+GYX5
         AE9Es4qdK7HVyJhggbwwV3LeKwYY2IGNeeE8lHqsL5g2lR6rtqR7Jr4XC5QA+UoWR51a
         ustw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VTxRX+AGKykbXJwtykp/HSXepAAcrtHUIjosixpxHhE=;
        fh=YktSCpm0ca8IwgWHR0sXGXIjncRHO1Ue7Yy8r5vwgZA=;
        b=WgMb8eXUoPmb3CJt18srKPZdJ231Da0V2ST5ptLH2S4EvnVS9shO9UmdxelAW5zpLf
         b9eiy2k1M/tKM8905bWWKkuqmBXInv3FWLIxwf/0UVXdWYzNlwMTHoElcWjeF/hkCeiI
         HMcW3Hf2tanekKFfoM+sLXBymBIzmRC1YK1maG9khEvNC552eUyfTjD266aFHd39aKnb
         +trWYpMkKOJYmoFWZe9+UdacFcJU91MrpuBiM/WnZCoeXsuuM3PywJ+iDfg3JO0RK3U7
         6Gph3jBuFICblG/USjfU962UWQMN916rvNaSeMK2d+YK6ntj8w9NODvYi1kcNG0arGLp
         oVjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773963813; x=1774568613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTxRX+AGKykbXJwtykp/HSXepAAcrtHUIjosixpxHhE=;
        b=dtJNmnmHdJSxi0MXxOM6idGO5cPE5KFRQgi8YrMddyJO9PosNcOokqOEU6fphPzEkv
         h+uHSSsl/Oj6KkuuHRz3K+g7uEK3I/Dbw8aQsUEstbSh3rSN4Xx/aj5t+DnFcV4CiJPl
         OSCI/H884V4CrzRv8FMiDDSLXOvhXbE017FMt+7HBjKTZIS7dJZmJyB7DAOcf67w7TSu
         vODaY2t0pNxoWMqgAb479neQLfdX+Mw8Ot6kSe2mpAFhLG5I9RRd5C5KY+4czGjpJX9b
         kASzkM/jJT33EnRJEWLCIWE4LlO3m9GNDy3ukoo6UU+ACdKgB4o96xlhX5WVf0dLftYd
         IrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773963813; x=1774568613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VTxRX+AGKykbXJwtykp/HSXepAAcrtHUIjosixpxHhE=;
        b=dL52XetJO06v0hM3s3MTSJ4XJWOlSyASsGkGgeWEHR+i+Spn5naS8Y8x+ZQDbGs6vp
         jUMlTIyGj9wGFjM0CWQZhGDhjEAtQwNCsOGC7kcZipQhPabICDAYWUw7bIjj0usUoUyG
         /+/1YKkU9wlzGAk4KbPKz4254BcvtZ/EI3qeZCKPPGmKHN5m49/YoDFQlEHxKtwaak1M
         nBON6f+5ByRphEChYZfSCn0DaitF69UloHbuSu6jOYgD/AxB8aeVdJFIREGaCaocIXEa
         J/jneSoWuuRaY2LabR0mXdS86DZTa+Vb8gUIP2FjvFrSva105gIfU0PLKR+Ep1pvavOT
         3wNw==
X-Forwarded-Encrypted: i=1; AJvYcCW2doJ2WRxx1+ZCwGU/jb/oTHG/aVgLmwrDBhhnIsiIwVp82c1Slja4G3Ww9rix8FpaEgneKo8V/f3Bu1vLW7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6jQSL5v2h5CPNw/RvIN1e6RZ82WtGKKjjT53+cvu37MI4Gms4
	lhkozygk2fxsCa4tPf6cb6TEHLkXVB6ZgNQ56WPc9S/+g6zSjUOyjiGUntKevF2b1jB5a/H1oZz
	Sz2p5S7NbkpQjStk4WMXVMALOPbPDu1+8Epyk3w5f
X-Gm-Gg: ATEYQzzl4M+aCbDAAJqnID/iVS98TnFkjOxSlzenCKZoqmh3ckZ8W/UM7xMYxwRfiVs
	dHmm0cfnLblv9eHYPDyFdsrkEDAxfz5JMLuVkDEDkuBB9eonz8bFljVKRXIVbwMOEgFkZmInRZ+
	SG50PjT1SJ825/tbxtVWcJssO+URswHIz15XSUrroiNrP6p3+l+ptFsBhMbJ0UCdZRXaWytnECx
	FIKE0aTqkNwqkafhaM7/QzxPw74w42cfiXJLBe31Hlgh+c2+lY9phQ2dZO17n/vwjuymDLuPjn8
	M+Gh15KrmL4HFc+Yvv0=
X-Received: by 2002:a05:6512:460e:b0:5a1:2e7b:d885 with SMTP id
 2adb3069b0e04-5a27de5dc98mr1324588e87.25.1773963813029; Thu, 19 Mar 2026
 16:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-vfio-selftests-aarch64-v2-1-bb2621c24dc4@fb.com>
In-Reply-To: <20260319-vfio-selftests-aarch64-v2-1-bb2621c24dc4@fb.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Mar 2026 16:43:05 -0700
X-Gm-Features: AaiRm534MfCLjFwMGGENHbU_DKBjVumsiYOQM8YxxMK1Pas88mVouCmO-lmvCvE
Message-ID: <CALzav=dUWartDcyoS09_mr-vziBeEDhKa4_Lfb8R_2wFcw9ULA@mail.gmail.com>
Subject: Re: [PATCH v2] vfio: selftests: Build tests on aarch64
To: Ted Logan <tedlogan@fb.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matt Evans <mattev@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 3:59=E2=80=AFPM Ted Logan <tedlogan@fb.com> wrote:
>
> Fix vfio selftests on aarch64, allowing native builds on aarch64 hosts.
>
> Reported-by: Matt Evans <mattev@meta.com>
> Closes: https://lore.kernel.org/all/e51b4ff2-13c4-47d4-b781-3dcbd740d274@=
meta.com/
> Fixes: a55d4bbbe644 ("vfio: selftests: only build tests on arm64 and x86_=
64")
> Signed-off-by: Ted Logan <tedlogan@fb.com>

Reviewed-by: David Matlack <dmatlack@google.com>
