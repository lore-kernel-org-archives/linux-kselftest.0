Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EFD36AB77;
	Fri, 27 Feb 2026 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182634; cv=none; b=KQOCe4rV0D0wECbPGYpspajDYXxPwNsDaJBsyhbhYdBaipbqr7mfVXT+T4va5N0tRTACBDiVjfEOwU2SSuqqelVuvbvCzM6OvU886ckhLenDDH6TVwZvFXkpTX6397GnWulI55c767Au1ErbgLWwqkzn+5fUmm92hUfQ3voCXvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182634; c=relaxed/simple;
	bh=t5Eu44EohAKtdn6jXoj24OL4Oxeey1xbO6OgpNiojOU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=RuJMuRYEBjV/+fkPtF/xJr0PkToAeZpwxCV12bAqSzuYrCiKmzm/F1r1or994aHSebGJpopmZkpyg6EJKNnjFUq0Xs4733eo5lOo/f6XZCedJ8gZg5aXDze6KwD76SwH43FG97lkkAxhQdJQlOke2apNGa8e7xn7dI684rLOaoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=PcjwctEq; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="PcjwctEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1772182620;
	bh=SrZdSJRdoAckbO5q82rdgzfQsNrTNPnCGAAFgAwtkIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PcjwctEqe2HezWFYSiow3Nv1o+ZkhN0cgj+vRkBYd5VynQVznhZZGK+8eeMda911m
	 7P5lcirUvHliZ2MLAUe0P8VmnfwauCprMat4GqixshMRgEbuWMimEAoHWksLJcQOVw
	 HhM2fNMQhj3jKyZBW034hlzoER2bTaHz5CFxsfOE=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.72])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id D5A8BC1F; Fri, 27 Feb 2026 16:53:26 +0800
X-QQ-mid: xmsmtpt1772182406tn7cyviuk
Message-ID: <tencent_CFAEC9223E6E96F14FD78573C5BC9C2FBE07@qq.com>
X-QQ-XMAILINFO: Mm8VRyTxzGuAXmNvXmUU2LbOBnvZelHi8jspZbz0yuR7wYRbbFaDo/Vf3iDZBF
	 LfxR9XalMhSq+VnWrGw10xvaOXSvgtB2bqQmWdvR2ndiF2ydH0zlpJFtbGknWtipdSAHuI8D+emn
	 GAxws519MvLFf6b3GiMPrN0MyfahWkdN9/leTqtS3BQUMVkDeEjegrCvnOpRkPQq43eC+o1XgonQ
	 1S66Zx8eijlllEyCoJNQlIPDCtvek6Y0H6wlRXzoGgTdfwZh1G+U5Y/l6ENObr+fe3hVWAD9xBkQ
	 g4J1qOsGjsu2ym1m979LAg9TxoFN3zLQ5Hpigz+mpuMlskakeuo1f+BEZsBbvQLZ+uPE93DDYu8u
	 FZKBbwl8gV07ddJcWSeVklxmFNhqJmgeDcPbQbCTamreYlhr3eLeKGXD95uUphTnBm8swxTvFQjS
	 4GJ665uH3vPPrEdM5ewpwt+fA+GP3RP7du/Wfwvz9rdWWht0BUwRRrbz98MzPyC2Q7EvwZ+DljZa
	 8UFjubRG50V5hbaiC1e/Yy7CA2jmshouvODRjxvFvxc64+14fwreWvsdhw+/zgIiNszQSV1PRamy
	 y5tyJRO7q/rMOsmUMwX4XzuZ/9ydAQE2nK/u6PlXV9l4rGrfycPqrWBETyRQV9hGoaZNFDU+HEXP
	 2f2BFn5PrbWvTa5iaVxUu44zKKabhOF5iE6RlaUfu4wXEOx48Dlaur4F5+zhwaUaDp8GT5oKY5Ez
	 AkYGiQFYvl3CcB03c8WgZdO486jrsyd0QCe+7H5e07NvP7NtjjIRT4ItEQ5mtuzrAce9XICOoVPG
	 l4pFR5erIlZbABLr/eFln56SkszTegFMXRxbi71sqH7xJLdp5T7SiahMgs+IRXgrVmIANzR9akWj
	 kt718WKzhjjlXg4B53K1TGiUCK17gykXbIcksty3ufpANCoyTJ3SNaKXeUzG+A3zRTW9flnJ0ksQ
	 b9hppSVQnah61LF6JXr1qMi1h5y0XOcmL6h11FCG1NFwLxnMpcpOmrn9g69S3B04TtqvN8ZJLBdj
	 YkSrL85Rp0mw2PaTgksNkqRfiSl1DZ93FPnEPDJsyr9Ww4Nl8vC2AtE4F/jgKRNMiY5SHtI2LTL2
	 HlPYIN
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: tglx@kernel.org
Cc: akpm@linux-foundation.org,
	andrealmeid@igalia.com,
	bigeasy@linutronix.de,
	colin.i.king@gmail.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	edliaw@google.com,
	justinstitt@google.com,
	kernel-team@android.com,
	licayy@foxmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	luto@mit.edu,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	shuah@kernel.org,
	usama.anjum@collabora.com,
	wakel@google.com,
	ywen.chen@foxmail.com
Subject: Re: [PATCH v5 1/2] selftests/futex: implement the interfaces related to threads
Date: Fri, 27 Feb 2026 16:53:26 +0800
X-OQ-MSGID: <20260227085326.47482-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87ldgx832l.ffs@tglx>
References: <87ldgx832l.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 13 Feb 2026 09:23:14 +0100, Thomas Gleixner wrote:

> Again. What's this usleep for?
> 
> If the file cannot be opened or fgets() fails then this fails hard.

On embedded platforms, the CONFIG_KALLSYMS compilation option may not
be enabled due to reasons such as reducing the size. This will cause
the test item to fail. Do you still insist on returning a test failure
when the opening fails?

> Why aren't you waiting for the thread right here? There is absolutely no
> point in doing that at the call site of futex_thread_create().

Also for the reasons mentioned above, my idea is to ensure that the test
item can pass with a high probability even if the CONFIG_KALLSYMS option
is not enabled.

Thank you very much for your patient guidance. I was quite busy some
time ago, so I'm replying to you now. I'm really sorry.

Thanks

