Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793731088;
	b=fpwUunTVofVa/6nNQFXH7k/8j6zClWlXcwHEoL38yWhpIC7E7jriR0IwRTG5ySwAsa5t
	 gZZefmA5AAJT+vOY9N7UDfLIHlUvh9E30hTCPj5bxRbyVXlvfDnrO5lvhcSQf85UvBU4W
	 yR3QZgJzR9RcEED4qTELUpUqrFMyMign6kXpzIUP216UG0MNMCA8RlQa4Hq18SwVs4MoY
	 PaCU5uk3FPuTwGM/vFOzH+oFiaxdUW5FKQoT6l0svmnHf74nYpGNzAKiNM/H3Cxbxs2D9
	 uBbmglJtll6Me7i/kXXVTFltk8mNHMcxvfpxcWwI1NwVcMvdTTTX5EDiP+a4HhlCX0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
	b=3WbhfDW4XYJ3ujztJ+Oy+MwsGeq/i/k/XCJCpZShGtva8wsZo9kMnHFJKzct43gunXu0
	 2Le0cFRApSivGdJubq7MGhut41CtUblvTbb3+aC/eh5Ircd7MbhsKq92aPbb2+bgn1FLF
	 HVXciR9Zbd00ogQfIpBu4Ky1RqbvHd8Q6ZqHoxmSjTduE9zahB9VHjNw8tXds5vJmH8aU
	 QARtjr7YW6uzZVHM0hK59M9ZDDfNGFUOSQwocFCYOltoUPjBsh9om06hN5h7qrp8b31Cb
	 UmEaJry5TL4l3D+sqitPTcLjagbiJIUVKdg5my9xIS387crGbMZqqfZrf+II9GC6UYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nVCsNw0y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE2606A32C
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 18:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6EE2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nVCsNw0y
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so23428901fa.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 10:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793731081; cv=none;
        d=google.com; s=arc-20260327;
        b=Nxcp7q32pr8Lo3utSOvvDVlUHXHmTFEWIKNLG+9YJUujRqoZibbgSGIwN8akwDeXMi
         JY5gPtlhISPQSGvJkNyQDXZ2i35SloL9SB7sSWc4jVfYJfjKrKfxJJF4J3ft4y1tl3d9
         TI+gRLTYrE6XFQExpPR3aJEDjs57kqidpahyTkCiTvMVCqN26sCkGUjx68Rs83XpzDzt
         1D/u88SvKHGI1mRYic0NdJrDf9qo83804oRhNjT4hsrlTqkSglcCdAQzzwaalDSg4DmU
         Ma7dxYVP0QTCgYg7uJ3SBihW/SVR/j1Yc3TNYY6QPEownI+G67x37KqEU+tPjjA1n7TG
         SkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
        fh=uRYB+v8igBE4Kc8ztw97lAGDbKArUM9Y0kNgEyUT/RA=;
        b=BJDbPIkQmfyBKft/qO8Lot/Clu6KHa0IPZcN1+ZcfCyMSp1qLMyToCE2UfN3uzLpbO
         FpX0El3YnKVjz9lLxxwCZMwKxDdjvHFmt4DSeD554njR8zZIXeZkg/XB69DKHxutQcgT
         wgsihUrUM3fdXJ18dcKtyR8cCKD/2yxVdGUHRRLUc7RaSFfU0FIczFr9Wd+JxTAqD4VB
         dknm2/B/6GbUBt/1SH88XgukfoPGw4s0lZv/jbX5j1j6k5Ia47O5DFt/k4qbe1NUiUTJ
         oBASJydM9pGZQXzerY8xwNzQlKppvOHak0oNHHvn0VGuHRK7bif8VoKHTavRgGP2r3YK
         dc5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793731081; x=1794335881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
        b=nVCsNw0y6hskrENSBv8EU3amWuYztT8dLT5p7AwDRfBEJgh5KCH4wcnDy1+4F8oz26
         mugE2B8LWKKCR0Y9k2Z98xSLZ5eNvcfR272i+te/45lnsb9AWyAtGJcy3D9bL7ir+f71
         qQpNmsSv7T5esoFkU7QTr7zF74lmigXGg9dzQbwmAGy2M5yd+bQ/6ZIx3r0WugxBJ5RO
         hJm/oKDuQExrJP3FUtAD2VCpRZdYySsqRCW8MbRDOe9JChKA+5WjiMn7EutjmI1dtjC9
         TX6PAuZUUq43suQ5ErDcrLsoaFbkM/WfFXDhbG1erayEtyXYdgmMQ2TL7MALbarBBDH6
         21vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731081; x=1794335881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
        b=yav++qWFiXR/xuv9vANndIHPHlYXNmxSqaHbfaWLnJIcM1zP9YU0NVvHwy+ICuurVF
         EBjRzWBAERIGKTGjC2d3NKhV9NpaW1JjYDGU++Hf40xcs0H9NkUvnQcbnL5+jmsyOIHa
         jx3PsuuJ2Jgpz0Ziqyysyc2PYZWm05XMYSTu056UVhoFt9ZvGyU++5NaqUHRtny2qLPD
         PfQQmQTuvJXWlIJLN72u22iK8vG7luO7nn41q+Wl6h52O7DzNov//KOmXv3x2QqJSGIe
         SqDGFHQLjMqllcYyNcu/V5WdBt7jhP8qd3MMqUF9ynZZETIpSUDSFVASTFmqn+MnfpyD
         xDSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8X6rIKwgC8qSsMnrDbbGJ0ye/9h6mhFDOmdmytUkyw4T0/PTqgE6fsoZ+v1nGUpFNBzbJyn0uN7PotfvBYKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W2h/oX/1sHL6rIzWo89CudwnqsdZbojVb78GgE3C2eooq6GUa
	cVXoGv1sVI1uVYw99BHIJUqxFUus2Sx5yh7WVmjITCOF1353GFs7gOrh0EJ7sAVj8SN2hOSvLoX
	KbACJlEDUPR+89LwbtZolbYs/cXBeZWfucL3oUQZf
X-Gm-Gg: AYBFou3gpN3VmC3E+f+D14eJ8k0l5ZcxEhcwcFSOvpMImD4IdVgK26GNHkaEw8+GMbr
	WSNwSYEjWhRfcBhpF6TwnVoVGAM+BRi3paTbd6rZZU5/vwPMWq9Fm7yGOjFCKhC9vbRKdCzsjCE
	muqU/1kthdV9JxHl7rPpuOH95iREXrXt5D00x321yQetcd02WalB6wUxg9Z2xzCVdoYI0x3V6sQ
	9gKAJ7uFN/Mg9cy845CF5xo61Uc7yrwE3wCldeZDH4i0pjnxA1B3LcThbptmU5V7RTdk7QnQ016
	rfzRR+biYx5TVja/Hy0gKdElroGSJ4XQ0PwJLFes6Zrvw7UBDLNETinHgO1XMT2039fdeQ+0o5s
	8jOPY/OiTH/IZRWAsam3mcUH0MhkPwkbrJA==
X-Received: by 2002:a05:6512:3ca7:b0:5bc:e8b0:5652 with SMTP id
 2adb3069b0e04-5bfd9589099mr5147409e87.63.1793731080985; Tue, 03 Nov 2026
 10:38:00 -0800 (PST)
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
 <auM32mOlBLu6ZUlt@google.com>
In-Reply-To: <auM32mOlBLu6ZUlt@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 3 Nov 2026 10:37:48 -0800
X-Gm-Features: AclHuK_sfbKF658HbwyCTsOToNn9cXs0qzXn8uaPUG4vxi_nXA5hXmjvbt4jwHQ
Message-ID: <CALCETrUD4vh_iSHV7G0bprUFU8=c+ECo701-tXcbQ3UXBWC1ig@mail.gmail.com>
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

On Thu, Oct 29, 2026 at 5:11=E2=80=AFAM Hallgrimur H. Gunnarsson
<halg@google.com> wrote:
>
> On Wed, Oct 28, 2026 at 03:56:11PM -0700, Andy Lutomirski wrote:

> >
> > Why should the task's cap masks affect this?  *Maybe* cap_bset makes
> > sense, but I'm struggling a bit to see why cap_permitted and
> > cap_effective should matter.
>
> Sorry, the phrasing here may have been misleading. Just to clarify:
> none of the creating task's capability sets (cap_bset, cap_permitted
> or cap_effective) are used to restrict the new user namespace.
>
> When I wrote "reusing the existing task cap_bset, cap_permitted and
> cap_effective sets on namespace entry", I was contrasting this with
> the prior series from 2024 [1], which proposed adding a 6th per-thread
> capability set to struct cred.
>
> In this series, when a task creates or enters a user namespace, we
> simply initialize its new cred->cap_{bset,permitted,effective} in
> that namespace to user_ns->cap_bset instead of CAP_FULL_SET.
>

Okay, this makes *more* sense, but I think it's too weak.

I have a sort-of goal of having the creation of unprivileged
namespaces be allowed in most contexts by default, *even in Docker*
(which would involve the Docker team changing their default seccomp
rules, but that bridge can be crossed later).  (In furtherance of this
goal, I fixed an ancient bug in newuidmap that gets us quite a bit
closer a couple weeks ago.)

But tying this mitigation to a parent userns means that it's
completely unusable in the single-deep case.

I do have a question about this whole scheme, though: are we talking
*just* about CAP_NET_ADMIN?  That is, is there any other bit that has
anywhere near enough security relevance to make this kind of thing
worthwhile?  Because if it's really just a single bit control, maybe
we can come up with a nicer scheme.

--=20
Andy Lutomirski
AMA Capital Management, LLC
