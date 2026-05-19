Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDB633BBC5
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 03:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160132; cv=pass; b=SVp54salNGgKTbqQHFGm6dnqZyYXEQQQQVRc/9rGRK30pZmjk9Ijy27mtJizZFi/AY9bGczemvmvqM24zfiqYFbeqmBOdVveCs7hXb5Rgo+9nepzZvcb9Ttf3MbfdrnWwyyQc44JfAV77vUambUvOWVh1axYSmlBQ6Z6/lJ8hXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160132; c=relaxed/simple;
	bh=EGx+v+ocxOnrIqVHktB3Pa65p9KA8cju+oJZDVVvPt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GS4NvHGZBVFOHRhqMFV7vbkZ/xh28A89ZLfcICxcvdpg70kj+1zE+XKpsdpBP3UpYnkH8XmCKFjHBL8O7fgKZDJwJzJ9UPrPB96FdSOx1T//pEVHnZD6O3JSzg7LSi+5UcARBV8wUdHUx5E/cYBxjzwxwDgwICGxb6T8//SF1Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=F8yXH9M9; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="F8yXH9M9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bcd3ac3307so16713565ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 20:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779160131; cv=none;
        d=google.com; s=arc-20240605;
        b=JopBa2wdu0w/btGR4TYc55ubvR0RtZ9JtLan+cdoB3hXoXD+wm99XAld0ua3P2DY4l
         Z3PC9tQ7YZZTeFZm0BvMeZhkBEeqmiz0M7XWgr60tX8JHFtoGQsgWd4Qw4KMw47MZ0Cw
         0y5qO2MSANDQ7IPQ7ZuD1Ewil0BUNSpsr83p71JvHXqYuxPtsgUOhqTyiCorxxlCheU7
         RLV3koydr6McZYSk3WgOgv+F0ZXj6rckA6wqgtaHldASGnXNzca7FUgkKAMcwNiyyn15
         i7y3ZwhF3XoZhjEC3zrzsFB1MZu+gaaDGl6Bf8PcSfyKKC3mOahl6IF2UQ9Du5//BW3r
         aOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A/ljOIyS4C2Z1cKAQfzZS/JE8nWVXlqsRfYq4oe3gMc=;
        fh=eWg4wmVqqjVPGFUujSIhac5X7KKr8lZbIvAVR5cHEKQ=;
        b=UJau7aCVaoO3hHeyAmd9zl/txFCafNhLa63VvRjS86ePwJP6tNtkq75mRo4XCls6d4
         sbmb1UZmrngQ6HFeIts/V8GtOqSReJxrHTcR9q7HGwQgy3dERr+/REKHBi1l2eLTW2lk
         xOkhoSZ1GjhkC0BkBjCPv8AGeixhHgOQjVpI0JuEkdnSXIvju6n67ibOilqeHHRAfyzw
         J3AmCRaNS8xBLu5Lr9d1Wc7wqTUrpqXN/rJ22GelDEWuwF8RJ1eUGVitB6pM209G68QQ
         h1NRIDYmKuGPc3l5VCYmG0KjdNoT8MEmLcRfVVR9O8pgfcCyV3tQSwI83whD21tNLWOP
         zJhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779160131; x=1779764931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/ljOIyS4C2Z1cKAQfzZS/JE8nWVXlqsRfYq4oe3gMc=;
        b=F8yXH9M9khoM7xBTiq/PBYj6we74/f+tV/Z/uJPT6mV7Je3uH9cZvY68nhrw/pbZD7
         RrqUqU4nS/8cWUIC1R4mdbluGN50qJ+RX4wUKXWuUuqee5FmTm5qKeyxSwmX3XWckSt4
         dMu0d7W7tOETyqci/K8QzVc3GYwpJSdNNWDfH1syvhH7fEN4MFFYMEeNKQ68Mhsrq27P
         aVWmdDPLEbpYTresSZOQlz1z64+nRMpjTFqoeGHJ2ALbLO+aEVlB6cWJw0QVpcfoc/sp
         ixkqsb6IQ0fi1A96Z9vCngExNZWn0IMxQOFxBxY1sT26lTbgF5vDmU2stZngttp9aQyq
         YyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779160131; x=1779764931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/ljOIyS4C2Z1cKAQfzZS/JE8nWVXlqsRfYq4oe3gMc=;
        b=b2A048hCZkTg3vnXgGjLBO7nvJrYOCBRNZgLPTg9NIpnMi0/h9Hc06CGG0V/wyLcDI
         9bI7cLCkay0g8JJy9zhc+tBKdBzLX4RySLDg5nW7MYmr8/94JI/chBoxh7XonbFfPLIW
         y1kRo1WHwYfYZP7OUYS9qYY1YKw/gTMnbay2DL0kB3aMKvFvUEZTouff5QYu9ADs+9BT
         Onry4HlJ644MGdfy9LlcVZsI2CWveN2rrBBFeJS0Z2az0wV0fK4YFplo/DMkTiubNwsX
         dl7eiFVPGLbAaNkRQcFa6OeodzlYCQUbfSSfV794ID44/ZiYoiG/jg1Nzd3CKAoaObAy
         phPw==
X-Forwarded-Encrypted: i=1; AFNElJ+3RftLwNivwiKpVa5+I5688RCmJkNIgiSxYpUHcOGQ+A8rN4QaGKV2YqilAbWkP1/2my6PJKMd6l9CiUncag0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZijE+KZYSZf2tUY0maqhsKZx98/MAd5Gk0V7EiT0CwCXSJcY
	mElCbMR0aWcX1BJ44RhjQuMHtYqLZjOqrXLnTsJbCRFTjCWcQWp96iWfk+M90r83DqNOe1+gA1b
	hAyuaZVE6Y5WTlu6z2ThBprdfjB7FAqhRKGVRb/Cs
X-Gm-Gg: Acq92OFuXojwN6rtrCN57eyNrTA7WHoZGV0m1mVkINqirZ9o0FwGufyTo9pkhh7UNJF
	Ynyi/pScP4sqZ9hferY46ObyxFX7BuUUBezxIdYOCE8nI7AkynJpblwU/sgml6KcbDXeMAaycG4
	2gPKnCMsMPI9a0cY3afHVXIaaySTmQSD5gTJtYHwkqux8L//Dt+El/kC9q3yGv2r5+cD+HQyfrR
	RVGhgljqTnnyqHypt5tewWTCJVt34+6WNHkwKPs7GjgETA9hQGGRLd5o/PZWqbP8gvN9nOet0zJ
	KDmbntE=
X-Received: by 2002:a17:902:9887:b0:2bc:cb56:123a with SMTP id
 d9443c01a7336-2bd7e8e730cmr128227855ad.15.1779160130784; Mon, 18 May 2026
 20:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
 <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
 <CAHC9VhS1DJNs9gDB6gD9WKhL08giSVajBskZ+=mY0AWRCAsw7Q@mail.gmail.com> <aguvV8QCxK28ZHct@laps>
In-Reply-To: <aguvV8QCxK28ZHct@laps>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 May 2026 23:08:38 -0400
X-Gm-Features: AVHnY4Lgk3Y-6PUi_KR7kVZAr36ndNcGd5RqHUXUruMuRWQ1LShUOGvFL1p2v0E
Message-ID: <CAHC9VhTEs7rCaoPG7cWAzyVkN3ztdadHAq0g8mEy_MgCiCe=0g@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Sasha Levin <sashal@kernel.org>
Cc: Song Liu <song@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 8:31=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
> On Mon, May 18, 2026 at 05:29:32PM -0400, Paul Moore wrote:
> >From my perspective there are two different issues here: should
> >killswitch be a LSM, and should killswitch leverage kprobes to be able
> >to "kill" security related symbols.  After all, are we okay with
> >killswitch killing capable() and friends?
>
> killswitch doesn't do it on it's own. It may be instructed by root to do =
that,
> at which point that is root's problem.

As I mentioned previously, there are cases where we can restrict
root's privileges today, but a functional killswitch would allow that
restriction to be bypassed.  My last email to Song has an example with
SELinux.

> >In my opinion, making killswitch an LSM is more of a procedural item
> >that deals with how we view a capability like killswitch.  I
> >personally view killswitch as somewhat similar to Lockdown, which is
> >why I made the suggestion.
>
> Maybe I'm not all that familiar with LSMs, but we would need to be able t=
o stop
> "random" code paths from executing, and I don't think we can create LSM h=
ooks
> at that granularity, no?

I don't see any LSM hooks in this revision of killswitch, and as long
as it is based on a kprobes I can't imagine it would ever use any.  As
I mentioned above, my killswitch-as-a-LSM comment is primarily about
killswitch filling a role very similar to Lockdown.

> >The use of kprobes, while an interesting idea, presents problems as
> >allowing any kernel symbol to be killed introduces the potential for
> >security regressions.  As a reminder, some LSMs, as well as other
> >kernel subsystems, have mechanisms in place to restrict root and/or
> >enforce one-way configuration locks; while many people equate "root"
> >with full control, in many cases today that is not strictly correct.
>
> killswitch "complies" with lockdown. Is there a different scenario which =
we
> should be blocking?

See the SELinux example I mentioned in my email to Song.

> >Yes, kprobes have been around for some time, this is not a new
> >problem, but killswitch makes it far more convenient and accessible to
> >do dangerous things with kprobes.  If killswitch makes it past the RFC
> >stage without any significant changes to its kill mechanism, we may
> >need to start considering more liberal usage of NOKPROBE_SYMBOL()
> >which I think would be an unfortunate casualty.
>
> Why? If I don't really mind the security impact, I want to be able to hav=
e a
> killswitch-like interface on my systems. If an attacker is in my systems,
> killswitch is the least of my concerns I think.
>
> If you are security concious, just don't enable CONFIG_KILLSWITCH?

Isn't the whole point of killswitch to have it enabled everywhere
because you never know when you might want/need it?

--=20
paul-moore.com
