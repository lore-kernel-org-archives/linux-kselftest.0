Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817E572617
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 04:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785730030; cv=pass; b=ROld14nLpjDiiJZYl0GWGVx2/eBZ31j6TocvIrYH9IaRA8WpYBgJhk+leP3m+GfVhjz/p9U12bxSq/gRlB/JZ3R4EAvcEp5w86nbVbRbevl7e36LncEQyE7oPfiCXSsqqnAadzdiu6AinAPpZ0nkUQTDriumdFqtLVSq1TIg/BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785730030; c=relaxed/simple;
	bh=1iOnBbTKxIxEgOnGkXUG2N73Qgaf1OlOeZ5koNqXAGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SL7uIbIM8aI8t03Xu3y2uN6FAIu0Xc3yCVAhP3u8QR63y99RVWFDcDIIH7Hrefov+/krpyBmLgmViv3OllcZtL3gjfrvUXNobXYEDRFpmJmkxI/aMWSqRg5VNC5I/yqcKBkFXUywdXKrwMyZ63i3+1oFIDRUhGwz0ADyWTMPfl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnbE4/AL; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnbE4/AL"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso3318316e87.2
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 21:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785730027; cv=none;
        d=google.com; s=arc-20260327;
        b=YcZHn2YYbmFNfPcAU2OwATTKO5p3s5dtViAsn5Mly4CEpkiavTTirGNpvQPYQP63Im
         4BAZzbKnp407j7QKpNgX9bhMaaKv8nIQp/UDEK1X34f/TdPOyKlxU0rOeb+AO3SsXiU/
         fIzZM56E1DDIHjXfH9hXdElgWIXg2P+DlBPOqGX5vb92H7oH4H4ZNQOUBdUKhPhwNBw5
         nfe6yLkG9K1GVLk+2x1FmcbvOSfU/XpaLfZvhnGiTzQquw4B0mwLY6lX3VUmfsgLqu9s
         tL341wOE6CdWMaOO1K+NACuKyccBmlYsF7jhTSGaiFBKl7zKROzJ8jecHS/CH0wAVUiX
         Ftbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1iOnBbTKxIxEgOnGkXUG2N73Qgaf1OlOeZ5koNqXAGM=;
        fh=w/tvoMoVkg6hDzy/56Jw0m/TDiV4tyLiqOkASaDe82U=;
        b=BABlAe3DzhmTvWOf4YSKmAIlkNn5hJ7XXFk9/JvjBu5zxMYUH4FLChck/fePtQSXk/
         NHrtgYjpatgxP4D10qGVRaDx9GNggaPClT3tWpqu/QHc6GZQ+k4PzuXzoJv5x8KELEvl
         kM+W9I/62WXAeRuh3glmSoIMY/ppm69CA8a2YBtqEsTcZ4Q45ksAdkaw5Pj5Gn3PwVdI
         vnIVWY/118xS6IVBQ9En4one1bODV7dxVc0z937HZyAMNEN/gXT8zZJRi4ZKqbZH9SD+
         6KHDbPfIARCPQif7ao6u4NfJvN1H7rpcaxlDSjoQ/QWaggOzh6AWi5Jh7msmfXptiXJu
         GFvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785730027; x=1786334827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1iOnBbTKxIxEgOnGkXUG2N73Qgaf1OlOeZ5koNqXAGM=;
        b=fnbE4/ALckfADf2sLtiZkYW/xVOmIiO9qyvyKjxaviNfF+obJ4+/NvwMoXm40rv6Y9
         28OqHF+shUtoxEBQUanbH0uHVadNVcNs2yDX1GF/ZB5j+h1oG8wedqY5eMwRePqkoOSI
         3R+fVSL0GkDdGlYkCsmOeo5o/VPNhRaMTInDVWuxUP6S6yfZNMLIzgEMbGqIwQwUbFKD
         PtcOt2oiALhMXu0SryI84tvNAIdWYubnDXGYu5za9sTTFIf0J1wUA1/xsiajm2yfrXF7
         Zcb1Q0JJfRfBomSYGMwBboaG75/WmLZabgXWDFE3ctyz38lafiubnpaAmveyq2cEdlBR
         /p3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785730027; x=1786334827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1iOnBbTKxIxEgOnGkXUG2N73Qgaf1OlOeZ5koNqXAGM=;
        b=ezTHUqGPD+cTLWo5nfocTdSGkEsZQvP07T992YsyjZIjU/Dc/qmzZkI7T5FT1lU0cw
         CEfRNeOUbdxJ3+3m1JKqlKgktloBlrc5bgwcy1WMQJDWd/8wpyTa6Xplloe4fdmtCOcb
         nFIGI0LcUVZtDvFVrhRD8ovRyjGwQ4PfhY9zACIGiq5YNbbHDYMUMtAtZcQeYSRAyzBN
         7QGrv/2xD05TF6Q4H+Ec6AbGZIL2g5eCOb3ff4dqVurM7g3hKtvxX4DwMhz14bCYCIt9
         bro+CodywzsKd14xoauUkqCsW04OnvmxbsYpx2ElG54CzavXmclqzRyAvGGPnT13irdg
         Uagw==
X-Forwarded-Encrypted: i=1; AHgh+RqMh19D9ygY1UEAUhr5g/ITN/Yg6i+XVOEhpoWmJA4/oZsvlR6q2vnXYSu6dG42jAkW/F+1Tm5dllKlXu3MJTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWTV8BSQGLt5VWMWHcbkOUROTVuAJ72Uzlq2bQb1X/u5cKCZWY
	6D0Ar7r3Rte6CXIR96jUnDSqfhzz/pBPax4x6h1HwB61To8LrlwZEu52buJzHshuzK8cWupw1Kd
	KOvQyBlI94w4/mxVGYskgMnLMluiVLJA=
X-Gm-Gg: AR+sD11emxbp/0Vsu6AHsJj2iXuxhDDxpOm+Ueii7YqRqp3d8wkgcZdFqSkQ6JxRrEP
	Ua8wmQqqOPKGJFcPvLHj5NCgy0Gvtnh8JZVLPq8I0o+jAm1BTx4xhy5RyjgSMaZ1uqTrrhyyjjc
	KrzMJuVM+fD/UBYcV5BUnZC4ke0FZNZWNaxgRQENn1ihj6E6tSOvYJlC1IelQtSIT/NxqQlg0YW
	db+hW78LD1QKHv7HXbyFFSSaA7Qx7jlYaHYR6InWZ2/Nykay1BOV1j61vo5p6FEkxBgSMHWULrM
	U3NJRBH72mwH0rezfww1Lg0s2elKJwNHZmJBOJERDzRJnZI=
X-Received: by 2002:a05:6512:10cf:b0:5b2:9358:b854 with SMTP id
 2adb3069b0e04-5b2e4f76d9fmr1341444e87.42.1785730027321; Sun, 02 Aug 2026
 21:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726021304.97ED91F000E9@smtp.kernel.org> <20260728033837.1466123-1-dingning04@gmail.com>
 <DKEUME1DRKOR.2R2XVNQDZKVSR@gmail.com> <CAJP4iuumoLdD62rXf=3HexiKVoKbXHJka7tm9+Cw-LaKmuvC+A@mail.gmail.com>
 <DKEYIUKP4IPQ.M7KVG0KIIU1E@gmail.com> <CAJP4iusjn58Uo7uE8NzicZQmKoips9fu8+bV0jEJFUNmXz8K_g@mail.gmail.com>
 <DKEZLMC43IZL.3IE6NNLQWJI0V@gmail.com>
In-Reply-To: <DKEZLMC43IZL.3IE6NNLQWJI0V@gmail.com>
From: Ning Ding <dingning04@gmail.com>
Date: Sun, 2 Aug 2026 21:06:55 -0700
X-Gm-Features: AUfX_mzaQB7TAxaY71wot5WebNPa-yhVeaNtebXeREzVCmEWg-QZmD8gKDnpXto
Message-ID: <CAJP4iusveRqaScJhLJhdkA7fLXZu74_W0MJN0YuHo=3Et5e0NQ@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Reject writes through untrusted allocated pointers
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, eddyz87@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, 
	danieltimlee@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Why is this not enough? 'key' is scalar, but 'res' which is being written=
 to is
> still a PTR_TO_BTF_ID with PTR_UNTRUSTED.

Ah, right. I was testing against Linus=E2=80=99 master, where that
PTR_UNTRUSTED write check is not present, and I missed that it had
already been added in bpf-next. That patch is not necessary.
