Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159B73AB466;
	Thu,  2 Jul 2026 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030340; cv=none; b=cyJARrXeXqC8g4gqr/TqDcVR1ZjVPPDzyNKPY+wOhtiivRaHoWAcFNYKqNUgxsXdhw4GDwroZKJIOpTKdbiC2OQAWgoKPNxNXTywazL2K5f2kDQwh5BSpC01hdbQbF38y/60yBaiEZT25Uv1jtUjWDE8SslfPuvIe47pcxouyHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030340; c=relaxed/simple;
	bh=jJxRosfOkkpgImi1WIyQeCuH/Lf7mbMg7/RCUJJSwA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gqCF0OZL67MBP+Rtat24RtTGooWSnDNS75048vs8zXKDSHJHW3bz7Ds2G0GR6+LrwprGwsgDq/t17tMrWzv/BcjU+SlSCrN3kI9nt5Qz2eH8fwdwKucvBjNc+VT/O7+lueOgNRDpkN2kkQCV/h1T1NWr5UKOWjvTFOqgvum8D1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6maidtP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6maidtP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CCA1F000E9;
	Thu,  2 Jul 2026 22:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783030339;
	bh=VhVz2E5EEE1ju7wxSJdrHiJ47qGtNUBPYGfeIuv/K2w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=P6maidtPkdFbpeVXavSf9kHqqeQ7ldKxr9bRJ6BF6G76zThu3DyaC3eDpl2VngihL
	 LrY1NVEosv9PC6ATdaaTGfLLHam7NskWmIQZauKiytd3afIcrfovynFnidlCU1YB2k
	 8Wlhrxl4kGz3z0Oe1q51g2v3njIrpdGHPv1pPtz1n2uBuQ4Dpe1AAuqFGdHa6zdtPm
	 3lxPudXYwHK8fg6nRmUIIWJ9rLJt+FlctxOVBjdoY4UoFCPG01IwBeO4R2/1wYxzf9
	 0Mfep4/5mCoCFO8V//GWbjQEFGbILFNO+wlmqh5rBpNSfKD1lSkdy7+lLsyVpuNgBC
	 7ylFeyS1HtLFw==
From: Thomas Gleixner <tglx@kernel.org>
To: Old-Ding <1746193727@qq.com>, mathieu.desnoyers@efficios.com,
 peterz@infradead.org, paulmck@kernel.org, boqun@kernel.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Old-Ding
 <1746193727@qq.com>
Subject: Re: [PATCH] selftests/rseq: Fix spelling of accommodate
In-Reply-To: <tencent_A20EAF9C0B2AC0D6DD97A4C2F250D9970406@qq.com>
References: <tencent_A20EAF9C0B2AC0D6DD97A4C2F250D9970406@qq.com>
Date: Fri, 03 Jul 2026 00:12:15 +0200
Message-ID: <87zf09m474.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jul 02 2026 at 16:23, Old-Ding wrote:

Please don't resend the same patch within 24 hours. 

See Documentation/process/

> The comment contains a spelling error listed in scripts/spelling.txt.
>
> Fix it.
>
> Signed-off-by: Old-Ding <1746193727@qq.com>

You have to provide a real name and not some made up nickname.

See Documentation/process/

