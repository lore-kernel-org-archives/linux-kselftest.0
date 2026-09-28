Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC733FC5AE;
	Mon, 28 Sep 2026 23:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790636983; cv=none; b=WFtGrCYF1xcVcv9csWivXfz+XispwhOa6y8q136vprzdG9OHRUrrIvUB/qtOAWFN3xZ4kckv8pKBjJXsJM2lb+xSIjIEhy3A1qK44MyvNj9iJO2RcT+X7v/xZ6ImYMo+iReG2xXpBtmUthHYJXIHEUvcxE/WPacn7kIjMdTz8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790636983; c=relaxed/simple;
	bh=xq1CPA79atUqxdiHTJOQkvM7HJAj7Vi9nvtAOk3UMas=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KT40Txc8NGEW1oHpue28qP7cvmViNZpkv5XDFH7zN+kPzQjS2RDQ5XtG68Zz6pZiSH6YpFDfvTymrvDktSIvSpLQwEIOrWG3j4i6+4P3kuYKBx0E2dutFaBzRc3RIj+oq2RRPHDYfr7s/8Ocw2OicYDDBJ1WKta2fUHyyWzm5vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUmlNjyi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUmlNjyi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC801F000FF;
	Mon, 28 Sep 2026 23:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790636982;
	bh=LcgmQHfKVXwQycuEIp0YeI6oaglMEocrzzRC4NS5Xew=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YUmlNjyiWlz9jEw7//cFr/esUnddvNoZ7F84EL3p+AlApXWTUEicBb8dcavrv9ysG
	 oC2huhu8Q+GlMqpdgJuzYlJ5CFN4f8+kiwyzAcKwcUFqhtKWk4ccp71f9kQv4UJFB1
	 6434QaLVHlJdQDLWnBFvTEuZdk+DemhdjMTdHEDUza/tiaJPJkQmk9soYXpIVp60/i
	 miXnGyRbHlvuhEy1xRTt0JzkpbidqQFB74G1o7bH90ta1TPWbZxGKxlXqzjlvd+TJ2
	 sT0EeZuYMc3u7zGxwP5Wd8vDx3mxWL/YWMCCKdEbhwTP54h5UYCDHP5gBNsvV6zY4M
	 IdDd4wb3bYx6A==
Subject:
 Re: [PATCH net-next] net: mctp: Stop selecting flow support for KUnit tests
From: netdev-bot+sashiko@kernel.org
To: kmehltretter@gmail.com
Cc: jk@codeconstruct.com.au, matt@codeconstruct.com.au, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, geert@linux-m68k.org, brendan.higgins@linux.dev,
 david@davidgow.net, raemoar63@gmail.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 23:09:40 +0000
Message-ID: <179063698082.3145.2926312612788491843@kernel.org>
In-Reply-To: <20260925192510.93840-1-kmehltretter@gmail.com>
References: <20260925192510.93840-1-kmehltretter@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch removes `select MCTP_FLOWS` from `config MCTP_TEST`
  in net/mctp/Kconfig.

--

net: mctp: Stop selecting flow support for KUnit tests

This commit removes "select MCTP_FLOWS" from MCTP_TEST in net/mctp/Kconfig.
The selection also enabled SKB_EXTENSIONS, and KUnit style guidance says
tests should not pull in dependencies this way. The two flow-specific tests
already skip when MCTP_FLOWS is disabled.

> diff --git a/net/mctp/Kconfig b/net/mctp/Kconfig
> index d8d3413a37f7e..3a5c0e70da776 100644
> --- a/net/mctp/Kconfig
> +++ b/net/mctp/Kconfig
> @@ -14,7 +14,6 @@ menuconfig MCTP
>  
>  config MCTP_TEST
>          bool "MCTP core tests" if !KUNIT_ALL_TESTS
> -        select MCTP_FLOWS

[Severity: Medium]
Will this break kunit.py run --alltests? tools/testing/kunit/configs/all_tests.config
still asks for flow support:

tools/testing/kunit/configs/all_tests.config:
    CONFIG_NET=y
    CONFIG_MCTP=y
    CONFIG_MCTP_FLOWS=y

Commit 109a5331143d, the one named in the Fixes: tag, added this line
together with the select.

MCTP_FLOWS is a bool with no prompt and no default:

net/mctp/Kconfig:
    config MCTP_FLOWS
        bool
        depends on MCTP
        select SKB_EXTENSIONS

That means a config fragment cannot turn it on. Only a select can.

After this patch the only selector left is MCTP_TRANSPORT_I2C in
drivers/net/mctp/Kconfig. That symbol depends on I2C_SLAVE, and neither
one is on by default or set in all_tests.config. So after olddefconfig,
MCTP_FLOWS stays unset in the generated .config.

validate_config() in tools/testing/kunit/kunit_kernel.py then calls
Kconfig.is_subset_of() in kunit_config.py:

    b = other._entries.get(name)
    if b is None:
        if value == 'n':
            continue
        return False

This returns False for CONFIG_MCTP_FLOWS=y. The run then stops at config
time with "Not all Kconfig options selected in kunitconfig were in the
generated .config", before any KUnit suite is built. That affects every
suite in the all-tests run, not only the MCTP ones.

Should all_tests.config be updated in this patch as well? One option is to
drop CONFIG_MCTP_FLOWS=y. In that case mctp_test_packet_flow() and
mctp_test_fragment_flow() in net/mctp/test/route-test.c would always skip
in the all-tests configuration.

Another option is to replace the line with CONFIG_I2C_SLAVE=y and
CONFIG_MCTP_TRANSPORT_I2C=y. The flow tests would then still run. That
matches the validation notes, which say the enabled configuration used the
I2C transport to select MCTP_FLOWS.

Since the patch carries a Fixes: tag, a stable backport would bring this
mismatch along with it.

>          depends on MCTP=y && KUNIT=y
>          default KUNIT_ALL_TESTS
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925192510.93840-1-kmehltretter%40gmail.com
