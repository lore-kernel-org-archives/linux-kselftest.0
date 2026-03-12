Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4FF38A298
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 21:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349784; cv=none; b=jYfOjOo1440xzLQctt12RSKLqBnQnUKR7R/Rgs3xptcXkt2dLWhgKBz9OlY1G2staMiWzyN8yy9wQruZyeqGZ/TaZfHQREDlcfg5AzL0CMZ04RrRhbv/RSTDvlmA0g7oAm1UOCM9vtUZj7LGkVXFVb6LBo1KHWIRXO3RCZNtYNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349784; c=relaxed/simple;
	bh=Nan4354/w2AKj06fXE4TsNtEJsUA5rTTezTgjUEvs+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVm+WynNbRHmAyKK8j+IzbgF7+TRi/gLqBjKSWshv/pPzAes2/W5RDFq1fCCcjZGFQoij+xsF/dsNvPpQxSTo1Mk0HG23PUu4pQtXgfow21HOUUgj52dx2RU5Jk1dfNhd0v4d9BPnxSyoNWQLsg763OcDYsSRRJmx3jg9/uHUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePwUi5U/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePwUi5U/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62109C4CEF7
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 21:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773349783;
	bh=Nan4354/w2AKj06fXE4TsNtEJsUA5rTTezTgjUEvs+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ePwUi5U/kAn16q7Gt/5NMasYNAQczY7ZMZflPM8b4atI4UJDIvGL7kGI4r3yIsAGT
	 51AJe1ZV12dtSvQf57t7pqpuFlh/FTiMqk7K6Bigg7MgH+ApromBpSXrBzsDuQvnOR
	 9p86l6n6twCIdtlOU4O5HRn5amVUqQqDIfO9Zy8c/rzbY1+VCZ47z/Y3jyR+YhU85P
	 9gb0Iu+a9Op37FKsTUzg9eR91wJR9G/L9XOYiBuwgGSgX89iTp9MXp+/CAil439D9i
	 6ZcO+CQbtirV8WgIq5nhSiTO7BN39oKMj+/tQN9V3S31AFL5tC9BzrTyUUUlIJBcUU
	 U4TniQpnnSa/w==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6630858b4ceso2151740a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 14:09:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWy8Wzi9SPBPqsUWzjNOSEqKt4LYKgkiZ5oY816IR8Xez+Wbg0w70lK5Jztc+DttFK9PeW+cZgsOSeMC4/8dHc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/oFocETTvQLEVvQVURLAN64WLDhie+dJNq2hVBzJnM65e3/2w
	VkOuJt07/DeY+ca72G9YHkt8sWv9B9ihG2dL6Tm5QcqIOhvKbGg7HMoXiCGEy2dsLrJB0ReUGzT
	SAhYIlBp400Zp55+362J+zXbNYVZR8CA=
X-Received: by 2002:a17:906:817:b0:b90:3593:654c with SMTP id
 a640c23a62f3a-b9765028beamr40772866b.21.1773349782192; Thu, 12 Mar 2026
 14:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312040627.55257-1-liwang@redhat.com> <CAKEwX=MqyGQSMuVCSWmhKfHju5uHBe3ySQEgK9XuKwCvpL4x8w@mail.gmail.com>
In-Reply-To: <CAKEwX=MqyGQSMuVCSWmhKfHju5uHBe3ySQEgK9XuKwCvpL4x8w@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 12 Mar 2026 14:09:30 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPmV8v0tiQvn2xFqX8F2oU23mfbVK67nxMO3QKt49kJeg@mail.gmail.com>
X-Gm-Features: AaiRm506sQlNtTd5yCay-yVuxaOgovvr4LCr2fiyeyxDv_MRp7ui-D0aS7YoY0o
Message-ID: <CAO9r8zPmV8v0tiQvn2xFqX8F2oU23mfbVK67nxMO3QKt49kJeg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
To: Nhat Pham <nphamcs@gmail.com>
Cc: Li Wang <liwang@redhat.com>, mkoutny@suse.com, yosryahmed@google.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"

> > diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
> > index 64ebc3f3f203..ec64daaa2f5a 100644
> > --- a/tools/testing/selftests/cgroup/test_zswap.c
> > +++ b/tools/testing/selftests/cgroup/test_zswap.c
> > @@ -589,23 +589,41 @@ struct zswap_test {
> >  };
> >  #undef T
> >
> > -static bool zswap_configured(void)
> > +static int zswap_enabled(void)
> >  {
> > -       return access("/sys/module/zswap", F_OK) == 0;
> > +       char buf[16];
> > +       ssize_t n;
> > +
> > +       if (access("/sys/module/zswap", F_OK))
> > +               ksft_exit_skip("zswap isn't configured\n");
> > +
> > +       n = read_text("/sys/module/zswap/parameters/enabled", buf, sizeof(buf));
> > +       if (n <= 0)
> > +               return -1;
> > +
> > +       if (buf[0] == 'Y')
> > +               return 1;
> > +       else if (buf[0] == 'N')
> > +               return 0;
> > +
> > +       return -1;
> >  }
> >
> >  int main(int argc, char **argv)
> >  {
> >         char root[PATH_MAX];
> > -       int i;
> > +       int i, state;
> >
> >         ksft_print_header();
> >         ksft_set_plan(ARRAY_SIZE(tests));
> >         if (cg_find_unified_root(root, sizeof(root), NULL))
> >                 ksft_exit_skip("cgroup v2 isn't mounted\n");
> >
> > -       if (!zswap_configured())
> > -               ksft_exit_skip("zswap isn't configured\n");
> > +       state = zswap_enabled();
> > +       if (state == 0)
> > +               ksft_exit_skip("zswap is disabled (hint: echo 1 > /sys/module/zswap/parameters/enabled)\n");
> > +       else if (state < 0)
> > +               ksft_exit_fail_msg("Failed to read zswap state\n");
> >
> >         /*
> >          * Check that memory controller is available:
> > --
> > 2.53.0
> >
>
> Seems a bit convoluted. You ksft_exit_skip() for one case in
> zswap_enabled(), but return some value in other cases. This value is
> checked in the caller (main()) and then used to decide whether to skip
> or fail as well?
>
> Why don't you just consolidate them in one place. If zswap_enabled()
> has no other callers, let's just open code it, yeah?

Hmm I actually like having the helper. What if we move all the
ksft_exit_skip() and ksft_exit_fail_msg() calls inside and rename it
to check_zswap_enabled()? We can also just read one character:

static void check_zswap_enabled(void)
{
       char value;

       if (access("/sys/module/zswap", F_OK))
               ksft_exit_skip("zswap isn't configured\n");

       if (read_text("/sys/module/zswap/parameters/enabled", value,
sizeof(value)) <= 0)
               ksft_exit_fail_msg("Failed to read
/sys/module/zswap/parameters/enabled\n");

       if (value == 'N')
               ksft_exit_skip("zswap is disabled (hint: echo 1 >
/sys/module/zswap/parameters/enabled)\n");
}
