Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0604485954
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141996; cv=pass; b=pq0jgiISQPi8xRQUrv5qS4jKjuRdiSovHAeZIBm41sb/bccOW+C692Y9MWJbA+6YghjM8UnQbjrhaYsm2CRaYEWrfrlIX4XIPLrEAVC/DHS2C/VDK7zVDrO72VIfQmi/e74oWsuIJC3o/Pj0R7v0Vhb2CPI77qzEVMTwM90BaGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141996; c=relaxed/simple;
	bh=F39xQOImaxJK8CevVQCFMKOX+9LgzBRLUqk9ae5qoSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVwIL4Jy7THc1atk6fbSsKxJK0Q6bUx+fMEAtKlW4M0bcXhlbqvcrc4H2a10sKdWZwg/rkkhUSg6H0Im6IDYcL/9J/gvMB35VSMzIEKh9Dev2Ijk+u7OGZUNiIJHQonoqqjZZOrsVxfBVxDcbog1kFcTmQkffs2MyURfP6p0Dtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=TU4HrLPr; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="TU4HrLPr"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c8386a01b0so714199e0c.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 08:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141993; cv=none;
        d=google.com; s=arc-20260327;
        b=VmeRfAaLAKfAb+Q1+v0FAPnhG46rZU7wRHzWw1aFc6PaEvCJbz5Z+5VdZZ4tzeqCWV
         WqqMALjIVMQIGpuQuW3J/lWV4tSXhQYxhWOaU5FpMCg16nvLNUcPSY1LkMmlXaiiEiTo
         vqhoGrRM+gDxGuDFSgn7KMLR0p+HJEe5siZBUhhhAN3TsLrwXT60MxVQEFzrIxBFqtzK
         ZIHMg5JciPKUn8kYXBAW+Dc/yFV167Z1QDM7m8Wvgke22Gek0IbD+jOsJlkxQmvRm6Zv
         YhUJwEtBOHoXrIN/yCKL/bDrSiNa44qDOPI/tyqGWbRzhYv1Bm01I1BqyD4aL8eVLHPC
         SlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1vv7gvwFES7J25+C+0P5Z/9fMTwoyrVRDGhTkAbqC3U=;
        fh=39kmAjWR3f+hTFsyuUxCTrDNqU5NtX/VhR24i9GqNc4=;
        b=nsxjnC3LK3hgpMp+a7oASQLZN9Wz12cjUBnqrtq5fdY4lZvS923RtuWTTIF4ziHzWK
         c+sq6x6pu8wUuANlgXNPB3NqpADbOepMeS3REgGe3hfKpGJpHdqO3ZvJoxfterGan1v3
         b3OTUHRweev9L7yYgfeaiegt3TxefQADi8gm/Y9wy+Q+WGZripr8RZcgHgXrhgZ1+SX/
         F4f6CWj1l2ftgx/pUZdPFLLx9vEx+wd25hd5FD4PBvXCXd+h2iz2O+r8at6P1xpiWtl2
         Cf/WusTryXkS08/quIDOCQkTv3MQMosmWoacmbH6fh7zyVzy0qWPelWj+REb7402Lg9x
         VgzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789141993; x=1789746793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vv7gvwFES7J25+C+0P5Z/9fMTwoyrVRDGhTkAbqC3U=;
        b=TU4HrLPrlHtlktUhdsoiWo4rdxP2ayY2q7G0lhCV1Z56O+wKgWF4FbO87/POWyQT3D
         8vSqisFEbSw/zy5/zznoZO9aPs3wdgHfatIQSbq0D7vNIU23WQ03BPbZfb2P4KzUPcVZ
         jicdK18YP44TNI8NRW8TZ+YRvIP1Trz4yUHbDZC6vL31fQA7aQ276LSSp7/pmYMADvNX
         CVh9hm+hcgw/5BKM2gB2t0+HRIdFIIMbdV5kOkSKPE3IsXVQrigE8FSD/7cQHyOIhjjB
         mL+tqNFTJtZp3JdOwh06TTvGwIme1kTcNfhwxXXKuJCavsyxm1AQtpLMj2U79iMCOO7D
         pjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141993; x=1789746793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vv7gvwFES7J25+C+0P5Z/9fMTwoyrVRDGhTkAbqC3U=;
        b=pQLrsCE1VxrxtxGCas5kfdN3rfdgqXLzw+8llZzjJbkf/ruijhMhwo6zrzCmrcJguj
         rSt1yReSCahmm5xnWsPrU9kLJYQVdc8xI2pu5D1R4poNo1QJHlx0VtgKMyAADAGTjI0G
         0fRPtgi4g+/GQC3f38amoekoLs3rlRC0rhfvJgHv+pWzNj+90wUpKX8jpuef7rZ+kLbO
         lVeopFm7rWT0wUxMWyUXtMhFXbrkPoGlRgBaNLos14LxCpMFwVh9nesdeJlh4IIPbUUy
         KLKNBVaRP1RZa7Z0yiq/rfj0YvB4IgVMWwxmtH6LxMc5bK2iP7M7UWNXCJfh+nfCAWvd
         c9eA==
X-Forwarded-Encrypted: i=1; AKwUvBzp39JU9ARtJR+Ulyb4Jb6NOnW4sPzxgxvR29NVAGjjWou0AH64cdcNJSewXBKFWjYgqJbcKage0CUboFv0AOM=@vger.kernel.org
X-Gm-Message-State: AFuF++kA7tQbt48u+tuZAoyC+p0IbUUx6wF+TvCJrwqyh0u6Lp8KXUKA
	j9FZiFeuH/aH/rHQkovDUUqyhNyzansbMpiWgkOC03rEvRscYanXoWRzBTHl49/HNncTfsRvZdR
	AaQplZgRicNulsWfA6FOIRF2encwz/bc/5Ahk9WfsJA==
X-Gm-Gg: AYBFou2vHaeeXXAPQFcq/Xcnvp4RhSKzERZ6taVGxQK15hlvlKe1bdDwYq+Vbeb3/Lu
	lXWEn6GXgJd4zMpdV53z0lm/rlZwGRhESSvt7KPBadiZW789+CUEJAnvBsU9V1FATxEEKSHc6aR
	/69VGcsFw/05Dv+RU6wEj+fWpAgvThbvRl5wb4zCfcw1tAraF0TTFrSYq9kEndn6O58pjnPnH2V
	eTFv4hyMybCk8x+vMmAPaLVdAmP/5MnZfZ8Vyg6KNhiDW0TYAhOYDXrJhsy8XqtmGZ/j40qDIFF
	dN6OBqf6NAVTXSqBm5AfmNcxbzbDvwK1ygeu5h7FIL10aHPSWf6IflZGL4GN0B9HFL9lDWY41Wf
	X0TUhqV3wAfr2
X-Received: by 2002:a05:6122:3d0c:b0:5c6:5daf:52ea with SMTP id
 71dfb90a1353d-5c8462d0000mr7158736e0c.6.1789141993589; Fri, 11 Sep 2026
 08:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906145643.219609-1-f64116045@gs.ncku.edu.tw> <20260909180851.01488994@kernel.org>
In-Reply-To: <20260909180851.01488994@kernel.org>
From: =?UTF-8?B?RjY0MTE2MDQ16buDIOaclCBIVUFORyBTSFVP?= <f64116045@gs.ncku.edu.tw>
Date: Fri, 11 Sep 2026 23:53:00 +0800
X-Gm-Features: AcwNN1UWcuwxZCQR1n7msY-EQ_gz2d88U52Op93xGQ8dQ4m1tuBVPc8TQvU3y2o
Message-ID: <CAEqcOowoHcmjpU5Nub5k+YVV1tHb7oX9beoTLE25ho4t49LB6w@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: net: Add TCP payload verification to udpgso_bench_rx
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> This new option is not exercised by any in-tree test.
> Do you have any special use case that needs it?
> Otherwise either its useful and in-tree tests should run it, or it's
> not useful and we shouldn't merge this patch either..

Thanks for the review. I've added an in-tree test to
udpgso_bench.sh that exercises TCP payload verification for
IPv4 and IPv6 and checks the receiver's exit status.

I'll include this test in v2.


Jakub Kicinski <kuba@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8810=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=889:08=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Sun,  6 Sep 2026 22:56:43 +0800 shuo huang wrote:
> > udpgso_bench_rx supports UDP payload verification but rejects the
> > combination of TCP and verification mode. Its TCP receive path discards
> > the payload, so it cannot check the data generated by udpgso_bench_tx.
> >
> > Read the TCP payload into a buffer when verification is requested
> > and check it against the transmitter's repeating alphabetic
> > pattern. Preserve the verification position across recv() calls
> > because TCP does not preserve send boundaries. Restart the pattern
> > at the payload length supplied with -l, matching the transmitter's
> > pattern restart on each message.
> >
> > Require a nonzero -l value for TCP verification and retain the existing
> > discard path when verification is disabled.
>
> This new option is not exercised by any in-tree test.
> Do you have any special use case that needs it?
> Otherwise either its useful and in-tree tests should run it, or it's
> not useful and we shouldn't merge this patch either..
> --
> pw-bot: cr
