Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792601513;
	b=ACP7asPeSPnXFukFr3WvOf3gE+2Tel7/zDZc7cLMaUGOm4S7SMQDTdzCZreJZmoMD0yL
	 Cqe25JNu3paRy0RTBiAuuZA5zyaI3bvMrFb2bzKRyRYiavwgXtTGmMOm54YOFvsxLp0Pi
	 rjRluhskl7zX2YN1NzfRu3ca6ahRZSsU8FqFCTXguGA3QMe9kXB5D4lk7ECxR9ItfD/iX
	 TYX4Nm7NW/XFHtp9BZPzCjBdMco2uJkqw2ihplSoKPkf2t4w7it7vh50R4qF730/pHjCv
	 mZe+o/lWRtnYFqAUalqcN62X1Dma4Rgu5Z+F8GZzW3hJbW9ZwHISpBGPJfjDljDfj1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=13QHzm0bpM59xYS1wnMZEwywD8qK4xxHRhkkWiGn1fY=;
	b=dS4SILBaJ3zcpApWavcPpyx2NgzAueWzkI/1tbsvO548cPzjF4Cha4kN5bAkDVk+AtwY
	 8FExCHaVmMhXDsjcpOKDdCvXw3S3Gi6OpfxXp/dwfanX1SM5AV0x2HPwjCKmZ0A4WamjA
	 RK/jWpSU7z3/59MHNlTda8SrBMXLU+Ff/jYJq76/sUrBV+NgyA3u85jZmVcWsqinqqomm
	 PeEJ5X/34CWoGGgnoGU3R5hGJfM88H+bRHgHmWxRX0d06wkGLl/btpB0qJU6AxhsmGXYd
	 pfatWGVCsK6O2nYEXCVQKfFqkYDaI60bckcQKpdEdHm0coUNmQqVJz3wSpc+1ucQRpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=IjY+GqWy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180D6606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 16:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 180D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=IjY+GqWy
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so528146a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 09:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792601507; cv=none;
        d=google.com; s=arc-20260327;
        b=G4YKZgn8MY3b9LsbfC4fxt59ZL5EyTZg7GYOPPUolNXWdJUduU4gd2l/7UZ4zj7hR1
         //lgFg5e8tPKAp+DsiyXP85nAk4BDDI7lz4QsX0W9cSkpR1kr/A8nAmjQMoHZNJFQnQ2
         cU7/qJaPQGyNLRRpy7QSctBsUbsb+hdjvqrQeCQkV0aSoHm0uhXuwSdLKnXZgleOehzN
         IWXAe1e46HxWINfNx9+k8nznQvbNERl9DcSEdYRHlREoPJfq1DxC8LdCGDrEzl+C28xE
         a4OnnzlUz0xWnEs+GiASHjS/Z+T7SReyJozz6lTLbuc0osPVogv1yHL/bznMysKpVWeN
         Ll8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=13QHzm0bpM59xYS1wnMZEwywD8qK4xxHRhkkWiGn1fY=;
        fh=PeGRNpJPgWFcvhJKhRECEMsRh0zgRJS1OGYHjuxHl2I=;
        b=bjQGJbjoqEm0c6Z4J9AlLhVbnqggBINkChnwxufUPV44kT6k2LR7NtpwO9sQCXiri4
         yFSIvDeBOhkaTRj2Xkc6cap/eE9h/jElIXTf42r5DrCXGqMwO5hDdN9nLKARzccsQV9G
         Ewlh11Fs77LCmxD8ysE1NgeC1+hqOf3lsABPFhDBeZKVVU5k3ow3citnOqi84QZur2JI
         ywM0qPo3Bhf/pEqE4KkZynqSFpKJRFY16E5GpDSaoUKVVMnEUK2BDD7LhhQi78YiSYdm
         RlFz43BLWMNgKHYgQBOJjP0DDNxcheijPuUi4NvrbJW2vbbEEJW6L7eakW+8nhZglnf1
         jaYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792601507; x=1793206307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=13QHzm0bpM59xYS1wnMZEwywD8qK4xxHRhkkWiGn1fY=;
        b=IjY+GqWyFsNApys1mFNaLpUe5Gb0T0eiWpXRqwguELZkO/6GMlW5MGLgxtcb09NTmh
         OmSwbge3z0LVW0xi+7CpV8QvKgiRUpsMtRGvmgg8qxBvc5jjXYlzpoNkCzfNBAEwDQ40
         wNNxyldEcULAnGOug9VS2bG65dXNR/mE46at5JcPgLJWv3O6ZhjEfjVOx0KdNPSWEHno
         KSs2G3y3N9SwBG5NM5nfzf5/ynFgtWgQ3CLXM7K+hSUVcPTdng4aUdz3+cuYZFPbi1eS
         ik03fYSF9K8HzXuBFVgMWtrD+TskuLJyDjiFDi0Uy/ej0ytsAm/0is3kvUh3PE/JmgqY
         Kg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601507; x=1793206307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13QHzm0bpM59xYS1wnMZEwywD8qK4xxHRhkkWiGn1fY=;
        b=uu2+pebqswzefBe63FelKLRS+upO658ndp32pxuK6JrR9ITZm/sLXqFUCEA/OzKBC+
         HEK005zFrWBXOd1fGS0fTzIsXwMoA0m1uFJP67NGF3wbv7Tym7jo0JHHjhCcZaZeDRX2
         JTcZte4XRZ4Qfr3tBnOQGpctBG5gOMgoqhIKu2XJi1gnb5Rw0Tz8aYOIuXsoyZy8aHcu
         SGbz/RaMReKfwFLsosbH6lhazqO5BQMNW6yKIK6R1oiOvW7zfHQft0sv3K7M0EDuF9Ig
         icvimPCUase32bP9vpVNtcrA4con4HGouEy1AoNJOX4ir3BWPwrlD8A9u4uHJb9VwbTl
         9ozg==
X-Forwarded-Encrypted: i=1; AKwUvBy/brkmBnE8RzQWsYbUbQjy+yWJR1o2i4jGEZaOXJtyOtVGvXCqi4kFwI0GmNF2dIMNC49lJGu3+diHQghtdiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhc9hpyWxNbyTuMq/N8qMOqfqxhhNJ4sHkO6FsqeufPetPWOfE
	YQhBbwqKl6PFDfX59vVqTGr0NjoFrEVp0wCHZ6dRS6NYDOjHy8KSj1y/n/+zWkuz1Y8TJWHZ/Rj
	vK0Mg5j+lN8Dm8nkz0o6o6bj6yzinrkiIIlBEtJYt
X-Gm-Gg: AYBFou189UC5vosQsbt8ZwtizPshUUcsdM298p0pmyqRVKzF0aExaqeyghAEXDsrMFd
	m8uCVU3yTv167uZrQBB9qrnCuntgwIq+1CVXt/6rZTSzDQqsyQtlxjR4z18nm2+w5UlT2IZCmbB
	cYUM4Xx4y10UTrTjijO2Z8yLdl93yJXCBL1Nb2cYRNeiSbzmdHMsX+5kdiKHq0z1LA7y5Z7mQTS
	05Ccqh07MLjP5qSXVhr23tM6JIqVOXj8fBsKiAbDzqLxHK1DmosaZxDLBsR+ciCLXU4D7Rol6d0
	BKjBRX4e1/d810DoVj8S5GemQ1vJmyM4/nSLow3iPvUTBkajwSVMxIVXfoobo8h4GIA0FaQN95z
	Pmo/A40zYHbIXbdF+7vLMgPk6/pr2CSfY3a+OWfiqQ/hIKfVZyBU53Q/gVAq6akwQECnrOtk2Hk
	6YFXxvANh1zRyQ4Q==
X-Received: by 2002:a05:6a21:4506:b0:3e2:5d7f:f630 with SMTP id
 adf61e73a8af0-3e287ef2e13mr2253079637.54.1792601507303; Wed, 21 Oct 2026
 09:51:47 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-ipe-keyring-rfc-v1-0-156f0b93e843@nvidia.com>
 <20261019-b4-ipe-keyring-rfc-v1-1-156f0b93e843@nvidia.com>
 <702ade20-a2f3-4919-97e6-c72faa89399a@kernel.org> <20261021-groll-donnerstag-erfuhren-ce34a0ed4e97@brauner>
In-Reply-To: <20261021-groll-donnerstag-erfuhren-ce34a0ed4e97@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 21 Oct 2026 12:51:35 -0400
X-Gm-Features: AclHuK9u4zlqRR8k7l_xhgTD3syw8PvB14c-IIpaLUltSW6zS4RYc3Du7nPPmmQ
Message-ID: <CAHC9VhTHUU0h9k74CMT6wYhMwyY3YhbSSFwJoDTvoFRyTFVZwg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] ipe: add the .ipe policy keyring
To: Christian Brauner <brauner@kernel.org>
Cc: Fan Wu <wufan@kernel.org>, manuelh@nvidia.com, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Andrew Halaney <andrew@amutable.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:54=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
> On Mon, Oct 19, 2026 at 04:15:57PM -0700, Fan Wu wrote:
> > On 10/19/2026 2:40 PM, Manuel Huber via B4 Relay wrote:
> > > From: Manuel Huber <manuelh@nvidia.com>
> > >
> > > Add a dedicated .ipe keyring for IPE policy signature verification,
> > > modeled after the .dm-verity and .bpf keyring implementations.
> > >
> > > With this, userspace can provision its own keys into the keyring,
> > > then restrict it and activate it for IPE policy signature verificatio=
n.
> > >
> > > This enables scenarios in which a trusted userspace component generat=
es
> > > an IPE policy, and creates an ephemeral policy-signing key pair,
> > > provisions its public certificate, and restricts the IPE keyring duri=
ng
> > > the early lifetime of a system. The trusted component can then sign t=
he
> > > IPE policy, destroy the private key, and load and activate the policy=
.
> > > During that phase, the system is considered in a trusted state wherea=
s
> > > the system transitions into a possibly untrusted state afterwards,
> > > running arbitrary user-provided applications. In such a scenario, the
> > > trusted userspace component could reside on a dm-verity protected
> > > rootfs disk, and applications would reside on additional dm-verity
> > > protected disks. The latter disks would be dynamically attached and
> > > their dm-verity root hashes and/or signatures not known a priori to
> > > launching the system.
> > >
> >
> > You might need to explain why the existing keyrings, i.e. builtin/secon=
dary/platform cannot be used in your scenario. Like the firmware is not tru=
sted?
> >
> > > A concrete usage scenario could be Kata Containers, which enables
> > > running Kubernetes pods in ephemeral, headless utility VMs, possibly
> > > without systemd. The rootfs disk is static and known beforehand, but
> > > containerd's image layers might be acquired and transported into the
> > > VM using the erofs snapshotter and dynamic block device attachment
> > > using dm-verity.
> > >
> > > Signed-off-by: Manuel Huber <manuelh@nvidia.com>
> > > ---
> > >  Documentation/admin-guide/kernel-parameters.txt |  9 +++
> > >  security/ipe/Makefile                           |  1 +
> > >  security/ipe/ipe.c                              |  2 +
> > >  security/ipe/keyring.c                          | 79 +++++++++++++++=
++++++++++
> > >  security/ipe/keyring.h                          | 16 +++++
> > >  security/ipe/policy.c                           | 10 ++++
> > >  6 files changed, 117 insertions(+)
> > >
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Docume=
ntation/admin-guide/kernel-parameters.txt
> > > index e75344f4e0cd..fd508dd779ed 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -2733,6 +2733,15 @@ Kernel parameters
> > >                     Determine whether IPE starts in permissive (0) or
> > >                     enforce (1) mode. The default is enforce.
> > >
> > > +   ipe.keyring_unsealed=3D
> > > +                   [IPE]
> > > +                   Format: <bool>
> > > +                   When set to 1, leave the IPE policy keyring
> > > +                   unsealed after initialization so userspace can pr=
ovision
> > > +                   keys. Once the keyring is nonempty and restricted=
, it is
> > > +                   searched during policy-signature verification. Th=
e default
> > > +                   is 0, which creates the keyring restricted and em=
pty.
> > > +
> >
> > I would prefer a Kconfig CONFIG_SECURITY_IPE_KEYRING default to N inste=
ad, like the fsverity keyring. In the kconfig you can also describe in whic=
h cases should this option be turned on.
> >
> > >     ipe.success_audit=3D
> > >                     [IPE]
> > >                     Format: <bool>
> > > diff --git a/security/ipe/Makefile b/security/ipe/Makefile
> > > index 2ffabfa63fe9..109e736696a5 100644
> > > --- a/security/ipe/Makefile
> > > +++ b/security/ipe/Makefile
> > > @@ -20,6 +20,7 @@ obj-$(CONFIG_SECURITY_IPE) +=3D \
> > >     hooks.o \
> > >     fs.o \
> > >     ipe.o \
> > > +   keyring.o \
> >
> > with Kconfig this can be obj-$(CONFIG_IPE_KEYRING) +=3D keyring.o
> >
> > >     policy.o \
> > >     policy_fs.o \
> > >     policy_parser.o \
> > > diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
> > > index 495bb765de1b..f5232f850dc2 100644
> > > --- a/security/ipe/ipe.c
> > > +++ b/security/ipe/ipe.c
> > > @@ -7,6 +7,7 @@
> > >  #include "ipe.h"
> > >  #include "eval.h"
> > >  #include "hooks.h"
> > > +#include "keyring.h"
> > >
> > >  extern const char *const ipe_boot_policy;
> > >  bool ipe_enabled;
> > > @@ -97,4 +98,5 @@ DEFINE_LSM(ipe) =3D {
> > >     .init =3D ipe_init,
> > >     .blobs =3D &ipe_blobs,
> > >     .initcall_fs =3D ipe_init_securityfs,
> > > +   .initcall_late =3D ipe_keyring_init,
> > >  };
> > > diff --git a/security/ipe/keyring.c b/security/ipe/keyring.c
> > > new file mode 100644
> > > index 000000000000..ea8d164b62a6
> > > --- /dev/null
> > > +++ b/security/ipe/keyring.c
> > > @@ -0,0 +1,79 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 NVIDIA CORPORATION & AFFILIATES. All rights re=
served.
> > > + */
> > > +
> > > +#include <linux/cred.h>
> > > +#include <linux/err.h>
> > > +#include <linux/key.h>
> > > +#include <linux/moduleparam.h>
> > > +
> > > +#include "ipe.h"
> > > +#include "keyring.h"
> > > +
> > > +static struct key *ipe_keyring __ro_after_init;
> >
> > You can remove static here then the other ipe code can directly use the=
 variable instead of a function call.
> >
> > > +
> > > +static bool ipe_keyring_unsealed __ro_after_init;
> > > +
> > > +/* Set the right module name for built-in parameters. */
> > > +#ifdef KBUILD_MODNAME
> > > +#undef KBUILD_MODNAME
> > > +#define KBUILD_MODNAME "ipe"
> > > +#endif
> > > +
> > > +module_param_named(keyring_unsealed, ipe_keyring_unsealed, bool, 044=
4);
> > > +MODULE_PARM_DESC(keyring_unsealed, "Leave the IPE keyring unsealed")=
;
> > > +
> >
> > ...
> >
> > > +
> > > +/**
> > > + * ipe_keyring_init() - Allocate and configure the IPE keyring.
> > > + *
> > > + * Return: Always %0. A failure leaves IPE without its dedicated key=
ring.
> > > + */
> > > +int __init ipe_keyring_init(void)
> > > +{
> > > +   struct key *keyring;
> > > +   int rc;
> > > +
> > > +   keyring =3D keyring_alloc(".ipe", GLOBAL_ROOT_UID, GLOBAL_ROOT_GI=
D,
> > > +                           current_cred(),
> > > +                           KEY_POS_SEARCH |
> > > +                           KEY_USR_VIEW | KEY_USR_READ | KEY_USR_WRI=
TE |
> > > +                           KEY_USR_SEARCH | KEY_USR_SETATTR,
> > > +                           KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
> > > +   if (IS_ERR(keyring)) {
> > > +           pr_err("failed to allocate keyring: %ld\n", PTR_ERR(keyri=
ng));
> > > +           return 0;
> >
> > You might need to panic here like the fsverity kerying.
> >
> > > +   }
> > > +
> > > +   if (!ipe_keyring_unsealed) {
> > > +           rc =3D keyring_restrict(make_key_ref(keyring, true), NULL=
, NULL);
> > > +           if (rc) {
> > > +                   pr_err("failed to restrict keyring: %d\n", rc);
> > > +                   key_revoke(keyring);
> > > +                   key_put(keyring);
> > > +                   return 0;
> > > +           }
> > > +   }
> >
> > This looks kind of awkward, like if unseal is not set, it can create an=
 empty keyring then immediately seal it. I would switch to the fsverity's a=
pproach to let userspace seal it.
>
> Please don't start breaking an established pattern that works well.
> We're now using this with both bpf and dm-verity with
> systemd-keyring-setup.

Just a quick point of clarification, you're using the pattern you
described for other keyrings, not necessarily a dedicated IPE keyring
described in this patchset, correct?

I know you/Lennart/systemd made the decision to implement your own
version of IPE instead of working with Fan to augment the existing
implementation to meet your needs, so I'm not sure if you've also done
something with an out-of-tree patch, BPF, etc. to implement your own
keyring.

> The point is that the keyring is intentionally
> inactive unless it is sealed and restricted. That is part of the
> security model. fsverity is used as soon as any key is enrolled which
> doesn't give userspace a throwaway the key moment.

As far as I'm concerned the decision of how IPE uses an IPE keyring is
up to Fan.  Of course, fitting in with existing norms is important,
but if it causes IPE or existing IPE uses a lot of pain, that can a
good reason to diverge from those solutions.  These days everyone is
going to implement whatever they please, but if you have
needs/requirements about how you want things to behave in LSM land, I
think it would be helpful to engage with us before you make a decision
and then start pleading with the LSM folks to adopt your approach.

--=20
paul-moore.com
