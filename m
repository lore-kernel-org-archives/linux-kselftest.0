Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696023BED1E
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221603; cv=pass; b=KT7oYTD96/vyYgslSnHIz18rdkxeKrczsEUhKV+QOQm0pMsliHW0bOBRh6opzOe3+r2ZcL6Pg6WGekGXVh+VuRZ5/5Ew4a8CcULgYjSNoPk/gUIEyZBAK6+cmT74hi8o+QUdq90XeuWgJIuONCo1xe3dhse6xQSKMPegmPKQle8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221603; c=relaxed/simple;
	bh=DghIKmYGd2hbT5j9h12R+ylPqCeMoSdsqZetsAXpcLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bn3QBQGr6qC36XuG4+HuF4K4YAraSa4dhH/i23gjwbLDDT+pGRdQswuqxcZGCsOPWgcsDsccuLI+VQKY9Swef6tAGyJj/8z3cbBRYhsgLOA7de/NNgfVBskDQpqtOTtmHrskVCyqwGKPea4cgW56F8AdKtHBVlRWEor5SL4yoiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=Nh7u9B1K; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="Nh7u9B1K"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceaf8a1265so42456765ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 23:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785221602; cv=none;
        d=google.com; s=arc-20260327;
        b=Je5XGReaAEWbZsgJM7AZGYI1kqVmVkJ+YSnkccOxSmpin0JpDEntXBLeA/TVWUpDVe
         o4tNlT19LuaoEtVebTtgzJQLT6yPpaS190QWF0rLyjr8+3RvopDLVm+CJ1vVA5/VdV0D
         mF8E4DQYxcNFJyjkhlRyti2Xm0Gb3GasYVlSrIYfEs56W+gA4210H3YD0ObYK111Lfj3
         OKtxborE1QZz9NpW/be8TjMDAobQQUQ3wXnbxUN0mfFwACy/3E5gOafABTXkBP+6PkSs
         m1NYp2SYEAJHBdxCk5iKX7rwje6S2/MQfxYb9tdMH+Q6OG2Q3tGhkrJ1sWZQ2a7/3dV+
         NbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DghIKmYGd2hbT5j9h12R+ylPqCeMoSdsqZetsAXpcLQ=;
        fh=7L6v7/ZWtfsiSV3PdIFdo3TQMIxLXSbegxJtRyvclpY=;
        b=E7m/+u2X0g2TfsfYC+pCkjqhu7wyonIt0VWI67+jPj+fDEoS43Vh4JosD5l0r+g6x6
         4YxFHitpverGlMzCNZgN9SfuuEZgET2o03RVJzeetAUgbrzPALzl36RhdqpEziCSkQO2
         tnINLvMlG4uUlLq42EchSLJKYNaCcaMvUoAJfiaFY3XV0P11oBUrWavHdYK9LgIbjxvs
         68dV9AzjbjsurLMd/zQcdyW7Z8s7FMuZYRqivJsUAgKtat8J/95huiaKqtiwA6TE6lzN
         9BVM8gLElLqycwQwnhHaxZ/eavnLV5QsC6Dlu+IT1vPSRm9ooOGdjvT3NwFgRf7fdATF
         MILg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785221602; x=1785826402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DghIKmYGd2hbT5j9h12R+ylPqCeMoSdsqZetsAXpcLQ=;
        b=Nh7u9B1KDf3Y4+V20VhU4Qc5WspdezTlfGllzszp7ixnJY5Jog9phGuP7N/vf3N7Dz
         fNIENKM08crKF0ZxMkOP49j9Ef26A/+RL3HOuWHbCGpnOjKWpAOgK7fqr7my7YzR3va2
         nl9xWFAzX2dQNU9ZLjqQ+pZV/+NVbmRcQ3NYt4hDcMWzN+PaoHNsuYt7fEJgrLSFrthD
         i2xdglgWBZK17PjFlZMDytC3eJG3nQ2wtIuFLBhfH6yI6ggvzBlj0z5sNaQ6Mi4gYCaW
         EpoQ1w31y+RyEKoGUdulEp4Uo7f8h6w3ExHT+S+qDre8eypT+LVREEdeh0dR5iKn/SaA
         4Rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221602; x=1785826402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DghIKmYGd2hbT5j9h12R+ylPqCeMoSdsqZetsAXpcLQ=;
        b=nkXCoBLtidzphl8gAT0zDteQ+zRAoCLsat09biVN1VlqjiJchbkwioACNQd5awEqfd
         XtiL1VS4fJFMelNxD+UBJ6wmTJW71yqzY2BjmK0Iop/HJAsZtcDHnVn8s6E+xGcSVVzS
         9QfnKlcbJxyIY2r8yJ8iKa2LcXIIiZXp88+680fAjX3BUSySQyW1rOFlucDUkpJEjZif
         wh+xvtxo20ml/fZ73tWYx4bAdvH4PEfSqFSaivMmOkfg4tS/V3NBU0MynB1vKugHG3Ss
         pWoodShIuUgiW/Z/vMjeLYeepAYc2H6kiu/vc7bTHZwNtChCqJsqH19UGc3B/+Pxp3Yf
         fkfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwTFJist3iFR3MDVCmiCL0iF0fP8RX5eLMlpEwKu+IDmcPGEQ9zI7ZGCApEjWQbOPvtPzDY4BIOOllSiTD4+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfwzcdauIhtm078fW+0h22fTn+4Kw/7D7T7aSp69Lsn9VKKYca
	ha+f1pOYfYSASKmnj0NcRM9uUiIItbDwlC5QxnHGRWlfHH/LZlddH4/a88vBmozqviiehsylqsE
	IRMkxy249h27KSCVLLQJS+FUI8d/cqGhS6YDUBaSP3g==
X-Gm-Gg: AR+sD10v67wbcneYUzlrzb6SbZPiONCLcUjKKIz5dFJnoJZgdrKIXn0ktzu5uMbeugZ
	WmO59qc6ujCMN1QnvzQyEWsCQkM401xgzox1BeTodXzCvOA9mBmkh4EmCFAreQVIMnbVyKRcPBK
	FokxbbvIavrEYJrSVZrU58y751KXKaCjK7wlRAWuXaBp8/ZLpNSvpIUmhC94HxywxH4PefjwqEO
	0kyKJyUQd9SvfkrGMTHV2dvzc2kzUhoc3Iyu5GmG7y9Fu6frYAp5CmEwpW9VPuHzeZ8CkbYYBtH
	RHeU+zsWqh5gB5363XACsRb9hyQmNuU=
X-Received: by 2002:a17:902:f645:b0:2ca:c411:78a with SMTP id
 d9443c01a7336-2d015ac948bmr15496315ad.3.1785221601786; Mon, 27 Jul 2026
 23:53:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-2-ammarfaizi2@openresty.com> <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
 <CA+KFgX76tbg_LTh6-PO-zrmhWtrjP4y3u47s1wximVFUQKq=uA@mail.gmail.com> <ambTvkneo9sf0lij@1wt.eu>
In-Reply-To: <ambTvkneo9sf0lij@1wt.eu>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Tue, 28 Jul 2026 13:53:09 +0700
X-Gm-Features: AUfX_mxdhCrbW3hN-Zhsv4woJBNLntZU0yodQrxIuuaP6KQEUZqgbeBaggcrC5g
Message-ID: <CA+KFgX4UssLeBdgJsz6opJcezXU_cvMuMnotMz1pAmPEtbH+2g@mail.gmail.com>
Subject: Re: [PATCH 1/4] tools/nolibc: evaluate syscall() arguments before the
 arch macros
To: Willy Tarreau <w@1wt.eu>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, LLVM Mailing List <llvm@lists.linux.dev>, 
	Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 10:42=E2=80=AFAM Willy Tarreau wrote:
> Since it's userland (i.e. not building with the kernel's compiler), and
> often used for ease of porting boot-time tools in headless or embedded
> environments, I'd really like that we keep compatibility for as long as
> possible with oldest compilers that continue to work. Last time I checked=
,
> it was still working fine with gcc-4.4. I still have my 4.7.4-based
> toolchains that I regularly use for troublehooting and compatibility
> checks (and faster builds), I can recheck. We should not require that to
> be verified by contributors (too painful), however, noting "still known
> to build fine with version X" is helpful. And the day we discover that
> this promise has been broken for a year or so, we know we can safely
> update it. I can recheck ASAP.

Ah yeah, that makes sense. Preserving support for older compilers is
cheap at this point.

> It can indeed be sufficient to add a line to the first comment block.
> However I'm thinking that we would benefit from adding a larger README
> in the sub-dir for contributors that explains some of the traps we often
> have to mention.

I'll leave the documentation to you then, looking forward to seeing
the README file addition.

--=20
Ammar Faizi
