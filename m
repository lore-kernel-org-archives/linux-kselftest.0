Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F32369D42;
	Mon,  1 Jun 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315731; cv=none; b=cTrsSykqOtVQN0NZThO99wAdXSwuY8MiariGAdehK+omE7gEIJTgeBbhQw//WGQC8Biq8Al9utgIMrl46hRbT2G1/PyNryZIVCJnv+zIP+CvGyGnxxUCF5zvnnYyuUqlTzbS8f7BjEy2/7RzFW385hQuoL1BX8O2J22fRF7IyS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315731; c=relaxed/simple;
	bh=xnhh4qSojD+zCcKpaUKgWefaAd3TcLPYmONvTupt0Es=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mMvF8JEeSIyV5XjEqPm7h7BgDX1FZt2wNE5zsVCy6zE0PR1TZMgEpwv0OqmF6PxiKhz1TcSU9O6TXueMwv/0MNUFpoVBmqlwc1+vI9mL28mF5W9QQsQdONEpHFc09HS8xo/L/JMv6Zbx6hexMVyqSD/YTiSgFGnZJ32uyaKr5Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etuz+XML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etuz+XML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D831F00893;
	Mon,  1 Jun 2026 12:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780315729;
	bh=kLN2nxCenCFriMHbgZyJm69uVh8thx2Q/wX1arVTgj4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=etuz+XML6WCHoCiD6XZWDdtBmSvYoflYOOwpy3l0IcSrWBqMMsconlpV2HkKJ2/Du
	 v+/3YyNCA2PIRV+OGXcws3jTDOkhMyoDKYW0nRNyv8RYufZEpwplNpN9lXifvBMOkK
	 SkOldw71OnXelPchHVQWVcYH/O4Tqt58tPSpPDQ5dgH4cFocz1Dqtdk13+O8UHszdD
	 QW1BRMUl1adBZ1kzAH3ZySXT4BfdxDLXpooMf/zqabNi14LAptzE3wcy6PH7aSE+VE
	 NhxpmTPXnNe7o09HePI0qteYo5tk5km3nviSGcTJic/L5YV4nrgZ/70+oxWwPalpRt
	 zSZTfOrsAB+Fg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v4 01/13] liveupdate: change file_set->count type to u64
 for type safety
In-Reply-To: <20260530221938.115978-2-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Sat, 30 May 2026 22:19:26 +0000")
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
	<20260530221938.115978-2-pasha.tatashin@soleen.com>
Date: Mon, 01 Jun 2026 14:08:46 +0200
Message-ID: <2vxz8q8yh38x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 30 2026, Pasha Tatashin wrote:

> This improves type safety and aligns the in-memory file_set->count with
> the serialized count type. It avoids potential truncation or sign
> conversion mismatch issues.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
