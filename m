Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27EF33F584;
	Mon, 20 Jul 2026 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546938; cv=none; b=p066qF7+xQJ6N6zFCK9kOHUYDrjugmnoOnQA6OG7W4/bqgaEliq10XIF8cSwUGUKlzytm4XkM6dxJJn8SKBFhKZ7UuoHndPxWCAGSuRn0PmRIMd2N3qSvlMSp+1lByPYTjWOpGICk10KWCtYUScl7/gDDbsW/x2+K49qQ9Uiyw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546938; c=relaxed/simple;
	bh=lRwjyeC78WwIQHFKJlu5Fxy5cobWN2TgGxczpSf/QMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RMoh7fzS0dP6FwvaMKm2S/N4ca324Tsl+NUU/1KaaPWhTagfCAR8VxAkSzV6mF1/ii7ldxQXAKBp0Zj2YEgtoldKITdDpmsH4CiYK+eJy4oG7U5moG9GKvoqg6LqsqeQ2bPdy4y1ILHPMqM/9A8aH2U+11tjkRneivN4bzRMv7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSpNhcXb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSpNhcXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690E01F000E9;
	Mon, 20 Jul 2026 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784546937;
	bh=FWJJ/4THIjTyif9tXUvhqrEnOYPI3yjA1+xq1KQYUG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LSpNhcXb+zuPy9rvHaEnnMSDSIKzdqb6lsFZep7Z62+WP9hUM4JLMJ72yRPnDYa7f
	 LMCalCe6XMG0YnDYPL2Od+iBhCsNPNynjyqHoV2gZZa3VpFcPSy8mb/JspzHJEcduG
	 fzcoCkm0+X2CAu2VOmdeAHQx+omXiZsB3HoAVmoEy/jRIf+L0eYiZCBUD1mCiDa8I0
	 vzBm1pcu0fWLFec7odpCJZvJ1h8I2Q4clm0amP5VHSPz9D/+Nh/wBuLL44t2bpmxEL
	 053sqDIIdcF6D2FrUPqvplaRSbGKftoj4MIegpVHJ+rezdVskoqj418Oss0P3BgR3n
	 CMy0nJr1qjv1w==
From: Simon Horman <horms@kernel.org>
To: deepshah146@gmail.com
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	richardcochran@gmail.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: ptp: add a regression test for the frequency adjustment overflow
Date: Mon, 20 Jul 2026 12:28:42 +0100
Message-ID: <20260720112842.106914-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712040922.6403-3-deepshah146@gmail.com>
References: <20260712040922.6403-3-deepshah146@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
https://sashiko.dev/#/patchset/20260712040922.6403-3-deepshah146@gmail.com?part=2
---
--- Patch [2]: [PATCH net 2/2] selftests: ptp: add a regression test for the frequency adjustment overflow ---
commit be5629a2612f961645c213deea88db61fa06f083
Author: Deep Shah <deepshah146@gmail.com>

selftests: ptp: add a regression test for the frequency adjustment overflow
    
This commit adds a regression test that crafts a struct timex.freq directly
to verify if an overflowing frequency adjustment is correctly rejected by
ptp_clock_adjtime() with -ERANGE.

> diff --git a/tools/testing/selftests/ptp/ptp_freq_overflow.c b/tools/testing/selftests/ptp/ptp_freq_overflow.c
> new file mode 100644
> index 0000000000000..342b22689f679
> --- /dev/null
> +++ b/tools/testing/selftests/ptp/ptp_freq_overflow.c
[ ... ]
> +
> +#define FD_TO_CLOCKID(fd)	((~(clockid_t)(fd) << 3) | 3)

[Severity: Medium]
Does this macro left-shift a negative signed integer?

Casting fd (a positive integer) to clockid_t (a signed 32-bit int), applying
bitwise NOT, and left-shifting it by 3 yields a negative integer. Left-shifting
a negative signed integer invokes undefined behavior in ISO C, which will
trigger a runtime error if tests are run with Undefined Behavior Sanitizer
(UBSan) enabled.

Could the inverted value be cast to an unsigned integer prior to the shift,
similar to how it is handled in testptp.c?

[ ... ]
> +	/*
> +	 * (1 + 147573952589676412) * 125 == 2^64 + 9, which overflows s64 in
> +	 * scaled_ppm_to_ppb() and wraps the result to a ppb of 0.  A kernel
> +	 * that does not detect the overflow lets this absurd frequency past
> +	 * the max_adj check; a fixed kernel rejects it with -ERANGE.
> +	 */
> +	tx.modes = ADJ_FREQUENCY;
> +	tx.freq = 147573952589676412LL;

[Severity: Low]
Will this assignment cause a -Woverflow compiler warning on 32-bit
architectures?

On 32-bit platforms where tx.freq is a 32-bit long (without _TIME_BITS=64),
assigning this 64-bit literal exceeds the maximum value of the signed integer
type. Although a runtime check prevents execution, the compiler still parses
the assignment and emits a -Woverflow warning during the build.

> +
> +	ret = clock_adjtime(clkid, &tx);

[Severity: Medium]
Does this test permanently disrupt the hardware clock frequency on vulnerable
kernels without restoring it?

If the kernel does not have the overflow fix, clock_adjtime() will bypass
the max_adj check and push the corrupted frequency downstream to the driver
via ops->adjfine(). Because the test exits immediately after verifying the
error code, the original frequency is never restored, leaving time
synchronization corrupted until a reboot or manual reset.

Should the test read the initial dialed_frequency and restore it at the
end of the test?

> +	ksft_test_result(ret < 0 && errno == ERANGE,
> +			 "overflowing frequency adjustment is rejected (ret=%d errno=%d)\n",
> +			 ret, ret < 0 ? errno : 0);

[Severity: Medium]
Will this test incorrectly fail if the PTP clock is in free-running mode?

If virtual clocks are active on the selected PTP device, ptp_clock_freerun()
returns true and the kernel explicitly returns -EBUSY before evaluating the
frequency overflow logic. Since the test expects -ERANGE, receiving -EBUSY
will cause the KSFT assertion to fail.

Should -EBUSY be accounted for as a valid condition to gracefully skip
the test?

> +
> +	close(fd);
> +	ksft_finished();
> +}
