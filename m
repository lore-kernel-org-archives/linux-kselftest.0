Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22471395AFD
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745719; cv=pass; b=IybIQlOjnv7XRKLmfngDKtNTl7o5WUdJswkOSpNSmXmMlf1eUJRzu/qfUjcQBpfKiPKi4QIzjMCrvg+O6EuQuCkZKAfT//kkh+DjHGsNYDZZ1PFK5BtjAaAXQzFaIWYgZiYMVJSpqbR4E0AzWp3coe1hlcLhOiOycXYsBobrxKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745719; c=relaxed/simple;
	bh=81kN/c0whuLRH0kfnXp/GgeU5xeC5H9AC8PyLrKwRWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXy6qg/qcrqdnnXkQxhxofLPJO2uLz9aWwGXpYEsv57dn0mbF9K8vB/R1JEBYtLkJ60wC3Idsztd2PMlyd+5LXtfs0eTzvwtXj5SfQpwVs20Lwn7sq4URIGkdL6jMfY+qvOrzTDehL9fR9+lOUW3683TMbYwYWqAr4CkgpTtbLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fKFUEsSe; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fKFUEsSe"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-134ac81c445so2387873c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 01:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778745717; cv=none;
        d=google.com; s=arc-20240605;
        b=gjdWqN7xhP/Hn7NE7nIJenUAudSlkXWJdxcPZ0LA/i7u44WnpJvGMnJh4BnFVnDadV
         zJKBkB1X0O9gl+qd2QjEwGlvUXz04sYnkG9FewGt4XL2qhMnAFOkdyrlLbvxpSUdPBwN
         l7TFgh3Z6gFXsPR3jyy8FZFGyJtFMh9ngmcV9MeN0vCsXAiBU0KZIY+76h5is7s50om1
         tijDu9TJFJHkdibAjjtE6Rxwyyup5AiH2XwBVprwy2Sw6nCQ3l+DDbUFQpUW3ksMHixU
         BgFvUqY9cq5+4QmJrod8suaFzhRe8pwEdcoOrTk4OcxcwtkSlsJYRIJiiOFPHNkfjVBK
         009w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R3rMcHi+SRGerVbM0q8doN39gwMZLkcDzykkfyfOtI8=;
        fh=K6+UHG0xBRwO5Q8DM3O8eIDvKqGBeANyscoEEYjwPGU=;
        b=SXhe0F2V5q7LjswA6AEWOaAsnc8CELlyDlCk6qYGGoYgT7Rpogo0BIlIx3PI06iPoG
         mbTfId4TX82NgdS30w/LrZmfZwAkYGt07fQ0cGGRv/NhHA3miO1cZVz8srG1hL9iuIBE
         95+LbnrE/NbM16TxTTDhrbCIjHJTkl+svKwcTDOmJf9g5jDVg5+N9ugJU3VoUK2vNAfP
         3ahoak9c8tZqBj4bMEFTCz+N1FC2QQN4zRpnaNXoxPF8OWLW2OKAvDW2TZZgjm4x3uGr
         njmWRvPhaH5TEFUYHze4vVEYlgsZfY6HmIyvyJwPaV0G2x81/NUCx82W5bu4EnIPRsJB
         gLiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778745717; x=1779350517; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R3rMcHi+SRGerVbM0q8doN39gwMZLkcDzykkfyfOtI8=;
        b=fKFUEsSeSYMSDVkCMtt5pEXXkHrte4cGizJMM1N82Q2Vegxnc3Syj9YvD0XPKZKtjt
         EpbOMOEwV3HZ/2myULhHtcOLZoC2z1TF4x+LE1zOwyDOmA2vFfwzyRlSQgplymgW8eXR
         Y5CaM/nja9ImztJ4unodiGVZGogD1hTm+1Cd6lQ0s8OfYNQX0CjHbyEDcpQqtOtylZaQ
         PFEeOBl8GeCRWBPJ9wAE9e7q5y5l8o48ND8z48mFSZVJbxLn6vnBllt2U0lOVoFPg2On
         5mr+8buy/0TJ/HsnwKCdCBJMR0f4eGOTitUN4bF4YD6EesQBQwI93YZVdLARw/6O2ula
         bhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778745717; x=1779350517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3rMcHi+SRGerVbM0q8doN39gwMZLkcDzykkfyfOtI8=;
        b=Ykp4pUMSRRN5JWZ4+TtpcumcE6dbNPwKzHxIByyrq+/WCAIAZf/4xtjM9b1CviaalK
         O868DN3X58LZMZPNQ/JzhPNkx8o/0WfFKlPQjIOjMPUHXBfBfAfWCibkl3mbFyAUkD1P
         EidDrLm5mQt3nFbYPnjMJLquAYirm76B0xdq41BW+OGcK6+KnbAgKcywPC9ehACKkV4j
         MBAFpzS3X9r1GGIqF6S5RBNwk/ASOMDBmkXi9B+Jd7jnet/qSyLA9zZSw1XXQefw3ihV
         nd4fMOnjsoDeHFC0SoLfHe/S+nkCAsryVw/5k11bjEKbYSGGbcjEyInMC+4sRCVSGYcS
         8KVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+11Mm+nf6PoFCN6aDA5uWu85lCiuCyU3tH0igsyQM2EXiZx3hKOEg2EycZIuUhQbw3l4X6Wn/ivaLtPIFRuzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YypF3IBrDTYmC1zbXN6DfKUbiDs9MbtsF0kvM48F3ZsPhlG8cG6
	RdE1xFLyo2Mu+MdkWzQ6itFXwTP0F/ZbdZ55Bh4JDqmXVOIbzSGQg7f6NKsyIkpT3ieD4ayymrA
	sKS1IbwukBYyHYU0jNbjv5kNyiyOulQLP4H2r2aw/
X-Gm-Gg: Acq92OFXVYyiW1qzywYO2EJ8q2E3LoyBMM5K0oSoijHtOfH2lvWDD8C+pf3+PYNITaK
	IXAYC+p94EgM7eD9mV1pFujzyS54Pcw14TtXkBDJ9YgFnw+56gAm5g++rAnZKr/FP+9rBo77e11
	iAjQCame6DcfuyX18412/YCcVH4ZGHd9CtO98PWKadYY0hZ4GkTk5C/xHszWw23gxJ1pVp9dY9t
	KSQ8iMlbu90g9EfHgXiukwvNvKvp2OxGBorfqvWDlHlFkJC6sOyNM205ipGl2+XmMnOA+t6Gxlx
	+XOxhVcXJdpNr87fLRs6eb7c+pAQqrFzzkdp6mt36auOw6IYqA==
X-Received: by 2002:a05:7022:b89:b0:12c:5e48:4c01 with SMTP id
 a92af1059eb24-1342ee3e06cmr4229857c88.1.1778745716497; Thu, 14 May 2026
 01:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514050455.2954509-1-justin.he@arm.com> <20260514050455.2954509-7-justin.he@arm.com>
In-Reply-To: <20260514050455.2954509-7-justin.he@arm.com>
From: Marco Elver <elver@google.com>
Date: Thu, 14 May 2026 10:01:19 +0200
X-Gm-Features: AVHnY4LXtb13xHae_HjNLF3uu8TPNuAYGsyBqY2dhhK2QMuCmkBsOtE8ngXwGcI
Message-ID: <CANpmjNNAb0apuxu4+tdihHr6PDmdYK5L7Fhg_3SxrVG3UV3_3A@mail.gmail.com>
Subject: Re: [PATCH 6/7] hw_breakpoint_test: fix test_many_cpus failure on
 large systems
To: Jia He <justin.he@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Kees Cook <kees@kernel.org>, David Disseldorp <ddiss@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2026 at 07:08, Jia He <justin.he@arm.com> wrote:
>
> On systems with many CPUs (e.g. 128 cores x 4 HW breakpoint slots =
> 512 = MAX_TEST_BREAKPOINTS), test_many_cpus() advances idx to
> MAX_TEST_BREAKPOINTS after the last fill_bp_slots(). The subsequent
> register_test_bp() call hits WARN_ON(idx >= MAX_TEST_BREAKPOINTS),
> returns NULL, and the -ENOSPC expectation fails.
>
> Bail out of the loop when idx reaches the limit. Earlier iterations
> already validate the NOSPC path on other CPUs.
>
> To: Peter Zijlstra <peterz@infradead.org>
> To: Ingo Molnar <mingo@redhat.com>
> To: Arnaldo Carvalho de Melo <acme@kernel.org>
> To: Namhyung Kim <namhyung@kernel.org>
> To: Mark Rutland <mark.rutland@arm.com>
> To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> To: Jiri Olsa <jolsa@kernel.org>
> To: Ian Rogers <irogers@google.com>
> To: Adrian Hunter <adrian.hunter@intel.com>
> To: James Clark <james.clark@linaro.org>
> Cc: linux-perf-users@vger.kernel.org
>
> Signed-off-by: Jia He <justin.he@arm.com>

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  kernel/events/hw_breakpoint_test.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/kernel/events/hw_breakpoint_test.c b/kernel/events/hw_breakpoint_test.c
> index 2cfeeecf8de9..943d040d2224 100644
> --- a/kernel/events/hw_breakpoint_test.c
> +++ b/kernel/events/hw_breakpoint_test.c
> @@ -137,6 +137,9 @@ static void test_many_cpus(struct kunit *test)
>         for_each_online_cpu(cpu) {
>                 bool do_continue = fill_bp_slots(test, &idx, cpu, NULL, 0);
>
> +               if (idx >= MAX_TEST_BREAKPOINTS)
> +                       break;
> +
>                 TEST_EXPECT_NOSPC(register_test_bp(cpu, NULL, idx));
>                 if (!do_continue)
>                         break;
> --
> 2.34.1
>
