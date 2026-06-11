Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0BC48C8DB
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210224; cv=pass; b=NvLpY7GlTLxGe1LPxrcoMmSELJgsNL/sSXST4pTc/2GeS6iLYLHNecOPah1tSs+wzyqpQLyAfH9lfhpnbfpMhYliX1OspJ+FVP8jHwy38d0uAyyE6HuRsiR83rDYU9TwaPpPcCZNaBTdGpZP7A85THk9+T7ZvzE3yCu1yt45lg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210224; c=relaxed/simple;
	bh=K58UcHo+B3aFwDsgem6xE8uiuWZd8lb+WbYUU9ocaqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wt5iUbmYv6XIa8cP8l/6riEjM81thM62yRwOIlu9NbcTXSUQYyj7tzObMn88fJQy/mHUWBbmJxStjILtAncMwq7FYTyOL7gxhEkAObPBK6pA1T7mTaAeNXDGprJsBBLkdxjTbQGUoPHy9ygeNznef8c8mGcrM004NuEdCYp0ZAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZWUKAUr; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZWUKAUr"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c54b82e936so5096137.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 13:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781210222; cv=none;
        d=google.com; s=arc-20240605;
        b=Ey2qvISkQXy+mxdgXBUCqnOh58t7xhFqABjsSEJfInrHFhLTrGKlqleQm5h53MOBXw
         Lw302mwAW7h/OQa46XZXcLVevRJhv9lSx/1yjBCT7RKFy4j0JNTh/cgrT5icXjOrKO6U
         t52LONRQLQYF78sm+YQJXcY8C24b7EBWK/aT2EiQVCbEfLgj7gAU1YCdXp2j4LQr+brd
         CGrL9GJV+397uAx8+Z/qKqm+IONhWnGZL+cp0g/aSQWuNNuSZsh4wAIlKJ65XTVY1RV6
         PpV8D3PbgdGNd560/6KbrBckiSKKoOwQCCMt2R+kQdFRWA+uZrIszX+i93yUy4vF26p+
         J3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+sd3cdzhpA5EXsMbu0XJlZwk0ZLWyDF9YQvcNfzR1z4=;
        fh=WWG/ZFcVbflmyG+5j2mOXP4/7/2yApvvKt4UzCcKYCg=;
        b=jHKA2GvZr4ITHqzk0192POLsz7zZxYHiR84W0Rv03PYRON4lupGLLRzx0UlGcGDt7h
         jQv3XZj+IU0Y/H+elhhp23Ga099XZim0zW30R7vSRgShlrC29wtGfOnlGJnrQpzPH5cM
         YVxw/3ZMybPvIHz1S4G8qeqqMJORemhbBcXUtcpxgZGoDC+2YYUNpSCsmiA+c1b5cEzy
         L++M56tElJzsPtK2/fCarmpPAcQQf3kZ/AIxbJfgn6k/CHiI6cORNsqRlIGqDjoFVDGK
         DL02W/U7oRix392M4riv8yOsFKdYf0IFBm/bSk1RroeamFP0hVTD1m1ZugL/7q3CzxNQ
         //EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781210222; x=1781815022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sd3cdzhpA5EXsMbu0XJlZwk0ZLWyDF9YQvcNfzR1z4=;
        b=BZWUKAUraziQu0sfd6OqVx7WeO3HUGsmQYbuFHe5pAVUJYAycBN4oIuAHq8rX12wSE
         UE4sF3bvEcOQ+p2+ebgkFMhBiP5NQpVPoygob6iftXrWDEdzRLD5dx9TUphJI70Gw7Iz
         mWUWmDxu/EUEOO1mVRHAYiQfCUY4BWTxqI/FuzqMi8shWbdiIXoxM/QC/1P1vALSiUev
         lKKJFFGusbgOtIVzmbVYVaH7xP8HPXMVk9UHZUVa0P6Wizi5vRaVqzihVQlnYHyl+Rup
         CO2cpYjhkPU9e665PFRpxg3T5oGzDEil/krlTR7haT1sWlL1vi0/kDniyxCVP2+f0Et/
         qMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781210222; x=1781815022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+sd3cdzhpA5EXsMbu0XJlZwk0ZLWyDF9YQvcNfzR1z4=;
        b=NiiiVDhtZkVUotr601tJPEAHt9P7cu1OL3dG0Ml+caxTl+L9Lxei3e8S7xbJ9fRXTO
         p9p528SdFO0OH+H9u7gcN0b8hxNfG+tzTtTnnQxMGOTjjFhIJKqCpr85t3Jqov5Y9du8
         BU2CXFO+ppk5PTFypBYGTBdXrDzHo2Owp4DR0R/Jgsng6ijT747iEgz/lCzzaVstpha8
         /FYxof/rFQrZxf2lfJgBX8DVJ9j6RuUtNkmSSb5ND/2xAYC4GSdwOmiUJuLWghkPd1Kd
         odijU/ndd8YDlh5FGKsz05MpAaT9LEGkOfwu1cgdPWVny1YhWJEiRZcnHLraBS0sELwA
         eHQA==
X-Forwarded-Encrypted: i=1; AFNElJ+kbzsEO9hA9L9Q6rker7oScu1DpnEO6eqWU54OnfgINKArSJGL6Xp7/NnwPm/W+irtD4Sa642w9L5dflzk1Hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqCc4Czwj4Os9RJulBVzEnrmVJ8WHdBhGjEBYCRThyw7eNehiV
	zv5eI14on1poEvM46oOQulAgBLtZrkHpF1iOVo4Z98xMXO6qw370KOJ4QUwvU13mRE3Fkw9eUlO
	JUWGrG7SWEUmAyy2GzfRcfKZdzDpQuKE=
X-Gm-Gg: Acq92OErwLAF6N5T+ZpBN0u7BNHJcVxt09voYOnoiZFjL1lac7Ifc5V0Qv3AgbQIpNn
	zS7sdAU7M5O+rrWgSR+d5B1iv3fIp4tyvkROrmnpC0m6E1YaQ5IykqpGTErhyIjd7ki0U0jLXxy
	MdkObf1wSxwPSb+Yos+Xis2P7ku3viMpTlrmDpoK1Vh/nJ4wZIiIEVMonIZgJ0qwQWxF7/0+u+O
	s40PGeBrGRcz22ugJfjwvaBrpTfk/pCwbMprd8K8zHjGdGX117TkWKBbq2AGM6uhgesVPPgq8kz
	i9KmD0gM4A==
X-Received: by 2002:a05:6102:26cb:b0:631:4d32:a86 with SMTP id
 ada2fe7eead31-71d5c67f824mr916400137.7.1781210221808; Thu, 11 Jun 2026
 13:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAF+TLO0TOKr3nef9RnbBuZ8A-jNpV1po26t1BO6JbSqMhfABvw@mail.gmail.com>
 <20260606003627.88973-1-sj@kernel.org> <CAF+TLO3a2MBVp3-7jm3BPjuT8jhx4yzdWxuA_QPQ9YPVEj0XZw@mail.gmail.com>
In-Reply-To: <CAF+TLO3a2MBVp3-7jm3BPjuT8jhx4yzdWxuA_QPQ9YPVEj0XZw@mail.gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Fri, 12 Jun 2026 02:06:51 +0530
X-Gm-Features: AVVi8Ce2REi4mUqmiQKXLcfNq0RParFt0ik2l5LBrnYnygRVam7OLZkXJS6yVMY
Message-ID: <CAF+TLO2PX71_-9nKBEAJ50+NpjNkgipig6=9OLsvbgZtqF2yew@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/damon: add regression test for damos_walk()
 vs kdamond exit race
To: SeongJae Park <sj@kernel.org>
Cc: shuah@kernel.org, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello SeongJae,

Noted on inline replies - I'll follow that format from the next response.

Following up on this thread with progress.

As discussed, I dropped the userspace selftest approach since it
cannot reliably trigger the microsecond-wide race window.

I wrote a KUnit test instead, added to mm/damon/tests/core-kunit.h:

- Creates a damon_ctx
- Sets ctx->walk_control_obsolete =3D true under walk_control_lock,
simulating the state just before kdamond_fn() exits
- Calls damos_walk() and verifies it returns -ECANCELED immediately

I built and ran this on a kernel with commit 33c3f6c2b48c
("mm/damon/core: fix damos_walk() vs kdamond_fn() exit race") present,
and the test passes along with all other 28 existing damon KUnit
tests:

  ok 29 damon_test_walk_control_obsolete
  # damon: pass:29 fail:0 skip:0 total:29

Since walk_control_obsolete is a field introduced by this fix, a
kernel with the fix reverted would not compile this test (the field
would not exist). So the usual "fails before fix, passes after fix"
verification does not apply the same way here - the test directly
validates the new field/behavior introduced by the fix.

If this approach looks reasonable, I plan to send v3 with this KUnit
test (replacing the userspace selftest from v1/v2), along with the
commit message format and other minor fixes from your earlier review.

Please let me know if you'd like any changes before I send v3.

Thanks,
Sailesh Nandanavanam


On Fri, 12 Jun, 2026, 01:50 Sailesh Nandanavanam,
<saileshnandanavanam@gmail.com> wrote:
>
> Hello SeongJae,
>
> Noted on inline replies - I'll follow that format from the next response.
>
> Following up on this thread with progress.
>
> As discussed, I dropped the userspace selftest approach since it cannot r=
eliably trigger the microsecond-wide race window.
>
> I wrote a KUnit test instead, added to mm/damon/tests/core-kunit.h:
>
> - Creates a damon_ctx
> - Sets ctx->walk_control_obsolete =3D true under walk_control_lock, simul=
ating the state just before kdamond_fn() exits
> - Calls damos_walk() and verifies it returns -ECANCELED immediately
>
> I built and ran this on a kernel with commit 33c3f6c2b48c ("mm/damon/core=
: fix damos_walk() vs kdamond_fn() exit race") present, and the test passes=
 along with all other 28 existing damon KUnit tests:
>
>   ok 29 damon_test_walk_control_obsolete
>   # damon: pass:29 fail:0 skip:0 total:29
>
> Since walk_control_obsolete is a field introduced by this fix, a kernel w=
ith the fix reverted would not compile this test (the field would not exist=
). So the usual "fails before fix, passes after fix" verification does not =
apply the same way here - the test directly validates the new field/behavio=
r introduced by the fix.
>
> If this approach looks reasonable, I plan to send v3 with this KUnit test=
 (replacing the userspace selftest from v1/v2), along with the commit messa=
ge format and other minor fixes from your earlier review.
>
> Please let me know if you'd like any changes before I send v3.
>
> Thanks,
> Sailesh
>
> On Sat, Jun 6, 2026 at 6:06=E2=80=AFAM SeongJae Park <sj@kernel.org> wrot=
e:
>>
>> On Fri, 5 Jun 2026 12:44:50 +0530 Sailesh Nandanavanam <saileshnandanava=
nam@gmail.com> wrote:
>>
>> > Hi SeongJae,
>> >
>> > Apologies for the delayed response.
>>
>> No worry!
>>
>> [...]
>> > I agree that a KUnit test is the right approach since it runs inside t=
he
>> > kernel and can directly set walk_control_obsolete to simulate the race
>> > condition reliably without timing dependencies.
>> >
>> > I will drop the userspace selftest approach and write a KUnit test for
>> > damos_walk() functionality including walk_control_obsolete. I will ver=
ify
>> > it fails on a kernel with commit 33c3f6c2b48c ("mm/damon/core: fix
>> > damos_walk() vs kdamond_fn() exit race") reverted and passes with the =
fix
>> > present before sending v3.
>> >
>> > Regarding other feedback:
>> > - Will use correct commit description format with subject in brackets
>> > - Will remove the Fixes: tag
>> > - Will add blank line before _damon_sysfs import
>> > - Will add changelog and link previous versions
>> > - Will share revision plan and wait at least one day
>> >   before sending new version
>>
>> Sounds good.  Please consider using in-line reply [1] from the next time=
,
>> though!
>>
>> >
>> > Please give me some time to study mm/damon/tests/core-kunit.h and impl=
ement
>> > this properly.
>>
>> No rush, take your time.
>>
>> [1] https://subspace.kernel.org/etiquette.html#do-not-top-post-when-repl=
ying
>>
>>
>> Thanks,
>> SJ
>>
>> [...]
