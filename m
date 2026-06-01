Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD88F372B45;
	Mon,  1 Jun 2026 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316366; cv=none; b=nYayi1NqsbLVLfvuQhjTGw1awnMdzNjn4m+z8jUEOZ+3KobqAT0xgALaeWZb+BPiPg8Qb+f7utsLRf5LmHZpNPAT7hgiU7pop6iyaNaKzYEdLVF4qQJY+O6HxRRQEnEZ9qBGi7Wmv6qw7OQl1ucmi3WANwVtaVve4eoPKweqS44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316366; c=relaxed/simple;
	bh=dKIw85cjjmMHvk+b6xPuAxxw3l7lsPs4Ra5gBjM2XbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pqmQPSW3g+HZGM0yyQHiON/Gj+zK2hSDcVDsDSRKeNZhEXHAqiJx3IhJlQv0OBVC4l6pmUZPk+kb8HQgOIvORHoW10OJ9LOUmcGTj/hPiMbKTR4GdLhxJOET5ZSItTZ6x4vNuBjlXM+QXmNDd5W5cdYFJBuWj020TYRxs5opRUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCT7BbAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCT7BbAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06C51F00893;
	Mon,  1 Jun 2026 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780316365;
	bh=c8I85J2qCWw8kSCV48bS5iJLpYyx/iyAZY3UbobiVKQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=iCT7BbADvyqY/N7ktQa9CCgQuLuxBi4bueukJYyNbHF0PfF8EjQwNrugrMCvzsqX9
	 9q3Bkh/2GSly5eAntX/fzTq/U3DYapYK0Af0v7fUEHdvK69OpMZqTpu3fIXD8Vtpsv
	 3kK64hONFu2Wyfiyk9SPhNn6LZCQ9nVjSQN1bCuf+1u908hDrJF3Cde/BuZPgKlfU2
	 B0wruFmyHvuzw8sv6UNygpdeq5JxWI0RLZusmFxpbMV/X8dKD55Gq+5l/2tZWNdQ09
	 CzI+TVBnBl8eH6W3yE0yHeox9lngm+77wRXMczG9PzhvJ3IGej4bCsIKsNxalLU60s
	 rocow+5OAKF5Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v4 03/13] liveupdate: centralize state management into
 struct luo_ser
In-Reply-To: <20260530221938.115978-4-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Sat, 30 May 2026 22:19:28 +0000")
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
	<20260530221938.115978-4-pasha.tatashin@soleen.com>
Date: Mon, 01 Jun 2026 14:19:21 +0200
Message-ID: <2vxzzf1efo6u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 30 2026, Pasha Tatashin wrote:

> Transition the LUO to ABI v2, which centralizes state management into a
> single struct luo_ser header.
>
> Previously, LUO state was spread across multiple FDT properties and
> subnodes. ABI v2 simplifies this by placing all core state, including
> the liveupdate number and physical addresses for sessions and FLB
> headers into a centralized struct luo_ser.
>
> Note that this change introduces a semantic difference: the sessions
> and FLB serialization formats are no longer completely independent of
> the core LUO. Their metadata (such as physical addresses for sessions
> and FLB headers) is now coupled to and managed via the centralized
> struct luo_ser.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
