Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8102C35F617
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254525; cv=pass; b=VhSGtqNBdkTbaZnlEBxE2QAerWlWi0d/qJnT/wlURmnq5j+2WayG379vDztWsg7uwH6mnuMgHnW1sf2RcpbGQLNdIk9v7WPGnnFiganxfHTECizHTRlKSCBs2MFbiJX4Ng5vSwqM3CTW/2/06Mr5D1rUFqRKnJvms5T8cjj2qb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254525; c=relaxed/simple;
	bh=LpTDiNlHjR7RogeTiDXmpnsy0/5Mme6VyuFnUyJsEkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7nj0ZXHx/VajqVpFxwU+rcYfiLXojSt4ti/9h2fwvSx3lFUR7sK87A4B1y6ZeE0beNIOYrBNC5USmcTEfCDMJnDOqgcc9Uflc7QIyiduHliBaMGQVXFbNcxiEIm6cJT67iedkCe3BCr0pltvgCXHXjmosa+GVkgdxTRHiQkYaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v8gsj13T; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v8gsj13T"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56afafef7aeso250879e0c.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 11:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773254522; cv=none;
        d=google.com; s=arc-20240605;
        b=ZBdg56GPPg60RC8fbHvrUDKZEiT+lWhEnzWEDVyyPv+HIk3lHEclz4ud+ZZIqzh5lm
         RJV0UlE8Z5ttpUHDmw3d4NCoiTOuAam4OtyQ9dYUEUoskHmJVtNGlmY5Fx8p8Y+v2KnD
         jF9t7VTqVxGpXMFyRd7F2uuXjzYzJ4lAPRMgpTk8e7SZBOjeJHNG2le0Q3qYG7pQB9IX
         f55Ombx+yyRhPTxhpDDLGMMpL0GfUG6UJyTL2lzT0eEsAtDJkVQm7sdJ4nsMS3jwhiPz
         HjZs2C/u7ydgr/w+VCLFjXzEYL6Spypt8LAbr/Aq6JG3eJCTdRY8U/pVltHvWmbuUBmJ
         GJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BcgUYRkLhII9+M7j2ixLhI6ILk1g0NW1TskzYd0mvUw=;
        fh=RJORCQbgwOyURoPmDyf6nZArWKlt6+goZhmJr41zEUg=;
        b=RZ5Ptgtjs8t7h545L4q8uVyUDuINdhcITG4GBdGly7BsHtCCTXp3IPo55y8iSLd7Q3
         bSN1s/pjhLytDuT0dVivPi1CzLsBYJZYSRPQAip2z4v+ls+7hkPe/2rypUowl0epZXk3
         U4STWkVxxPsadeU3ZVkk9jMkKFZg/YTxdxLp16Qf4QS0IhfvM0MOwvVoSohIs54rsyfS
         U2YtV0sMn4xbgs7HPvdkMtv1T1xYjdIxKBppPmWyTTQtsTDkH9qRG1nTuaQJQ0pkfb3c
         CPRmHe4M69DTuAPHaOUYEaCDxhMArXpFWcl9huukt9acgIxEpoeaWHiu1AjFwT4gu2AV
         xE1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773254522; x=1773859322; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BcgUYRkLhII9+M7j2ixLhI6ILk1g0NW1TskzYd0mvUw=;
        b=v8gsj13Tksz8etj60QllyLjje/yQt0um9lDizHDWFnR7kO3xoEphI2Gm0fhZi26mD7
         ePj9w9EUcSEk3ZCMrkpEZEbBCANbzd8P8CurJfjnlK3cWaad4ELQm9vunkMlO+2NKKNk
         wUcAtgAoozQ3Br1jGi29cfDOCfmo42Zu+rIvv8oLOH3tQQ6ZVqBIPBYVpgzoe2tK5/yD
         PTmmh1o6zyupuqP2xJDw6cURlTBp+HdeN05uuQKUwnhFc6GUayK+utVZzmJvkSMZXJL+
         JaJ2OAQq92qCNYO8nInnxybR6wedhz+VGs5YEg+bHBt5qd6UsX5k04D+uCxoCkwcpG+9
         bNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254522; x=1773859322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcgUYRkLhII9+M7j2ixLhI6ILk1g0NW1TskzYd0mvUw=;
        b=rUO3eYfz/EhlFfK+K7JVMw6oH/DNybhnXiXz8rJGOauPdoVd/o0eP6D3gpy7xcYNlW
         +wDQHe3V9Wkw/WMfi1nxoFe2/nSh2Z2i66No77fVtEnkpNebrCbOlbf2yoFnXpEg1HvJ
         tJmuSfe7jz9Pk6rKASKPkKZ2Hth6/RaQdLfkDHTiykEGmkTbt8RRnb6nPinmU/vJrkXH
         eaxTL2oJG9fPnIj2WH7ywdCNf+8HQSq1mENZxQMbRPKd7FZPtMPTLEkibwi1h4KXzrXc
         MEGM1tryONQ3iMTOGF1Y1ymo5R9VxPnBU+pCLJy+SI4NZ6K9hcCMYOLqSBkxhy36884j
         Um1g==
X-Forwarded-Encrypted: i=1; AJvYcCWF4m0md4nfHePgj2KSQUUy/VDA9ZJnXm8dH0f/+zPvJZ2FfsO4JSIEM6emc+ih+exlA4NjLoBuk9t7Rky35+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsQlk+ivlUr2rQbwPiz4vcO8cZISpKjkca/08GESQJ9wwl/fuO
	XK1+LnbWuTZ6bl2wjKK+rGIII/6xhWTjP8nMszc23Zo2aUce2z4xCKPj/Q94PwPCYYJFxumUpf1
	s+5C9WI2vf4wUTPsJtH9hXKlIu1fx6Kkpklfs585w
X-Gm-Gg: ATEYQzxotziQr2PMF8yRwa2hpDSpcoaBgVnht+pDVS7aqyr+efwiMQczIn10BwT7nOT
	x7l37Hhvcbl8vjkLxJtREjMVGGTMYAXEy3ZQuxtY5pMFsq2KtvcpNBSqICUQHyhnlRweKp5LOBH
	EHNHzw9jqCP0stJt/LWS6hauX4KZNwqcp9o32J2Wwu6O0jjBc0k3mcJWnaeb5nlsfN+Henhj/+j
	QUd/rSW9O7IosBJyLQ3+hlxTzF1VES9Lu3Tz+dcPFCO2RHCXtdFvjNhcGNoG1+fh6hh0rS8TsQt
	wKttlSK8ZtFK39eC
X-Received: by 2002:a05:6102:3a06:b0:5ff:30de:a421 with SMTP id
 ada2fe7eead31-601def3286cmr1502772137.30.1773254521696; Wed, 11 Mar 2026
 11:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311110523.26624-1-liwang@redhat.com> <nynf44sljfbjeftotwow56w7nz4j3zkgnoor3ulljq5ajo4lgq@fogtfchssfnt>
In-Reply-To: <nynf44sljfbjeftotwow56w7nz4j3zkgnoor3ulljq5ajo4lgq@fogtfchssfnt>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 11 Mar 2026 11:41:24 -0700
X-Gm-Features: AaiRm53fgVwmf0GEDRK_ykCE-CN6tKvUHuAWz4QWlmQ7q9ESPBd5nH95Yjefi8w
Message-ID: <CAJD7tkaX8XP_JH0VQ+nN3HZhewQzGM8Yv7okeu+aJs-ETArnuw@mail.gmail.com>
Subject: Re: [PATCH 1/5] selftests/cgroup: detect and handle global zswap
 state in test_zswap
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Li Wang <liwang@redhat.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"

> >  int main(int argc, char **argv)
> >  {
> >       char root[PATH_MAX];
> > -     int i;
> > +     int i, orig_zswap_state;
> >
> >       ksft_print_header();
> >       ksft_set_plan(ARRAY_SIZE(tests));
> >       if (cg_find_unified_root(root, sizeof(root), NULL))
> >               ksft_exit_skip("cgroup v2 isn't mounted\n");
> >
> > -     if (!zswap_configured())
> > +     orig_zswap_state = zswap_enabled_state();
> > +
> > +     if (orig_zswap_state == -1)
> >               ksft_exit_skip("zswap isn't configured\n");
> > +     else if (orig_zswap_state == 0 && !enable_zswap())
> > +             ksft_exit_skip("zswap is disabled and cannot be enabled\n");
>
> I should simply check the enablement state and skip if it's not
> satisfactory (possibly printing an instructive message what to tweak).
> (To keep the test dummy and leave it up to who's reponsible for the environment.)

+1
