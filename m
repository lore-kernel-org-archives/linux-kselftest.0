Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214561;
	b=goN6uS9swSTQ6wo/cjZ/W8XDEti8w3XKl86ZqVzy9GuGUEAgxHsSXWOgmHbyjFIAbSPe
	 +7SD4qu52ztjWcv3ncQNnoTmAOxwGqc1NMUZ15pkvG8kiQlBZcOvYlNQaAND+wJUvjE0D
	 792PGhv9qqg1hZEkS0A7+He0KRD2IUsDwpP0Tr+o0zv4M4HBiYCx9KaRLdUdVDygne+5G
	 WJI2uJi9vIpKgX8I5sUWQRRo4zUssF2oc+0H7/oU+BmkMF46x+CnpCZypv1iFf4VJ7c/n
	 vMPkteSDi5pZlfTsqExZRDa9oq4RaIfPfqM+sh8g8TDmEUAAOHVLOllhg7YfmUtTn+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vHqmqtUv3ldNxNv4goZfjp24sRWMWgjGzY8HbYBqnOI=;
	b=diZLHknElQvqmagGzi2Fi5t8a7WTgeccpvR5kFT+Pj8Lduk6ewxlaNtQb0psctcol0KM
	 ZulbbCYBrzmDGT5PK7KIsQT0aTUZ9XEdrR1uI+oDQ+nmTkUuqMIUNLJptQ2j/L7skPAjR
	 bMR0w/sI28gxoPjJSwnLwm/21hIIn4lP5Lo/XPymjT8qXAuPZ4CVrk9rPEkIEmnyHmuan
	 BPA21xvglyTmByM55Lr1mJ9LYLNyKkc/OSQ9BijTpK7SAiSuzMI2PSJ7fGcr2mCpzGHeX
	 lFisK1oYotDJM0Q80myMg+x283oAgEq5skzYMD6QJC8nJhhbjoBABhG/xeey75oe8Nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=OJwL4udw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F53606A6BA
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 22:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F53606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=OJwL4udw
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ccca948203aso1550308a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 14:42:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795214557; cv=none;
        d=google.com; s=arc-20260327;
        b=PtqKq7s+jRj3wCnCJG/6/zIYvcaDz6LihXd/6ckX5xbH3sRL73xtCWErj+xPGKXFai
         56puTvfSTp+cqq6V1M2We70RWlcIDfyp+fSFz4UY1WYxRZ+qk7h/4WWwtKB/wK60mi4h
         Y+/jKEs5VbnXi5YC/uD89hfXOf52+i/ZkAWU6pnlhXQJH/96Y8uTT8XrgcMnoXQHq5F6
         w1sQwh93eRe4RGH+rWBqP2ISnxIDMvH49rEgW1qt3oDhr4G8o+Boru4Woz2juHaqUPEu
         xTa7BHQ7jU0WoygG8Ea788PO4Z/lNEz4GzQwazxCN5ZNt+fepfdpoYAkiYoz7FCYtypq
         Hh+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vHqmqtUv3ldNxNv4goZfjp24sRWMWgjGzY8HbYBqnOI=;
        fh=NL6+LI6Dmgb36etANmEH2vObBZleu++S+VISkozmLs0=;
        b=FRrBzT8NfLH6MpEMUz6IryHKPL0d11rCvAh8cfxg4Ev3WKZlSiFDD5bs/Hl1MzHclp
         9qLtpJTTcs3fvGow8r9ZpfxgDMMZR9FRVBr33egNd0yIThavzl+HbEz45C1YaLsaT5OL
         Pw6iJu/klFceju7oHF0W/yOOvMczyN0a4DstaclPnuGGiaua1EhlEVYHx2bF1nD3RyCv
         CAmfiV65l7aV6zm+zoMCoyiNnwgqTw4qy7LW4FYa3qXzPVyfAJxmtvVy5hDcbckOZFr8
         QqzEAXyTMEL3mg3Uav5gHJm/v3YrYO4skGklHPMvzQO05cB4sT3fTcKGpJ0uIpGt/d4Y
         y3nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795214557; x=1795819357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHqmqtUv3ldNxNv4goZfjp24sRWMWgjGzY8HbYBqnOI=;
        b=OJwL4udwjxpmrVlLHcONzEvKUwhIev56POEovLo3PpC21XYiIbCLjZym094IUqQtp1
         SzD3eL2YEmvY3tysOdOdNwsBvOmiPtoMmHs9W1NuU9fUrWicTXKcvYPxfOCck86JHzvT
         qbzhYmAnu4rs7/Vg9AJjp3SqzmuPPN3i0oIPTtuiuDD9ncyts0iF5uFGUBBego5huwqI
         UqKAd2WvunRkHPwyE5dN3n7lAhAjzJHhnmA6+dI+i7PADtHvZY9fGm65FaQVH8h/LZyC
         qOPtpKrdHbE2MqbsGQXCYLz9M1C9jJelpoD3tNstDXxXkAUrYEM8x00PwAvGX8rJVyE0
         16Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795214557; x=1795819357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHqmqtUv3ldNxNv4goZfjp24sRWMWgjGzY8HbYBqnOI=;
        b=L93ZnTotyQUToF7NjOjGqwzzSJgukH+WRVYVxQxVe2Maj5W/Ses/QR1dQrw8tHvOT5
         otVJH8lGLEXmiTdhBWF5tZWrtMu82Hn8bYd2yrDxIiyQVGZFxB0e4wui+Lgl7+iEs6Sz
         muXHMLLwc5R9YnP34DAR68+oUjhZ+kcZMK0SeFIku/nMo+xKnyomZpYvWwiABz+auBkX
         g9G715gJzkfLPd4qLv4YVfYHYXgvqF7wr4NjMWbNM1bb7ST/39OZzcuERqhwwrWmC///
         k7b7V9ySD6YvkKhTpGfyK3ZsX0q9ayHPNzHFCjAPpAD3Nztt45fEaCF0GF+ay0OZ5h81
         mB/Q==
X-Forwarded-Encrypted: i=1; AL+hErF0gUo67mBpouDlMQbgWafS+nDCAFf0oF98NBbKTV/rbrmClA434DAu7Rw2s/aCXzlNZNNv5B5KsOrwYzB0TMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DyV4J0zxmN5BObkt/ddu5DtW36BnuDPta8XrHAEMcqwPgPmyx
	M3LLIt50w5nEHmraccG3K9YKGr9jWAkCEtgqjvQ0GR5SRLs7KjAD/eV3p07eLnGZ5Mlveh8pybu
	zpImN53K2zm0VH53AuiA1mkiBHH2m5fsY62rqwc18
X-Gm-Gg: AZFdTZdbPG69WtvPlF8Rsm4nHuyB1xDZCMv/7CoEnMyOi2gRdAtExXG0+HBufa4r6HL
	PYfa2cGGZF4CMG5etwK1gtZlJrkiyv0Indsf3b4G2BSDm8DtKAIN4vnsWegv1fqLdGDRB8zkYBx
	VrpcVjnEMOlyIYQew0txXAqBCDKYO6XTLN66iRKfU0WtowUqhDrEoMEuTW1wAsqT8t/Q1ptaDex
	ulhuK2RtJUwirok6ZvBFJJ41COTjuVCc8rwNawIB1h9wi3Dw9ZoMVLBLzwWiMKz5MIRUrFlW5FZ
	Oy1yF3YUeIQRYm7LPASeFtKqcGDczKLiMyoRtwqHUrM37fJ3VvfIou0mtLeilQveCAZ8V9q2kZY
	YM+X8s7zxpc6xRN9RrMSgmf2AMXi0fYDvfcetQnHsL4aLlcLsA5xDTJmrriOZopDKFwfZ
X-Received: by 2002:a17:90b:2e4b:b0:3ab:884b:659e with SMTP id
 98e67ed59e1d1-3b41c8e1705mr3678138a91.9.1795214557060; Fri, 20 Nov 2026
 14:42:37 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791023194.git.tjdqudcks0424@naver.com> <d7e10b50556ab3b79c7132018249f6f7c608411b.1791023194.git.tjdqudcks0424@naver.com>
 <asLNxHYQ/xQ6KaWy@hallyn.com> <CAHC9VhRMCfahvx89HjSoHfyKR27swLdt2HZuM1enmoi_gxRyRg@mail.gmail.com>
 <CAJ-EccMjtVkvM5bZzUKDAPcOAKZbd1Lc59oNrW0U8m=s+4R9eg@mail.gmail.com>
In-Reply-To: <CAJ-EccMjtVkvM5bZzUKDAPcOAKZbd1Lc59oNrW0U8m=s+4R9eg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 20 Nov 2026 17:42:25 -0500
X-Gm-Features: AclHuK8McY1ik9ic5I54PqjcEuVP28e3vO7azigKd93SO_GqYl3O-C3M45QZMNo
Message-ID: <CAHC9VhSZVo-TMR7Z9xM=ECVB5xFZhdnHK-OHpE_i=1g4dhTfNw@mail.gmail.com>
Subject: Re: [PATCH 1/2] security: safesetid: use real GID for GID policy lookup
To: Micah Morton <mortonm@chromium.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, tjdqudcks0424@naver.com, 
	linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>, 
	Thomas Cedeno <thomascedeno@google.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:44=E2=80=AFPM Micah Morton <mortonm@chromium.org>=
 wrote:
> On Thu, Nov 5, 2026 at 4:26=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Sun, Oct 4, 2026 at 6:05=E2=80=AFPM Serge E. Hallyn <serge@hallyn.co=
m> wrote:
> > > On Sat, Oct 03, 2026 at 07:34:15PM +0900, tjdqudcks0424@naver.com wro=
te:
> > > > From: Sung Byeongchan <tjdqudcks0424@naver.com>
> > > >
> > > > SafeSetID policies constrain the ID transitions available to a task=
 for
> > > > each source ID.  id_permitted_for_cred() always builds that source =
key
> > > > from the old real UID, even when it is checking a GID transition.  =
If the
> > > > real UID and real GID differ, the policy attached to the real GID i=
s
> > > > therefore missed and the lookup can return the unconstrained defaul=
t.
> > > >
> > > > On current mainline, a test task with real UID 1000, real GID 2000 =
and
> > > > only CAP_SETGID obtained non-allowlisted GID 2002 despite a 2000:20=
01 GID
> > > > policy.  The bypass reproduced for setgid(), setegid(), setregid(),
> > > > setresgid(), setfsgid() and setgroups() across three clean QEMU boo=
ts,
> > > > and enabled access to a synthetic group-protected resource.  This s=
hows
> > > > a SafeSetID GID policy bypass and group privilege expansion; it doe=
s not
> > > > show direct UID 0 elevation or a universal local privilege escalati=
on.
> > > >
> > > > Build the source key from the old real UID for UID policy checks an=
d the
> > > > old real GID for GID policy checks.  In three fixed-kernel boots, a=
ll
> > > > tested non-allowlisted transitions were blocked while the allowed t=
arget,
> > > > existing-ID, no-policy and UID-policy controls, and the existing Sa=
feSetID
> > > > selftest continued to pass.
> > > >
> > > > Fixes: 5294bac97e12 ("LSM: SafeSetID: Add GID security policy handl=
ing")
> > > > Cc: stable@vger.kernel.org
> > > > Assisted-by: OpenAI Codex
> > > > Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
> > >
> > > Seems obviously correct.  Thanks for the find and the fix.
> > >
> > > Reviewed-by: Serge Hallyn <serge@hallyn.com>
> >
> > Looks good to me too, thanks!
> >
> > Reviewed-by: Paul Moore <paul@paul-moore.com>
> >
> > Micah, assuming this looks good to you, are you planning to pick this
> > up?  If you would like me to take this via the LSM tree, please let me
> > know.
>
> Hi guys,
>
> Sorry for the delay! Yes this patch looks good to me -- thanks for
> catching this, Sung!
>
> It's been a really long time since I sent any pull requests to Linus,
> so it might be a good idea for this to come from the LSM tree if you
> are up for it, Paul.
>
> Let me know, if you think its better for me to dust off my old GitHub
> repo and pull request etiquette I'm fine to do so as well :)

I guess it's up to you Micah.  If you want an excuse to get current on
merging patches and sending pull requests to Linus this would be a
good one.  However, I also understand that it can be a non-trivial
amount of work for one patch (which is why I made the offer).

Let me know what you would like to do; both options are fine with me.
If you need some help on the administrative side, e.g. sending stuff
to Linus, let me know and I'll do my best to help you out.  If you
would prefer me to include this in the LSM tree, please reply with an
ACK tag so I can include that in the merge.

Thanks!

--=20
paul-moore.com
