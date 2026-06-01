Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382B3AD529;
	Mon,  1 Jun 2026 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321625; cv=none; b=IWdxMrjhIQhRSqExE3hfOo70xLQUBWaT4AQJVQyA3xrtImNo9mgP95O46x2EsQ0u4AeTJxMgbb2Jjgs6BMkkSVujpHqgy/hSCYknglPLlgO9aTgC1zN0lNEogXhMYJ90QKUGefcr8wXWmaAOCLHXUZnPYVWE7xrkPIgf/dBl4m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321625; c=relaxed/simple;
	bh=VfJiTQf40QlNSshff+GS1/ZqHYz5s38Y3MIK/i0Sfow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B+MTmTVkep0yILpkozRIzzfZ2WgkY6OpSt7EuS5o1UiIxPFrqLuj9WpU5H7iP5NedywVAlPvSqPAwxPJ2zUCtVrqwHWMVq6QBa/EDHU4MhjCgmqKlNDuH7L7bJGSWw35sRvw2wkSLu4tQis5Zq76gZYLUK7hKEpLoZwLryrupdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2kJyXI1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2kJyXI1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258691F0089C;
	Mon,  1 Jun 2026 13:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780321624;
	bh=VXhPQdQbmoYxAcV9f2JludgA6q/58FaJSUv8UfHFRl4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=a2kJyXI1gAxua3NhkBOff+AUkJjnhgPLShZ/88+99yp64tJHwtjd8quIORXIi5PyB
	 9mSyIIlLImIB6U+wbfQ5aRikM5IkO3VFL/iSK3uMhUbF9EyEfx4Q2OUeoZws4yMFAk
	 BUuX79fXFgvZqgbNRe8KiMU8rStJ8qX5nPjCL+LBljsZbLcgxNDmqZcwJ4HMCqWEXk
	 s4zxvlfmuIOlvB00hxcodPp2ocg6vU2DviYmGIO6wCapBTaPWH2qw9K5Z8GKBF/yjy
	 gQUnBroinBXDdp4ReRa3TRZuAzEMSLTOCtRS57xC7ywiutabcheiqjjY8i1oPJN5MF
	 h95wh8sINQUjg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v4 08/13] liveupdate: defer session block allocation and
 PA setting
In-Reply-To: <20260530221938.115978-9-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Sat, 30 May 2026 22:19:33 +0000")
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
	<20260530221938.115978-9-pasha.tatashin@soleen.com>
Date: Mon, 01 Jun 2026 15:47:00 +0200
Message-ID: <2vxzmrxefk4r.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 30 2026, Pasha Tatashin wrote:

> Currently, luo_session_setup_outgoing() allocates the session block and
> sets its physical address in the header immediately. With upcoming
> dynamic block-based session management, this makes the first block
> different from the rest. Move the allocation to where it is first needed.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
