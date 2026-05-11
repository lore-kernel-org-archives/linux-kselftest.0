Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F29C3A3E8B;
	Mon, 11 May 2026 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505279; cv=none; b=oldBXz/FNJk52nHaytjDPJaJRhL6oYfugbxyk7Wj5icOZbrGYlYnAxrhUl0m9uwFE2xOAq+E80JW10FBL1b5XfVmAGaH9BylHPbQOFcjwGUNIuz7HXvAn6cFYFxyJhaVhB1xJkYNiguS3PUoiuEin8JR6a5lL+zSX49NMTAgukU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505279; c=relaxed/simple;
	bh=bYI46wjLV9WdFFXdb0OUg0TPn9jqQ7EcQVg86OoKbpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Axu5Me0F22L2kQCYypvxOhG5s9QO1JowrxYqkUy2wc/XiUuXzKHExNVYAV4fvTaqyHdKBj477/7QHmkiswXqCaIO4fui6nVkHbon6oD1I/b6FKaPC5Rk3E3GTPFjRf5G6/MEJBTnvXNjK+6uhPWg5nml41XlviQV9xCdEpeJVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=M8+t7Hwn; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="M8+t7Hwn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+nwwGYjXAbOErj8JZ2huv4J4icPCzcZEgoH+hJ4RkG0=; b=M8+t7HwnI4Q/DCAhPPgzptib3v
	RIMb04mRas8ayYkpbcOrx4ZJu5STMQbPcH7gelJKOkMGZZWr4Lmah2xJDPl180LUU6MNtNzoSiQCp
	j5KF76r+J994ufZqkpUI4wX/pRvyf6WpSoDA7R7p1uB3+GuoLdiOiRwXB1B4YzR7iUqG+vuBq1qTL
	CBMpNV9EIb4jmyxJf3Rr4uIUh8SlYQ2N1QVEOqlmQDqW5C68qHVz3e0uiuSbbU/0W2JVLF5iDHcvT
	ICzJOZ5tloG09BcT+dUYuXgAZEtPEp7dooMlGDxqh1ohd0QcyBU9iojQFeuyU7cnXtI8klV2Ka8kh
	2PpruzFw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMQSu-001ctB-1W;
	Mon, 11 May 2026 13:14:32 +0000
Date: Mon, 11 May 2026 06:14:27 -0700
From: Breno Leitao <leitao@debian.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, akpm@linux-foundation.org, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agHSFo0yqypa9vk9@gmail.com>
References: <20260508195749.1885522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508195749.1885522-1-sashal@kernel.org>
X-Debian-User: leitao

helo Sasha,

First of all, Thanks for this feature, this is useful to me, and I am
interested in it. Feel free to copy me and I can test the next revisions

On Fri, May 08, 2026 at 03:57:48PM -0400, Sasha Levin wrote:

> +config KILLSWITCH
> +	bool "Killswitch: short-circuit a kernel function as a CVE mitigation"
> +	depends on SECURITYFS
> +	depends on KPROBES && HAVE_KPROBES_ON_FTRACE
> +	depends on HAVE_FUNCTION_ERROR_INJECTION
> +	select FUNCTION_ERROR_INJECTION
> +	help
> +	  Provide an admin-facing mechanism to make a chosen kernel function
> +	  return a fixed value without executing its body, as a temporary
> +	  mitigation for a security bug before a real fix is available.
> +
> +	  Operators write "engage <symbol> <retval> [reason]" to

Should [reason] be shown at "engaged" ? I was expecting it, and in fact find it
very useful, but I don't see it.

	# echo "engage __x64_sys_getuid 12 CVE-2026-99999-INCIDENT-4242" > /sys/kernel/security/killswitch/control
	# cat /sys/kernel/security/killswitch/engaged
	__x64_sys_getuid retval=12 hits=12

 
> +#if IS_ENABLED(CONFIG_KUNIT)
> +#include <kunit/test.h>
> +
> +/* Non-static so kallsyms resolves them without CONFIG_KALLSYMS_ALL. */
> +int ks_kunit_target_int(int x);
> +void *ks_kunit_target_ptr(int x);
> +
> +/* noipa keeps the call out-of-line and uneliminated. */
> +__attribute__((__noipa__)) int ks_kunit_target_int(int x)
> +{
> +	return x + 1;
> +}
> +
> +__attribute__((__noipa__)) void *ks_kunit_target_ptr(int x)
> +{
> +	return ERR_PTR(-EIO);
> +}

When compiling with LLVM=1, I get the following error:

        kernel/killswitch.c:708:16: error: unknown attribute '__noipa__' ignored [-Werror,-Wunknown-attributes]
        708 | __attribute__((__noipa__)) int ks_kunit_target_int(int x)
        |                ^~~~~~~~~
        kernel/killswitch.c:713:16: error: unknown attribute '__noipa__' ignored [-Werror,-Wunknown-attributes]
        713 | __attribute__((__noipa__)) void *ks_kunit_target_ptr(int x)
        |                ^~~~~~~~~

Thanks,
--breno
