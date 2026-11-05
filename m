Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793897971;
	b=weXDqldUmh7dFnmT+DlAmJKgq0+JANkGYLcrvv6VJ/67bEp5pInYFkhYZefvGHGL3ajX
	 GfwHsnQISPtvOB88xy/SlQlD9YEdwM4baQJNWvw0TW45gIEkx2kT8LERO115bw+vGtFlT
	 6i1YZDDQssvgZH5SOww8aNkYDZRL+GgPaaiL3BwHfrqHiLF00LC5Lus6OPlq8+m5Yk1oB
	 ng+SRW5Ysx6vfxKIuRADzc//9rC4AzvnQCLhpFuDD5eDt9C8FcBuwK5ZZ+5nVz5BBZ7wT
	 UnfMrl/DH5O1KZh2h/SjTlbw4PLr0ONUNefvxe0TuRlYedMhu1jE/igvyED05ms1Isg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ENTWrgdqNOnhBXm7Ydoc9z3n/Zlmn8Dt6MNiq3/7nzs=;
	b=lXUT5u1H4Hv/Jkqv1zRlTSgy/I8WxroxMn2erzQIuQbCLW3/2E5bRHdUNesFEggb80Qw
	 pliStLDcE0DHUZMuDmYmW2OxT3knSTg9CATlA7Q/4cx9QfqzevUbCJXzF9rzCythKCzMZ
	 fMzl4Yae7c5SdBOLaDChABGiYP8AqT6imaVR+1suaXPmL8gctoBvOZ8kyYwb1JjJsaMIY
	 gfMxAe1FOQaKUjQXzwo9JfaxNa7L6yCO+nsdWi8fMjktZnp86+mzUWILzqzWzbwj1LvIK
	 aYVDc8NvxlPSidJ4OZ/ZwoxnQa1qAgeGgdqJADkgPLgWJ/XWZh9XvFGPhKwsueMwJTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M4rBHBr6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6936E606A330
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 16:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6936E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M4rBHBr6
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso1523343e87.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 08:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793897969; cv=none;
        d=google.com; s=arc-20260327;
        b=ILpMgFE1GrsJeOxXyTkETbyk0HPA2ZFCc05dHdkBea0u8ulUuBN98f/1b3kvHQrFiL
         ypysBjc8x0gmiMQxvoR+ZbRcrsuTYCPHzSdn6otEMXvGpbKMoha9FACZixtZkI7Bqjqz
         trp2uG3zgFyiQWzDN4F+puf+dUsWVtn63PWmQ+UZq7HT6zN1kqopWIiN8AEcc7wGIhVv
         FRyPdxQDMCu9ESE1kVmpHaVLDq1aa5KzwVBFv4Yaa5VXrbynDFVJH8lIhUSbdUMtH8KG
         2ZYKrj9dyWJfv1GY2pmoi9/YbdEPMTvUUS5fNqJeEVbmFs8UBjmoVQV/jX9v0Wjos5Fu
         7qYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ENTWrgdqNOnhBXm7Ydoc9z3n/Zlmn8Dt6MNiq3/7nzs=;
        fh=JRn24DFsZ+4YmA/LWGKVyyHvDGSWryIliCl1QAv6UFI=;
        b=O+L+DyayYy7OEt6avVl543pWMs0e4Wrb7j+D/dBsrP3j4skIiJOidT6O1nK8gP7OGD
         cA8h69R94iL9h/5iLyF3x+PcJ5lfMNGdZ9YkPRy6Q5BYfV4xxnhGS6wulpCjI7nD+pYd
         Z98gM5uZk7yYHQLiyxXkWAiosg0HA9f16rVVA/JWHyLfbptHVHVrH0Oa49tOVx2vj4g6
         clMZ0pNaht6J/f1jeuxTD1DuohZ6o9Ds27JJpiADMWEtuh50/4Pvc4sXTPgwJBZWsWuO
         DDzOx6ewWVI5Pl5Z9Adn9atNiliopoqKxooMZo4AmUI0+xEptuMp7875npMsdvwo8c2V
         k2EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793897969; x=1794502769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENTWrgdqNOnhBXm7Ydoc9z3n/Zlmn8Dt6MNiq3/7nzs=;
        b=M4rBHBr63W/SAVwNNbCQfErkFQNKWB1qkv3HtqteP54rOiV/HHnDMbtUKJCArIzFu4
         mYj0S1RcIb0q9pNYYwzfkrgcW/4hpcfT9cokBuN88bZN0gEMLrtAd9p4+/Q1wKWLERCs
         DrW00xbJ3OukwQpHPe/em0QG+3GlYH+g3IYsga7TvOEBXsyzoIivcIrFXjcPfBtQMsJx
         dhhKFMCZQePt2r/MCoc/hvcGaP1eaY7HE+KfNY0jNPytwrHw0Re5wyWLV4CIYYEeqBaz
         M8PdhqQP2K58xdjOL5tlAIrLEOG/UBLGLNET3to0NrS8A3suRDOPofJdLYHDtzflD6hB
         0Dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897969; x=1794502769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENTWrgdqNOnhBXm7Ydoc9z3n/Zlmn8Dt6MNiq3/7nzs=;
        b=x4rfZgp/mFJOmnnyYwLRuQUb6vbXz6NimRUwmZC59s4TmbmgvtK0iahW82gFI8kdZi
         tDo3pcuw+9trCLZ1v2ZcmEXIfHM+lGrkbvzRvCI2yaVsWOmuoJ0KPNRF/Aobih5NjLaM
         E4e4opV0JnzIX0lNHdY/MoDrq3yHuzJSZO2WBxaKLuZixcQOS2USieSoDlIQ6WdyR3+C
         cp9l5qPAM0BOjW28EWLsjYVXN68OJFqWS3uML4xaDnKwotLe83sGV4TmkTEE2y9v+lXE
         1Rct8C6UFZLofUaYpew18850SK0w1YRD6hiUC869k+WfqfkDkUvUHzou+XxcgSfoVs41
         74oA==
X-Forwarded-Encrypted: i=1; AKwUvBzDiUNwalbev9Wo1WVfhKPPTt4VIveTtibtNJDzUHrv57vu6cYij/U1/oeqSfoDGSfS91EpEfq45LUegSMkKwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QO7OHFA/qa6+uEkKrz1rm/LlUmxpG2YcdT/BTviIkbfr0euMv
	dau2fWUx5MFsa5yWZTOyUecRuRrmUs0XV22ujv9H+oxvjIQzXYPdtqrH3AEHwYkwEnO51tnY6Ek
	9ORpEo7V+DcbT1uABxu5oOnlKYbRQ8Q4+DuCsHR1W
X-Gm-Gg: AYBFou1H+oq/+s27G/NAUgXMZ25l3wjf7/n7N6oGryRP+0gfFAT9pIDrfzzc6NrKx1w
	VwRkNDnJ6EUYLg5Mn7UlP3VfNCEYeYUBKhiqQvtcH9+Oe3xhfxjSD6rg9566tvIVlG16GaaS0oZ
	0ysrXzqqf21pmBS7eVcITgo3moot9JXyx/9dYJYhUt9FWXV6Q+yEepEqwevE+ZEuNaQOt3SlVlZ
	cYh/QMt6gaA7yF+TIyZvmoHdrJgJXkHOFXcv5zsXcuB9kvzZOkWQ1OfgVaBPU2vNFS2Ce6raPNz
	L89tN6juKZ94qMgHG9gFsROINsaYhuZ5hiJ32lM+y5tntFliF5yN0zVo8QvrbHHXelgWJ1ewQkw
	DY1i6VjmDoxu5nsBx9ZZLF0NWGZf1rAuz7Q==
X-Received: by 2002:a05:6512:3e1c:b0:5b8:f97f:7a22 with SMTP id
 2adb3069b0e04-5bfd957683fmr6945728e87.54.1793897969539; Thu, 05 Nov 2026
 08:59:29 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <aunVmg42/S2uUDWR@hallyn.com>
 <auyink594bxptAPN@google.com>
In-Reply-To: <auyink594bxptAPN@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 5 Nov 2026 08:59:17 -0800
X-Gm-Features: AclHuK99RUxjga4Yt7Cih1iKUoXn780fqABuH5tRHwVrGa5--KTUob_Z762ltig
Message-ID: <CALCETrWaFf-X-mD0moxqaqEDWOV+85geK2B2Rs3ArixKd=Ntfw@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: "Hallgrimur H. Gunnarsson" <halg@google.com>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:48=E2=80=AFAM Hallgrimur H. Gunnarsson <halg@googl=
e.com> wrote:
>
> On Tue, Nov 03, 2026 at 06:37:46AM -0600, Serge E. Hallyn wrote:
> > Generally, if I, or some users I support, need to use unprivileged cont=
ainers
> > or user namespaces, then when an 0day comes along, I can hopefully trus=
t them
> > not to exploit it.  The biggest danger comes from the fact that, right =
now, if
> > they can use them, anyone can.  So if someone can trigger some other co=
de running
> > as user nginx or something, that can become a root vector.
> >
> > So what if we had a built-in feature or LSM which implemented a credent=
ial based
> > whitelist, entered at firstboot?  Something like
> >
> > ```
> > # Default deny
> > uid =3D=3D 1000  # approved
> > 1005 < uid < 1010  # approved
> > gid =3D=3D 1005
> > security_label =3D lxc_user_t  # Not sure how far we want to go with th=
is
> > tty # must have a session
> > ```
> >
> > Now, if you want to use user namespaces for generic sandboxes for all
> > users, e.g. to confine browser activity or nginx modules, then this mod=
el
> > may not fit.  Or rather, it might need a few tweaks.
>
> Thanks for taking a look and sharing the credential-based allowlist.
>
> The latter scenario (generic sandboxes for all users) is actually the
> primary use case that I'm targeting. I want to allow unprivileged users t=
o
> create user namespaces, e.g. for sandboxing, but without granting them
> security-sensitive network capabilities (CAP_NET_ADMIN/CAP_NET_RAW) when
> they are not strictly needed, given the historically high risk of local
> privilege escalation associated with them.
>
> The two approaches target complementary layers of the problem. A credenti=
al
> allowlist at creation time controls who can create a user namespace, whil=
e
> this patch series controls what capabilities are available inside that
> namespace (and its descendants) once it is created.
>
> Gating creation works well when there is a clear boundary between trusted
> and untrusted users. However, in a multi-tenant environment (like a large
> container fleet), we generally treat workloads as untrusted by default.
> Because we still want to allow these untrusted workloads to use unprivile=
ged
> user namespaces for sandboxing, it is essential to keep the attack surfac=
e
> small and follow the principle of least privilege whenever possible.
>
> More specifically, this patch series enables that model of safe sandboxin=
g
> across three key use cases:
>
> 1. Configurable capability stripping: Administrators can enable unprivile=
ged
>    user namespaces for all users to support sandboxing, but configure the
>    system to strip CAP_NET_ADMIN and CAP_NET_RAW by default in new user
>    namespaces created by unprivileged users. Basic sandboxing rarely need=
s
>    these (except to bring up loopback, which Patch 1 addresses via
>    CLONE_NEWNET_LOOPBACK).
>
>    The per-namespace bounding set can enforce this either globally via th=
e
>    sysctl, or explicitly via clone3() at the container manager level. Thi=
s
>    restriction is monotonic and persists down the namespace hierarchy.
>
> 2. Selectively granting CAP_NET_ADMIN: Some containerized workloads
>    legitimately need CAP_NET_ADMIN to configure advanced networking for
>    sub-containers. Because an unprivileged creator's child namespace is
>    bounded by:
>
>      parent_bset & (sysctl_ceiling | creator_effective)

Right after sending my last email, I had the following thought of a
variant of the model.  Permission to gain CAP_NET_ADMIN via creating a
userns is kind of like a capability itself, right?  We could get
pretty close to nice semantics if we allocated a capability bit for
this (CAP_USERNS_NET_ADMIN perhaps?) and, by default, giving it to all
users.  Unfortunately, the latter part is tricky because even sticking
it in the ambient set won't keep it from being dropped by setuid.

Perhaps we could have an extra capability mask that is for default-on
capabilities.

The intuition for this is that permission to gain capabilities in a
userns is a mess if it's a sysctl (as sysctls are global and there is
no clean way to say that a particular unprivileged task may
nonetheless create namespaces with CAP_NET_ADMIN) and it's a mess if
it's a securebit (still has the latter problem), but it's much tidier
if it's tied to a task.
