Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794077276;
	b=46Egdd71YXqJzb8y54svgnrzdTTwzJ60ZZz7EevYKSwzDSUudqTCwtoq5twSLVxrkH5f
	 XYECmIJyTSFu+Y/e+RAPFgOqp0Tq12N97AIJUNm9F3kbh4tLKkaoL+FgXxlsZdwpF44ws
	 vRofCPN51gG5qLcRoORUDy360e0xm8HyYUim+E+tlze5BWKfZSGWnBVJVK2lyFgYvp/CK
	 LmSkT3om3TXXtOo6Iz5XKvRP0KDzmKGTdMk43Id2oFxRe8mYnrzgD5ibGxwHccgV9seHD
	 chr0HezUzWaI0ASJStQ7CENRXB3TzK50b0/O2DUh2k0ivjDyyTvMDs5cMVMWnd7NlrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
	b=mq7QuH1kZnX1U2dbwjs7m5W3z05uCACPC1ByZOU3T/CSbQjM/vmg/V1PQe+MsR287XEI
	 /2hpROvMkLuDp1Wq9hTlhCHhkkobyczALxFi1rj3GOnwCp8ZmtwVO43pxyEvmvJ04JaaF
	 65BN7jxehdqspnZpzTKDvar3bpr+phDuFv1oalKBvBm6L1TYWo26pHPHl70JArcR94RzB
	 zo25RfbQSo3XkMnG6qnfr/hcEoZZT5+Q3hSda7UUuFD5HzKyn7KT9FpaJRjEYtoG8gmAh
	 SVSbWR9pxTBBfgyJlxndmsT0SMiisEEqvsdsiznseOAIMWPZCFsXvGCG67bjbTYUn8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jDsWkgNe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB3606A32F
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 18:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0AB3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jDsWkgNe
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so1981461e87.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 10:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794077274; cv=none;
        d=google.com; s=arc-20260327;
        b=GkkquNGnlZbG1VHwIlWYFOb1aqaobhN2tl8UUQabkY23LyHh5wE/X64ppjtHFydo3d
         8XrMufCnnW3756bR74UAuLCuwZvwFEYSp6W8KyOMqhDm9KWhf1oBYnVB5+1rVQ4RuvBB
         X4AXS947lG/+7o2dx9h5VBsEsiIQE2/i+Jxw1WaCI84uvJRZXF7PnJ27f3Ux2rrv9tBT
         lOOHetJk+Qf48ocaaMKZBZUHVQ0/GngXmKbuvFse1OzsZ6lVvCWRhHWbT/MiAL282gGE
         oihPILJgjBa4NX1dn2/0IlIvXSlmN7J43bbeFW/08w1JKikf9gaiWulUoRwuYZkMSsae
         BvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
        fh=nDWdq2bmlHx30tbo81rvRZi/AA8EyYIpFfFa3Q09DY8=;
        b=ctZJAHrMYLx0WK7yN1bcH44u1bR++TmDSsmQfuYbJfKwcVred1P3loYBw/XeIAbda+
         4xl68plYZS4/cGHT9lPsIbCODHWLyNNj6XMU6EYidmVv9oqIwyuJ9v/BYIuhXSYnunXn
         KVAj4dweEUE+Qav4U8resDqKxAi6jKq/UUSBEfE7HMJ9Fwm1CmOJ1i/nQi3eD69kHpUh
         L714162SEkAp0J9bM6oPYsuQbBorLD2kXR4q/2n/xVqj3mbBxF+ZLkPLHYhZpOxQTgaP
         05dm3C/jxPPIlb4XFf7DCT5hCbMq+WwhL2htA74n/Kxt+oFppcgqYLBFRL1eXmRBrjpe
         pIuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794077274; x=1794682074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
        b=jDsWkgNeFsbdQ7qKqbpHSGOmDkfyI4OzDS2pJc6+Irn0QHpBxG9wPbmRTDmNnDdzS5
         db8t7KSVAGcHE/QtRbNhFDCWnX4uqUr1mEeZuLglr9YUDK4k94+gZZ0e2v5XDqaLBMAu
         GF2mKtLq3tPj9IBZGN3w1gGTAF0jFrsZMFCKcXAmKrirJiOIjEcuysNg1l24IqICP4gV
         r2UQCTmuYiVAi+q/1GU8UDVYE1+IZodom/D3RIz9GtMMMdasHTqHTXmlylMP0IcXnVJO
         5lWPTzglrmuISOXtwRoPqefa1QyXnIQk56sGTTb2Rf1nGsDNJzcZ5BPRF2XDpKcZZ3TD
         g2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794077274; x=1794682074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
        b=SP1LIpXv1QgPAJtaDd56K/fEW1OI0Upsx5S20RLbFuuIc82QtxHwpraW9iufDl1LVA
         3LxGFluinAbfOnieIzKCOM/5VSi1Zr6MYtcg5zRq6j0MNz2WcgpVTqGygok2PDPtLRix
         +ZGBI0uwheeCMX04vj3rEzymNKNAj7fHFdQ6xkeRBj7h9BLiVsrHJ7nGN2Kl+fUexIDF
         YMzD3vSu98B7Ogn3D84aI98FgjTQFYXxpd6qv4KuICi6vSb7lT165BbVr7EMPjTFBpcq
         30eTkdFTD9qkZwBAP6pvjCJJkA5gPuK8v+DmLLumy4JdhE5Ee90OTxX96sYPzsPRf5k7
         uCxQ==
X-Forwarded-Encrypted: i=1; AL+hErEwL+Sgq4u9YI7JEp8fy2wAvwEuSKDRYBLisMjHP7Vif26U8YwHocG/ayoZEcBVXA4pjlBdzkXrUcXZWkt8WNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o1FHLLI7BAjN97vOQlitAPmbKcPuxJYuoSRhaQcQ6wbbJjMEr
	smFzuBTpnlJLEggNU45rnFen370DQ/oE3B/oEpHP+qyEpz5z5ownwHouMO2Al0Iw52S/VZ1jbqh
	HLXCoCSJrqrgZCb1kSlb8GS1MvtGJz5SI+OPaBCP8
X-Gm-Gg: AYBFou2k9fbF4lXXhhsWCVwMqscDiulhkqFOsgRRwRUdMt5nJhiRppr9owX1vbk4jt7
	uH5nPpFqLTkvcFt3mLYnSYmhYEyo8wxWqRRsn5zp6cFvQ6uBCBzk3bzeUrb/Qi8MTui4X8G4f7L
	+5bOVL4ZGLqoOUkhnPWxcCKSzK+BfU6k4RbRCKDNu6L1R6fWKvCtwJHzKPnK9f5PB1+WkPervp9
	E57GqV34jkBUTtAtEF23EV6YgwPLuNMCNuxjkCWfMCJfriEUkQk6PiadZFAxqMYS/1qqDfC4OFc
	YlARDSGR9e0DGaLV92X+Bog49XvVi2OOHjT10bo0+yYqHuMDqxoOMalyTBMr/EAaHDR0evVmpLz
	KGM8nBGo/2D2anDZIce0Uk1inzayQpV5igw==
X-Received: by 2002:a05:6512:291a:b0:5c0:ca1:9dd7 with SMTP id
 2adb3069b0e04-5c00ca19f2bmr594320e87.35.1794077274068; Sat, 07 Nov 2026
 10:47:54 -0800 (PST)
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
 <20261106-befreien-addieren-eislauf-e09212803534@brauner>
In-Reply-To: <20261106-befreien-addieren-eislauf-e09212803534@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sat, 7 Nov 2026 10:47:41 -0800
X-Gm-Features: AclHuK9s0dgg3FDVqp4WbjYQnA0hebDpEpxOAgz_VjLjRP_HfRjeTpRH9DX274k
Message-ID: <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: Christian Brauner <brauner@kernel.org>
Cc: "Hallgrimur H. Gunnarsson" <halg@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
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

On Fri, Nov 6, 2026 at 5:13=E2=80=AFAM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> On Wed, Oct 28, 2026 at 03:56:11PM -0700, Andy Lutomirski wrote:
> > The whole unshare/clone flag situation is getting out of hand, IMO.
> > And this new thing makes logical sense but is really about reducing
> > exposure.
> >
> > Perhaps we should instead have a small list associated with a userns
> > (extensible in the future) of things that the ns's admin (i.e. whoever
> > has CAP_SYS_ADMIN relative to the ns) may do.  That list could
> > include:
> >
> > - Create loopback with sensible defaults for ipv4 and/or ipv6 (i see
> > no obvious reason to separate them)
> > - Create tun/tap interfaces in that ns (and attach them, etc)
> >
> > And add a very simple new API to do these things.  Actually, the
>
> We've had this idea in the past and I think it is reasonable. I had
> always thought that we should expose a system call to create empty
> namespaces ot any type. Usually I'd be excited about that but I think
> that point is a bit moot and I'd really like see whether we can turn
> cells (or whatever other name) into a first class api.
>
> The problem I have with the patchset as written is that adds a lot of
> moving parts. And yes, I find the CLONE_* and UNSHARE_* flags plus
> sysctl to be suboptimal as well.
>
> So the TL;DR is that CAP_NET_ADMIN + userns =3D
> CAP_NET_PRIVILEGE_ESCALATION 10+ years later. And this patchset wants to
> put it back on a leash.
>
> So why isn't an aggressively stupid solution to this problem to split a
> new capability out of CAP_NET_ADMIN so it covers the absolute minimal
> set of things that should be allowed instead of doing effectively the
> same thing but split over multiple apis?

Because we don't actually have a clean way to make a list of
privileges that are, in theory, harmless but are hazardous from an
attack surface perspective and assign them only to tasks that ought to
have them.

But maybe we should invent such a thing.  It would be very, very nice.

Other than that, I agree with you.

>
> Anything that is reasonably advanced should not be the kernel's
> responsibility to delegate. I really think the old privilege model where
> the kernel grants control over a whole subsystem is inherently flawed
> and is much better replaced if you have the means to let userspace
> services grant and delegate resources.



--=20
Andy Lutomirski
AMA Capital Management, LLC
