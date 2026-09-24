Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A17B428495
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233876; cv=none; b=A8i4m93nzfwAxYkTgpfKqanQ4ilxlY/m6Ns3EnZysCYYpWHynCDQtSluWBa5zpJ0qdvPkemMWR2jM8NiTQCZcrsci13elVxnX7p/BOti59SxSXh7C0liWofqzOEA9cCCPYmf9uhOWs/mzaVtCBcQV3YP3fGVyC2hHIS0lFl8IMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233876; c=relaxed/simple;
	bh=ZuEmG6wBl2efC/945xSQ8zaEHszttX3U0I2BPYqa8Dk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jWuHMRkkPn8HcH/uKov8k+s0mt99ADP7TDfriwQhpKc67UDZ8YkLefgnGrMBQZ4seeSUGdbaoU8BQ8zvgkr+28HH4Ak3XobHwbxxuCWouncsFhJfn7Pd26tPGqHaqWiCXwvic6zcGXqGLQhVOLHPrFG2iiAZozByda1E4ueTCXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbZVe+Gb; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbZVe+Gb"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so10143925ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 00:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790233866; x=1790838666; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZuEmG6wBl2efC/945xSQ8zaEHszttX3U0I2BPYqa8Dk=;
        b=rbZVe+Gbn5WFoJNWmttbn9T/hrYcccuJLmz6b3bzQl6q2MqGIUboFWOOmhhTch1bzg
         YdebHXD2Lo8i4NywcmFbsCrZl92FnGBmPT0h2iB0adZsv3S4peYyAaH2ipwstoBOR9xm
         /YFPMuytnpUVsmCs0cJOG+iIOsWtcF4csBQhcGK4CorslU+0A7hh68DlIxalJgEks4L0
         XJEhblVZbug6X33LZNCMGEstqXkZ3q0aw5zIFXacMZylwMpoosVSmvtBeG/LB7PgidN+
         y7a84aLPMi/yfqx5QWIcxPSjvB3/RNrLzQY2bTYN3EAk5ibazlHpRFx1sUpnTj6uhU0W
         +yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233866; x=1790838666;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuEmG6wBl2efC/945xSQ8zaEHszttX3U0I2BPYqa8Dk=;
        b=t0Hqm3lUGyHlt8z3TBgpr0Qqmut5RZYeWkN7wOecN6O063d+Uth1OIehe/AcExNy/S
         Z5xJYSXZdBHUrrxQ7oOU9fkE564MsV0IpHlqgxD7YOpYXH+vgMeqDKEtSoH3bLsU7lJz
         fkI3f5EQfYd42BJ/DIOP2tty2SdCrVMFT3yza3TQS8r2bZsT64gZr9odJhjZlPxxCtB1
         VJg7IGXRyZVNr0k5DQ60jPdjoyoItfnRTB0luXKi+EfFdIy02zU3/Xgmd2bkFL9m2MQk
         RPLenIDp0X0WybmyGD44L1oAl6W0TC6miN+3n41js6EkoRs1KQ4+1jQQcaFYggc0wRFl
         TH/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3qSHnTnXgsCOEIcfgkdzyGwovw2duPywe6Cy/KRE/nYiNGGTiO1K0oEMsII4P6NMx2AlSz0CjtGLoLPka5KU=@vger.kernel.org
X-Gm-Message-State: AFuF++lakfrYGdtjJWB6qAb77TrORmTywM92KLH+BfsXLKWdnOU/dHRq
	4Ivt/p1Ju/rEeEb2aQLs7Ragi51Q0ht7U2OB9TKomFYoabfjCGmpO4fD
X-Gm-Gg: AYBFou1oEplb4g/CaCTX5q73Nb9RpHiVjEQYJmPFq1+EL6JOixRLe67KmLJzgcUnveW
	Hj/57OJrOUt3AGYFVynFquWV5Kyob8FyJTEH113lvJYQpuTI0hjfbo1AOZc9KXBBn2NBw5Zw/5y
	HTBw5XanxEMnh6nMSq3g60VRl2BuBPgTQftG/Zve7+xoJpyxvsBjYbxZUyi9hsuDz8AZcUPa1BI
	H3E9RSakOqpGkuA1/gQS638juWNUWsM0cmbMMHSYL7Cd6lECRUgFC9j2a9Mfjs7+O4FPQhv4qr9
	hPPObJn/z2V2pP3nyVd9gue1ihj+Z34ZIW5tXzr3fl+nQIwsJLKAA+HgSkGDA5juTLR0XWIPEsC
	EAXIHljbRqErwmKJ27eQtYCmZvXI5tGLRjl//R/USNNdUbYLc3sfsQ0wW24IxVBjU7Bi2oZsh4l
	7h7haEr8Xc0bFZb/rBgJsfBCpmIu5wKgmjOTCe+U6Zk/oIs7r/c9USxerlpKwpcnVLnY7n9DEDg
	v+yIgWaxjBolSvtmpptN61Ov+s=
X-Received: by 2002:a17:90a:1090:b0:3a0:a515:c480 with SMTP id 98e67ed59e1d1-3a0a515c8cfmr85375a91.29.1790233865909;
        Thu, 24 Sep 2026 00:11:05 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09738f2absm3113496a91.14.2026.09.24.00.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:11:05 -0700 (PDT)
Message-ID: <1eb267761bd627b63e5c78bdf76215c019aa3fa0.camel@gmail.com>
Subject: Re: [PATCH 0/3] selftests/bpf: Fixes for out-of-tree builds
From: Eduard Zingerman <eddyz87@gmail.com>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>, "Ricardo B."
 =?ISO-8859-1?Q?Marli=E8re?= "(SUSE)"	 <ricardo@marliere.net>,
 ihor.solodrai@linux.dev, nickolay.lysenko@gmail.com
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, Emil Tsalapatis
	 <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song
	 <yonghong.song@linux.dev>, Song Liu <song@kernel.org>, Andrii Nakryiko
	 <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau
	 <martin.lau@linux.dev>
Date: Thu, 24 Sep 2026 00:11:02 -0700
In-Reply-To: <e4761ef3-4385-4ec2-ada8-70f293c14331@linux.dev>
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
	 <6f95ec90-194a-4304-9673-c7bb50065223@linux.dev>
	 <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
	 <9e055710-d607-4a4c-95c8-eb3a0b4aa1a1@linux.dev>
	 <2a1875a99b173fec18d214419efbe876dcd95ad1.camel@gmail.com>
	 <e4761ef3-4385-4ec2-ada8-70f293c14331@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-23 at 14:06 -0600, Nico Pache (Red Hat) wrote:
>=20
> On 9/21/26 3:42 PM, Eduard Zingerman wrote:
> > On Mon, 2026-09-21 at 15:15 -0600, Nico Pache (Red Hat) wrote:
> > >=20
> > > On 9/21/26 3:04 PM, Eduard Zingerman wrote:
> > > > On Mon, 2026-09-21 at 14:40 -0600, Nico Pache (Red Hat) wrote:
> > > >=20
> > > > ...
> > > >=20
> > > > > Given your series was defferred, and there is a "rewrite" coming,=
 what would
> > > > > be the best approach to working together (between us three) to ge=
t these
> > > > > fixes in that series too.=20
> > > >=20
> > > > The, "rewrite", as you call it, had landed today.
> > >=20
> > > oh thats great news. I checked on Friday and didnt see it. Thanks for=
 the update :)
> > >=20
> > > > So the series in question can be re-spun.
> > > > Regarding your patch on top of it, it appears you can just post is =
separately.
> > > > However, I am inclined to be confrontational towards changes like t=
his one.
> > > > The purpose of the selftests makefile is to run selftests as approp=
riate
> > > > for current tip of the kernel tree using a very specific kernel con=
figuration.
> > > > Main users of this makefile are BPF developers and BPF CI.
> > >=20
> > > Yeah we are trying to reincorporate BPF as part of our CI. It has bit=
 rotted in
> > > the Fedora env, and our large amount of build variant is where things=
 are
> > > starting to go wrong. We need to build selftests for multiple variant=
s, and be
> > > able to specify which variant we are building for. Hence the out-of-t=
ree build
> > > with specific vmlinux.
> >=20
> > Why can't you build the kernel and the selftests in the same out of tre=
e location?
> > The change you are proposing is contained, but it's a death by thousand=
 cuts,
> > the selftests makefile is quite a Frankenstein's monster already.
>=20
> Due to incremental builds, and tool building in different env's

Can you copy vmlinux to the output directory?

> >=20
> > > Is there any other approach you'd suggest? I personally dont work on =
BPF, but am
> > > trying to cleanup/fix our selftests builds for Upstream/Fedora CI.
> >=20
> > How many Fedora-specific kernel patches do you carry already?
>=20
> So far its just the series Im replying to here, and the commit I appended=
.

Okay, I was under impression that distros bear a ton of custom patches
and that adding another one adjusting random makefiles won't make a
difference.

If that is not the case, then I'm being unreasonable and the change is smal=
l.
