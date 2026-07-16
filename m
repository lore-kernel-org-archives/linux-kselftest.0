Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F6F30E828;
	Thu, 16 Jul 2026 01:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784164139; cv=none; b=rChQH7Q4DdWs0J8c+MK3LBwysgPVcw9ZHwF32Vt3H0Ot3fMABhN9ipwOwTvPAWGFyqmtwXHpRjBjyO7Fe0VabEOoQTG8RS3thCiKaJRRy6OpU/yY1FiJAjLw2cFwlZFauUSjM94tN9gfur92Mv6gIQVM933dZmz74seTwTYvcwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784164139; c=relaxed/simple;
	bh=is+AGMYh35Y4QGJoYKJ/RV9dXzWAVFSf1b417EmdWBM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=thfR9Sd3Jaemue79VnM0RE6IQ9ioDXbuugj6m7EvDwBZ155WE+Z3JmtRMNTY9RWqhzCbNPgt3HU+bPhQX+xy+v7rMg+nf0h8SQRFsF4JsEm1OvBZ5G5YNt/rHzcLuRNOXKOtFwjFfwcrGSZawNVICD7TTYU46rzorlFnkz4kcdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LV2SrDoH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LV2SrDoH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463271F000E9;
	Thu, 16 Jul 2026 01:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784164138;
	bh=8m2lWaB2tQvv6RcpNesHusG0CbEU4bCCEZvcdotg6TI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LV2SrDoHVaHuhnRPNgvwLXWQA0XmksntRG07jFGFaqeqscl9b4dXC7sIRLACZrg6G
	 nKMSFhsomwy/VaArvWU/fz83/2cSsEDjulc/KHLElZoVCqjO1eKct64k9Io7EePJ6l
	 WclL60Fz8V/WuFL4uMXqhlaq7tVoaMB2u+HMCAYdTA52DWtdO+EYirVsHOa+40lJeQ
	 31hR067dhoWB3tGBKeE5xMpM4biC6Jcx5CNnBfqYY/5t1cRNqYd4yuMKHKpV3BRVRv
	 R/Wg5WQbvG/xrnlD29xzxEkEDJb4lZ6qygoqOPFW1cxvryFoUPvBpk8HL1WvVSVQdX
	 zXx4KugIOrZeA==
From: Kees Cook <kees@kernel.org>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haofeng Li <920484857@qq.com>
Cc: Kees Cook <kees@kernel.org>,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: Re: [PATCH] selftests/lkdtm: rename STACKLEAK_ERASING to KSTACK_ERASE
Date: Wed, 15 Jul 2026 18:08:43 -0700
Message-Id: <178416412007.1787429.13509468247552081982.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_CD80B5F746B6AABD68AF3F1097AD02C96F05@qq.com>
References: <tencent_CD80B5F746B6AABD68AF3F1097AD02C96F05@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jul 2026 16:02:10 +0800, Haofeng Li wrote:
> Commit 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
> renamed the LKDTM crash type and selftest configuration but missed the
> entry in tests.txt.
> 
> As a result, the selftest generates STACKLEAK_ERASING.sh, which run.sh
> skips because the LKDTM DIRECT trigger only exposes KSTACK_ERASE. Rename
> the test entry so the generated runner uses the registered crash type.
> 
> [...]

Applied to for-linus/hardening, thanks!

[1/1] selftests/lkdtm: rename STACKLEAK_ERASING to KSTACK_ERASE
      https://git.kernel.org/kees/c/b3a7aa9c0020

Take care,

-- 
Kees Cook

