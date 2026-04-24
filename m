Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967113C3440;
	Fri, 24 Apr 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038806; cv=none; b=rIc6/rqWxRNLeoW52Sygz3V1LvKad7x2HkCzBxpqBPHrBo9NHsXZIreIUOdaD5EsuOOoF0xcqsL5WIIEKiKNV2KDPGDueB059ZJWJAoPD2rHZoG3XROP+SGfm046vfJf7kJgjOIzB8S5SneZiLu5Lo50s4o1RplBni6Uq6hWiKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038806; c=relaxed/simple;
	bh=SmelVMfR0lIT8feBbjzKlmYGOWieazPUWxP+anpPpOE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CHxJbhDJetubeZ2a84yA8Tz/1bRlJFVQCOYwzXGXbEim/C4NRG8VTPm1i+UgarJRhKftWbE+0VNzcZJePBm8ue61ghOt4zgfsxcvqJAdN8rvcjEwDVQ3OGH/Dmw7pLl5aLJmQ8sEpgN2FgVwDDZXMK0Mpt4f9TKzRC7NyATBtsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BVr1vvQf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BVr1vvQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F99C19425;
	Fri, 24 Apr 2026 13:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777038806;
	bh=SmelVMfR0lIT8feBbjzKlmYGOWieazPUWxP+anpPpOE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BVr1vvQfL1f9TtXGB75geSK6oFBdMswSbOe57cvHGXKeu50nA18hCinr25LHx9ZLn
	 T9MtaGzQAzj1CwQ76SxHhuOzj6gVlKHFePd5nUP+t5UKZRdLKxi6sY/lzJV4GBd6sH
	 lsgYTCTZBOgxRYvieyx+yth0vF1iVR/Hp2KI/rVA=
Date: Fri, 24 Apr 2026 06:53:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan
 <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/2] mm/kmemleak: dedupe verbose scan output
Message-Id: <20260424065325.d9643671feedb0f27297cc94@linux-foundation.org>
In-Reply-To: <20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org>
References: <20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Apr 2026 06:45:03 -0700 Breno Leitao <leitao@debian.org> wrote:

> I am starting to run with kmemleak in verbose enabled in some "probe
> points" across the my employers fleet so that suspected leaks land in
> dmesg without needing a separate read of /sys/kernel/debug/kmemleak.
> 
> The downside is that workloads which leak many objects from a single
> allocation site flood the console with byte-for-byte identical
> backtraces. Hundreds of duplicates per scan are common, drowning out
> distinct leaks and unrelated kernel messages, while adding no signal
> beyond the first occurrence.
> 
> This series collapses those duplicates inside kmemleak itself. Each
> unique stackdepot trace_handle prints once per scan, followed by a
> short summary line when more than one object shares it:

AI review:
	https://sashiko.dev/#/patchset/20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org
