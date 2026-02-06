Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EB033AD87
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399570; cv=pass; b=hWGQK1rKO1GLq0E2B1lkZznB8W9EYvsWMPB/+g7kA+2Fv9sDV1Pr6N3IaL9h4dEmU7p5sIUikmtwfJH7WQzhJncevzTKROxFwNUxz1MxlUjGau5KhxdxJ2lGMMhPikfugjHueVnbcGNqwjQEgjy1o8yu2HQgAphHXXHqd7RJBhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399570; c=relaxed/simple;
	bh=/xcM8rEuq6wU1HRmAP2pZXXwStrfQwI5eVL19g3QaqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJUYs30UXthKRAq+WP+y/imDvA0FwMIUlnCwHELXwf4t0/9Bvv3/DVd2HW2Fhvz2Ar80JbfDiNF9q63Fh1mufU5snbJ6CCmoqfMnbNfZHtfJueCORINJ/towahrOTTgT6z3pdXOMlrAWTERonT7x0ityn4A42XLKk73cfRk+XOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3MXZ1z+; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3MXZ1z+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso15697345e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 09:39:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770399568; cv=none;
        d=google.com; s=arc-20240605;
        b=IMXoQ0Xun0rCM03ujbldEBt4NDQ1bDMAaLKaQmmCmF1iWEpPHOwClGJ2ERVeck0ZRe
         MRKyz+oZobi5Xugur4o0f8a91DHh47hnAfcS5KZXlSPJBBdWZU47TF+OBF3eoog+71rz
         k4axHGfMfXIr045tKSNA1HnfZm3pqNT4pODmK0VXV5YaOVYNR4e5GMkrNs7vAggF8S8P
         Hi38EWD7D8y4LNUIAd8uhmVI0ydFhn7xHllA5n6u62t6PLNYItZT4Tf+9im7NmJpAApf
         NTIYOJrBO63gGbKhhxZ0a3Aa1fnyDrIsAGIMpZJCq+eG/waEDhPmybf49O4oSY2TEeFL
         ePLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mxsEHElmdVyhBy8oLH1GXCMKsnKp6WZzm6RxnoWSNrk=;
        fh=G48D4Beqo8Q8DaBBgkSyD3oY0FKNgwdzYBMnFXvDxo4=;
        b=SPG6M439xsqToPk3KVexyYPxVsFy+tg8PBMd5f+8s9KNVssqyCAzwtN8J4/yVioZyk
         PguglNo7fPNiE+9wPlAfBppuIIAZfpAmFDzITzEke8s6wEPCdkh63DJt97BogZjT9M90
         VA+tS1ZTk5S08/9uuqgWfu/l1pmn6KTpd0VyDgHkljK4ob+Olqki42ggHZ/J6G5kc9lI
         bPVpi0mh4hobbKgPVsYklEly+4tuKI/hGg/b6tk4LoYpnUS5PHm2KWM3aO1zQMG4PcIS
         woW9QLvIOiKxJ1si6faZSo7Y0aji01WFpw4ZpGSm8QUfQMKASMkrprFnNPx4SpMBRccE
         Wj/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399568; x=1771004368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxsEHElmdVyhBy8oLH1GXCMKsnKp6WZzm6RxnoWSNrk=;
        b=A3MXZ1z+QIIwhKGNQ08W7aQoPinyGSMRGyC2ISaAv1LWAWuFGJEXCEoXBg/6SdGObK
         fKcM/Dd8qcm7+7VyyI8bNn8QWfe0uKVLZRzGxMneej/JEN2bqIm1zFCbDRtCFYt/qAGH
         lpxseLVXotWO+fksTgbG+IBmA3nZDmPFPZRylMIIn01u/Hq3rVQG2cMrmTytn1RT56vb
         8l5qSeOgHtxWl2WwsjXDkGmZlTUNm3TajcTP1f67j1clb18brqZ6mnk2KHwTPKcrbcTd
         FBuFHH1sV1Can/KH6GiCwREqr1kkwePWLzgkmBNXI/qu7jFMW/fc2o8EIux0f/XvOuw/
         0xEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399568; x=1771004368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxsEHElmdVyhBy8oLH1GXCMKsnKp6WZzm6RxnoWSNrk=;
        b=QUCHHyShXeAjt4eFAEh+KMJCDU1hdUwtvO1yT3Sk2WUFUJqfu96pUIGDLIzz7BpVRy
         0hYP00EUaVNZ9tpUAtnt2ZE+YGVtpGRo0A4u+ybeYFJaxp65FXSLG5yA0ye6CgFIdpXh
         XAuf9z6/u5B2hrsbMGqMlyr3iVJFlsF6/vEs2LUXPMd4QIVRHhE7qSooygQS80gg0EFG
         Y9dVn9nWDBOgIXdxNuKFWmHTnnFClKvfvA5DOSR4m2K7Fs+4wU39lt2TGU2KzgKjtGF/
         2U94a0A0eqP+r9e/O/KIn8koSCjmAtRZyBhbDqphE3KBf7yePSSLidm7JMrApbavfTOH
         NVJg==
X-Forwarded-Encrypted: i=1; AJvYcCU9m/PQvrUrkan2w5Ydy1wsGmEA4hmih1F07ZuKQhAD1feWWOi6tW5jiEvtLiP8wmm023et/JdIu+t6d07IDgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcBEkw7vaOHP9RBwAxrQ/0KBg/9UZhAKcfO4o1wTkU+AHf6zZh
	kQ/Y0VdoarMjI3bFzc+jXSR74JbiaXCcGCk3uGYdeFD1+puvEwBCCX2Cos6JWu1X0wFkJABzbaE
	NAT2F0PbQrh98vwolkL1w6KM5DaYBYl0=
X-Gm-Gg: AZuq6aIlcmUT2oztVJqRIfnuB2t75IaFbyxX6lzZJFycOIkyUE3qIzIcE3zwtlkwc43
	LGLuhZOzjQRWULT7fgPP/ulJawDZ8QcKUiEzpOqPeTQ9LLlKgeFn784mh6dLONOvQcate2wYoS3
	m8rE6VRrpNwUoMBJfQyeX7n2eF6UV8M3ks97e3LI8GhfA9UPhFhFQuEVktmtRvlbwxinag7OvwI
	VSTnhNcUTJxv9t96dDA9JR/Zp3KJsqm0khU6PajbmCGHH/PVAyxSgWZCVAoAR5LAzCedVp+lpK5
	37NDew+0F0D4TUQXrSnDhP7cOkKf9CfxOF403KXvN+dPkav/FcCc+rtnmTqzbzO6IOHNuzcwZTb
	5SR//zFMGfmiIJQ==
X-Received: by 2002:a05:600c:6209:b0:480:690e:f14a with SMTP id
 5b1f17b1804b1-483201ee840mr48075395e9.14.1770399567976; Fri, 06 Feb 2026
 09:39:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203155103.2305816-1-larysa.zaremba@intel.com>
In-Reply-To: <20260203155103.2305816-1-larysa.zaremba@intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 6 Feb 2026 09:39:16 -0800
X-Gm-Features: AZwV_Qhiudu9I4yt9_TPQJS3OSxaKo3Vh7XUGlL9nFcebbE8dzWA0vJPdWwRON4
Message-ID: <CAADnVQLszbJ=dMjmAVkj1zGBPhhopU7XHH6bc1UHEemXwbgxzQ@mail.gmail.com>
Subject: Re: [PATCH bpf 0/2] Fix some corner cases in xskxceiver
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: bpf <bpf@vger.kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	"Bastien Curutchet (eBPF Foundation)" <bastien.curutchet@bootlin.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>, 
	Jason Xing <kernelxing@tencent.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 8:18=E2=80=AFAM Larysa Zaremba <larysa.zaremba@intel=
.com> wrote:
>
> While working on XDP and AF_XDP support for ixgbevf driver,
> I came across two distinct problems that caused tests to fail
> when they shouldn't have.

Applied.

What is the status of kernel side fixes?

Running test_xsk.sh I see plenty of

[   93.609026] BUG: Bad page state in process xskxceiver  pfn:115920
...
[   93.633927]  bad_page.cold+0xd0/0x140
[   93.633929]  __free_frozen_pages+0x85a/0x1150
[   93.633935]  bpf_xdp_adjust_tail+0x808/0x1120
