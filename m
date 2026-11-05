Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793897301;
	b=U07xNJHFrrVhRATD8lmLRp19gabG461W8pn66e+8lEZdX/D1T4u7cFFnFCYsvLYzmMZ+
	 Xpe37R0rYslhFmLc3xdh77SWcdSpjlF1LsMhah9Q/M8rZjfQl1z/nBc9f7Cz0amRLE9Uq
	 j+rIzq0CugI7vmO0llCDhTgKyhOY5Gq7Ke5aC1Aqm2M0xOt+FA4WVpdlQgwCeW4LYTDPZ
	 O42jxs98ZlTPzAcudirAsVIU+/2NJh+ayNVla1WnzmESbv0GH4O0E9MAW6rwKeSrcemgT
	 FOS41u5tC6mvZDH7eSrsfYLDtUKOUerMUAXdSJvx/uV1kI1535kYnnuJUzPITXzOwlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VqiTrc04lJztf2dyTmHN89oGm1bJ8PUHM0btmGHDZmI=;
	b=XOXSPIp4DP2W0jKGG18l8eThpi3x9DjcrLhP+TN0uOYbIQ6CpERbwQKHQs9Z3+YZVI4i
	 7WQXDUsxCWtsVsX4U6ZwpPdOx8VRjeWAwO8q5JoTHSLVFLJtGJ6PYxkSXalUYypbmKaXY
	 fAt49DCeG9L2rkgfFZQXMjlmE2UedlsJlRXhOfWG+Vkld7ZA5o5hTCGkpz201yy9dmYTn
	 Wv8KKnMgWytTCnHtmCB7v9rTnDArVLtdP0TsUtQpb9TeuKbrKOZEAjVqi70UYjhWQ+f7l
	 sGoyMWkO7vaWSAU2E1u0XUXwd6MpCBryAnp+dzIChpkJ6GiYngKlSbp3SkwtRjNH7+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PD82jKo7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5F3606A32F
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 16:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F5F3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PD82jKo7
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93ece7a73b9so237282085a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 08:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793897300; cv=none;
        d=google.com; s=arc-20260327;
        b=aV6xbhaqZelz11WGUglSSBE41ncjHfMCHOXYIPbNnI0s8G/V17u35mWs+hcglJDnE8
         JtJvPdiVHrIE+uOYJ1eEWjLPsXTm/MpCtuZecd2OgYgzbdx1W4xhRO0ILZXcQuwWa0As
         DuMYc0brBHAu27CVufznHtZ9CTy7aEaA8SmKwvKUawR2d0pOs4ldhsNTzl1UZkwRBQrL
         3A27O2Qg64KznKo0ToBlqJcoKMJw+IWep7QPR2+eqDhjr7ZZbznyMyYZnIq/AV/VQWj5
         hPpoSm/K6C/ofon8h89tDu2W84KDEFtHug7mm6uD1XVsH/4B0+qTS53ElhFmp2OSqpn8
         8qVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VqiTrc04lJztf2dyTmHN89oGm1bJ8PUHM0btmGHDZmI=;
        fh=wUtnDMzQ+B74vPipRe0CwCurDzcf3K9p0IB6T1rOcco=;
        b=a+YmR6l1w9bM3B3RGda0uP2aTu4Ma3Iub0Y9EAJ+WG9nYL3DFpDw0ffDy0aWcg0z/H
         zdLy6XsLkZ8O+OzEiUsBirPoz0AifWzKIT4IiiGsk/qdnerEQ7JudMpBMN3bwSEl1wKa
         T3xnjITp2CNsjBcDq4whR53sRMOTkFEbpaRI3eDkmNTjn4Ik8RS5UjZH/y1OHQjBjWgP
         y7AIIHsoTMZFvgwofZ0j+ZwKfoXQVxy4cV1G9Cr/EkNh8KBMIKq2/k8e3TzFR7nohSNS
         XcdhBOpSQROAb5fGBzukBaKsUmSZqaj7ZWroDRhiMqOHfraA4MvdKNIsXVNpdrGpKTNN
         J1qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793897300; x=1794502100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VqiTrc04lJztf2dyTmHN89oGm1bJ8PUHM0btmGHDZmI=;
        b=PD82jKo7jigK4yo/BsC4mL9gzNaCyQCuN/kPVJGkjQjdLI8tYXff0Yq6V8OcVaJvNy
         weurqZPZmulH0qGSg5NbPVImgWJ+FnTdb3j3Ry4nbirmi+Rj3QFivs4ORBwQaFRqCGqf
         QEUbVI/SqDEMT+7UGhcd921nGG7eTyZrIMcUrpbYcHWgfkjlc4bKSqYZEDRPXgz7lXtH
         DqeNW77psjBaqljc2mahGE9h0G2f7KashF5X4+pB5RTZgitOtmNbn03q4nK6XwgY7JUH
         dHKc7aq+4G8SSRybkD5tRl+j5GVa6fgvquMcqs4nqsv6V0mQuY3Plyf9y99pCk1OO04q
         xdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897300; x=1794502100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqiTrc04lJztf2dyTmHN89oGm1bJ8PUHM0btmGHDZmI=;
        b=dpnn5pu7jaV62ZxJWelExvbirygLL53JCHsZrEeGW0JDl3fyrTcrLPMxAru6rgn8L5
         NB/krvcyBuRYUTDpYi3JYfNNeNbaqkOg01Rt96/AjEIMN8UcdC+3jEqGcWgZTYSYXObs
         f2nwfCjDL4gOS7NkVPjdTMwK+hEAVEDlhdy38p8pNQ0g5GodrMK/Rb900fvC4n4b3U4P
         ALnkWyjatJYBWuk+PUyz0aAPFNY9vwQ/QXVWV7QDxebtWkjiq+7sBqMkQgLlGgIkAQOK
         1XLuIxoHTXNJd04RdpIMY901PQJoQQyzXfzWedB5rtCJTsHLiltlzy4jOlD1LBUI1TQs
         tAAw==
X-Forwarded-Encrypted: i=1; AKwUvBzEwc4E7B262psOZCtZ2yLbDpG9YxdXfC9k+ABFlcsK6e4+3pIxQYzsYQmNpEGCmfIXDGQzgcX2Mh20/DPB//o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yhL18L5f3EiYJ5WSCx7PuRfLWQNMHozQO6DdW8dvSCe998Drc
	eaD0NGUum0ral5b49A/zVcptqwpN0uHPg5VQ4wcYLucUS/KEaiEvNHGBtw4vzRg6C++ZgJrR4Qr
	f/6Cbtfln15nc5PP+sZUDhEQRsbWZSqUwmCBvk5e5
X-Gm-Gg: AYBFou3aK1FmARKAVqgQFkKQ2e76aR9q1VFpAeN4Dd1p15bVjni8wa5SFPWsMkPbxYQ
	y8vPX9c192psIB6/nE0J6ai6aINK5wbuixUve1ELG5+QIWZuw0lQtLbFCahHyTrqiObZ/SoHsQe
	du50d58ZZwy7eLXwOXL8z77aeRuaC+y3nvXZKjTNQJJF6lbR8WPV8oiN7GOWvvX9idgAJ25SlTe
	KuZ71GllwbF1rR8cDJxL1FIetXs9cc0df+OXR7CprewkESgi+NjfR7uc6hpUuE26laGWtUHYl6G
	bFal3yxiGLoZyLReGh9b6s1KymKQEgBWqbPAIUfqoAxzzmgKY+fX4riXdTkP8ibGMTeGM0aKqQA
	Y3OxL3WtSlO2KH/PDXW3L2fMdJNuh/QlW+d76mgQG1oYsPRzwbIIrUH4=
X-Received: by 2002:a05:620a:29c1:b0:93f:334e:df25 with SMTP id
 af79cd13be357-9442175b2f6mr3556460685a.41.1793897300081; Thu, 05 Nov 2026
 08:48:20 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
 <auM32mOlBLu6ZUlt@google.com> <CALCETrUD4vh_iSHV7G0bprUFU8=c+ECo701-tXcbQ3UXBWC1ig@mail.gmail.com>
 <ausXFWLgHabezE7R@google.com>
In-Reply-To: <ausXFWLgHabezE7R@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 5 Nov 2026 08:48:07 -0800
X-Gm-Features: AclHuK8CUFetL3KNjWElY9pamqV4vOzKRAOdGaRShI4zykg0vul-u3a1dyx4v8I
Message-ID: <CALCETrXrdQRWTVdCq-V_AVpZG7g=1aCpeyNP3jLXT7VDW=OaVw@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: "Hallgrimur H. Gunnarsson" <halg@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
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

On Wed, Nov 4, 2026 at 3:30=E2=80=AFAM Hallgrimur H. Gunnarsson <halg@googl=
e.com> wrote:
>
> On Tue, Nov 03, 2026 at 10:37:48AM -0800, Andy Lutomirski wrote:
> > On Thu, Oct 29, 2026 at 5:11=E2=80=AFAM Hallgrimur H. Gunnarsson
> > <halg@google.com> wrote:
> > >
> > > On Wed, Oct 28, 2026 at 03:56:11PM -0700, Andy Lutomirski wrote:
> >
> > > >
> > > > Why should the task's cap masks affect this?  *Maybe* cap_bset make=
s
> > > > sense, but I'm struggling a bit to see why cap_permitted and
> > > > cap_effective should matter.
> > >
> > > Sorry, the phrasing here may have been misleading. Just to clarify:
> > > none of the creating task's capability sets (cap_bset, cap_permitted
> > > or cap_effective) are used to restrict the new user namespace.
> > >
> > > When I wrote "reusing the existing task cap_bset, cap_permitted and
> > > cap_effective sets on namespace entry", I was contrasting this with
> > > the prior series from 2024 [1], which proposed adding a 6th per-threa=
d
> > > capability set to struct cred.
> > >
> > > In this series, when a task creates or enters a user namespace, we
> > > simply initialize its new cred->cap_{bset,permitted,effective} in
> > > that namespace to user_ns->cap_bset instead of CAP_FULL_SET.
> > >
> >
> > Okay, this makes *more* sense, but I think it's too weak.
> >
> > I have a sort-of goal of having the creation of unprivileged
> > namespaces be allowed in most contexts by default, *even in Docker*
> > (which would involve the Docker team changing their default seccomp
> > rules, but that bridge can be crossed later).  (In furtherance of this
> > goal, I fixed an ancient bug in newuidmap that gets us quite a bit
> > closer a couple weeks ago.)
> >
> > But tying this mitigation to a parent userns means that it's
> > completely unusable in the single-deep case.
>
> To clarify, this mitigation isn't exclusively tied to the parent userns.
> If a system administrator wants a host-wide policy, like trimming
> CAP_NET_ADMIN for all unprivileged user namespaces, including
> single-deep Docker containers, then the host-wide sysctl handles this
> seamlessly. Any unprivileged process in init_user_ns calling CLONE_NEWUSE=
R
> is subjected to the sysctl ceiling, effectively stripping CAP_NET_ADMIN
> upon creation.

Seems reasonable, but see below.

>
> Where the single-deep case falls short in this series is per-container
> granularity. For flexible configuration on a per-container basis, this
> patch series assumes that containers run in their own user namespace,
> allowing the runtime to bound capabilities at creation time via clone3()
> and have that bound persist down the namespace hierarchy across any neste=
d
> userns creation.

There are plenty of cases of *privileged* user namespaces (i.e.
created by privileged users) that would nonetheless want this.  Or
unprivileged user namespaces on systems that will not have this
restriction set that still want to apply it in their own container.



>
> If a container runs in init_user_ns (as in standard Docker) and we want
> to restrict userns capabilities for that specific container without
> relying on a host-wide sysctl, then you are exactly right. We would need
> some kind of cred-based mechanism to pre-configure a restriction for any
> future CLONE_NEWUSER calls within that container.
>
> > I do have a question about this whole scheme, though: are we talking
> > *just* about CAP_NET_ADMIN?  That is, is there any other bit that has
> > anywhere near enough security relevance to make this kind of thing
> > worthwhile?  Because if it's really just a single bit control, maybe
> > we can come up with a nicer scheme.
>
> Yes, primarily CAP_NET_ADMIN, and to a lesser extent CAP_NET_RAW.
>
> If we look at submissions to Google's kernelCTF VRP [1], 90% of the
> exploit submissions in 2026 require CAP_NET_ADMIN (and about 70%
> across all submissions since the program started in 2023).
>
> Restricting these network capabilities when they are not strictly needed
> (e.g. for sandboxing) is the primary motivation behind the series.
> However, I wrote the userns capability bounding as a generic mask so it
> could restrict arbitrary capabilities down the hierarchy, but if the
> preference is to narrow the scope more specifically to trimming
> CAP_NET_ADMIN and CAP_NET_RAW, that's completely fine by me.
>
> If we go that route and want to support the single-deep Docker case, a
> per-task inheritable securebit might be one way to do it, e.g.
> SECBIT_NO_USERNS_NET and SECBIT_NO_USERNS_NET_LOCKED. Docker could then
> set and lock that bit on a container in init_user_ns without needing a
> parent userns.

This seems perhaps better.  But maybe a bit that applies the
restriction to a userns created by someone who doesn't have
CAP_NET_ADMIN in their own userns?

IMO what we really want is a generic mechanism for sysctl-like
settings that are scoped to a userns.  And we would want the API not
to be filesystem-based (or at least not require *mounting* a
filesystem) because then we would just make everything messier.  This
would solve many problems.

>
> On userns creation, create_user_ns() could record this restriction on
> struct user_namespace. That could either feed into the userns capability
> bounding set proposed in this series (clearing CAP_NET_ADMIN and
> CAP_NET_RAW from user_ns->cap_bset when the bit is set on the creator),
> or be stored as a single boolean in struct user_namespace if we want to
> keep the mechanism minimal and drop the generic capability mask UAPI.
> In the latter case, we would still need to replicate some of the
> userns capability bounding functionality, e.g. strip CAP_NET_ADMIN and
> CAP_NET_RAW in set_cred_user_ns() on namespace entry, and bound the
> parent-owner check in cap_capable_helper().
>
> [1] https://github.com/google/security-research/tree/master/pocs/linux/ke=
rnelctf
