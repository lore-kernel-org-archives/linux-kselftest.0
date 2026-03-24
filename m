Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCE415B0EC
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311208; cv=none; b=Ndyn6XfBlFSUXzCB3QB2eU3LcKFwuO9Py2RgnDMqEw94bjzX+htwVwDZhMmQopch19ISnwW72wkOEjANznWVnblZDh8FcM2fnFhtDM1roNHc/dfyCwn2c4VTp5+eKk09i80NBgS+qPfEbv4vY6abQ/rnB+ggGR3Rlj6zTBlp72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311208; c=relaxed/simple;
	bh=K6vWPNhQfmc7Mv4vXHrObzmoR4P9iWMg9c5bCa4Hpis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4ZknGKy6Pbd3YLuYe+2ZCypYuCNT+D0fL3YfEI/T+kuGNeIBLQEYLH/hELHMIHVNynLaAmuRE9+DzBirIN7QWvCf0UjPLb9t+V+nheWfdv3uzmfkLsVVEeHStWsZugsKk8oJn+dhYL1xVPyfGfNHHlezXhSkwDsf6KQ1eiaB1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5WeZhN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5WeZhN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1DCC4AF0E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311207;
	bh=K6vWPNhQfmc7Mv4vXHrObzmoR4P9iWMg9c5bCa4Hpis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U5WeZhN82O5IaGPhmvAaAKFOIrPgm7g4HTEZI6df+K8344IaSD8bBDh3XC9wgcoBW
	 JxgMtKB2WKJ6xujQXooqOGl7xHtVPbeKP9QjdDUSFj051Gr5OqxA99O9H3lI2tXUWp
	 QM5sF0ZNhAYq4R/dM1B8h2Ub9ixreDMVvNWD/7lf/Wuak12czwEP4+z1yXAw7J7GrA
	 v3UZT0SzmCrxTtYbG3roTyPMqW+XT+GJgth7DrjXWrzPUkljhE6FOFbGzcpp73a81q
	 VvH7oERXT+ZoVGA9JGyqdsyeUHpd8EhRC4mcXZ4TDF6k2chDr0sNGImbKfk5H80VZA
	 6ZDukShfneRcQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b97e6e48b24so149725466b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:13:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUFhld3Oflip+i2OAJUr5DgEghG668i1HSQ812E+UwW3zdoE0ztu+EPvdYCxhvAi9IbZCADXkhMGViindNzRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZdXrtmkqZJ5nJuUWAfxbNzd5vsdub8TjfyQPxCpbBujWK6QEJ
	7YiJLpaItSLdZt0Bi0wPoq2QV5sFh/ThRmDy3plF9wF0jX80xHfVfhEEcxb6VchVzjwxQ/AdqpO
	8GInhXH8rNd4QdgBUcb/xE93Iq+kqk+c=
X-Received: by 2002:a17:906:6a25:b0:b98:528b:8461 with SMTP id
 a640c23a62f3a-b98528b96f9mr684031466b.52.1774311206601; Mon, 23 Mar 2026
 17:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322061038.156146-1-liwang@redhat.com> <20260322061038.156146-2-liwang@redhat.com>
In-Reply-To: <20260322061038.156146-2-liwang@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 23 Mar 2026 17:13:14 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOwPnP9_AMX7Z_w4jLMYP=Ujs3BxNLWVXHOEAKVGFGfmQ@mail.gmail.com>
X-Gm-Features: AaiRm51sDTJLIXwe6wg38ozJyHVTmTYj7Kk418jSg7POV9iqwyQKa2-Q0lx47O8
Message-ID: <CAO9r8zOwPnP9_AMX7Z_w4jLMYP=Ujs3BxNLWVXHOEAKVGFGfmQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
To: Li Wang <liwang@redhat.com>
Cc: akpm@linux-foundation.org, yosryahmed@google.com, nphamcs@gmail.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, mkoutny@suse.com, 
	muchun.song@linux.dev, tj@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, longman@redhat.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

> diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
> index 64ebc3f3f203..e69d845d3592 100644
> --- a/tools/testing/selftests/cgroup/test_zswap.c
> +++ b/tools/testing/selftests/cgroup/test_zswap.c
> @@ -589,9 +589,21 @@ struct zswap_test {
>  };
>  #undef T
>
> -static bool zswap_configured(void)
> +static void check_zswap_enabled(void)
>  {
> -       return access("/sys/module/zswap", F_OK) == 0;
> +       char value[2];
> +
> +       if (access("/sys/module/zswap", F_OK))
> +               ksft_exit_skip("zswap isn't configured\n");
> +
> +       if (read_text("/sys/module/zswap/parameters/enabled", value,
> +                                               sizeof(value)) <= 0)
> +               ksft_exit_fail_msg("Failed to read "
> +                               "/sys/module/zswap/parameters/enabled\n");
> +
> +       if (value[0] == 'N')
> +               ksft_exit_skip("zswap is disabled (hint: echo 1 > "
> +                               "/sys/module/zswap/parameters/enabled)\n");
>  }

In the next version please put "/sys/module/zswap" and
"/sys/module/zswap/parameters/enabled" in macros to avoid all the line
breaks here.
