Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12A83BFE33;
	Mon, 11 May 2026 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506869; cv=none; b=KDin0qyUGId2izQudeduslVT0n5xIk3ZY6qxPeM6Zh9ZKemfrRCYRUjEQjNP0Eqc1zDhTdVTUOJhLKea4h6RgfroKaP10TlTR9OyN6G9ILqxwcyvKULWgO4XoSgaXxtBA6FFavOpyXqvTLxRsTNKXoW/LdoV1+l/1YmnJYPi1Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506869; c=relaxed/simple;
	bh=A665MEVXMZekT0cld9H2rty4M2R4mWBaSCWPSm3L9Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1DcRGU2N4hV4YKDGrngjQRTgam3zrtTz1L8m95jKMuemcLNT30YyLhHwdE0/uPl3PnKlamhgzgFEDZ1zwwblpSrEzDjnHOYyvPty64zdh8oHds01vVHFK2p1wutGWDseg0t+gjR0xlav1KPSDFcydXRi0JJPnoxnr3BdWy4sGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtqpnJEy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtqpnJEy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C844C2BCB0;
	Mon, 11 May 2026 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778506869;
	bh=A665MEVXMZekT0cld9H2rty4M2R4mWBaSCWPSm3L9Y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtqpnJEyKc1kDH9q8n+RQr9BQRZU1pOL/9fx9BqM/FsxwTK5H4JtjtptAHZXZez3/
	 EceBNxmwaDmnGKCClzKTwK/jYDPvqjfzg1h1ePZht7Njo4vNaZ62eH+5keG2Tizf73
	 L+fAOyBxT6zARoDYYNSLjqZO8YWaigzZpA0wigzMtrAYGRiY8nW25TdyeIur/ELYo6
	 BHNn5KlY0ex6sZpX1/QMX+nFwpKLRbfBYz6eOmahN7GQiYbEeZ7DpyTwv8WYSPXAcS
	 xoSWpVnU4JCQ1PkdPyEUoby+jDRPHsqNskHhOvCMLKyDsBnC9s0queYLgqKiRjoPhW
	 LVytkOgeInsgQ==
Date: Mon, 11 May 2026 09:41:07 -0400
From: Sasha Levin <sashal@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: corbet@lwn.net, akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agHcc4s-xj83dzty@laps>
References: <20260508195749.1885522-1-sashal@kernel.org>
 <agHSFo0yqypa9vk9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <agHSFo0yqypa9vk9@gmail.com>

On Mon, May 11, 2026 at 06:14:27AM -0700, Breno Leitao wrote:
>helo Sasha,
>
>First of all, Thanks for this feature, this is useful to me, and I am
>interested in it. Feel free to copy me and I can test the next revisions
>
>On Fri, May 08, 2026 at 03:57:48PM -0400, Sasha Levin wrote:
>
>> +config KILLSWITCH
>> +	bool "Killswitch: short-circuit a kernel function as a CVE mitigation"
>> +	depends on SECURITYFS
>> +	depends on KPROBES && HAVE_KPROBES_ON_FTRACE
>> +	depends on HAVE_FUNCTION_ERROR_INJECTION
>> +	select FUNCTION_ERROR_INJECTION
>> +	help
>> +	  Provide an admin-facing mechanism to make a chosen kernel function
>> +	  return a fixed value without executing its body, as a temporary
>> +	  mitigation for a security bug before a real fix is available.
>> +
>> +	  Operators write "engage <symbol> <retval> [reason]" to
>
>Should [reason] be shown at "engaged" ? I was expecting it, and in fact find it
>very useful, but I don't see it.
>
>	# echo "engage __x64_sys_getuid 12 CVE-2026-99999-INCIDENT-4242" > /sys/kernel/security/killswitch/control
>	# cat /sys/kernel/security/killswitch/engaged
>	__x64_sys_getuid retval=12 hits=12

This was a woopsie on my end: originally I planned to have a reason field, but
then decided to drop it to keep the patch simple. However, I forgot to fix up
the kconfig help text :(

If you think it'll be useful, I'm happy to add it back.

>> +#if IS_ENABLED(CONFIG_KUNIT)
>> +#include <kunit/test.h>
>> +
>> +/* Non-static so kallsyms resolves them without CONFIG_KALLSYMS_ALL. */
>> +int ks_kunit_target_int(int x);
>> +void *ks_kunit_target_ptr(int x);
>> +
>> +/* noipa keeps the call out-of-line and uneliminated. */
>> +__attribute__((__noipa__)) int ks_kunit_target_int(int x)
>> +{
>> +	return x + 1;
>> +}
>> +
>> +__attribute__((__noipa__)) void *ks_kunit_target_ptr(int x)
>> +{
>> +	return ERR_PTR(-EIO);
>> +}
>
>When compiling with LLVM=1, I get the following error:
>
>        kernel/killswitch.c:708:16: error: unknown attribute '__noipa__' ignored [-Werror,-Wunknown-attributes]
>        708 | __attribute__((__noipa__)) int ks_kunit_target_int(int x)
>        |                ^~~~~~~~~
>        kernel/killswitch.c:713:16: error: unknown attribute '__noipa__' ignored [-Werror,-Wunknown-attributes]
>        713 | __attribute__((__noipa__)) void *ks_kunit_target_ptr(int x)
>        |                ^~~~~~~~~

Will fix, thanks!

-- 
Thanks,
Sasha
