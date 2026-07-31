Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B8A3090C2;
	Fri, 31 Jul 2026 01:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785461998; cv=none; b=j12e5EAFKi1S3SUK4CvcWAl3sPO3c1A1pShk2d11X0ssC6fkHyrH9B8yiPKzHZTy64jQa2B0uS7WmEb525EEWM96H6iJOpKMeIECGdgBMlIcoMA9n5Us1NT07nRcCBFuIoi8sMfGmLh5t05CofWhOFQ7U6Ki6qiw7Ax2mR4lTac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785461998; c=relaxed/simple;
	bh=83hYyOaeM02Y+EtKEjGkqIWb24PH2+MwPGRaxWicpwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=js7hkOJQFkjQC/P4wYbJisXELxu7HvRJQTDsBCXVLTQRZP9yJG54gYE7iL6v75/jrF7qwzqSft8ScAldRZnW1KWd86C9l1g7/RgEcuskg2YvmuVpuhkGRQwJvzKLw+chFbXGVgER8kX20OVe/hmSWnl01TZ9wPccYt7C7xp/+3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYyFDsnx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYyFDsnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F1E1F000E9;
	Fri, 31 Jul 2026 01:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785461994;
	bh=xw2g8OoZ8SRA4GpY72pq0W+8lpftRdi/I2nNnzbsBPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EYyFDsnxdIKEGZlzlOwI+lNB3rI4Wf0ilwm3aO6R7psQ5FjD0y1r2Ek8TvhCzHt3G
	 FJ0KDqVIa0d7+2r3GNo6O3GUYAp0S4pJ/sJCnb3q2UPEj5Rv2fqon037XEsgSFvWVh
	 /NJjeA6ih4g4+eQVqlLgNJnOBqJusIA710wH5LyQANHMrFdSMjgI9yxK+kfYr9JxFM
	 7vIwKbKNhhwJ2EBjbAXMugI3eIw58weALM4lFhHc/bSX+DmBmIUvaSwFSd/NFtg/9s
	 p5ktYZlkaOZWdtFgDB4mzkrNGhPIjCwItSoQd21O0hmQdCmTDBMx5S9Ha2T90T3bBW
	 5kO0QeeYxDOrA==
From: Jakub Kicinski <kuba@kernel.org>
To: marcelomspessoto@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	marcelospe@proton.me
Subject: Re: [PATCH net-next 1/4] selftests: net: test IPV6_FL_A_RENEW
Date: Thu, 30 Jul 2026 18:39:52 -0700
Message-ID: <20260731013952.752309-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727043516.93101-2-marcelospe@proton.me>
References: <20260727043516.93101-2-marcelospe@proton.me>
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
--- Patch [1]: [PATCH net-next 1/4] selftests: net: test IPV6_FL_A_RENEW ---
commit e6f2968aee0cf7d9f88007bffba4ffec657d1cd4
Author: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>

selftests: net: test IPV6_FL_A_RENEW

This adds a flowlabel_renew() helper wrapping IPV6_FLOWLABEL_MGR with
IPV6_FL_A_RENEW, and a new sub-test in run_tests() that creates an
exclusive label, renews it with a longer linger, releases it, sleeps past
the default linger, and expects re-creation to fail.

> diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> index af95b48acea90..cfa7e6270994a 100644
> --- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> +++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c

[ ... ]

> @@ -160,6 +171,18 @@ static void run_tests(int fd)
>  		error(1, errno, "wait");
>  	if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0)
>  		error(1, errno, "wait: unexpected child result");
> +
> +	if (cfg_long_running) {

[Severity: Medium]
Does the new test ever run in an automated pass?  The whole block,
including the only call site of the new flowlabel_renew() helper, sits
inside if (cfg_long_running), and cfg_long_running is only set by the '-l'
option in parse_opts():

	case 'l':
		cfg_long_running = true;
		break;

The only in-tree invocation of this binary is in
tools/testing/selftests/net/ipv6_flowlabel.sh, which passes no arguments:

	echo "TEST management"
	./in_netns.sh ./ipv6_flowlabel_mgr

So under make run_tests the fl6_renew() path is not exercised, while the
changelog says "RENEW was the only flow label action without selftests
coverage".  Should the sub-test be unconditional, or should
ipv6_flowlabel.sh pass '-l'?

A sleep-free variant seems possible: renew of a label held by the socket
returns 0, renew of an unknown label returns -ESRCH, and renew with
linger > FL_MAX_LINGER without CAP_NET_ADMIN returns -EPERM.

> +		explain("create a new label with FL_MIN_LINGER linger time");
> +		expect_pass(flowlabel_get(fd, 5, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
> +		explain("renew the label to increase its linger time and put it");
> +		expect_pass(flowlabel_renew(fd, 5, 2 * (FL_MIN_LINGER * 2 + 1)));
> +		expect_pass(flowlabel_put(fd, 5));
> +		sleep(FL_MIN_LINGER * 2 + 1);
> +		explain("The label cannot be created because the new linger time is not over yet");
> +		expect_fail(flowlabel_get(fd, 5, IPV6_FL_S_ANY, IPV6_FL_F_CREATE));

[Severity: Low]
This isn't a bug, but would it be worth bounding the renewed linger from
both sides?  The sequence only checks the negative case, and the label was
created with IPV6_FL_S_EXCL, so in net/ipv6/ip6_flowlabel.c the create at
t=13s fails as long as the entry is still hashed:

net/ipv6/ip6_flowlabel.c:ipv6_flowlabel_get() {
	...
	if (fl1->share == IPV6_FL_S_EXCL ||
	    fl1->share != fl->share ||
	...
		goto release;
}

Since expect_fail() cannot inspect errno, an "entry still present"
failure is indistinguishable from a share/permission failure, and no upper
bound on the renewed lifetime is tested.  A kernel change that made a
renewed label linger forever, or that clamped linger/expires too high in
fl6_renew(), would still pass.  Adding a second sleep past the renewed 26s
followed by expect_pass(flowlabel_get(fd, 5, ...)) would pin both ends.

The RENEW error paths are also untested: -ESRCH for an unknown label,
-EPERM for linger above FL_MAX_LINGER without CAP_NET_ADMIN, and the
IPV6_FL_S_NONE plus CAP_NET_ADMIN lookup branch in
ipv6_flowlabel_renew().

> +	}
> +
>  }

[Severity: Low]
There is a stray blank line between the closing brace of the new
if (cfg_long_running) block and the closing brace of run_tests().
scripts/checkpatch.pl reports:

	CHECK: Blank lines aren't necessary before a close brace '}'

>  
>  static void parse_opts(int argc, char **argv)

[Severity: Low]
The From: and Signed-off-by: identities use different addresses:

	Author: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
	Signed-off-by: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>

checkpatch reports WARNING: FROM_SIGN_OFF_MISMATCH for this.  Could the
two be made to match on resend?
-- 
pw-bot: cr
