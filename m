Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9364F85BE;
	Wed, 30 Sep 2026 20:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801736; cv=none; b=f+KH/apiUpEP6o8YQRsEGE3/kGIa1+pHX61xQyaIZAYeAmq1EoKrBsZmomCSIX76XChHXzMGKeDkT+HZid1X3yqrTsjWlUjc74WjntqyH1sCNy0W8nfLmkzDMm/OcOqZal3GWSuA0eMfFjAoMvx5FE5xfIlt6aCjl+6gX934b7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801736; c=relaxed/simple;
	bh=A230iVNsAqBVZ+IaBkxNWqwUWVyBB8FyI5l67yLWTvo=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PFGAlPjHJaI0Rp+Je9asik2IFhtZA2+QFji9q8sLCqTUcsie+X5zgS3tkholWD61iVyETjdij0+3ZoTQrMtvn+3xE+iMn+VZa4U5Opy3fDMow9q8Fmp4WJS0m1fpg5Hac5LRsuoUk8FJERzh/RseIcu88510HrWfW/sS0oVWNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOwrWzkr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOwrWzkr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11C51F000FF;
	Wed, 30 Sep 2026 20:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801734;
	bh=D+QBnD5d45LP6j+lpnTToXdnei1sUTQnyrZuwrKGyRk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kOwrWzkrH3OmiNFF/qMTMM1dj706xXO+WXNS3MVBFYC5GAVeY+zOrUx+LMgPKBE+s
	 8AKLkSheLWXJojEdyXNdBLuiGxquGkCco0G5D+K6aldWh2malpzdS1gmYSFQXXmql8
	 yk4KmyZYqR9iBDj02WX0msKS1hHlW+d/CWdnXuhxOEA5c9prhHLZ/Xcf87veg4ZRNh
	 Afnd08WhetUATtjdliRgxJDBw4dB8WjlO+o4aM2UGxgrqk8FPwjR08UQFHqZaezUHd
	 a8GrVq3kNZcVeb7Rndh+c40g4ypuOwOhQr/wQHyb2NmM6XOpVhaRrK0NyquImCFNy+
	 MXRGgKBGB/q6Q==
Subject:
 Re: [PATCH net-next v2] net: mctp: Make KUnit tests depend on flow support
From: netdev-bot+sashiko@kernel.org
To: kmehltretter@gmail.com
Cc: jk@codeconstruct.com.au, matt@codeconstruct.com.au, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, geert@linux-m68k.org, brendan.higgins@linux.dev,
 david@davidgow.net, raemoar63@gmail.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Date: Wed, 30 Sep 2026 20:55:33 +0000
Message-ID: <179080173322.434549.16914782890279505094@kernel.org>
In-Reply-To: <20260928205352.30502-1-kmehltretter@gmail.com>
References: <20260928205352.30502-1-kmehltretter@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch breaks `kunit.py run --alltests` and drops the MCTP
  core KUnit suite from all-tests CI runs.
- [Medium] mctp: core test suite disabled on minimal configs due to
  hidden Kconfig dependency

--

net: mctp: Make KUnit tests depend on flow support

This patch changes MCTP_TEST so that it depends on MCTP_FLOWS instead of
selecting it. The goal is to stop the tests from silently turning on
SKB_EXTENSIONS. The suite is then available only when something else,
such as the I2C transport, enables flow support.

> diff --git a/net/mctp/Kconfig b/net/mctp/Kconfig
> index d8d3413a37f7e..e64d4f7ef6aaf 100644
> --- a/net/mctp/Kconfig
> +++ b/net/mctp/Kconfig
> @@ -14,7 +14,7 @@ menuconfig MCTP
>  
>  config MCTP_TEST
>          bool "MCTP core tests" if !KUNIT_ALL_TESTS
> -        select MCTP_FLOWS
> +        depends on MCTP_FLOWS
>          depends on MCTP=y && KUNIT=y
>          default KUNIT_ALL_TESTS

[Severity: Medium]
Does this make the whole MCTP core suite unreachable on minimal KUnit
configs?

MCTP_FLOWS is a bool with no prompt, so it can only be enabled through
a select. After this change, the only way to satisfy the new dependency
is to pull in a transport that selects it. Today that means I2C,
I2C_SLAVE and MCTP_TRANSPORT_I2C.

A .kunitconfig that asks only for the core pieces, something like:

    CONFIG_KUNIT=y
    CONFIG_NET=y
    CONFIG_MCTP=y
    CONFIG_MCTP_TEST=y

now resolves MCTP_TEST to n. KunitConfig.validate_config() would then
reject the run, because CONFIG_MCTP_TEST=y never reaches the generated
.config. In menuconfig the "MCTP core tests" prompt simply disappears,
with no hint that an I2C slave transport is needed to get it back.

The commit message says the suite is available only when flow support
is enabled. That undersells the cost. The gate is not only on the two
flow tests but on every routing and socket case in route-test.c and
sock-test.c. Most of those have nothing to do with flows. The configs
that lose them are exactly the small ones developers are most likely
to use for quick KUnit runs.

The patch also leaves dead code behind. route-test.c still has the
!CONFIG_MCTP_FLOWS stubs, such as mctp_test_packet_flow(), which only
call kunit_skip(test, "Requires CONFIG_MCTP_FLOWS=y"). With MCTP_TEST
now depending on MCTP_FLOWS, those branches can never be compiled.

Which direction do you and Jeremy prefer here? Some options:

  - Keep the core suite independent of MCTP_FLOWS and let the existing
    skip stubs report the flow cases as skipped.
  - Move the flow cases into a separate suite that carries the
    dependency.
  - Provide a net/mctp/.kunitconfig that enables the I2C transport
    bits so the suite is still easy to run.

If the dependency stays as written, should the unreachable kunit_skip()
stubs be removed in the same patch?

[Severity: Medium]
Will this break kunit.py run --alltests?

tools/testing/kunit/configs/all_tests.config still contains:

    CONFIG_MCTP=y
    CONFIG_MCTP_FLOWS=y

That line came in with commit 109a5331143d. It only took effect because
MCTP_TEST, enabled via KUNIT_ALL_TESTS=y, selected MCTP_FLOWS.

MCTP_FLOWS has no prompt:

    config MCTP_FLOWS
    	bool
    	depends on MCTP
    	select SKB_EXTENSIONS

so a direct assignment in a config fragment is ignored unless something
selects the symbol.

After this patch, the only selector left in the tree is
MCTP_TRANSPORT_I2C in drivers/net/mctp/Kconfig:

    	depends on I2C_SLAVE
    	select MCTP_FLOWS

all_tests.config enables neither I2C_SLAVE nor MCTP_TRANSPORT_I2C, so
MCTP_FLOWS resolves to n.

KunitConfig.validate_config() in tools/testing/kunit/kunit_kernel.py
would then find CONFIG_MCTP_FLOWS=y missing from the generated .config.
It would report "Not all Kconfig options selected in kunitconfig were in
the generated .config" and return False. build_config() then fails, so
the whole --alltests run would stop at the config step.

Even if validation were skipped, the new "depends on MCTP_FLOWS" would
make MCTP_TEST resolve to n there. That drops the whole MCTP core suite
(sock-test.c and route-test.c) from all-tests coverage.

Given that, is this statement in the commit message accurate for the
in-tree all-tests config?

    This keeps the full flow-test coverage: the suite is available only
    when flow support is enabled, for example by the I2C transport.

Could all_tests.config be updated in the same patch? For example, it
could add CONFIG_I2C_SLAVE=y and CONFIG_MCTP_TRANSPORT_I2C=y
(CONFIG_I2C=y is already set there). At minimum, the line that can no
longer be satisfied could be removed.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928205352.30502-1-kmehltretter%40gmail.com
