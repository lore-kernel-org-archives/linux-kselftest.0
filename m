Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A0A2773E4;
	Fri, 31 Jul 2026 01:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785461999; cv=none; b=lCB8te42TRnlvuEMAMNPVEOoKmShLmAYcpi4DfxYhtTK7sE4HT0rThZ1+VkjpqO3ehYS5mAbIaMGruMexeYT5Yyw3PQLTq2L4QXARia4NSiXEDoPLYukNhih/69efsGcZQV9YggAZYIXRWNtDUudyeU/f/f+0zmzDxOrCvbWx1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785461999; c=relaxed/simple;
	bh=l7RJTnbz2nxLBWNM7N77s1JHDjl1SXmWSlb2PenA1DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VaRE6bz0jdh5eF+bUxedfDqTPegTa5t4VImJdZJ7+J4qMPItQR8SOPH4gJZ+ttcIm7SbQe3sg+6JGYbgBS4eI8jN+Yr6yUjEfkFIThAwkHdXoQzHIayvcZV+d2JV9astncXKF2ZQEx3tiTJEeOfCMHQI0TRjlGdCznZd2GjjmJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtI5t5n2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtI5t5n2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F601F00A3E;
	Fri, 31 Jul 2026 01:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785461997;
	bh=sC1/xEc/Q+j8n3WeiNwZt1sUnZE8LRPdhRlVtmhW3hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MtI5t5n2DXPMfr8DTxpbPu0rBtWXT/C+ZEvcN9WltowN7ORs5ixfmP7QfDRXtkZHB
	 nlYEPXM3bpcvX1Yh6tjuBDnKnyxsKEIolQaXddDzefwsBAtxhm0FzC1FTdr9A95Fl3
	 h6RFSBqdhMDLbIlChzoSqO+XdK0qq8cEFRdpCGNXjIrklKeX6s4/shl9yzFy4z+8bu
	 OtpuylJBYNPiVJYjurL1nET++RCKXkl54N8CWmwQMWlOYPZYvvkVKHPNNWcutALj3v
	 kO8olZx1CFcoT1PclPhdRO4s/puQOH4MF6hoATvddAt0MUeHkoYN+akz70C4L2LzAy
	 Wkuc0R2jg36aQ==
From: Jakub Kicinski <kuba@kernel.org>
To: marcelomspessoto@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	marcelospe@proton.me
Subject: Re: [PATCH 4/4] selftests: net: adopt harness for flow label mgr
Date: Thu, 30 Jul 2026 18:39:56 -0700
Message-ID: <20260731013956.752437-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727043516.93101-5-marcelospe@proton.me>
References: <20260727043516.93101-5-marcelospe@proton.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
--- Patch [4]: [PATCH 4/4] selftests: net: adopt harness for flow label mgr ---
commit 645c864c25dbeeb65888e7e3525b6298beb1ae4c
Author: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>

selftests: net: adopt harness for flow label mgr

This converts tools/testing/selftests/net/ipv6_flowlabel_mgr.c from the
hand-rolled explain()/expect_pass()/expect_fail() helpers to
kselftest_harness.h, splitting run_tests() into individual TEST() cases.
It also removes parse_opts() and the cfg_long_running/cfg_verbose options.

A few questions about the conversion below.

> Author: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
> Signed-off-by: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>

[Severity: Low]
The From: address (marcelomspessoto@gmail.com) and the Signed-off-by:
address (marcelospe@proton.me) differ, so the sign-off chain cannot be
matched to the author by tooling.

checkpatch.pl reports this as "From:/Signed-off-by: email address
mismatch". Could either the sign-off address be changed to match the
author address, or an explicit From: line be added at the top of the
patch body?

> Another change made to the structure of ipv6_flowlabel_mgr test file
> was the removal of parse_opts. The supported opts were already not
> used on TEST_GEN_PROGS and are not impactful for development. Opt (-l)
> skips long tests that are not time consuming at all, while the TH_LOG
> and code comments can cover the information obtainable from (-v).

[Severity: Medium]
Is this description accurate on two points?

First, the binary is listed in TEST_GEN_FILES in
tools/testing/selftests/net/Makefile, not TEST_GEN_PROGS; it is driven by
the TEST_PROGS script ipv6_flowlabel.sh, whose only invocation is:

	./in_netns.sh ./ipv6_flowlabel_mgr

Second, the -l tests are described as "not time consuming at all", but
FL_MIN_LINGER is 6 in this file, so each sleep(FL_MIN_LINGER * 2 + 1) is
13 seconds. Dropping cfg_long_running turns both previously gated blocks
into unconditional tests, adding roughly 26 seconds of wall time to every
run of ipv6_flowlabel.sh.

Since no in-tree invocation ever passed -l, these assertions have also
never been exercised by an automated run before. Should the changelog say
that the long-running checks are now always enabled, rather than
describing them as inexpensive?

> diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> index da253dff2cfd4..9aa5c8146f171 100644
> --- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> +++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c

[ ... ]

> @@ -39,23 +40,6 @@
>  		.sin6_port	= htons(8888),				\
>  	}
>  
> -#define explain(x)							\
> -	do { if (cfg_verbose) fprintf(stderr, "       " x "\n"); } while (0)
> -
> -#define __expect(x)							\
> -	do {								\
> -		if (!(x))						\
> -			fprintf(stderr, "[OK]   " #x "\n");		\
> -		else							\
> -			error(1, 0, "[ERR]  " #x " (line %d)", __LINE__); \
> -	} while (0)
> -
> -#define expect_pass(x)	__expect(x)
> -#define expect_fail(x)	__expect(!(x))
> -
> -static bool cfg_long_running;
> -static bool cfg_verbose;
> -
>  static int flowlabel_get(int fd, uint32_t label, uint8_t share, uint16_t flags)

[ ... ]

> @@ -141,6 +125,10 @@ static void tcp_connect(int listener, uint32_t flowlabel, int *client, int *acce
>  
>  static void set_flowlabel_consistency(bool enable)
>  {
> +	/* flowlabel_consistency must be disable to use the IPV6_FL_F_REFLECT
> +	 * flag. This helper function is required for setting up and tearing
> +	 * down test cases for this flag.
> +	 */

[Severity: Low]
This isn't a bug, but "must be disable" reads as a typo for "must be
disabled".

Also, does the second sentence match the code? set_flowlabel_consistency()
is called inline twice from reflect_flag(), and there is no
FIXTURE_SETUP()/FIXTURE_TEARDOWN() anywhere in the file, so nothing
performs the "tearing down" role described here.

[Severity: Low]
This isn't a bug introduced by this patch, but the helpers reached from the
new harness bodies still abort the process instead of emitting a TAP
result. set_flowlabel_consistency() calls error(1, errno, "open
flowlabel_consistency") when /proc/sys/net/ipv6/flowlabel_consistency
cannot be opened, and tcp_listen()/tcp_connect() do the same on bind,
listen, connect or accept failure.

>  	int fd;
>  
>  	fd = open("/proc/sys/net/ipv6/flowlabel_consistency", O_WRONLY);

An unprivileged run therefore exits the harness child with status 1, and
the harness prints a bare "not ok" with no TAP diagnostic. Given the
changelog says the conversion "enforces TAP standard", would SKIP() from
kselftest_harness.h be a better fit for these environment preconditions?

[ ... ]

> @@ -152,187 +140,270 @@ static void set_flowlabel_consistency(bool enable)

[ ... ]

> +TEST(exclusive_label_share)
> +{

[ ... ]

> +	err = flowlabel_get(fd, 2, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
> +	ASSERT_TRUE(err) TH_LOG("expected reuse to fail, due to linger");
> +
> +	sleep(FL_MIN_LINGER * 2 + 1);

[Severity: Medium]
These two assertions plus the 13 second sleep were previously behind
if (cfg_long_running) and never ran in CI. Was enabling them
unconditionally intended?

The other side effect is state left behind in the per-netns label table:
this test finishes holding label 2, and renew_label_linger() below
deliberately extends label 5's linger to 26 seconds. A repeated run of the
binary in the same namespace within that window, or a single filtered test
run, would fail the initial IPV6_FL_S_EXCL create.

Related to that, splitting run_tests() into separate TEST() cases suggests
per-test independence, but cannot_get_non_existent_label() and
cannot_put_non_existent_label() still assume label 1 does not exist while
can_create_and_get_and_put_labels() creates it. Is the ordering dependency
between these cases worth a comment, or could each case use a distinct
label?

> +
> +	err = flowlabel_get(fd, 2, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
> +	ASSERT_TRUE(!err) TH_LOG("expected reuse to succeed after linger");
> +
> +	ASSERT_EQ(0, close(fd));
> +}
> +
> +TEST(user_private_label_share)
> +{

[ ... ]

>  	pid = fork();
> -	if (pid == -1)
> -		error(1, errno, "fork");
> +	ASSERT_NE(-1, pid) TH_LOG("fork failed");
>  	if (!pid) {
> -		expect_pass(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
> -		if (setuid(USHRT_MAX))
> +		if (flowlabel_get(fd, 3, IPV6_FL_S_USER, 0))
> +			exit(1);
> +		if (setuid(USHRT_MAX)) {
>  			fprintf(stderr, "[INFO] skip setuid child test\n");
> -		else
> -			expect_fail(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
> +			exit(0);
> +		}
> +		if (!flowlabel_get(fd, 3, IPV6_FL_S_USER, 0))
> +			exit(1);
>  		exit(0);
>  	}

[Severity: Low]
Does this lose the per-check diagnostic that expect_pass()/expect_fail()
used to print? Both child expectations, "child can get the user-private
label" and "child cannot get it after setuid(nobody)", now collapse to the
same exit(1), so the parent can only report:

	ASSERT_EQ(0, WEXITSTATUS(wstatus)) TH_LOG("child reported unexpected result");

with no indication of which sub-check failed. The same applies to the
child in process_private_label_share(). Would distinct exit codes, or a
TH_LOG-carrying variant, keep the information the removed macros printed?

Separately, when setuid(USHRT_MAX) fails on a non-root run the child
prints "[INFO] skip setuid child test" and exits 0, so the harness reports
the whole case as "ok" while a sub-check was skipped. This matches the old
behaviour, but SKIP() is now available.

[ ... ]

> +TEST(renew_label_linger)
> +{
> +	/* After a label with EXCL share is put and lingered, it must be
> +	 * possible to create a new one. Check if RENEW action extends
> +	 * the linger period of put label, blocking creation after previous
> +	 * linger time.
> +	 */

[Severity: Low]
Does the first sentence describe this test? The body does
get(5, S_EXCL, CREATE) -> renew(5, 26) -> put(5) -> sleep(13) and then only
asserts that creation still fails; there is no assertion that creation
succeeds once the extended linger elapses. The positive case is covered by
exclusive_label_share() instead.

> +	int fd, err;

[ ... ]

> +	sleep(FL_MIN_LINGER * 2 + 1);
> +
> +	err = flowlabel_get(fd, 5, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
> +	ASSERT_TRUE(err) TH_LOG("expected reuse to fail, new linger time not over yet");
> +
> +	ASSERT_EQ(0, close(fd));
> +}

[ ... ]

> +TEST(reflect_flag)
> +{

[ ... ]

> +	set_flowlabel_consistency(false);
> +
> +	listener = tcp_listen();
> +	err = setsockopt(listener, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_on, sizeof(reflect_on));
> +	ASSERT_TRUE(!err) TH_LOG("failed to enable REFLECT on the listener");
> +
> +	tcp_connect(listener, 7, &cfd, &afd);
> +
> +	err = getsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_query, &reflect_query_len);
> +	ASSERT_TRUE(!err) TH_LOG("failed to query the accepted socket's outgoing label");
> +	ASSERT_EQ(7, ntohl(reflect_query.flr_label)) TH_LOG("accepted socket did not reflect client's label");

[Severity: Medium]
Can this leave net.ipv6.flowlabel_consistency disabled?

set_flowlabel_consistency(false) is called at the top, and the matching
set_flowlabel_consistency(true) only runs on the straight-line success
path at the end. Every ASSERT_* in between ends the test child
immediately:

	ASSERT_*  ->  OPTIONAL_HANDLER(1)  ->  __bail(1, _metadata)

tools/testing/selftests/kselftest_harness.h:__bail() {
	if (for_realz) {
		if (t->teardown_fn)
			t->teardown_fn(false, t, t->self, t->variant);
		abort();
	}

A plain TEST() is registered by __TEST_IMPL, which never assigns
.teardown_fn, so teardown_fn is NULL and the child just abort()s without
running the restore at the end of the body. The error() paths inside
tcp_listen()/tcp_connect() and a harness timeout kill behave the same way.

Since each test runs in a forked child, the parent continues, so any test
running after reflect_flag (and anything else in that namespace or on the
host) proceeds with flow label consistency validation off. The most likely
trigger is exactly the regression this test exists to catch:

	ASSERT_EQ(7, ntohl(reflect_query.flr_label))

The in-tree path runs the binary under ./in_netns.sh, and the sysctl is
per-netns, so the leak is normally confined to a temporary namespace; but
the binary is also run directly by developers, where the host setting is
left disabled.

Would FIXTURE_SETUP()/FIXTURE_TEARDOWN() be a better home for this, since
teardown_fn is the only callback the harness still runs after a failed
assertion? That would also make the new comment on
set_flowlabel_consistency() about "setting up and tearing down" accurate.

> +
> +	err = setsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off));
> +	ASSERT_TRUE(!err) TH_LOG("failed to disable REFLECT on the accepted socket");
> +
> +	err = setsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off));
> +	ASSERT_TRUE(err) TH_LOG("expected disabling REFLECT twice to fail");
> +
> +	set_flowlabel_consistency(true);
> +
> +	ASSERT_EQ(0, close(afd));
> +	ASSERT_EQ(0, close(cfd));
> +	ASSERT_EQ(0, close(listener));
>  }

For reference, the earlier commit adding the IPV6_FL_F_REFLECT test also
skipped the restore on its error() paths, so the missing restore is not
new; this patch increases the number of abort points between the two calls.
