Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596003EBF35
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141171; cv=pass; b=pYZ8u0vF/I1xohq24SjCEJN9F+TCNETBjJOGiTlYUz4ngghCB6zBzK6f2MTgqhTLCHFOq5rq8onMEQaal0SZmwcF9EZ4uLeRiKXGW2TKY+E3arcP8hM36+PrVV5K3UWGmY9MFCCY9dFMd6zfE9IpWQfeYtSGdiELnlZHPcpeXtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141171; c=relaxed/simple;
	bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Am+5Mdh7jKRNdAwvrA3ra/vALEMCgLwjAC8MVr8HdgYsxEVjbOPdwUcbdsqEDQF9uWyGejuiq6Q/sz0d6nJ3sJa9a2jA9oK1wFmkTzB5v3Ew5ZncDFXS3KDWYjua82BndDScxreRzJB1SsfEOnrrZoPceEDUXQfdgTAvEvdc4ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=AP9mRmfB; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="AP9mRmfB"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533778ab0bdso70863131cf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 01:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141169; cv=none;
        d=google.com; s=arc-20260327;
        b=hYmWTafonNXdCeopk5Z6QpwPmpurQN2fYnu126SjLYIa9JgFxY1CVZ2i69PcQsLmGC
         tbjnJOYOQZcYl9zctuQMdX7fgpwqkYHbHpC2FDtUicHSZ/Gy+LNi76oPNPA8txf+COTg
         bnuWAtadmFBmQ+qLTsa4bKq+d6B+5bM4Y9k9o8dhWu2HU9xQg9EBgJeL48gv+MTvI/HS
         68vqo4azkep6HM9x0RVKz/zYtP7aVb+LSsjBIgq5ru+ErN0a1GF5WWWZPBsYPZ1q+G2A
         0ly2eRMgJ2fTM/lWJLZWTyWAYfF1rxFlyDam0xKWigWZnL+6VfNY0um4HYOG2525Mu/I
         Ng3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
        fh=Q4tPUAdAS4RUfNSqi3N6POolGMZTvQzo3Qzna2l+hXg=;
        b=ChEGH/KXYIchMONDVGW5ENVM5+lIMWJ5kfMjScQ1tI2EVmLJR2QM3oaYbV3IQAJmsW
         rSOGn9monEbuhvMg3MET4EvHXpiZQF+n8/pH7GYvSYIAe4DaLVLnrN/5S4q5DGpDcOEU
         PuBGXnJ9sqg4RXdYfvWcre703mpEBfveJCk62mndE6Jm7v+svRyFwt1dcnSB/Uv0+aXM
         spqwl2ybtEesbEmJy5ZTctQbyzRmoR53erZkUG+IkmHLAgDzY7RIFc01Pirn5O2gIvia
         j39onT7nEpEAOfMys12tlORXtWDOXVFtM96vz0wPpKFI3W9Wb44IFsSyFVYhIgIGSk/a
         5oBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792141169; x=1792745969; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
        b=AP9mRmfB0tN2vqd3ND9tkHgdtm17ibVX9xAsFmSGAqbyLxAd6cNsav3AkeIr7xsC4y
         Wl/dO3qALT9/4qaw2XDi6C7jayAbGJR4vqEF61AGPcoYgEhe1u+ED6/GtdHZ9xwM+g5H
         6em9wWPVeDj/3Nrqs3POqLd5GnuUlC+y9F/6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141169; x=1792745969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
        b=cwgkGMJvcksH0diIus7ARUSCZy2hCrrCIceMX2pRZzwRgzUl0c3zAMs4Nqbg/b5As1
         ZGBB39h55Wz2SS57jB4bZCJAksrH/5OvYMkH5VtIonyf5DcDnhRaO1awpzmtnfzOARy1
         rIPxf3qvqvRlD39NIaSNr/SuRJaE3YSC82z6Cpo+l4G5wAtZ27+t/mWVTbIJFEU3mK5M
         PVGMU1WkCJjKkF2lr4t0uYHGpVztWQCGnrsNBuFYHdhyXIQ2j8sx078E9l5fcNjbZv3s
         XpMLzg9NLBiKNTUZBa6HsIcEusCn3JeZIzWVgSN9q3QvekRiaYqZzdwpnz1a7APUKZQ6
         OV9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx98G3ERAM19CtEkT6NbVBNLlKyEzR8zl1PB3IqXRwFYZz/FPr+9I2rU1j5w5/iVA+B8pv1rMKDhMrKLfyqGcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6mOQ5hosdfGqqkYIb6o1tpIDm0EBh2qFjjgnZzIuaxs/c+Anf
	Xin2M3ZMkZHlk/mj8ywzPUppYMzU/nrxljSaYptbzUdymiZXDea1P4k53VVY0ji2+2G/CKkMXGo
	P2WZuvLaoU1UJHBn7rc/h+/X9m0og9rUxkwVzvuMnuA==
X-Gm-Gg: AYBFou1Cue8iFICvTJt1bQKxDrnJNYjoqFv3tGrraBC/THYvVCOOZGgSyqCUeVdB+Ct
	Ulh3EhGV489HkH+F2h/sW763P+hy007jIXmdlg3vVS+yk71FDKGxeexa+aQbcX4tRSRPoVr7aGZ
	OnFE59ibSjrqEq/91XbM2YR4GebntVTK430q2uRJ5VZyfQj0jTtzNyBCs/KjD+FbglSSSvH77Ou
	ifb1PqrDFNXvitd7wfswFwz1ozt4WKZ2fX855rC/n/rUwrk5QX25UxR3h6vEkxYj+fHSNK6YNrE
	EybcfvqRzFog3Z+AH+tCPEfjW1kHVu43K2bUDmmwR2/s/aMpARcrxZbKrsxApy8SQ1Jklk7vf/a
	beesIIao=
X-Received: by 2002:a05:622a:1804:b0:535:a5f8:a5c4 with SMTP id
 d75a77b69052e-535a5f8b53amr352445591cf.68.1792141169297; Fri, 16 Oct 2026
 01:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820130158.254808-3-jamz@amazon.com> <20261014200112.1363344-1-sashal@kernel.org>
In-Reply-To: <20261014200112.1363344-1-sashal@kernel.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 10:59:17 +0200
X-Gm-Features: AclHuK8plkUWG0caIufFg1j5DIBTkx_nzXhY5cYIKKqxQ1cPSAaRX-yvQIYuAck
Message-ID: <CAJfpegvGBZaEw_tS-EpOKMyzb-AG3CYBG7DwbQQa3280fRNQRg@mail.gmail.com>
Subject: Re: [PATCH] selftests/fuse: add the missing FUSE_HAS_SYNCFS privilege test
To: Sasha Levin <sashal@kernel.org>
Cc: Jimmy Zuber <jamz@amazon.com>, Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 22:01, Sasha Levin <sashal@kernel.org> wrote:

> Add test_syncfs.c as posted in Jimmy Zuber's v3 submission. The test
> talks the raw FUSE protocol over /dev/fuse, so it can choose whether to
> advertise FUSE_HAS_SYNCFS and directly observe whether the kernel
> forwards a FUSE_SYNCFS request.

Applied, thanks.

Miklos
