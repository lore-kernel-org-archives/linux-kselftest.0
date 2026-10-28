Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793228185;
	b=ZcdvneHQMvcaAK/TJ07/PdyFiDX6Dp/4blU9gWaTEHVjnLEKpPgWpTAV7ABr9kDq47gC
	 vQl+6vNEtN7QEyRGkozWXQJNK2CCr1FkcQu2+sO70nWOlNXmaPhW59EWLe5MoJG0aLtPq
	 YJIBduVIz2q1WBi5jvNZLg+/qMbGvN1/h84rXBcBbfT04MQgFyLDnNf4PuvhcspvzeSaC
	 9pQxPzJzb/8KGyEFhceaH3jAMQERUZ05bpRwLwZYyWzvz6K58dfqWm0xiT/0rsih1OBsc
	 sJmOhCUNuuQuRAqhDMyGlegbE5frt4yXYwZ2gMmYeSTE1D5fmbAaMvWaLn2NET2whkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793228185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
	b=fOGcRbdvfv6Wg1kaPegrn2fISKQ40+n6YXcTqIj/ZoQ6AynwHCHiZc1xspOUTZYsSzUK
	 VZi8g5EAdr3TkyhDGEi9fuYt0aJUQLxtPd8UKCLO8m8nRbwoH0b5+34j2AZb9Y2R4LRo7
	 szGFf1WBNI0TXGDVx2isAUDPm4qKQEj7dJc/T/ZGnDe3QcQoypc/TNX5mrYE4rGKG0Wl5
	 XcT7SumHYHDSWSNVrjtx1MHCw9s/WYUqAwd02k9L6wwXFoC+S72W9xXzNGgD87u9VhcF+
	 RTNJcN1UhiGqJ8UPUSuswEwvG4dFcSkUAACBBmRpqxz1I4AZNxfhef+hmBcCnBVfxoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bZOSlVJG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0641C606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 22:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0641C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bZOSlVJG
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso1507689e87.3
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793228183; cv=none;
        d=google.com; s=arc-20260327;
        b=iJXj92cy9b3JTxXxXdUwYkdpUIgmKYjIeO8ib7lBW9wNc0WFyTmt7g5oXFmStyvN4H
         2dHQlXugjHVFmmCQoOkQdnqnJNsSCjnADuCIZrU9wf8M/I+TUn0k4CSNiRB3SeeLvAet
         5ETQ1s/AaSL+jhkZAAIOPSAlAvDmfkf2IxE3Nj+tkRa3HKanyT5YZpojGPhhFYRlyOzE
         /lxqCc736gj9b0JoJewlEKj3RLKpaW/eZvv9j3MDss7ZBBa9xBgqNQ/GLB3hzoA24TBL
         DXgezuGvy5a1x5swO8I9YyMtInZaJF/o+acnbmYIAC8xyg9tHckz1QaCclPuWWJhTL/d
         4VqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
        fh=i6K6949xaiTvJJ0ZvlCrKSJluub+Sb/8yo5JIy+QEII=;
        b=kh7lDWFEvnWgBJVuHNf6EScz9vvoixvOF8H4Dc89wneIndDJfgEGfb+KIO5S1jTy5T
         hqPw3EnY7HtDkS/fgAspM5S0SgSn8Rp4TczRRSd70vhV3YHz1YcL9pjh8p4VkdPH/lyb
         ozH5pMI2QdwICJcpvMY/VT6AwK9SQOQZjyxQ6YnZChGwaRKBdsrQ18RdVNbv0yEyafE9
         cSvX9EP/e8AEKanlcvkOxCFxK4DoTAWh/+xIkpzDLChkd1dbZCT4gtPUrY/MnErkuK3z
         oTYHC9um0F2A1i9DEu/yx4jK4ztaWXavhCICAcSG2pukuvJJgtfJgvLetw3rYBce+JNp
         b81Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793228183; x=1793832983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
        b=bZOSlVJGtHEYwYd8P/JXTJGc0heKbmZ4zF6gCQsfAWUdj+V8lveZo37a35kI44zsZG
         8r9p4GP3JXlJVRf/lRQCeD7DpNu+EpwjtNRy8B/mAQWg4VrhYeyQL+tDoFWr1hQ8Js/1
         WmBu61FcofxUa9iC2o9+OqMJhIY2ZxGCvswPzn8Prxv7xx3PhcvCqjngxpEz26C3Zh5+
         QCDR/cnpyszjYnYa+NJ3GR//R0d+Eo5+XTYFDLb2ivFHUdLHCDDXia/PshsMR6SOBMAE
         M4o+rVXHudqK4Y3GjiNjn4cOkyeetgJTVfYAYDZGmr6blu+DiQE+KChOyTySu65qfvrn
         wIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228183; x=1793832983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
        b=u0iICvpfkBk3s6DgNOOXrVUfg/1Vms6cXKAPV1JSZoha1WE6/STeEO5KDvRp9suhq+
         /XH2tkQGqxo5PGWG6Z+GSEAZQ0m8dHAIeZdrFQ+MqXW1J3HGWLUM0+HIH2r1GUxibDLU
         V+puRm1D8uaUPFLlW+jssEJfx3zJO/Rg3ihXesW33Qxx4NEFarR3NtnhZDPyesB0SP35
         6l+fmGrrM9kMlGXgKuz6er+WdHEQwgx4INwjqCtYB2Kp70kKxyZU1fjV/1Maaqyb0JFM
         Klkwg3PHSWpCmIEQJQW4NHNDEx7OALcy5djmj381h5pSDRVRcFSdMWquoG7EUpwDQ+p8
         C0Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwrZRrZUHw2lfSNMUBsoLtGIwy4Qwgi/0QqNoHdgKJwB9wfTB7XHoEOYDTd5lkgGlvLl+3ITNFNa+bAiTeU9tk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4rngo0NQTnOLoFEL7v27JtJAitrVbU2gLQsw5s95TI5XAuP7x
	rarR2bR2yTxznl6aFXH4s0Sveoj5ZvNFIdJJJYa/EVVGysQwu/EITMzNlj/4zhipRHMko8cvNpW
	155beg2lD/xT5vVjWB8fPkbg0P/aFhesD57ejgCrp
X-Gm-Gg: AYBFou1z6yKD5csCNRBZrFYctVXqMNiGVheIWVrHhNbbinpTxicuDSRKQEn2VTEuxPK
	42gOdNpaTyvcLoD+kGlsi5gR1WtbBjXDRb8ZwutyWw2UFnx07UrE3A/ZuNCi15Zo2GXbHD6hVzK
	CiW9p+qOPNL6RQKncH6qKSf/A8YYPPbxEBzpVEEZJDNuiX/w/k4V5G0TC4r5pbJ3zkwqppw0ugQ
	ZeE6XZoO6p+HYC74Dz9oMOZ2q+woXatSI3HMRR2rNr11X9UgM9L5mboqqhD8LfO8n63bQb2iMYB
	NKRjhfUKxV0JvMqHGkw494eIL8SadwnLphAoPltFzwpyO9nFPn/kSvwT9iKqAno8CqbZ5tnXS1V
	t5olb6kmViyW78Cop3UGzq3a1EcUz8aqhBCd8VA==
X-Received: by 2002:a05:6512:3e19:b0:5bf:c239:71ad with SMTP id
 2adb3069b0e04-5bfcad69127mr1282221e87.38.1793228183136; Wed, 28 Oct 2026
 15:56:23 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com>
In-Reply-To: <20261028221705.3915340-1-halg@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 28 Oct 2026 15:56:11 -0700
X-Gm-Features: AclHuK_P2NrO86m_OPGwNSCuxqmiVp7fbTt4tlVfFApQPbneLnvcqCjpUTpk6N8
Message-ID: <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
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

On Wed, Oct 28, 2026 at 3:18=E2=80=AFPM Hallgrimur H. Gunnarsson
<halg@google.com> wrote:
>
> When an unprivileged process creates a new user namespace, it is granted
> a full set of capabilities (CAP_FULL_SET) scoped to that namespace.
> While these capabilities are isolated to the namespace, they allow
> unprivileged local users to reach deep kernel subsystems (most notably
> networking configuration and raw sockets via CAP_NET_ADMIN and
> CAP_NET_RAW) that historically assumed a trusted caller and have
> accounted for a large share of local privilege escalation
> vulnerabilities.
>
> Many workloads and sandboxes use unprivileged user namespaces strictly
> for basic UID/GID, mount, PID, or network isolation and never need
> high-risk capabilities like CAP_NET_ADMIN or CAP_NET_RAW. Likewise,
> system administrators often want a host-wide policy ceiling restricting
> which capabilities unprivileged user namespaces may acquire, without
> disabling unprivileged user namespaces altogether.
>
> Prior work by Jonathan Calmels [1] proposed addressing this via a sixth
> per-thread capability set (cap_userns) alongside a global sysctl mask.
> During that discussion [1, 2], feedback (e.g. from Casey Schaufler)
> suggested that rather than adding another per-thread capability set and
> prctl() interface, capability restrictions could be integrated directly
> into struct user_namespace and configured via clone3(). At the same
> time, as noted in [1], a clone3() flag alone is not sufficient for
> administrators who need to enforce a host-wide ceiling on unprivileged
> user namespaces without modifying every userspace callsite.
>
> This series combines both pieces of feedback: it embeds a capability
> bounding set (cap_bset) directly into struct user_namespace, reusing
> the existing task cap_bset, cap_permitted, and cap_effective sets on
> namespace entry, and provides both a system-wide sysctl ceiling for
> unprivileged user namespaces and a CLONE_NEWUSER_BSET flag for
> voluntary per-namespace restriction via clone3().

Why should the task's cap masks affect this?  *Maybe* cap_bset makes
sense, but I'm struggling a bit to see why cap_permitted and
cap_effective should matter.

Also, I think that Docker in non-userns mode restricts cap_bset, and
the purpose of that restriction is rather at odds with interpreting it
as a restriction on newly created user namespaces for purposes of
vulnerability mitigation.

>
> In addition, because restricting CAP_NET_ADMIN at user namespace
> creation time prevents userspace from bringing up the loopback
> interface in new network namespaces, the series first introduces
> an opt-in flag to automatically enable loopback on network namespace
> creation:
>
> 1. Opt-in loopback activation on netns creation (Patch 1)
>
>   New network namespaces start with the loopback interface (lo) DOWN by
>   default, requiring CAP_NET_ADMIN over the owning user namespace to
>   bring it up. To block external network access while preserving
>   localhost networking, sandboxes commonly create an isolated network
>   namespace with only the loopback interface enabled.
>

The whole unshare/clone flag situation is getting out of hand, IMO.
And this new thing makes logical sense but is really about reducing
exposure.

Perhaps we should instead have a small list associated with a userns
(extensible in the future) of things that the ns's admin (i.e. whoever
has CAP_SYS_ADMIN relative to the ns) may do.  That list could
include:

- Create loopback with sensible defaults for ipv4 and/or ipv6 (i see
no obvious reason to separate them)
- Create tun/tap interfaces in that ns (and attach them, etc)

And add a very simple new API to do these things.  Actually, the
tun/tap could just use the normal mechanism.

Thoughts?

--=20
Andy Lutomirski
AMA Capital Management, LLC
