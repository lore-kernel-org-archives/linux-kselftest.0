Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA25733B970;
	Wed,  9 Sep 2026 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973434; cv=none; b=jiczd6OeDfc70RwidloXAfsiqAFAB0Ba5HlljBKCxjTU+lpkXJ8YZv1cCBVjN8gwGD1W4SIajeWzz2UHUvxHeZX3dz0gIwoT2+YxMxRE60IcnSKYSnZfvZGHmExvVq6RivszpPpwSX5ku/U0KZ2IZp9XXGbcR8ZhOutsJh29XDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973434; c=relaxed/simple;
	bh=tGSpatkddG8W1AUF/UXQ9AOr/SMPFFlWkQfvLd1+6Tw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u9cJvx5mpWjXMI0/rHt/Z9iaNj4FeWcsP7c5tplp1oq8FD1tEzrhiKtndxixqzFp/l2d1lLjqzB+ByqGpXPTFqDTp1x6U8MxW2GxJSJd4QWNSETskL2cEqL3b7fIphqPVUaej2gthhWWx+uvjeeUzsB2Xa07mx9wVRX71hsaDGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1ZucjDK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1ZucjDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26F21F000FF;
	Wed,  9 Sep 2026 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788973432;
	bh=m39JX+Mvno5Gx5kmyUKqAxehnmdCMrqeb/cgNNO/UnA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P1ZucjDKNyguVg89nUxgm32Kpny5dpthO5U6s7SgDLvv3mKEuQ4wrDh2qHY1wobkA
	 C7/ccJ9htNBjr7yyVGRNxrYnfZ49M24+Du8OOHw7/B0lDG7XY0i9tqrJqP19RLSIEf
	 A6NSrJNjXBYokwE/xh4+DPADdNil01Q22+WJcr8OPM6iXzDBOFUm2kNFhFfXBqUCpZ
	 iWfN1EsECaI1pJUb38+aFsBq8pYygSxEvWhI081o6aaVmrMTmztmlKzKhuC6GNn4SY
	 MBKx5ywKQrCLeA9CUxZk4GEut1adWsgGaaYu5XdI+eIFWT7V/6RX1WjdpJaKcIianK
	 K1kQax55LOROw==
Subject: Re: [PATCH net-next] selftests: net: Skip so_incoming_cpu on
 single-CPU systems
From: netdev-bot+sashiko@kernel.org
To: kuba.pawlak@canonical.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 kuniyu@amazon.com, 223556219+Copilot@users.noreply.github.com
Date: Wed, 09 Sep 2026 17:03:51 +0000
Message-ID: <178897343132.219967.15956418454562518941@kernel.org>
In-Reply-To: <20260904140334.562593-1-kuba.pawlak@canonical.com>
References: <20260904140334.562593-1-kuba.pawlak@canonical.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 2

- [Medium] The new skip gate in FIXTURE_SETUP(so_incoming_cpu)
  (tools/testing/selftests/net/so_incoming_cpu.c:84-86) tests only the…
- [Low] Missing `Fixes:` tag on a user-visible selftest bug fix.
- [Low] The commit message uses the non-standard trailer `Co-authored-by:
  Copilot <223556219+Copilot@users.noreply.github.com>` with no…

--

selftests: net: Skip so_incoming_cpu on single-CPU systems

The change replaces the ASSERT_LE(2, nr_server) prerequisite in
FIXTURE_SETUP(so_incoming_cpu) with a SKIP, and moves the check ahead of
setup_netns() so a skipped run does not create a network namespace.

Link: https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/2023546

A couple of questions about the commit trailers first, then one about the
new prerequisite check.

> Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
> Signed-off-by: Kuba Pawlak <kuba.pawlak@canonical.com>

[Severity: Low]
Should this trailer be Co-developed-by: instead?
Documentation/process/submitting-patches.rst documents Co-developed-by:
for shared authorship and states:

    Since Co-developed-by: denotes authorship, every Co-developed-by:
    must be immediately followed by a Signed-off-by: of the associated
    co-author.

Co-authored-by: is not recognised by the kernel tooling, and there is no
Signed-off-by: for the named co-author here. Since a bot account cannot
provide a DCO sign-off, would it be better to mention the AI assistance in
the changelog text rather than as an authorship trailer?

[Severity: Low]
Would a Fixes: tag be appropriate here? The assertion being converted came
in with commit 6df96146b2025e ("selftest: Add test for SO_INCOMING_CPU.")
as:

    ASSERT_LE(2, self->nproc);

and commit 97de5a15edf2d2 later moved it into its current form:

    ASSERT_LE(2, nr_server);

Without a Fixes: trailer, backport tooling will not associate this fix with
either commit, so single-vCPU runs on maintained trees keep reporting the
failures described in the Launchpad bug.

> diff --git a/tools/testing/selftests/net/so_incoming_cpu.c b/tools/testing/selftests/net/so_incoming_cpu.c
> index 4740701f1a9ac..1b73442386aef 100644
> --- a/tools/testing/selftests/net/so_incoming_cpu.c
> +++ b/tools/testing/selftests/net/so_incoming_cpu.c
> @@ -81,10 +81,11 @@ static int nr_client_per_server, nr_server, nr_client;
>  
>  FIXTURE_SETUP(so_incoming_cpu)
>  {
> -	setup_netns(_metadata);
> -
>  	nr_server = get_nprocs();
> -	ASSERT_LE(2, nr_server);
> +	if (nr_server < 2)
> +		SKIP(return, "requires at least two CPUs");

[Severity: Medium]
Is the count of online CPUs the right prerequisite to test here? The code
that consumes nr_server needs the CPU ids 0..nr_server-1 to be individually
usable by the task, not just a count of two or more.

create_clients() pins itself to each id in turn:

    for (i = 0; i < nr_server; i++) {
            CPU_ZERO(&cpu_set);
            CPU_SET(i, &cpu_set);
            ...
            ret = sched_setaffinity(0, sizeof(cpu_set), &cpu_set);
            ASSERT_EQ(ret, 0);

and create_servers() assigns SO_INCOMING_CPU over the same dense range:

    for (i = 0; i < nr_server; i++) {
            self->servers[i] = create_server(_metadata, self, variant, i);

So can the test still report FAIL rather than SKIP when get_nprocs()
returns two or more but some id below nr_server is not runnable?

Two cases come to mind:

- CPUs 0 and 3 online, 1 and 2 offline: get_nprocs() returns 2, the gate is
  not taken, and for i = 1 the mask contains only offline CPU 1, so
  sched_setaffinity() returns EINVAL and ASSERT_EQ(ret, 0) fails.

- A container or CI job started with taskset -c 2,3: for i = 0 the mask
  contains no permitted CPU, sched_setaffinity() returns EINVAL, and the
  test fails again.

Would deriving the prerequisite from sched_getaffinity()/CPU_COUNT(), and
iterating over the ids actually set in that mask, cover the same class of
unsupported environment the commit message describes?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260904140334.562593-1-kuba.pawlak%40canonical.com
