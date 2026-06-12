Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA7C34252C
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251248; cv=pass; b=RY1p6o2wQoj9b8GvEYescwSAcNXZSycn1mZQCZUkhRAk6TvZbATNEo/6eVbfmqEu1UrsnKbZZa7nhnodFFXGdlg+tKLLzgrL46jpnxA/k85WIAoM+AgQZ8pFZYwOPBNcWBhrFafw+t05P51YNQblZKCBF4fXxtdI2iVsCrRWWqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251248; c=relaxed/simple;
	bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2GUtDY3EmZivP8OJg2Wvzjq6T6Z9DJRG3npnCazSr+eCAmW7AaJeD3NOe0Fk2NhUCNp4ZXOdXLPan0Ii7jCdc50qG2tlhm/qKKnyQJZIvWZNXOdlRcdewrOzj2boJOpfhYZOewujkKNNgFqDwB5RCG1oh6FgrX+ACEnPWgvHVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/KaT+yK; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/KaT+yK"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7e8833c99fcso7211787b3.3
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 01:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781251246; cv=none;
        d=google.com; s=arc-20240605;
        b=UQyajh6nazwPSC6mIALE1qYAN0jwop81V58qGc68e5lK4HcvsEBf2Y6fBH4LD4IOPL
         ijQxETmyy75diAK2/dYC6ur9UFO7EKBy4PvTuYbIjw0bahDGbX8WI+heSVdhxdOhlIqW
         fWUEM6/KG8MC1o3Oh3XGT/0B7AX+zRD3N9L35ZrXQ7ajagXnd455/o0Hcxnlew9iZW0g
         96DaNodhv6EaohxOnUR7vrvq37fPh3gsapT40CLW5iSKBtp1njG/gC6M3bSmPTLl1p6k
         L7OKnOn+eLGRAMZ6trQ2LFpbzT/0Cz21B68MsP3oEgTqE/HpxykJ50Qm38LKcB9V7XEe
         eO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        fh=8JGDM4ZW3VDQCFr2BugbJATOlsNEb7IElSbplTaA7SU=;
        b=lL/dzJTCNtcw0VQM7YxO8OIggq1OnaMDIe69WrbudpaZ9CiSJrTdUY7H7Lopk9KdBH
         CX5AJuMBkcC4AYDJd5nQpSuTG7HXv4kT6cAHk9i4/CqbrOajAhsRAhKKSG4uePkXcBY/
         KP1eZ25T7PyujW4jGtpYCmzfBCL6d5sJo2B0LRmI0GBTf21BKbDjKT3UOjMHZhppg4tZ
         OuELVQ7indyyj55WFSVVcSdZqhaK2efa8bvHsfBitokBx4S3FAbG/P09YCOx7QtOdDnS
         cbarNOHxFYy6ZUJ36Nin03EYvjF8B0DkxHqzPYK2s4MMl3w/QJOLMHG2Gvq77pDkqY5D
         7RQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781251246; x=1781856046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=v/KaT+yKVuYKxugk9GOkU+ByBS5tAuu8BM52P0ROYU/zA36UgpEdVVgn/Siw7JATqN
         eJF4aDW9cpF4phgd8eNvDOGOd9fp9S8mgtqPR02h49maNhy6DW+9FDBxBrjYkfilUXtp
         173US70nRQrPQjMz5ChJs4F6QYj0e7NO90jIwHXCCGmxmrKjfghm4AUxd6eNSQnUkwhv
         qhzkHeddM8HkbCVyqW5biYj9jbh+zqe62E968ClSB4V9Jym2H+hq4cbAz5RcxrpaBwN0
         YrF2QYkryG1AYMaCgXfsQ29oUL+6fvYeXb34RP+xlfGbfPJUeBhB9XEnPQWC03zgAE84
         CQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251246; x=1781856046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=PImk6J9WtHxpIwvW1xUIJ/LPImQiC/XHmSo948MHdj9nctg+syYMlQyR8JCa3opzne
         zN9n47ZdogaYdE7dRwLC4wsxyVkFDy5aDFln8aTpBFSETZi8pgCJ7KLQ3Owej6iLySp1
         AxODnjsZlGiswtVDzTXIPE1IoXuM3TtjTsyorIuujLZNxvt0JVdtCWlyVhdWevibGWWF
         j6VJWFkpGbfyYIQsHztPm5ui3h8JzXk5Z3jLOrRwcxXX8isVds4VTMQBtSnlIWq2IRY9
         Kmbv+vq+4rvoe3FzA5c8o6WKTEkGB2F4Rpbo/5ou96Bkjl9Dum0h4VDNKwUsgyvMSGy8
         ghtA==
X-Forwarded-Encrypted: i=1; AFNElJ/1eCYbe8VUzzI07oHk9n3VIOUKa/c2elzxtTRl9RqSqcHG+TMvBK1hFjeMvtJJMyoJSuD11invmqO+1raKKwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7RYqZ0WE4z6bygAhGcOLGZNaWVDMCRoxI70o8ngNG9zaWFrYq
	Niqp5W9r/oqWIgKJvi639zYpU/Dkd/Ya3KzKccW30FHm1GCmBehztQ8buEzrUayEDnr4RLFed3m
	v2Gt1FqYeT6FY3TjMV1yPEJwibBcbYY2zbZmFtwyN
X-Gm-Gg: Acq92OF5AI9O2RmvYsj6RQWjNmZOlIqt1fqbtVAvxJpEptdOdXr5WzbhXqa6aRL7LhD
	QPPYCfBkE75qWRyf+OD7O5jzES1gZ4gjOubuHctuwDTn0n17e/5YX+eyqRwYdQoDOQf9Dom1mWZ
	IHoyWpDZ27znC4ed2X0Vwh1aTWu2eaKEMI4ixM+JzAx53nUSlFnuWYlOxLo7CoIMlEa23Lk2xLf
	rOeQr/pgK6rcjCYkfOoGLzYcK6mW+M6JT6E7TeHd54GhsqqIfeBTqNDUYYDptYpESXgrlqmkL87
	Ia1WTdG0rsiY+B+U/q58IZ0AX1FMjzTJxocosw==
X-Received: by 2002:a05:690c:6201:b0:7db:f8b1:cd80 with SMTP id
 00721157ae682-7f7bac02970mr15863297b3.2.1781251245971; Fri, 12 Jun 2026
 01:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech> <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
 <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
In-Reply-To: <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 10:00:07 +0200
X-Gm-Features: AVVi8CdEFjoun-R64CqbvYJPTnaS_E7TDNryUpyw-2UHJoZxcDfdiOQP2RCPBTE
Message-ID: <CAG_fn=XB7_zbjGzpgwEzm5dqcwehqvB+=SpJhHvw9QdETberAg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 9:25=E2=80=AFAM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Hi Alexander,
>
> > On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.=
tech> wrote:
> >>
> >> [snip...]
> >> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> >> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202=
60603-v2-0-fee0939de2c4%40est.tech
> >> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> >
> > Can we please avoid this?
> > kcov_dataflow.c is being introduced in the same series, there is no
> > need to send a buggy commit and a follow-up fix - just squash the two
> > together and note the changes after Signed-off-by: separated by a
> > triple dash.
>
> Thank you for your guide. I'll remove it in the next patch set.
Also please make sure to update the patch version. It's really hard to
distinguish between "[RFC PATCH v2 n/6]" and "[RFC PATCH v2 m/14]"
when both series pop up in the inbox.
