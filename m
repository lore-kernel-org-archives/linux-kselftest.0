Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483E392836
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779223818; cv=pass; b=tHDqwMSjuWbBr+MgyLfQZcScy0pizv9lUPVb3LnAMKHRo2gDf3R81MNWOt8WoSwlbvoCzXD/qYKNxW8ye9sO4iK+3C7cH1lvqHvwmeb01iV/sHXSzGVmC6F/RLv8BeS8dz6RzYiZ66kwAvj3kVgZDSgjDPFOXuzPvuNv1bDavhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779223818; c=relaxed/simple;
	bh=dkFcUlc4fzRySYc2NVKuup3javqjiLZAjWqACwOHCrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A324YqNxaSTEyXQLP0QdNEnsqr7mXd4YJKAGf7ic6EfD4aik5q4IiAGyDIzncW1T2ROAPL3zu8VuaIV22FaBmL2U0eF6j9f6Fx0nF51DvXeoDxvtIJ5204z4YcN2T+eQSMfgi5yBukLx8dJ8lDcHkXzJ+WvXtf5tRg546R4cdZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=EtdA27y+; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EtdA27y+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3697c35eab7so2230993a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 13:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779223817; cv=none;
        d=google.com; s=arc-20240605;
        b=GX9WUKirhEzvIe+10SXVofOnIyPghcTypiaOwpjdqcPd8h7lYgTEaZJNV2hEheG5TG
         jtAvxFzdCehIktHJra1xX2uhq7ZThuFjimYg8JUaiayFd2sVGM/eRa8G9gcmOlr4lxw2
         01Fh96o+HgXBUz69QMTIO/9GFrj15AMQRh/u+w8crNVxQQtn1Q/wAq6W9b6BuqV6w436
         TBCKUkpZIcFQa+eeGpSqMfqpeZ/EnROeWltmL3YT8GASYcFCIHo41DNLpX8za02yoW1m
         dojWqVFHo88WkGkVCk5jJPwQOYUkdaby6lFtrTYJhwlAFb85NoMbxrWZfKDqNQ1Cmfjq
         QFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8O9GVoY1EHAAfM0MQrVZUm+Yf00xHx28lkWL3OXgms=;
        fh=gbltYYUR9uu5BHCrDCTmLe0m7bt2y5ZnQkAVEjrQrxg=;
        b=i4hVifoHOwK4XMAfOsYBQjcU1j86dx8U5Ab0MIbbpQ2aIY3DZTEZRIsgqEbMqrrSD6
         CP9Xjwvx8yO+Z79qSvDaBuVCI+jt/Bz6K6pp2k8SFYrLWkpDzq7WQC3FtxNeffcYI4O6
         S37G78/OzyQCErqDUf/R+U+ClhsFNs+xXQ1CEGFpQ+vxmO/0ppTymV+y4w2dbDPdPWX/
         lbyRIbsH3kBF92Bz/Ehzq7ZhhOCNNBaoBT8t+oCQofafg71I6+oQ9f81uIJ8E3dlZkQL
         y3uLBlyBost91q2K9wuvzI1VF7GcqOlD2JvBt0r/wUljVqRDc+GYoBj2zWGOqR2/9wmO
         eCXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779223817; x=1779828617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8O9GVoY1EHAAfM0MQrVZUm+Yf00xHx28lkWL3OXgms=;
        b=EtdA27y+Rf/GNne1QZP75bT6ScTLnAp1YUAKy23OnL0hsaicNEGAcYgP//u/7xStib
         w7NVDhBCdwWR2XKJwDzyf0rzep+/MjpgqOyrlYgUSLcVlqL+cRu1MnfHqrHdoXoYEasR
         a0zRyNGifuh+D6X0r80EzQk/QEaUjLDfG9y4hCpOU3xodnb+OChoKKvZ6TEGQJcq+Xlx
         2168lM5brvj9FbLcU3gEW4GsKjvLK5u9WpmqdX+2xmehop+rItuNR49VmS7nN5yG0HnA
         rmwdRtljMcnj9uo5+W4Q9KZp21eq+bXKFJVEmdDpSFEPFTBrtiLGVbR42pd0Y/78x607
         b0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223817; x=1779828617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8O9GVoY1EHAAfM0MQrVZUm+Yf00xHx28lkWL3OXgms=;
        b=Vg1S1eal5s4weAmlJm2CItsT9YSqPz9SH2qy+YRYFWkRfK1pDFq/VGBenEj7IhieXA
         U3pMnLYxeOpzXvNQKStfRtXlCDJqTzdgSomaKWOSDYzD8R61l1C5CbRdpyQHT7WhdRos
         bYVY193y3eT4+Gy1MfKgBzGbqNnr6j8nE3rQnslUtfnTuvUxyoAtOZn6IIdw5tWMf6Zw
         HkDH5u7iP6lCud6EVhiU5UnDDM0WKj5T7eRrWDYl3TyX5vgE9jI8bZDkeD+7Y6UFqOwZ
         gF8W5Sx2AxVluJknvCHn0TEmNPJr2CRYa/H7sP0YlPSH4e4oitqLVhnd7Szvz9nTmYQ9
         RPDA==
X-Forwarded-Encrypted: i=1; AFNElJ9yYwFlaR7gK6SGbmMZ6n6zykSmxqRchJXZiNu1i++iLlKkKUj+0xfi0M0nY2jgzDXLE40JDJI8Mb/+3qNFFcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZjfwIelB+VfdBDB0c+sMFr+TyR/xoIJ4z83hc2aiz2M50+0J
	91BZZct2DtRVYgxq2L2g7nLkNRVZlFkSO6u32jyjGC+kthyzIVzpL8L1pgohpOYqqJczqzBRZ4y
	Ay6lA3j+7foqk1t895cQJETkSk2izJ8aVlwU0u1LU
X-Gm-Gg: Acq92OFcKFh2ViGFPDMKz5+3ARgKCGphTZ0Vcr6ZWwog6DLT/5YCjTJ1ZFy4pTnFQTW
	9o7aqQuaFF+slSqx4tj7GUW5HH5yJhWdcTFR7CG0XYQa4RDfXR558bOo/+PlTS3T1jb/9XjqkQs
	+Vax+hSMwZ0snaJmv7WySYujwspblOytAMhlIyHAATWf7o+ezRDU+F2kSTYLeW+WZvu48pU9OJB
	04dKzUBfSDYh/nKSZbGE3zRsi2grM4oKu8gY/iiWoUv8yZlk8nhb5ISkSK0oWJrDtYtaYNYxYoI
	fXH6QjTyzGOb7TwmZQ==
X-Received: by 2002:a17:90b:3811:b0:35f:bfdd:f5a1 with SMTP id
 98e67ed59e1d1-36951b711c1mr19794993a91.13.1779223816741; Tue, 19 May 2026
 13:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
 <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
 <CAHC9VhS1DJNs9gDB6gD9WKhL08giSVajBskZ+=mY0AWRCAsw7Q@mail.gmail.com>
 <aguvV8QCxK28ZHct@laps> <CAHC9VhTEs7rCaoPG7cWAzyVkN3ztdadHAq0g8mEy_MgCiCe=0g@mail.gmail.com>
 <agzBd9mMt3Zf7j1j@laps>
In-Reply-To: <agzBd9mMt3Zf7j1j@laps>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 19 May 2026 16:50:03 -0400
X-Gm-Features: AVHnY4KCfX5Y0PjhjYuSYVFhPqpM3ke1eUGUAa_yfyARFQTZnpheXYisH7aJzTY
Message-ID: <CAHC9VhRL1L99N9k4nYy_cN=TXHJC7dys00=zfhXeFej3XPnF8g@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Sasha Levin <sashal@kernel.org>
Cc: Song Liu <song@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 4:00=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
> On Mon, May 18, 2026 at 11:08:38PM -0400, Paul Moore wrote:
> >On Mon, May 18, 2026 at 8:31=E2=80=AFPM Sasha Levin <sashal@kernel.org> =
wrote:
> >> On Mon, May 18, 2026 at 05:29:32PM -0400, Paul Moore wrote:
> >> >From my perspective there are two different issues here: should
> >> >killswitch be a LSM, and should killswitch leverage kprobes to be abl=
e
> >> >to "kill" security related symbols.  After all, are we okay with
> >> >killswitch killing capable() and friends?
> >>
> >> killswitch doesn't do it on it's own. It may be instructed by root to =
do that,
> >> at which point that is root's problem.
> >
> >As I mentioned previously, there are cases where we can restrict
> >root's privileges today, but a functional killswitch would allow that
> >restriction to be bypassed.  My last email to Song has an example with
> >SELinux.
>
> This would be handled by just disabling killswitch in those scenarios lik=
e how
> we do with lockdown, no?

One could presumably deny access to killswitch, but that pushes the
burden of choice onto the users/admins.  Yes, that is the easy way to
solve thorny use case conflicts like this, but it would be nice if we
could do better for those who have to deal with this in the wild.

> >> >In my opinion, making killswitch an LSM is more of a procedural item
> >> >that deals with how we view a capability like killswitch.  I
> >> >personally view killswitch as somewhat similar to Lockdown, which is
> >> >why I made the suggestion.
> >>
> >> Maybe I'm not all that familiar with LSMs, but we would need to be abl=
e to stop
> >> "random" code paths from executing, and I don't think we can create LS=
M hooks
> >> at that granularity, no?
> >
> >I don't see any LSM hooks in this revision of killswitch, and as long
> >as it is based on a kprobes I can't imagine it would ever use any.  As
> >I mentioned above, my killswitch-as-a-LSM comment is primarily about
> >killswitch filling a role very similar to Lockdown.
>
> My question was more about how to structure killswitch as an LSM. I want =
to be
> able to poke at pretty much any function in the kernel, rather than restr=
ict
> access to a known list of functions.

Well, like I said in my last reply to you, I can't imagine a kprobes
based killswitch would need to worry about the LSM hooks.  Structuring
killswitch as an LSM would be mostly a few lines of code to register
it as an LSM and that's about it.  Benefits would be minor, and likely
a matter of opinion, it's mostly about how we view something like
killswitch in the kernel.  If we view it as a security mechanism
similar to lockdown, then it makes sense as a LSM, if we view this as
a completely different thing then it can be whatever it wants to be.

--=20
paul-moore.com
