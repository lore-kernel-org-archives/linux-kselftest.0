Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635625;
	b=XTV+SUcP9BG3wStHSUIxnMjBDqGSMOVZvkOEhD4en51jqmANg6JpUeskaS2LMNLe2VM/
	 yv/Zmw9h/SJvOJaS6066gownlNZPMv36YMP7jhg1z8FRuWblZaqZ6VmRq7IAIyAs7vmxt
	 dCdX8rXKUyS8MnMkZ9twh0Kp08yEXucFF3q6iUaiS9nGwUY7K0ghpUk3NfqnSxyl+pwR+
	 WfYpWT2e1N11ACqUixKzQZ+tWT7rWmYSMndsB00aBShgd53fcMMjHr8L6Eu2qMskMHDDP
	 r3nZ7CTp1zdm/TDszNHfuKbF34aPqDuLbnQwvQytEK8tTtpa2ZRKSCiq58w3h2Sep6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=9A011GwDGlG1py2D4N87gJQuX8ar0m5xB7Oz/LEhEnE=;
	b=zQ/h5gXRMQV7f9qf/fzxVMo0L9/Zet5/tC0LWJ54o42g1B+tXG7iRHtFxEuyoTTV1y2U
	 VasPUwte5HUpI3U1TRUOG8BNozY9LTY8f1aSnHoFjAmAOmlab79qmMsi2oPBsS9v/m93Z
	 CsWldmWucxvrTSP4Jm3nGJUSa20kmbmyKlc3+x7zQ34r/ounfdlMTT/SxVLqTUQVJNmqT
	 oKXVFBj73U1Y2tycPY2DZLnJgHir2IxNzFL3g7wFKEju+kw9CzVtZpk/uK5tZz78/p6yP
	 lbt3jEiggTqUo3EHa3hCfLr7XHLZIE8fcjs5yPpLO74tisQrXXdudcvgHrhCWO4EcdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Eckaxjdg;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F12606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F12606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Eckaxjdg
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f046b0adc0so35916705ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795635624; x=1796240424; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9A011GwDGlG1py2D4N87gJQuX8ar0m5xB7Oz/LEhEnE=;
        b=EckaxjdgaDF5mThZ4+h58P4VsPDsi/ZeXmTrk0WIn2vCojkLZ2+iVD6aqESiUlTAJi
         GgnmvTYLeGf+I3rqtT0QQNuZ+mBtlw9UhSSrpHKR8dDqPfj7X41Hagst2vxi5D28oNpE
         ttoMoVQ+5E1Q8PpqGSAa7LAypesEvx4t+Sz0XdGILvgX4t3d7K710Lv2DlceWs0bIByl
         PEPsS6Xes30JsdmoNteiXgDmPBYD0y+THHCC1z++EMeOhzhywmjTXrq4hXu39+2uV6sT
         Vyj71u76ScKty8RpJhPt1HWS8kgHtX4gVo150Ccn0EFxMEoeJSTjuyWX+D8KUH+xpy9D
         qFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635624; x=1796240424;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9A011GwDGlG1py2D4N87gJQuX8ar0m5xB7Oz/LEhEnE=;
        b=hd9shHZFRQWAZqmnfmXlAnlVkyoI7bNOvfhoojQNEkGPer5KcDcJdgMQi04mmgiyi0
         7QMxjs7h583rZ8JM2CtTSuoGRpvgTJn+kzEEH0CqC44ImQn1NybXKNhHDT4JVN1pQGoz
         bZP9VMkucqrzS5KtiT58kNVm47IfV9J7/4Iv6UfL8JVjj2W9MYeOQbBsSS68N9toKn74
         CoWfAC7DRKt4zqJRunsDcA2a7IFP+qrnZ3zOfwL29xJ/KjtzY0wvJBXdjN2LD++sIJXp
         /QF36Z93eaI8mn6C52pRFd9pUS0+LbuX0mUJk9e7a0YgUckEcia2ada0q49ovxrTp1Op
         Sm7A==
X-Forwarded-Encrypted: i=1; AL+hErG+KtSryGm3gkCilv6rSNW+9P3ZMFW8/xQzaGvufxDo6KueIILCU2haR3MaJROqHIEX4IX96/wlaGT0TBkopGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NaFEhbUlcs5fVI30UXNRWMip6Kix8EkHjtjo+F8ryaQEhuIz9
	xZ6Dxlq2A6sEnnbrxmGkvE6nqkZQFl0NJlUx8xU2UnvIC9fql4tCOFku0NIdf2cATQxG43jWjoO
	jZE+n3vyz
X-Gm-Gg: AZFdTZfs/TsVc+nufs82i42FS1BdTyHcku/7ilWXMZFEEnE+8EG9dbbXmz03xs7WItu
	Rq3nSTUbWb77j8L6KdUB/Yt+dUmejdYngIMW7WsV4Y4bQBffbJJMJh3RGsyb8/AdAGIejIIl3ry
	IJ8oCuTJo8P8FRomB9AqL0OVe0BmLdH6mbia647X9YPkZFDTua/MKBz4g7euGWZ/WfsHgBgSib1
	c5bKkeRxDQvlv1QUANHQmHhrRQecsHEkwKLLgc4CRMVGOblb9Uy3+9WKWaYwH8APQLN6PVLYW0a
	suOtLEVrzPgg3ANQbccLMmV0lpZ30fp8WKhm0pd7FJdYRupqpCyytkHB3HNXGjVZTwDynVXHo6s
	/DlCGGf+PoDIzXqpPy9XB/oWU0worUES6YwKn3nzWqK1EWDHD0diFmQpYcKIvcy3exxdirJA7xY
	iwI9qbO8c37TuZcaags7r9gr5gy2xCQU0+wsiE7Xxr8eZGiMPeJcJZJd7ciPV1VTph+w991Jn9a
	4mMQSBUXfGK2aw0Gn3s5c09FH77V5Yh64b2CJhVAwWI41OYPbS7wXRr940GWqX7Z+RyWCboYf99
	Eg08YnQ1WvCWkg7A+bNYmTCGBV+9eY54ruuFxBuDeT0sa5jpZJERd+YgW+EM20A5G8rsMrPUyqc
	gU5eG/U76DA==
X-Received: by 2002:a17:90b:35c2:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b41c8e0c7emr16015888a91.18.1795635623451;
        Wed, 25 Nov 2026 11:40:23 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9518881a12.19.2026.11.25.11.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:40:22 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 11:40:22 -0800
Message-Id: <DN4JPCW1VT9K.1HWW8L3LMPE35@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Aaron Lewis" <aaronlewis@google.com>, <kvm@vger.kernel.org>
Cc: <alex@shazbot.org>, <dmatlack@google.com>, <jgg@nvidia.com>, "Kees Cook"
 <kees@kernel.org>, "Andy Lutomirski" <luto@amacapital.net>, "Will Drewry"
 <wad@chromium.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v4 4/5] selftests: harness: Support custom command-line
 options
X-Mailer: aerc 0.21.0
References: <20261114132200.113697-1-aaronlewis@google.com>
 <20261114132200.113697-5-aaronlewis@google.com>
In-Reply-To: <20261114132200.113697-5-aaronlewis@google.com>

On Sat Nov 14, 2026 at 5:21 AM PST, Aaron Lewis wrote:
> Also update test_enabled() to match exact option characters rather than
> tolower(opt) so custom options that differ only by case (such as 'R') do
> not mistakenly match built-in single-case options like '-r'.

Please also explain the has_positive change, since it's not obvious
from the diff. How about replacing this paragraph with something like:

  Pass the full optstring (including custom options) to test_enabled()
  so that getopt() correctly parses custom options that take an
  argument. Since test_enabled() now sees custom options, only update
  has_positive for the filter options (-t, -f, -v, -r). Otherwise a
  lowercase custom option would be treated as a positive filter that
  matches nothing, and every test would get filtered out. Similarly,
  match exact option characters rather than tolower(opt) so that custom
  options that differ only by case (such as -R) do not get treated as
  built-in options (such as -r).

[...]

> +/**
> + * struct test_harness_cli_opts - Custom command-line options for test h=
arness
> + * @optstring: getopt option string; must not conflict with harness opti=
ons.
> + * @handler: Callback to handle custom options; returns KSFT_PASS or KSF=
T_FAIL.
> + * @help: Optional callback to print custom option help text.
> + */
> +struct test_harness_cli_opts {
> +	const char *optstring;
> +	int (*handler)(int opt, char *optarg);
> +	void (*help)(void);
> +};

KSFT_PASS and KSFT_FAIL are test result codes, which seems like an odd
fit for a callback that handles a command-line option. Please follow the
usual kernel convention instead and have the handler return 0 on success
and non-zero on error, e.g. in test_harness_argv_check():

	default:
		if (opts && opts->handler && !opts->handler(opt, optarg))
			break;

and in the next patch:

	static int opts_handler(int opt, char *optarg)
	{
		if (opt =3D=3D 'b') {
			...
			return 0;
		}

		return -EINVAL;
	}

The @handler kernel-doc above will need to be updated to match.

Also, kselftest.rst explicitly lists which kernel-doc comments to pull
in from kselftest_harness.h, so this comment won't show up in the
rendered docs as-is. Please add kernel-doc for test_harness_run_opts()
too, and add both to the "Helpers" list in
Documentation/dev-tools/kselftest.rst so test authors can discover how
to add custom options.

[...]

> +#define OPTSTRING_LEN 128

kselftest_harness.h is included by a lot of tests, so please use a more
specific name (e.g. KSFT_OPTSTRING_LEN) to avoid clashing with something
a test defines, or hard-code it locally.

> +
> +static void optstring_append_custom(char *optstring, size_t size,
> +				    const struct test_harness_cli_opts *opts)
> +{
> +	const char *c;
> +
> +	if (!opts || !opts->optstring)
> +		return;
> +
> +	assert(strlen(optstring) + strlen(opts->optstring) < size);
> +
> +	for (c =3D opts->optstring; *c; c++) {
> +		if (isalnum(*c))
> +			assert(!strchr(optstring, *c));
> +	}

assert() compiles out if a test is built with -DNDEBUG, in which case
these checks silently disappear, and nothing else in kselftest_harness.h
uses assert(). Please follow what the harness already does for misuse
it detects at runtime (e.g. "Illegal usage of low-level ksft APIs in
harness test") and for bad command-line options: print an error with
ksft_print_msg() and fail. e.g. have optstring_append_custom() return an
error and test_harness_run_opts() return KSFT_FAIL, the same way it
handles a failure from test_harness_argv_check(). That also avoids
pulling <assert.h> into every test that includes the harness.
