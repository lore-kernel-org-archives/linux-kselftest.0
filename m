Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83F943B6D3
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448730; cv=none; b=FCdlb4pAntyQAu+9oA1z3Jsnh5p9jyhrRZ5RkanyR4YB3P6XtlhD7ri6cl2YE2Oq9lTvfcWOfqfbVUuBwLwrUYEx0A0oaccEqSRuSuUc/uC/KQ8rCrYtlW+PMTBdaqvaRag3RtZutYVT7TdTAG9Qv1EK+8YXbfibbS+Nh/FCHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448730; c=relaxed/simple;
	bh=WDatReQ1diJxMnQ27gX5bGDxa/1pmcVJt3crJPRj6lE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ut2d4JrMPvZ2UtP0RAqYxmDt3eIWbxKd/6Vk4ssVb9NXult0gv13q8ZgLyX47EAp25TpmU8p4JBVj+LrzbKc7GHZuNjEDvwizxajbFjZq/I54B2R3F7JbpEuePyJsZDZaE2WMIPLrtb5pHoGlXg8jf2+GJP19Tp9RkGXmFggYxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8R9IeOm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8R9IeOm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF37A1F00ACA
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783448729;
	bh=UodfhMWHJOTmOaDJSgPxCuKgMVhusPF/cnVjRAHGFO4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=B8R9IeOmQ/w6CN0kw35IGwlxxnZpEu99nbMX4c/Uz0ZcV4rgegRJI/jZiko7++/tb
	 c7yvthhV1zfsHkolcBeQOX7HTX0sx6KH3vp7Q3YMAFi/s1gGzciFZzeli/XT38Q9XE
	 jIUj0Ye1Vn5XWYnys16iy4Z9wVohuuK2k9yXDeBgmwTe3+cqlvBbVGw5OjeRnTJXaA
	 62BCKeNy8ZiHZVWFCkEqfEs0r5Bljrmi6XyIu93HnVEejHreDAPSoHcaQutzY/dk8r
	 cqIupSIZo4R9LvAy9nA4m6/IzjGrfi2efqDUvgDh8BiMKdxtEm00EAfxT4kT2Xs2Xg
	 r6ZyRyoPdR1gA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so7013495a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 11:25:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+DSc5JyHGk0BNbubyqWSgvSwHo9e5NM+v3OZw+b9o9XyfK+wQV0WUfrKZLSnJrQpLhJA9bXe0R81pt7V7aSs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2M/8G7RsSAuL1GjiW8yqp6CJtplTUJCdu2mQS6z8ZDgWdVxZi
	+B/m5dslgKRaIHrJq/9EUu5HJqNXXMG/B9f9FSW/flCC8+NACsJ9TZEcvqokkL510S325q0YvWT
	wrFb3Jlpvz5OIimX9jNdo1JkeQA1ptA8=
X-Received: by 2002:a17:907:ea8:b0:c15:b27d:51e4 with SMTP id
 a640c23a62f3a-c15b27d5823mr202693266b.20.1783448728654; Tue, 07 Jul 2026
 11:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c0970cee-42c2-4844-b88e-229853f08e90@linux.dev>
In-Reply-To: <c0970cee-42c2-4844-b88e-229853f08e90@linux.dev>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 7 Jul 2026 11:25:16 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNJh65SZzdW8Cc8_8N5Wr+ORuRtU3kuaAX_DhLaESFYTA@mail.gmail.com>
X-Gm-Features: AVVi8CfOmsujy8Bb6nVmdtBpnu4IHHs228GbFDG2jlrs3NnSjCrtP5K0xKzG314
Message-ID: <CAO9r8zNJh65SZzdW8Cc8_8N5Wr+ORuRtU3kuaAX_DhLaESFYTA@mail.gmail.com>
Subject: Re: cgroup/test_zswap failed with "zswpout does not increase after
 test program"
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	tj@kernel.org, mkoutny@suse.com, Shuah Khan <shuah@kernel.org>, mhocko@kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 2:38=E2=80=AFAM Zenghui Yu <zenghui.yu@linux.dev> wr=
ote:
>
> Hi,
>
> Running cgroup/test_zswap on my arm64 box failed immediately with:
>
>   [root@localhost cgroup]# ./test_zswap
>   TAP version 13
>   1..8
>   # zswpout does not increase after test program
>   not ok 1 test_zswap_usage
>   [...]
>
> I'm sure that pages are successfully written into zswap by checking the
> count_memcg_events(.., idx=3DZSWPOUT, ..) trace events. But "zswpout_afte=
r"
> in test_zswap_usage() is 0 and results in this failure.
>
> I guess the problem is that (in this particular case) the memcg stats has
> not been flushed when userspace reads it.
>
>  memcg_stat_format()
>    mem_cgroup_flush_stats()
>      __mem_cgroup_flush_stats(.., force=3Dfalse)
>        needs_flush =3D memcg_vmstats_needs_flush();
>
>  static bool memcg_vmstats_needs_flush(struct memcg_vmstats *vmstats)
>  {
>         return atomic_long_read(&vmstats->stats_updates) >
>                 MEMCG_CHARGE_BATCH * num_online_cpus();
>  }
>
> I can image that memcg_vmstats_needs_flush() will return false because I'=
m
> testing a 16k-page-size kernel on a box with 96 cpus..
>
> As we have a periodic flusher flushed all the stats every 2 seconds, I us=
e
> the following diff to wait the flusher to expose the accurate stats to
> userspace.
>
> diff --git a/tools/testing/selftests/cgroup/lib/cgroup_util.c b/tools/tes=
ting/selftests/cgroup/lib/cgroup_util.c
> index 3ce134509041..9596f294da0b 100644
> --- a/tools/testing/selftests/cgroup/lib/cgroup_util.c
> +++ b/tools/testing/selftests/cgroup/lib/cgroup_util.c
> @@ -95,6 +95,8 @@ int cg_read(const char *cgroup, const char *control, ch=
ar *buf, size_t len)
>
>         snprintf(path, sizeof(path), "%s/%s", cgroup, control);
>
> +       sleep(2);
> +
>         ret =3D read_text(path, buf, len);
>         return ret >=3D 0 ? 0 : ret;
>  }
>
> I have no idea how to "fix" it properly. Please have a look!

We were discussing a way for userspace to explicitly trigger a flush
before, which would come in handy for testing. However, we decided not
to expose flushing as a concept to userspace.

Unfortunately I think the only way to "fix" the test is to allocate
more memory, enough to trigger a flush on most interesting setups.
Perhaps we should scale the amount of memory with the number of CPUs
so that we don't have to keep playing whack-a-mole.
