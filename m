Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583813469E7
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838753; cv=pass; b=R8CdERW1WIMNyoy0oMzHZ7VEeIp8dLh3lezXX+5jHmz0ziqqdAD047fq5N83FRBpg3D6SfcYN41WHoJ4L1F5/3o1oOfsGFOZKgXcb0wGtiW1eONMr8h2vgOy1orb35iKJ5w/2h3XsRtbf1zy5ofLDLPxa3p37bdn1d1gLJgR4qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838753; c=relaxed/simple;
	bh=D9KgXj3p9xpu5QhxeThPSX6EQ5/AxPP4nNd8EGLcxC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxLPhSqVv5NX1krhS80R4WCivj3YjkUUpMC+XFUjqPg2suGA57XRkTSkKVV5awP6CkvtMKO9+bUbK/LxIag5pWwa1ogrBVlJoEMOoUfi1G/Xjlpe5EEdv7oxgGBzeEB+UVPlB1WitWLFU4l2A1qZD2LjiaoEHGXLVHs+Pf7Q+zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4kdKYEr; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4kdKYEr"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4955cd5da3dso1275729b6e.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 09:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782838751; cv=none;
        d=google.com; s=arc-20260327;
        b=sYv90YARjpTohRjgwly2i2x8Ajd8A8422qfnHtut+w631qGdcYhcOlhfIFy6lNBobp
         xJLs7u2ZwFFZTpDT4PumSGdLxc39oxv4Hf4rK2wqwOBmzHEX4AagNhTY8KWII/CYU2nF
         u2IhMESMFhQxEsSYsvccpzxt2pArQW3oIpxq01iFFEGYxhfApf87xvVlETln3gJfcKUN
         HeGYyzEloftaYQ5uuIXg8k0cZZ2qnc/0YbbnU05tx/1D6qdgRglWAwq2IWBisJ5QDdCc
         PuxKYC6nvtbete51vntdKrXCMEV4ItwD1+/zP18IFv6fN0JR6RONPf4xy2MVLE1T2Y/E
         ux8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k4zfz2a25b/4hh/Mk6SSry+b3vjwL3UMLdr/ekqsfYQ=;
        fh=aNpWexvoOYtgc4PBBvioStExTSR78RNnjlDYwJ6tujM=;
        b=Ib7BUP3xW/RPOt2FT5ENA3s/LWKM4D2UwnqtphE8d1wrzoegvKwXDgDlFv2K0w2KnK
         sVV0Rk9F7j+kL1SKE4isfv3/Iugg1JzsExy8hrEyKlVqdDWm57szGUaHWpPIOfB0xAKH
         anuo0GT2/z8wnxvobtG/rapAnrHSl1shYmtrpriNksLx8AiNkBasRV7b12BwcLZWFleX
         0CRH6vNTsSZkNvH003t7lGwSW0NHXZA4LlVCZwPu8lsMJbXwovJn/6izHo4MHtBgOTb5
         a8r0/HVWZXqOvJTCr4v0C2TzSgjNr89vmaYp/7tU/meZV52yJ1C8ZJDNh4NC3XKaWalD
         nr8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782838751; x=1783443551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4zfz2a25b/4hh/Mk6SSry+b3vjwL3UMLdr/ekqsfYQ=;
        b=g4kdKYErtQNzCZupv1lTZSzilQDo9g2hTmLFFPdVUWU5rLM6lZ01g8jLorkXWtC+Kk
         tGw+F8DE8MzSK0BBBgIoUcQvuBeDdTVIVwWgY2+NFN8nUh0AhupuU+PMjgP3K+DnyPjy
         3a6xUFcVESgMTWVjK1extq12IUYul3t/eyLUUrublA1M3kj+pkIHhEleIDIOnQEwxUer
         WKQs/s0BUhBO2OFFERRdIyjCL9JchzlG9hGtSLEAM/slkkP3Dz3qXwmUl5nkKNFEI0BP
         oCF0qS9TcSFml7QPGyAYhngLJDmqjowZfyTYHwS9vSzNtL0w6WhXoDwX6sj/1VmFQpoi
         FFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838751; x=1783443551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k4zfz2a25b/4hh/Mk6SSry+b3vjwL3UMLdr/ekqsfYQ=;
        b=adUtmUvtO/3P8VR86/aM7/KN2X2pL27D7rsVP0uT1NJx5W7iwhW+CVmIFV5Ie4hDc9
         uwWbehXEtSzxVAQjdRxVM11zu+o6pdFuqN0pdEdGtebLMJaNjZu7RoCw+qvjeAVbklXR
         tqjooMdiimBcje4L+8U5ajjIgon0Tgj84xbMexFFrabKBpenkhFH/YByOYHmlF9DzuIr
         l4xq9qBmJqaQVrQWHSeLZ4m+xUByofR0G1otbl9+SkZZzjfO7bk0NueY/E9ylsJghYEZ
         vijrzc+54sU+gJSM9OXXY8dJuZJwUjJBvJDlBJbmw7trRzSFojpQdoUkcDPF8163Z8bl
         tFGA==
X-Forwarded-Encrypted: i=1; AFNElJ9cGjOAIEwdu3x0uSn4jkDR9UTREljXLkTKr39EWGMfTIsMS4g/baVHhlhbUIWJy2RSGdVJjSAhVPcXhYh+02I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+N/HZiRipDxNP5iXeDFjZBjdraZoopOsXL94UJF1MEO+erGjt
	4f2/pjNFucnyYzTKJx4XKo/QentQTNi7Tj0HPafE+d01yOzRIKw/BTkB51QU8EZ1cc7jHPsjd75
	m5kheb5JoLEboYmfjbw0u0pw1Vl/MCHg=
X-Gm-Gg: AfdE7cmdxFe9ekMzesOTeU+NoheBp6KDsHOx6Pf9UBwf5a5/bttvuJqEwgZyNKV4bhB
	Udp2MxTO+zt8osDGVWvQfboAB4ZZ8dde6nV2SKo8DQvMevX+CfE0R7FyAZQwA0DZj7GVMYvGR19
	5mkNBaIoozZlpsDp30ZLAPtrgyuFC7z0FEvCt2mPpv4ZCO0J8EfhNZiJ5SY4XRK5bpQHVlVwj+S
	bkt3GsWwT/VlbRhxPGRgMl6S+C1dXlma6DEu4loKvubQTKS2HFGMCT5gTdI0dzEdyj1sg==
X-Received: by 2002:a05:6808:10d6:b0:48f:ba75:4d86 with SMTP id
 5614622812f47-495fd786f9fmr877167b6e.32.1782838751296; Tue, 30 Jun 2026
 09:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622043934.179879-1-farid.m.zakaria@gmail.com>
 <sfv7zc6jboy2oxv7zuyofysas4ncbzenwsuzveiyduisfr6i7q@mx23er7uxdbg>
 <CACCo2jkDuwy5w_yhX8833m+s-rY736pk8xtKjxg3_y_7BCOHeg@mail.gmail.com>
 <24420045-a6eb-4999-ab19-1e344eaba8a4@app.fastmail.com> <20260625-atomkraftgegner-hunger-kursbuch-b452ff2becab@brauner>
 <CAG48ez2X1p5Nm2_sU=SK9wUusUO8c3_T-=FGrrOhkm7Kn9Y_7g@mail.gmail.com>
 <20260628-ungeordnet-orgel-stechen-36dd64038541@brauner> <20260628-debatten-vertagen-amortisieren-3bf518773e75@brauner>
In-Reply-To: <20260628-debatten-vertagen-amortisieren-3bf518773e75@brauner>
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Tue, 30 Jun 2026 09:58:59 -0700
X-Gm-Features: AVVi8CeK8WjwHCQZDoC40WvF605CJBeqNgve_898b7N0eQYbsYh8_ELB2RiXXo0
Message-ID: <CACCo2jkA=HajHww=Ysf+cg+LLTg8y1eHd3MZVJqCGtHryzT6CA@mail.gmail.com>
Subject: Re: [PATCH 0/2] fs: support $ORIGIN in ELF interpreter paths
To: Christian Brauner <brauner@kernel.org>
Cc: Jann Horn <jannh@google.com>, John Ericson <mail@johnericson.me>, Jan Kara <jack@suse.cz>, 
	Kees Cook <kees@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, shuah@kernel.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	linux-kselftest <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 6:20=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On 2026-06-28 14:36:52+02:00, Christian Brauner wrote:
> > > I think the proposed patch will only change behavior if the
> > > interpreter path starts with "$ORIGIN"? That wouldn't work on existin=
g
> > > kernels unless you have a directory literally named "$ORIGIN" in the
> > > cwd, because "$ORIGIN/..." would be interpreted as a normal relative
> > > path.
> >
> > I was thinking:
>
> A few other things came to my mind:
>
> (1) memfds: /memfd:woot-woot
>
>     A memfd doesn't have a path so any $ORIGIN type behavior - script or =
not -
>     will be at least useless if not very confusing outside of a sandbox.
>
>     Btw, used by runC to guard against binary overwrite attacks.
>
> (1.1) deleted memfds: /memfd:woot-woot (deleted)
>
>       Same as (1).
>
> (2) deleted executables:
>
>     /woot/woot-woot (deleted)
>
> (3) unrecoverable executable paths
>
>     No path can be resolved at all. What to do?
>
> All of that needs consistent, easy to reason about treatment. Reading thr=
ough
> the glibc implementation of $ORIGIN for shared libraries in rpath - even =
with
> an eye on cutting through most of the complexity - doesn't give me very w=
arm
> feelings. It feels very hackish and full of edge cases...
>
> Imho, tying the lookup of the interpreter to the binary itself and making=
 the
> kernel responsible for figuring out the relationship by resolving bprm->f=
ile
> and splicing it with PT_INTERP is terrible.
>
> So, I kinda like the concept of having relocatable dynamic executables bu=
t then
> let's cut through all the userspace red tape and figure out something tha=
t's
> super simple and outsources the problem to userspace.
>
> I think the wrap-buddy approach here: https://github.com/Mic92/wrap-buddy=
 is
> going in the right direction in that it gets the kernel completely out of=
 the
> way. I like that a lot more than moving more nasty bits into the kernel i=
tself.
>
> In a way we have been doing something in systemd that goes in a similar
> direction. As of systemd 261 systemd _only_ links against libc and nothin=
g
> else.
>
> Any other shared library is dlopen()ened as needed (discoverable via
> elf-notes). Lennart wrote about this just a few days ago:
> https://mastodon.social/@pid_eins/116781776665322560
>
> This effectively minimizes the work the loader has to do at startup. Imho=
, your
> effort with wrap-buddy is related. To me moving the loader invocation out=
 of
> the kernel and into userspace makes a lot of sense to me.
>

Wow the systemd approach sounds pretty surprising. As a Nix/NixOS user
having software enable/disable features depending on changes to the
system ad-hoc seems like a footgun. Despite the allure of shared
objects, the are less re-used in practice and rebuilding them when a
CVE appears is just as easy.
A good read to me:
https://web.archive.org/web/20260320072121/https://drewdevault.com/dynlib.h=
tml
https://lore.kernel.org/lkml/CAHk-=3Dwhs8QZf3YnifdLv57+FhBi5_WeNTG1B-suOES=
=3DRcUSmQg@mail.gmail.com/
(yes true, NixOS also uses "shared libraries" but they are effectively
static in how they are setup with fixed paths).

Anyway, I digress.
What other options are there to go after for a relocatable binary? The
steps wrap-buddy has to take... are a bit horrendous in practicality
(although amazing from an engineering-sense).

binfmt itself is configurable and modules can register additional exec
types. What about something similar for ELF & INTERP ?
Maybe we can meet-half way and support it via a plugin architecture
that NixOS can leverage.
