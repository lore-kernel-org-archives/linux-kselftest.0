Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE67F407580
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 08:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834901; cv=pass; b=HY/ynsFYa2cdFHSarresX5C4GrxO4cjE2Tv7ivN7WbkWTjuy0GDLvUjIOfeYh64UlR0pVfV1x6zcb81zq3lnj/HIBOnKglrckWLs8cpC23zj4UzzbduHLl96g7nWp4aUjOY36oNJvSw2Xk2rJ4fdwVHhQDNoVLttjobUQs9G7OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834901; c=relaxed/simple;
	bh=BuSU6X06PGkDc7RLhuBIQoLj+CZbz6reI7X5a6W85Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YICk7jynUQ+lUaa4ea4EK7eHmMQB8bf/atbILtOz1sexW4uPhZDXG/u+UcQy7IP97Dm6D47t7GOjyusPnmbwjf+UJvBIenTfOS0dsRKlBEa8anbRbdJkDrUwJOfGl71F9x1TLVPm+JSj0Y/dhrGZmaThFY+4dIqcaA9ay6JJPu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZFSFzh+; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZFSFzh+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso51950825e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 01:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778834895; cv=none;
        d=google.com; s=arc-20240605;
        b=PVS6r3d6zazgQ7nI6MoigvYSAwkagkFTGWtNIILLkJGXWTLmAdawiP4Iz1N4jYt8jQ
         woToNR/9tD438SjWxHDFx/lc0AR+v2f4dcMvKf9PeSXwoPZPqFkjP5ZsZXg/PeJ5l58E
         0SP6PTC1hDkVwItu7Jy9UUhrJQKZfpIX7TzkSIxEL+BsFRBq175Ct7WrdKmRH5AYfWMw
         1nwsKmIepwQK6jityaIJfyBXSj4meXibaO7Uvl6A0QMpFuCJrm6rFggmes663VWRBPbr
         awUdF1Mzmh2Fdd3n5HOFYn5DNTC5bOiKHxs+f1nlnKh5M1Amp8Hng3qWSfuErQtdl7k5
         mbhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=80BVIdhlJiwVpXQGwMap7k4sOsggi2mdyxhI5ibVJF4=;
        fh=fUs3CnKUdih57bn5FhEWVss8UFFQUiC8oyBqwE/fKMc=;
        b=WFf7qPHnlIKYVpA0h3uSOM665sA1V/pPTcrLCN5+HA66X/y7igjsxULQsZ1GmSGL+7
         2deAkZFDPmfDX7z8D6CyspMrWuzpMr7cE2yWgj6TGZNxQVVi+c3mA+FuAc8H9W7RtqKe
         3/TZFtG/YTSCnSpMv7aHx9oyzhCQGfqzf3M5jz6TZNGg7SijXPkYTovlQcvDPuU3rt4s
         Y0fDVqBE6JbNH4uplneXYyg/QtdlYULOMLf8vgzPGMTizAOT+MAATvCJAbaBER+V0a8l
         3hicKyPP7O7SUEUEC/yX9rs7f5LiVtWMw4a0VE//IY6AtPHiAK6OwdsHAai3eAnLOhdz
         G9Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834895; x=1779439695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80BVIdhlJiwVpXQGwMap7k4sOsggi2mdyxhI5ibVJF4=;
        b=IZFSFzh+NJVZan8eZzAKuj27YM6i2FcyLNImEJ2Uh/afCJfLe9mbfdb0lcJuM0gfjn
         IBNe/LS8rOIGEL/zTuJQofXgb1BnP/pvGzghjrAnyCiRznAIeugXGUEd+j6UjMAcJ6ce
         CxRy3trSLI7ATW7HUdYW8Va+w3XKfU/jt+75p2ZGbeW3iZ+hbA0946+3zAbDu58EgN+E
         Ml7BEiBOz0oE2Nbf1Jof1ndzs3UT/F6+2KN6+EpegOixaeC0FXEYps+/jltKASwYRFJF
         1naWLQ8/KoRjlYRXhjZatTPzQSDevDmdkk3CRz4Dg4REwbkSMAEsmZZjMs8nkub1s1Vj
         S5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834895; x=1779439695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80BVIdhlJiwVpXQGwMap7k4sOsggi2mdyxhI5ibVJF4=;
        b=P2DxKcbY6/NSWdviSY/ZgAn2fV8XbZD4sbfOpCYvzZSr7Jze0nDfOiSse8Gif/qfvO
         y7trHi5lPxfN5UEOfo7jJ7Cn8Wj9UhqYGGpqLgR6sXQk63sYk8oj2oietUBsQhAIASJb
         FNfC2w3ON4M7/faV8TIoEZ811slvzqXQ/TWtVLDViE53nUkfA+yGPZZsm6zKo4DrOf8q
         NeM6hdYt1fnlkRer5BQSUD0jHUqdIk2U4/LJYzQG5MUqhbcQNuQrBjA3lykvusK6nOKD
         lNVJ9a4yQooA4r31GLrxXV7ePOPLBi1Nl4KIR6UP8f+3DCBMqzve/f26FI2Ea9Rdb/dN
         rGBA==
X-Forwarded-Encrypted: i=1; AFNElJ+5E+5yK2QpKF8meDNTIBKV9kTEgvZ0p8/1msC32lL7dKLgkOUXmXqc/oRtQCtXsC1N2VBLsPlPrvK4urD5PbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2OP4pBtZCGzxR5EjVJZRr/BsJaVS0uDGMSFs7xKOs3tI19cs7
	PzcVAjGOr3q+BO0p6enItusc0yO3Vn3+W/is9OUPlUX6yZSXA1iTgAadujw/sV792eYmnsshMyJ
	umvg9w/zhgIllwDZcU4z5AANvr428PSA=
X-Gm-Gg: Acq92OF/hGxVqB7eXjfQvE0aOZ6dE9kV472MFhjNkGQXOTWudVGf4/hpor2J92que6E
	LzNJtwRRgyLBcrwXcYK2606f7Pf3CHhRQqbCsqCW7O2ko9uEr/Hwt4x3h6GNdyaeo43UUTkbHif
	jrY/Mb9DTKDYJjgAISV6ked+C44Jc8UIi441YQMNN6XBztbA5q2Bx0z/AIbLURrNOutDJ5M6xvh
	bvXTG3qXGQDevOIzMbIwWhqvNTLKIilp70FAn97xRTSHxDPo0Sf0T7Jj4lRpkLMA5U2MfxImNT7
	Xw/SWyY=
X-Received: by 2002:a05:600c:a30a:b0:48a:568f:ae8a with SMTP id
 5b1f17b1804b1-48fe5fda35fmr31749305e9.8.1778834894273; Fri, 15 May 2026
 01:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513121240.2590767-1-houminxi@gmail.com> <f7tzf21noy8.fsf@redhat.com>
In-Reply-To: <f7tzf21noy8.fsf@redhat.com>
From: =?UTF-8?B?5L6v5pWP54aZ?= <houminxi@gmail.com>
Date: Fri, 15 May 2026 16:47:47 +0800
X-Gm-Features: AVHnY4I1GuGaSSmMujdoxWL-IyKXw_JETbROO8KstmjQW9j-pAJcDpAKNH8MHwo
Message-ID: <CAJ0BgHcq9Qs__f53kcNzG1+qYXvHP2_q1+mk8=z1Fo3TNY9W8g@mail.gmail.com>
Subject: Re: [PATCH net-next 0/5] selftests: openvswitch: pylint cleanup for ovs-dpctl.py
To: Aaron Conole <aconole@redhat.com>
Cc: netdev@vger.kernel.org, dev@openvswitch.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	echaudro@redhat.com, i.maximets@ovn.org, i.maximets@redhat.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Aaron

Thanks for the suggestion, Aaron.  I dug into this a bit and I think
it's worth doing.

The good news is that 3 of 4 OVS families already have ynl specs
in-tree (ovs_datapath, ovs_flow, ovs_vport).  The flow spec is pretty
thorough -- covers all the key/action/tunnel nested attrs.  pyynl
handles genetlink, dump, and nested encode/decode, so the library side
looks solid.  There's even an OVS C sample under tools/net/ynl/samples/.

Gaps I found:

  - No ovs_packet.yaml spec.  We'd need to write one for upcall
    handling (MISS/ACTION/EXECUTE).  Shouldn't be too bad, maybe
    100 lines based on the other specs.

  - The existing specs are missing a few operation defs (flow DEL/SET,
    vport SET, datapath SET).  Small additions.

  - ovs-dpctl.py also uses pyroute2.iproute for tunnel interface
    creation and NDB for interface lookup.  Those aren't OVS netlink,
    so we'd either keep a minimal pyroute2 dep for just that or
    shell out to `ip`.

  - The ODP string parser (~1500 lines for flow key/action encoding)
    is orthogonal to the netlink wire format, so that stays regardless.

I think the natural order would be: start with datapath ops (simplest,
spec already complete), then vport, then flow (bulk of the work), then
packet/upcall after writing the spec.  The f-string fixes from my
current series still apply.

Minxi

Aaron Conole <aconole@redhat.com> =E4=BA=8E2026=E5=B9=B45=E6=9C=8815=E6=97=
=A5=E5=91=A8=E4=BA=94 14:53=E5=86=99=E9=81=93=EF=BC=9A
>
> Minxi Hou <houminxi@gmail.com> writes:
>
> > This series cleans up all pylint warnings in ovs-dpctl.py,
> > bringing the score from 7.62/10 to 10.00/10.
> >
> > This series applies on top of:
> >   [PATCH net-next v10 1/2] selftests: openvswitch: add vlan() and
> >   encap() flow string parsing
> >   https://lore.kernel.org/netdev/20260512070841.1183581-2-houminxi@gmai=
l.com/
> >
> > Patch 1 converts 86 %-format strings to f-strings.
> > Patch 2 fixes misc warnings (unused import, bare except, unused
> > variables, redundant expressions).
> > Patch 3 renames classes to PascalCase and variables to snake_case.
> > Patch 4 adds one-line docstrings to all definitions.
> > Patch 5 suppresses complexity warnings from pyroute2 constraints.
> >
> > Tested with vng on x86_64, all OVS selftests pass.
> >
> > Minxi Hou (5):
> >   selftests: openvswitch: convert %-formatting to f-strings
> >   selftests: openvswitch: fix misc pylint warnings in ovs-dpctl.py
> >   selftests: openvswitch: rename classes and variables in ovs-dpctl.py
> >   selftests: openvswitch: add missing docstrings in ovs-dpctl.py
> >   selftests: openvswitch: suppress pylint complexity warnings
> >
> >  .../selftests/net/openvswitch/ovs-dpctl.py    | 794 ++++++++++--------
> >  1 file changed, 428 insertions(+), 366 deletions(-)
>
> Thinking about this series, it might be better to go a bit further and
> just drop the pyroute2 in favor of using ynl to generate the netlink
> encode/decode.  The value that ovs-dpctl.py brings is the ability to
> interoperate with the ovs-vswitchd odp encoding.  That we are using
> pyroute2 to do the actual 'wire' format of netlink is incidental.
>
> Some of the work would still be needed (I think some of the f-string
> adjustments) but that would allow trimming a good chunk of the code and
> let us just rely on the in-tree ynl rather than pyroute2 dependency.
>
> WDYT?  Ilya and I can work with you offline if you are interested in
> pursuing this approach.  I think it should make the overall code much
> better to work with, too.
>
