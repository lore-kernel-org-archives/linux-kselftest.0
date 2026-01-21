Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AD9439014
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 22:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033069; cv=none; b=BObMEtc/iE5B4LxpH+AlQpEUaTz2B4AZZJbqQjq6HLzXlFpS7CRekjPXH40t+P0DNJ9jhbVJ+m8cMz8Xc4tuUjF0fg5mwFCpxlO/lj96hp9LFOS4h+tk2eQbn9e07ZFispxcdBo4jlYH/RNymtbUi2kT9AeabrGDtkk1kCq1+pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033069; c=relaxed/simple;
	bh=BPC40cd+PK6beKXkMEkAPgW8Vuk6zBAwXi60FwrFXDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3TSwfdMqTNc7nqZXxDC8XY8SSUPXaKGU54gRMyPuWnnCh8qfAkrSr4Y94knNPD/7ckrViAfyMpZJNxTEbsrhFo+Qhw/UmERs3961s8JKMXZeTy1AZe4CLqE/YIDV3ICyYFsELbh2V8JRiPVORUSyYWo5ifMnZ73DBb7Hc5wOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lnc/OCVx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lnc/OCVx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801c314c84so3169815e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769033065; x=1769637865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ68qOu/lJJCVxKn/HKtPSCAAtAx0dItgoT8Dw3lvcE=;
        b=Lnc/OCVx4gJnZ/x2tFPCQgcXmDatmD16iiKDPuMLI0gEK1O0lsFjr5I/dukAODtwMD
         +KxvBiUbQLJiayd5eR3ePPd3pKxFrptiCURDoW0YHhfOHz8nwFyVS6V3gTFeoM7D15/O
         3A2kBjXUon0I904hqTm5S14EzBoYiYHnmHz2ifopkmCKaTTeYBQUGceFSzq4bkcxHyRU
         Fo1wBVblhit2N3Ko+3fYX4ie84/zFjQWPtmvFogS1hvshclw1rFVQxdVVRrE8D1l9dJR
         J1amcpEbZEvzuHKTLHoU5XIoHHKk4iATqQSD8BE0lJVoYnAoqYKNvn20DBiXWTEAEQZg
         ruTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769033065; x=1769637865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJ68qOu/lJJCVxKn/HKtPSCAAtAx0dItgoT8Dw3lvcE=;
        b=jE8J4iMy3xc/zddILtKrYmJFoYbGgyUX9dukUhrSNaUEnC8DirmppXSX8lfPnaFCjo
         7HDNiI7y5qoVx/tZCY8uJA6K7iC7SW/e9hKdvuAVnhPAQDPiILuRy7QsuIhtxcVFgVgL
         /67BusXxy6DI3MnLNCt1SyLQbEWmGVaqOONltty25fzcJq4UjxsbnOKFovXvKVK30SPz
         YLoo/JzbbOGD4xczdCbhwVUE2ruCiCL6S1cTeysRsQ0/51i9Lyi+mcurQVZeFEKt0pYH
         sqtIUBp1CzveiCJkLIAdUiMpAJxLy8XB/VlOE58618v/2j1HWk/Cm37QVZ3p5zuBZD63
         b03w==
X-Forwarded-Encrypted: i=1; AJvYcCWQt6QqenmksH1nqeAsRV+lxu2a3fXs1+HQwDim6/Bv20fcKb55JUQe5pwbnPq8b5VJVoCVRIv/82TEcL7OabE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6rEtwtssXLaAA8TqOVF0q8J2zibaklDyedWdbvwp7UxMCTcpy
	4iolphbL+YYfbmI8Oi6BYQSbZ82ORhnlK38aBJYI8cIJzYAMnbI+feiqqjAIYQ==
X-Gm-Gg: AZuq6aJygFdr6rnrNfNZzoae+YIcueLSYd0GSEkSfygva69l6P7Nzf8SViHe54fRzXI
	fGQn+9ZhmFLtTdLHIn8Ob2dxKU3+6kZ2F0BYDLWI+ZcY/y7ffMO69PxqaPgdODYdmiu7cl04MiI
	ccH/fjFjOrjz+PEtmYJ2Ir9UVfGus0wMrRVr84mJd7avsHcZXvejBrf3E5Ze9yUkawzH4FCTZp/
	6t4Cpi6rG/Qz99JyQt0EJNBiIgejvzPHYa1YZhWT1gaqtj4tpVrvPJ2A9phLwZnVdrKKL0RkAT9
	b3S+txgFM1aEptjbbMcctM1yU8VkZswrBbH7kWl6QRso2MRSMQT0Py64DFLtddGCCl4qycieOnu
	wBRmUM6myPItbjbG0xudXhm2H9ni0yV/XmeUKWAmjZrmMsvkUUeoDKqoD69nblTIARoNufU7fnZ
	fGDhTOwA==
X-Received: by 2002:a05:600c:8b27:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-48022668fd4mr258559955e9.7.1769033065384;
        Wed, 21 Jan 2026 14:04:25 -0800 (PST)
Received: from archlinux ([143.58.192.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356999824csm39410535f8f.39.2026.01.21.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:04:24 -0800 (PST)
Date: Wed, 21 Jan 2026 22:04:23 +0000
From: Andre Carvalho <asantostc@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v11 7/7] selftests: netconsole: validate target
 resume
Message-ID: <aXFIk1L8G_dHF6od@archlinux>
References: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>
 <20260118-netcons-retrigger-v11-7-4de36aebcf48@gmail.com>
 <20260120172057.6600eefe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120172057.6600eefe@kernel.org>

Hi Jakub,

On Tue, Jan 20, 2026 at 05:20:57PM -0800, Jakub Kicinski wrote:
> On Sun, 18 Jan 2026 11:00:27 +0000 Andre Carvalho wrote:
> > +++ b/tools/testing/selftests/drivers/net/netcons_resume.sh
> 
> There's too many of them now and they keep failing on real HW.

Since these tests are only using netdevsim I was a bit surprised about the failures
on real HW runs.

I'm suspecting a race on my workaround to trigger reactivation and these runs
potentially running on a host with systemd with MACAddressPolicy=persistent as
I'm able to produce a similar error on this conditions. Any chance these are
running with different configuration then SW runs?

When the device is recreated with the same MAC address as before, there is a race
between my workaround and the resume. netconsole will immediately resume and UP
the device, then my workaround goes and:

ip link set dev "${SRCIF}" down
ip link set dev "${SRCIF}" address "${SAVED_SRCMAC}"
# Rename device in order to trigger target resume, as initial
# when device was recreated it didn't have correct mac address.
ip link set dev "${SRCIF}" name "${TARGET}"

The problem is that the rename won't resume, as the target has already not deactivated
and nothing will UP the device. 

Doing "ip link set dev "${TARGET}" up" at this point should address this gap. Alternative,
we can skip restoring the mac addresses if they are the same.

Does this make sense? Perhaps there are other conditions that can trigger this, but
running it with MACAddressPolicy=persistent is a reliable way for me to reproduce it.

> We'll keep this series in the queue but I think it's time to move 
> the netcons tests out to their own target or move them to netdevsim.

Given the above, let me know if you prefer I send v12 with the proposed fixes or
a separated follow up patch to fix the test on HW runs. Since you mentioned keeping
on the queue I want to make sure a new version of this series won't mess up your process.

> With absolutely no error message getting printed :|

Yes, debugging these has been quite challenging. I'd like to improve all netconsole
selftests debuggability in a future series, looking to work on this as soon as I wrap
this one up.

> 
> TAP version 13
> 1..1
> # overriding timeout to 360
> # selftests: drivers/net: netcons_resume.sh
> # Running with bind mode: ifname
> # ifname : Test passed
> # Running with bind mode: mac
> not ok 1 selftests: drivers/net: netcons_resume.sh # exit=1
> 
> https://netdev-3.bots.linux.dev/vmksft-drv-hw-dbg/results/482560/4-netcons-resume-sh/stdout

-- 
Andre Carvalho
