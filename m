Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E0538C2D1
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 06:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544816; cv=pass; b=m4h32AZNeL62r8Z/sYFmI1AU2rlZf3C98rNjxb3xp0lucdj+C/qh/YPVXGoKlZUrs6VMwi7LRquwa81yRzak5s7BwVfM4R05usFmWCQPyFIB8bjEyfmhFHdWeYIvGLInvtzH0QkWekC2i5wVCwM+mXiFk0BtIZdW0ZY0HYWzsws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544816; c=relaxed/simple;
	bh=FWpfwl5EpG+FUBdNljoQk7IzodPiLTITpijDs9wnTzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5/VomOO6R1On6BT/54J8m1Qayd1/iXlYzSiaMXLLDQp2O7OpcnVMo0lL/UfWV6OlBmTF0IRtFrH5QJzDaPDgYgFlGn1dEa2Zp+8i2+b2vSm8OIJm/xEqEnzm6Vy/orap3st4dLARhHu/4US50FZW77kRmd395DZLmnDPDzsG4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUXv6ah2; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUXv6ah2"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9c01854477so767994966b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 23:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775544814; cv=none;
        d=google.com; s=arc-20240605;
        b=cF+0hijs6pXg/NLaiqpV1JNHemMLlXPlmSwYZaIHIHRaHDdSdLRHxhIkofN9yNJ/N3
         HS/uePl1hKJTdeca4YdnbMI/25GGQUqpVhkkCq4y53ezLRB6wrB/iPmkwIdzedv29BwE
         N42/KyY5yNU1zD+PQhlSnEV6hrQx3O7o0WXlqxaQmSAD7hVo3O1zzvdkeBs6lUUghfDs
         HvLjQrxOArFkpBgmq7o10o6o4IN5aN+/Mdg3m5AiCwYrO+MrH7Byz+/LEiZuC32eaDtV
         V/WWK+R12GehKvTVFEMz/OxE9FLwg3q1/D5MfkujV58lnNVvhbPZWktzEbzL05sf33lS
         oEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3QGGQAplBq02BHVXyopNXftOCfxeBQ27SGZLzvlb5js=;
        fh=mhIriqhgstd1HO1E2TwNCHt6tiR74r4r3iyExH97gdg=;
        b=B4R5wfkBBqPAiU0GIUD4qNgrGynUr00XO3bzSWg8mZqBnLGJOLN/1QvXo8tgmNnKhf
         hzIsEJc866neFnVSQT8uZsa+SJtE/N6IaNFv2QSowgOKvq5ZYM6K6kF5Y+nrGxBxNeUn
         PXZh2J9HepDpEeb9jtdQeDMvqUMfBjlvCCXeAcA2jhnN5zMDLA25VNWg9dAD4uVFTEKl
         HRR1agvsZcsbAsWxriwm6BD/GMRcUu0OQxEUsrs2CrOTo9GMeOV0nyk7HslA4dwbyz3/
         o/qcRgiOtPw5pcQihA7N8mnxDCxP9XxySZ+iR7kWodcWMw2nCkycJ/GMlp+g8185yBRp
         PDig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775544814; x=1776149614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QGGQAplBq02BHVXyopNXftOCfxeBQ27SGZLzvlb5js=;
        b=ZUXv6ah2qQBkZXMv+MA2dVfH/XDZVD0OjZckCL38OtM23za8PBlrP7Mq6fZHNi9nrl
         srItEPrpBWiOHHvOMbhB/r9GMJwG7zt2HEPnONVFD7XjZUPMz5IHaPa7L1uXkPT2+m+4
         1qxulKqdPEB1igC4Pxi0JaVDldAAtVXEAlhvZcP3KxNdpzdff+y82C/Mx2Zk1MQy8Ixs
         bDeaXKCJKrNWGw6LiHwnlwY3G4wpn67YyoGH76KzdQcO5RWoEhMz1jkeYqJfgHX5mOgq
         c/y9x54wg573WKFCCkc95+74q0VE7Y0h+jCeaXoo0Jmobn+I7CJXYvwmgG6pF6KD5Wna
         KxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544814; x=1776149614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3QGGQAplBq02BHVXyopNXftOCfxeBQ27SGZLzvlb5js=;
        b=UOenAxfSvmF65ZKDOH0dYXriv8BM3WzMuOQ5E3ZKbF0/caBFUBWFZpV/MRLcELw7Yn
         wrQH8FcT3352Xlbwra7LL9+fFuoaIhpMvxHeA1Xr/pih/Lto+L8aQ8UsIUm3e8TwqgvU
         B5tOLsk3TSXlIpjtT3MWrNC18voe4Foi7O9d8xIdOr8PfzT/ZEaFVud6Uxz1IkMgFPQh
         QuRY9y8EtgQ8uAhO58xhmpmN8OanU7DHSv+MySahENsTKvRqkboqijSaPOtpFBNQPRod
         xGrefAaj6tW/mPX6metGJCby2p++fIiVpsB/mhuaZZ3LFjJr2SZrr1pI/pG2IpEuw3Pj
         44/g==
X-Forwarded-Encrypted: i=1; AJvYcCV4nwIRNTKhdeC99jBGQJS0boSwiS2m3id76MsWc+m9Q9dKm5tRuP3VpLTJkSvNugnLABzvG6Dw6jjoQQxxSEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq0A85e/X2miSSwegvcImkRD4lcGMIWIZjF48ui1+vPSgtCcSo
	4zR7sB3pyylH+Rz63ZDtaQfAG9f9yqCfSUXHI5aWHQt7lU+8HlAtT7nU3C+46/s6rNbPJ/MUst1
	UAhBmoe1A7BUR2dmYI1YubJ7vG/G6jn4=
X-Gm-Gg: AeBDievmiGrjc0NWAdiYNorShYDJmg1MpjQN9/wkCZhAlo53FkLNSkxCXV4PD7ckOeW
	CLvqz/SspPnUJQE4mqfCsN0ydwxfYBWiFtoHp74igOgATARqRav/ou1bXREHl4uYVlRlpyXxMD4
	IHkEXzNjHaySGy/jGwkL/rg3UMGDcv6ErgFy9R/5JLPbvlVPUKhQrLef6oNqwg8DNLZjIw/YsQU
	S8PRxoEBbqNofHEstTCi0NNKX/ETH5vKhFzLlpkpWtA2qDY52PZrLq85etE+bYheq0lgnR+3CyR
	v066yeN5z1amowxEuA==
X-Received: by 2002:a17:906:f581:b0:b9b:1b9e:1e99 with SMTP id
 a640c23a62f3a-b9c679580b6mr816033466b.34.1775544813579; Mon, 06 Apr 2026
 23:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403150050.1235-1-royujjal@gmail.com> <20260403150050.1235-6-royujjal@gmail.com>
 <20260406182504.52a03794@kernel.org>
In-Reply-To: <20260406182504.52a03794@kernel.org>
From: Ujjal Roy <royujjal@gmail.com>
Date: Tue, 7 Apr 2026 12:23:20 +0530
X-Gm-Features: AQROBzDobic8jv_imKaJPmW4xt1c4Ipd4HaOp8P0tUSTUyRBdcWdqg-PViFb7qc
Message-ID: <CAE2MWknnJHgdxrC8mVPsCxe91WfA4aS6JZEGvhG4u3Mmq0D3EA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/5] selftests: net: bridge: add tests for MRC
 and QQIC validation
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, 
	Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, 
	bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 6:55=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Fri,  3 Apr 2026 15:00:50 +0000 Ujjal Roy wrote:
> > --- a/tools/testing/selftests/net/forwarding/.gitignore
> > +++ b/tools/testing/selftests/net/forwarding/.gitignore
> > @@ -1,3 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  forwarding.config
> >  ipmr
> > +mc_encode
> > +mc_decode
>
> please keep this file sorted

I will keep all the codes under a single file and keep them sorted.

>
> > diff --git a/tools/testing/selftests/net/forwarding/Makefile b/tools/te=
sting/selftests/net/forwarding/Makefile
> > index bbaf4d937dd8..a26da846632d 100644
> > --- a/tools/testing/selftests/net/forwarding/Makefile
> > +++ b/tools/testing/selftests/net/forwarding/Makefile
> > @@ -1,5 +1,15 @@
> >  # SPDX-License-Identifier: GPL-2.0+ OR MIT
> >
> > +top_srcdir =3D ../../../../..
> > +
> > +CFLAGS +=3D -Wall -Wl,--no-as-needed -O2 -g -I$(top_srcdir)/usr/includ=
e $(KHDR_INCLUDES)
> > +CFLAGS +=3D -I$(top_srcdir)/tools/include
>
> Could you please keep the format more aligned with the ksft
> net/Makefile? Also is the -I$(top_srcdir)/tools/include
> still necessary? KHDR_INCLUDES don't include $src/usr/include ??
>
> > +TEST_GEN_FILES :=3D \
> > +     mc_encode \
> > +     mc_decode \
> > +# end of TEST_GEN_FILES
>
> Also needs to be sorted
> --
> pw-bot: cr

I need bitops.h for fls() API, so I can see KHDR_INCLUDES is not
needed but tools/include is needed. I don't see lib.mk is including
the tools/include.

@Nikolay Aleksandrov  Please review the updated test cases in this patch.
