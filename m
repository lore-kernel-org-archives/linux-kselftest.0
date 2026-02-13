Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED0F349AEA;
	Fri, 13 Feb 2026 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770972518; cv=none; b=pUHE2e1ZoySW/kkEI5gqPrSw8Q3Z28TjIFUwOEunuka/mS9D2EMUbTYJMbBTBem+TNqHRB1yzCOgl3Oq0JnpTaqL55T1d+viWw3RD4XOEzBpHQQvKQDg1j45kowEgTM+bG7LyesBzcK/+Tnu0q5q4EslGwGZztQTx9p7Q8E+6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770972518; c=relaxed/simple;
	bh=MuqqbySfLbrXxCZtufrECjpaM62KymJsHeUZ+/3ILUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dV+Gai1C8pkSOPJMd7ob6sp7Cz/6E+Won1Z+iEU9rrvFLKTMH3kR9DHmconSEE6OLFPxSqo4OY7ATHVW72fF5OE8a6UYQuIs/FZ9DZRUhqpp8IBJpZiG+phtk+pz1hWp2gM6y37wxzO4QkIy6zbdx7O/VZsd8ZhZjYjg9GWE8W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NuAsqN72; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NuAsqN72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19D4C116C6;
	Fri, 13 Feb 2026 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770972517;
	bh=MuqqbySfLbrXxCZtufrECjpaM62KymJsHeUZ+/3ILUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NuAsqN72k5J1pxKAVhC3h9o8Wde0CkrZZEm6gJV3UZXlmszA6ptU5DSPzdLIZJhd4
	 hwMaHuOqq09YUfOu5WNNops3u49gYefv/Cj4xnEheg7hvzD0ZPAnHqZ/deTbRx2101
	 8KQsHIViEsW0D4VdfrG7sFpdixLHhanIJO/1id70bqJX9mCwBQKoiAhV0MCV6+94Rr
	 cmTk4tKtIeSm4ZhaBOk5WWzJ8GeskISejgzuxBj32b7PVGYliJj62B2Xnrm8Zqg9tA
	 RoZJJiiYNBgRU9nXMkaZXPmWWPTaChC4YvKztRSC1BXAkdINLc6Prb2GAJQgjpawqa
	 /Bd+IrCkRH6GA==
From: Thomas Gleixner <tglx@kernel.org>
To: kernel test robot <lkp@intel.com>, Yuwen Chen <ywen.chen@foxmail.com>
Cc: oe-kbuild-all@lists.linux.dev, ywen.chen@foxmail.com,
 akpm@linux-foundation.org, andrealmeid@igalia.com, bigeasy@linutronix.de,
 colin.i.king@gmail.com, dave@stgolabs.net, dvhart@infradead.org,
 edliaw@google.com, justinstitt@google.com, kernel-team@android.com,
 licayy@foxmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@mit.edu, mingo@redhat.com,
 morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 peterz@infradead.org, shuah@kernel.org, usama.anjum@collabora.com,
 wakel@google.com
Subject: Re: [PATCH] selftests/futex: fix incorrect result reporting of
 futex_wait test item
In-Reply-To: <202602052333.1Bhrssu1-lkp@intel.com>
References: <tencent_7D6D776D157570FF8C9FB9DE9D9FE5257C0A@qq.com>
 <202602052333.1Bhrssu1-lkp@intel.com>
Date: Fri, 13 Feb 2026 09:48:33 +0100
Message-ID: <87fr7581we.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 05 2026 at 23:29, kernel test robot wrote:

> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)

>>> futex_wait.c:48:2: warning: format specifies type 'uintmax_t' (aka 'unsigned long') but the argument has type 'uintmax_t' (aka 'unsigned long long') [-Wformat]

Priceless. Your compiler can't make it's mind up.

uintmax_t is defined by the compiler provided includes.

Thanks,

        tglx
