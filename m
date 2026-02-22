Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B931C84D7
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771744796; cv=pass; b=uj2kAR4+rt0+o0yggU9IUSbmfWmDYXhG4a2aiP+tSjZFYYQsJ6SpEgiPczmffChgt7d8wawTWHq0Qvfjvz59siIodAFUX3b2NNejRHmo5VDl5W/obbZB009Rt3X/nqmnyP96BSXQ9htHzgvvfHSX5ZVcd6QwrVO5XIxuphG6dYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771744796; c=relaxed/simple;
	bh=0lDfK3AuaNxxPB1Mx5JPD44YULX91cix/sE9XtEee8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdobE2f49SmPRRSGPjrUB2uGZU9+5EIYVxLPKfWcrPZtcBO93acWtv9mUcbr4owAudTUvK4e0utsD8lppXfDmsoMOYJk8xkQTgeVBxFnlFCruAj1e2aKIZkaXKX88sUUuJvANJjBuxguomLZbuwgoTGpWBdOFJ0/lKFdRqdHpSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwtvKFVx; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwtvKFVx"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56739adfa1aso2531001e0c.0
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 23:19:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771744794; cv=none;
        d=google.com; s=arc-20240605;
        b=BPxDz7reVrnRkdj+cNxypE+mL31F0akCmPf0FDhNAQgl9saFgMXlXslssuVAkJbBV/
         zMgNIzwD6CbNx0Lv9L2pJwf8Ap0d5JW3fL9j5TJi1VFhY6wVZ09iooLJbOY6KdqeBuva
         mbup1Y5KiBuCgZTeWhSTBpzjiVvUUHUS/AqE6Y+e+RIStr9nI2G8HAvbMvBZSDbQsY/h
         fsOV8qAvTN/TaHPc6DZhls3nqw8n5wsLwe9rpGzVDR6btel3H8LYmlSuJ9F63fvoEvBT
         U25but8gsyhZ0OFj7KenSvTAGa3k++b8JXcAfNRJpCy16/eOeMtnw0paZWN5TO14S9/a
         jdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OILCq3HcP44ucOZfdh81GCluvZoTsk6wk990N+3C0dA=;
        fh=/AyWXPvfE2lRMc6t0vnmpnj83Nk17qluprKPu528Qpk=;
        b=i6275cbznTHEXXtGfR5kmBDO0cL+fzXS0lyw89m0lUm6+jC3wSwRplbGKzQVItl7zc
         BqX1Q6bpYX/rYtbaHewbQsyyV9F8eTbmh+NJWd+3jVra0jCYJXt7KZ8NP9Jk3D9CSIEm
         K8Gtnk4ZqChZSgP77ATpQ1baKraieV3YBQYnf5AZ0rsKxyJTHGzh50+0fXA8gy0sKb7y
         PcgAnwui8PunOc+s1G7Trp0rybcOPO/yYt8urcUKSIXwN1T9yckQOgM1GnLpBh2ikXgP
         t/kZDo2MUvLtR8tMM+sR5cTKpKCCYeHB3T2yQd88XnN0pEnzLZGiJ3kdZOJQSj0IDttB
         DsSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771744794; x=1772349594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OILCq3HcP44ucOZfdh81GCluvZoTsk6wk990N+3C0dA=;
        b=iwtvKFVxJY411/9ogEeNuKuIL+swHngOLh4yrtBI6Td3Zvrhz9GAxS6djLXc2BeeOf
         nwptn4OPwALolDkNO4yfUKWVGz6BTUQ/ZjsrhDkQelUcEp3u211ABAUwyaGfWUa3xyIl
         8TncN5e/ul82aK3psRyH0mTUkoioWE7HxKEG5Tl+V4ZPPo1duell20yNXLiz/uGQbSYH
         7yGlXL3++eZgdVawMupcKZlupPjYixQ8Rl23W+szYf64S6Jow0ieM/ciHxBMW07CFwOu
         mPqgTy21kVuM+pHA2DPgrWsLpiGUpwbZYMi/pXNbvGHP1UIGZhLEeFn1TM96mjwZUN8t
         bpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771744794; x=1772349594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OILCq3HcP44ucOZfdh81GCluvZoTsk6wk990N+3C0dA=;
        b=LLDRDrGX/Owtf03/ju4ycrQYdjv1Gq7ukNoutkyF8uJe8sJDBprucKNgZq8crWFg+m
         6XLyP/iZ/grEKy/rzmod3w3iRVHnetzkYGjfkcpYSa17diz9xee+tsiXya3aZUtK1382
         1526cnuHiNK5gpH3I+b42V3qCOpcb9Y6mcdJ76EZ9VqtXTmrHlsQNJ/RYaKJX8emLO5l
         LknT7YxlzctO/X2arqkTAYrVI/jWOiSVt4iAG9R9IfnRm3h++Kufh4PPvLC1ocpouQ1Q
         NeSx2j9igMoB1YxxEOmhZQtPcxMPMcfpkGW4I7IaNZ4nEybbSqniWOakjb0bR4+xAxzM
         5ZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSdDridJVE0+HGFFD8tFc06pSuF8yaRYFHvGew2zsEsHS5kmxpPItMszZYp5MOKCwR291xpyZJLzxkb9HDwjw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuoj+PLee/D9PpjqBEl1C0nCtxkuBcq6g9stNlz6N59ARgjy4l
	cLIxse2vNYJivX7WBi+2wKUG1W8LGxZDKoxGjVd7Id6PcGXB8YRdGlk+K9cK8wE0TWd33q/Suld
	fcbqway7z2/uvdZ7Mviz/YxvoillIIBZVQw==
X-Gm-Gg: AZuq6aJVSI9YHltQeKCg6gYZO44s/UGAa7OFPd9EBPoYdUK0S6gU4TRaMOPqqu4bOpW
	mt6P1UEoDwFjv5++YBlEcSUD/ab5hMGvG/5PsqAeaAt3nmUiqut0s8DyCweIRUJuWfJASOaOw5i
	ApiZhhzgfvbdjB42TR4NQAmG5X8yJKFoaEop1GrTcPWUMN/d8OqKi3a4v5HGeJ0psUJOjumcRNi
	ACTmZToWNBdGeJwggrkYySgcfwIX7IapHed77t14BZdjNq7rUUpmSI2LltiFeVWavMa/KYzCjE/
	zi5XkiLnbglavCQnNSIGbFzgxgVp0UTF3CqvTIyjrGdw40IfJlahxA==
X-Received: by 2002:a05:6123:2c6:b0:55a:ab0d:bf74 with SMTP id
 71dfb90a1353d-568e489e04bmr2702083e0c.13.1771744793575; Sat, 21 Feb 2026
 23:19:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFfO_h7TJbB_170eoeobuanDKa2A+64o7-sb5Mpk3ts1oVUHtg@mail.gmail.com>
 <20260221234553.2024832-1-safinaskar@gmail.com>
In-Reply-To: <20260221234553.2024832-1-safinaskar@gmail.com>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Sun, 22 Feb 2026 13:19:42 +0600
X-Gm-Features: AaiRm51yAd7WZH0JTtET-y37usKeLDtT6X5Vgs22uOg_jqenzkdmMaQOnOQPf2k
Message-ID: <CAFfO_h4dNydbmKSTP8uD9X6ouEZTyJUGoTBXrEHWeHtD1B=p5w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] OPENAT2_REGULAR flag support in openat2
To: Askar Safin <safinaskar@gmail.com>
Cc: ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-nfs@vger.kernel.org, v9fs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 5:46=E2=80=AFAM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> Dorjoy Chowdhury <dorjoychy111@gmail.com>:
> > I am not sure if my patch series made it properly to the mailing
> > lists. https://lore.kernel.org/linux-fsdevel/  is showing a broken
> > series, only the 2/4, 3/4, 4/4 and I don't see cover-letter or 1/4.
> > The patch series does have a big cc list (what I got from
> > get_maintainers.pl excluding commit-signers) and I used git send-email
> > to send to everyone. It's also showing properly in my gmail inbox. Is
> > it just the website that's not showing it properly? Should I prune the
> > cc list and resend? is there any limitations to sending patches to
> > mailing lists with many cc-s via gmail?
>
> I see all 5 emails on
> https://lore.kernel.org/linux-fsdevel/CAFfO_h7TJbB_170eoeobuanDKa2A+64o7-=
sb5Mpk3ts1oVUHtg@mail.gmail.com/T/#t .
>

Yes, indeed. They showed up after a while.

> So this was some temporary problem on lore.kernel.org .
>
> Sometimes gmail indeed rejects mails if you try to send too many emails
> to too many people. So I suggest adding "--batch-size=3D1 --relogin-delay=
=3D20"
> to your send-email invocation. I hope this will make probability of
> rejection by gmail less. I usually add these flags.
>

Understood. I did not know about these flags.

> If you still expirence some problems with gmail, then you may apply
> for linux.dev email (go to linux.dev). They are free for Linux contributo=
rs.
>

Alright.

Thank you!

Regards,
Dorjoy
