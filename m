Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2024433EAF8
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 02:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773370721; cv=none; b=X1Of2QG04/3xODXUdtjTv9MbAbkpkFIQr/1KebSJ8rs++M87MzjA1bVRuJVYOJ3gukQp7EayIViQ+enErlMOsdLcWs4hHQ5UOmfUGh/4MUNcXHWtp6IQYg8uiRgBWA6oVxtL0XpoKpne8a0l8ANxCvyExjQ1tCcKLF/naKMoHcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773370721; c=relaxed/simple;
	bh=K0jrg19P8Iu/nlZftvIqA5/cPhbQEq9I6Sfq37Rwmr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJRSttVq1NQrI01ZZRzP91PLv818pIekadhEn9dBkUpTkjLTHf0535jNW3m7HjOFLkKDkqRqQ0KxZWkHSjKKVUxWQlC83MS+SkeVxc/qRRrfZDy4SmfssDxtosOl5V2LIF23wIj+zz0hkuFq0PNJekrfOYOnvufmD03l8I9HXyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPu7I3L+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPu7I3L+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06FBC4AF0B
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 02:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773370720;
	bh=K0jrg19P8Iu/nlZftvIqA5/cPhbQEq9I6Sfq37Rwmr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lPu7I3L+J0vBdgyRNoBXeM9JsG0i1lt+tN4h7FbQpwGyhIoUMXPJHwylekpLyBGjf
	 iiSUou0xehz3peAanV0tAyWRMC2pUbu36IrGnHbzXHAdgLTYiPLg+Qw6bwrpkTIEZ0
	 mx+E1HoByMnxOpBc1nYrFR0cDMV5TFq3kKu3BKdSq5IMGv8bi9R+9vV3DfOllTSKmr
	 iCWZxEXq3ZrwpIq6j7Arz6lofEwlnDhOi+C7dtD5BjlW9y5qylE36+kq9Mj9+t1i5t
	 iXYwT+IPUedhgEiGswa020j9uY9XzJpM9q5oQw0JQ08XUZP9riyNeNs8k6V0/ni2Aj
	 s9tvENMLAchLw==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b940f962a82so265379566b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 19:58:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6RvmkHMxgZykqKLcr70XKWv2vrkqd0gWSCK0TtGzlPzwyzk1tR1LjrQ+4VLqqt9be29rEwN6I7ZK33E8WNQg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk8O2qGct2gk1KWpVLCiXxKTfgg0sFRXdvGM+1jRxMiyEXqBLP
	wCmAiT7HoYa0kONxKPEbmdwW4AaFynnF6igXhz6jjFXrwICqbg9Lcgw3vXD6Gi/EyjKAfgtoYQd
	nHH0oxUNEOivSyu0WWL/fjE0CgqVIE1A=
X-Received: by 2002:a17:906:f8cd:b0:b8f:87a9:27b5 with SMTP id
 a640c23a62f3a-b976515b976mr77959466b.41.1773370719442; Thu, 12 Mar 2026
 19:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312040627.55257-1-liwang@redhat.com> <CAKEwX=MqyGQSMuVCSWmhKfHju5uHBe3ySQEgK9XuKwCvpL4x8w@mail.gmail.com>
 <CAO9r8zPmV8v0tiQvn2xFqX8F2oU23mfbVK67nxMO3QKt49kJeg@mail.gmail.com> <abNtUReAUHT6j9Rn@redhat.com>
In-Reply-To: <abNtUReAUHT6j9Rn@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 12 Mar 2026 19:58:28 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMh=tAV6UJcH3hhZWrZJO_emVe4raiq4wiBEgC-GAD2=Q@mail.gmail.com>
X-Gm-Features: AaiRm52el4UNPSjT5Jsb7Qove8ZY9-j0c5T-w67OOyJVuzPzLKcC_Enx9cGG_FY
Message-ID: <CAO9r8zMh=tAV6UJcH3hhZWrZJO_emVe4raiq4wiBEgC-GAD2=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
To: Li Wang <liwang@redhat.com>
Cc: Nhat Pham <nphamcs@gmail.com>, mkoutny@suse.com, yosryahmed@google.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"

> Yes, this looks more tidy than open it. I'll go this helper in v3.
>
> >
> > static void check_zswap_enabled(void)
> > {
> >        char value;
>
> read_text() requires string but not char.

I was just illustrating. This should be passed in as &value. That should work?

>
> >
> >        if (access("/sys/module/zswap", F_OK))
> >                ksft_exit_skip("zswap isn't configured\n");
> >
> >        if (read_text("/sys/module/zswap/parameters/enabled", value,
> > sizeof(value)) <= 0)
> >                ksft_exit_fail_msg("Failed to read
> > /sys/module/zswap/parameters/enabled\n");
> >
> >        if (value == 'N')
> >                ksft_exit_skip("zswap is disabled (hint: echo 1 >
> > /sys/module/zswap/parameters/enabled)\n");
> > }
> >
>
> --
> Regards,
> Li Wang
>
