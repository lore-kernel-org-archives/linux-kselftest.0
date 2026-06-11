Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3E356744
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173735; cv=pass; b=qSpab1Xp16X0dQCOBazOxAgnVAUeX4yf8bmvdXDC4rmu2PoqIfJRbr1ueKF3r6wr6lR+Ytes+wyALwrQY8gBD2SJE72aaJ2R+YXQiVLxdUcmQ2+gH9y9iOJvYfWp6o81Vp2bW7Osm24Z/tBoXqF4mcoa2nZVekZ3Z53zkDGB3LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173735; c=relaxed/simple;
	bh=CislKDFyARtiFmW8Vmp5r7hsmkZU1U1itCBY2Y1nqdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5+9WLoIhvBUD0+fC59ZnWWWXw6wbiagCWh5XNDS0/ISNydMRAd57ARGVsbTG+eV8gyyhruTJLlN1WsVHpcHmAC0NbAP5hb2FZCUcExRFObc9fTstnG3S1XLFdRnY9wvR8OiBUZ31c97LK7uVj10ZV6hI8rgtTvF4W44Fkhb3lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=MY3QbnjM; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="MY3QbnjM"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-91588056619so551368485a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 03:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781173733; cv=none;
        d=google.com; s=arc-20240605;
        b=L+6nTflEAdGqtQen6NxElaa8/Pf23loZSxPtTzkgN0xJW7Bm5HsAmMputCd4+JBFqY
         EI9W9ISXQhLsW0H3St1Hl0chaEH1WcNsM20QLj19SyGMzv2ifyoRRYOZ+3oBNYA2XRIu
         dDHSrBvBbRNBErsmVlre/WJvya5G1iACJUW/M4qVtQn+/ngiA7iHe8O03JIGRMpe+AaZ
         r6qjmFW02UgD5NXP1od7B8OiYRYWWw0HBsp+WqLeU6jmdVX18j6hEnLJUSytEC+pOk3m
         4UpTGXQk+UnwHAUJEq3rqshijMbQlbWkAL359P2wywzt1RcmP5uhvZHLLDvWOG39ZilU
         gOmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LW11kryOtpG26/bj76zRyOWCPKAWxgk5hD+JnYIGwu0=;
        fh=vfcYQ3pcmbgbKY4ppjNVbLEWFjoVB8ALmVPNY5PIDag=;
        b=O0fXGdXs87f2eDAAXhPKXN70ovP4xIBjhZNVnvbZve2gjE303BKJGHXmKSHXls/X4x
         MX+KaJjIgX6U3MUr+fVt9a3WMjQjSXSC2z6t5EQeMkhOIdv5uSnNeJAoR2v6FChdMfg/
         WnRKiRskPGiRPiufLQwY+z9ASSceY+BTfQhZpkragQG5WOe+dP566GRdgodLZVmYgBKk
         mqRrkNjOcFjpTa5diV8sQrnVfsEAkICLJR+NDAcowyHa1ZTkMRKMDdZEmjTD5CXp1Lgp
         JDNSPvjrtnzIsNgvBH7+5r1nXTglkyhJvrw/vdlL0xZCv4IffhrX/MQ/Zx2/5aLgr3YW
         sZ+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781173733; x=1781778533; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LW11kryOtpG26/bj76zRyOWCPKAWxgk5hD+JnYIGwu0=;
        b=MY3QbnjMlZcPtyWsyR4yZm2M0JTeEQc0zBKVAJvgeQn66cNslndUWR/Ch2yAPjRQVa
         7YDfTrIVcz12eppe78QgltBl2kBjq7DdCq84zMccgDI6T/+eM13ylhnBhtSxujoV9FRV
         cvvvRNT/p58XX+z46gxSJuHcx/aj/thQFfY+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781173733; x=1781778533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LW11kryOtpG26/bj76zRyOWCPKAWxgk5hD+JnYIGwu0=;
        b=q3Sq4uZ6kziaLlKnTcq5fR74dw1MoE00S+Iy06QI+DoryZo/F4MJHSa4XsR5hEVajy
         bl1sW1+8SO+v8pG91DKcI4KBi+vVDYhpSqjeWA55D7ZTWWi2C0qtkYf92hAi3NCB+ahX
         YSRv+qr12k4UByso8VNuPZu8rD8c03FnOIrR2h7c4Oh7Ak3A4I3VRRzYQ2hUZB5qLEAe
         CwSHJy0fA1jsvbOp7tAKRrz9Awodoaw5OYxva88k1YF59oN1NDp0VybEhgxsnIhl6GyR
         eDLALuXkbbt0f+QZFd8qovvQ9fTGZJDFHPQS/ZxND7gCWsi2Q3XFFlkkrLH9qxemoqGJ
         Lbog==
X-Forwarded-Encrypted: i=1; AFNElJ94dL4moqQP8N0y8zb5nKO7YE1TCyUQDOOTagB/TLym5LQ8cZqrXNxAfo/ZWXu/JiW+A1KBBTj6UlaRSTZT+ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGDuz3i+w2jtmrOMDJsh94d7PgiJk1dnIvM3BLdwiZiwlbKQK7
	xV5RSyir2NrBTi/SFio4oXu6W5W/G3p7cnyeyPcQ43hWCcnPZZy3RgeJr5D8QNT70+dhsMlQ1oX
	ZB+PQkN2TRjAefg5i44DPGy8Ku3XZJP3tur38njYJbA==
X-Gm-Gg: Acq92OHzMNwBq3CmwqVBAbVG+ZKUt2Da2n+uf7YG1iaL5jdtEby7adzlLdO0SYJoBer
	aj2sDcLmekJ1/zjEh/Itt/Q6wu1UEYPPl2GdEuqIY+F3CJbznxDxdugfcULlviBC0As6+yrMA1v
	jQ83mDdzeI+QVW671LQbDd9ZZ1RE/jvdMnrP210YpWiwM1NN40nY5yGChQnX8gWp065dWERvGKL
	e4iRrQbeX2MApM41rRtb2xLOaHLKoSrlbRDy7BLv8KlexnbAtVjwBqLtprzrOJRhB5k39xlT9e5
	3/zG5GwYjrE3nSnqJBtiF2bP+PD2YOdxoyHBTheSjKltMgD1J40=
X-Received: by 2002:a05:622a:54a:b0:517:76b7:7b3e with SMTP id
 d75a77b69052e-517ee21406emr33317811cf.38.1781173732847; Thu, 11 Jun 2026
 03:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-wip-cuse-leak-fix-v1-0-1c028d575e97@redhat.com>
In-Reply-To: <20260408-wip-cuse-leak-fix-v1-0-1c028d575e97@redhat.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 11 Jun 2026 12:28:41 +0200
X-Gm-Features: AVVi8CfnSu0q8VDbJtoyGEYJCcOjl2tDogUfywRgVL7x8ZxksWLzTZXyfJZDryE
Message-ID: <CAJfpegsDNoT7MYDMdwFDmnZQNBK6FWd2o7KNncpyk6e2CAuMYQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] fuse: fix CUSE device node leak and add regression test
To: aruiz@redhat.com
Cc: Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 17:23, Alberto Ruiz via B4 Relay
<devnull+aruiz.redhat.com@kernel.org> wrote:

> Patch 2 adds a kselftest that reproduces the bug by forcing cdev_alloc()
> to fail after device_add() has succeeded, then verifying that no /dev
> node is leaked.  To trigger the failure deterministically, a
> CONFIG_FAULT_INJECTION-guarded module parameter (cuse_inject_cdev_failure)
> is added to cuse.c.  The test falls back to failslab with stack-trace
> filtering when the parameter is unavailable.
>
> I'm on the fence about the fault injection parameter in patch 2 -- it's
> only a few lines and it's guarded behind CONFIG_FAULT_INJECTION, but I
> understand if it feels too intrusive for production code.  Happy to drop
> the kselftest or rework the injection approach if the maintainers prefer.
> The fix in patch 1 stands on its own regardless.

I don't think it's worth adding this to upstream, though I'm impressed
by the  thoroughness of your work.

I'll reference this patchset from commit header so the information is retained.

Thanks,
Miklos
