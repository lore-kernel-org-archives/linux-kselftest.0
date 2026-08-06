Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2084A4CA286;
	Thu,  6 Aug 2026 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044177; cv=none; b=L5fnFcTe9SM9Ma3zm9SoGmlJwAWs/iVPM8s/KTpKcqCarwVxgq8IE7Bavr2ZSMN9nJ/7aHtCZOFVDP4BHMlww/rm2A5jDQzSRoSvVOJJGQfOL8bMKx2XNIP1+SMh9GgnDZa3daiZLwJ5TPo8cihCpmpgotEpBxjZJ8jTeJe+AqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044177; c=relaxed/simple;
	bh=eCw+WyRCmjitOlp5mQQowPVvy7PCtrOZtQzEezPBIf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UByt0GxRBSxWbugkFjlBdZRXTuLSrVezrUgiR2isxnscWy6OhaisYgnMLTXXaT1W6HEhZ4T4seLnJUtZLkQBktTVlUqZYtKw7jfx+ih5x/A8DjdupUmFzxMjtaYIy1vf2zFZa1HhTsGNG3iLzLxgGs4vv5jpHWq9i+WXM72RR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uemlqz68; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uemlqz68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570211F00A3A;
	Thu,  6 Aug 2026 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786044172;
	bh=5zKChjMBDxEiJJ6UlOccg1ERWPIlVsdgxwCVBmacLV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Uemlqz68fUPmnPu3tQj6/U/CGfeNKMCTozARJ2kUg7DwFb9dRWA/e5EFU8sg4GCD5
	 8uFp1LbgANjUd+lRL9W/vAKTr30lUAU4hN30eo/eZhGszcINaGxNEyouoCwbxp2Nk0
	 D/23tiLgmFbnvqBdpGqrw/uEYlYt6lHXOQ5PwZZUAVUBtPzlLvCRw6vlJNziKEoDbN
	 pk65zh4iCDC+LhBsvyon8a3AIHjpAyNMjW/kO9x/PpOW714AqaPHhUdYJiAZa9U0vk
	 ntCv1q7aWg74y0maTOY+ii4x5wuqvjZnulhDe5qld/5i98bmureVBd5izL5KvGryRJ
	 /AVihr2zQdyVw==
From: Jakub Kicinski <kuba@kernel.org>
To: marcelomspessoto@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/4] selftests: net: adopt harness for flow label mgr
Date: Thu,  6 Aug 2026 12:22:51 -0700
Message-ID: <20260806192251.3335962-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804025910.50145-5-marcelomspessoto@gmail.com>
References: <20260804025910.50145-5-marcelomspessoto@gmail.com>
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
selftests: net: adopt harness for flow label mgr

This converts tools/testing/selftests/net/ipv6_flowlabel_mgr.c from the
local expect_pass/expect_fail/explain helpers to kselftest_harness.h,
splitting run_tests() into individual TEST() cases. It also removes
parse_opts(), so the two previously -l gated checks now always run.

> diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> index af87eec799c80..482921f7ee119 100644
> --- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> +++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c

[ ... ]

> @@ -159,230 +131,335 @@ static void tcp_connect(int listener, uint32_t flowlabel, int *client, int *acce

[ ... ]

>  	pid = fork();
> -	if (pid == -1)
> -		error(1, errno, "fork");
> +	ASSERT_NE(-1, pid) TH_LOG("fork failed");
>  	if (!pid) {
> -		expect_pass(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
> -		if (setuid(USHRT_MAX))
> +		err = flowlabel_get(fd, 3, IPV6_FL_S_USER, 0);
> +		ASSERT_TRUE(!err) TH_LOG("child failed to get the user-private label");
> +
> +		if (setuid(USHRT_MAX)) {
>  			fprintf(stderr, "[INFO] skip setuid child test\n");
> -		else
> -			expect_fail(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
> +			exit(0);
> +		}

[Severity: Medium]
Should this path report a skip rather than a pass?  In
TEST(user_private_label_share), when setuid(USHRT_MAX) fails the child
prints to stderr and calls exit(0).

The parent then runs:

	ASSERT_EQ(pid, wait(&wstatus)) TH_LOG("wait failed");
	ASSERT_TRUE(WIFEXITED(wstatus)) TH_LOG("child did not exit normally");
	ASSERT_EQ(0, WEXITSTATUS(wstatus)) TH_LOG("child reported unexpected result");

All three succeed, so the harness emits "ok user_private_label_share" even
though the check the test is named for, that an IPV6_FL_S_USER label cannot
be obtained after switching uid, never executed.

setuid(USHRT_MAX) fails when the binary runs without CAP_SETUID, or in a
user namespace where uid 65535 is unmapped, which is reachable since
ipv6_flowlabel.sh drives this through ./in_netns.sh.

Would propagating KSFT_SKIP work better here, for example the child doing
exit(KSFT_SKIP) and the parent turning that into SKIP(return, ...)?

The silent-skip logic itself predates this patch, but before the conversion
there were no per-test TAP results; now the test individually reports "ok"
instead of "# SKIP".

The raw fprintf(stderr, "[INFO] ...") is also the only diagnostic left in
the converted file that does not go through TH_LOG, which prefixes output
with "# ".

[ ... ]

> +TEST(reflect_flag)
> +{
[ ... ]
> +	if (flowlabel_consistency_enabled())
> +		SKIP(return,
> +		     "net.ipv6.flowlabel_consistency must be 0 (run via ipv6_flowlabel.sh)");

This is the idiom the setuid path above could use: SKIP() sets
_metadata->exit_code = KSFT_SKIP and prints a "# SKIP" diagnostic, so an
unmet precondition is not reported as a pass.  Could both unmet-precondition
sites in this file use it consistently?

[ ... ]
