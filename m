Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479D543B6F6;
	Mon,  3 Aug 2026 13:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764857; cv=none; b=tlN+AaOz18Jwak0+nke0QWvyLHvILtTk2BYJzl4CLxAky6wDLSe62GtZ1lsxmh9yQDO2+xAPpd6ko5rjUUsz4wQ59XAeS9M4VkhNoedI9xLANe05DeYCrqdzRlND0UHcuZmvTbunhke0qOa0Q+1G8XIBxK37IGCLE/mdl9eWaXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764857; c=relaxed/simple;
	bh=hhXsfn/zKWmJn+exhaR5yAw9rWiZOEgRl4BokkeuAis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4YWt16FOXGavDiQzLMXUfc2wd3N0IUIo8ps8mwtSEMRWspoWECfIJnT/8HipM3MnGIfZmowYA0JJ6uz9zHqBse/GY6MS91oWp99VqOtA6wavDF7RC9wZ5iPiHyJbtyrZFyPMiqo0L3fL4uJ6Ab/zpxxd9GhrT3tX/yWIF5nJfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JYalJtLF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JYalJtLF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C60B21476;
	Mon,  3 Aug 2026 06:47:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42F223FAF5;
	Mon,  3 Aug 2026 06:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764855; bh=hhXsfn/zKWmJn+exhaR5yAw9rWiZOEgRl4BokkeuAis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYalJtLFKsdTul5C+eXgLl5h/r+HoLJG8PCPUQtIj1di2hvliwdGTq4hy7X+HeTIM
	 Y+jp53IxJk4UAXoaSZkMwRRoMpR2sER4qpgcji7R/nmCaoMxDTVCFOSk1YaBHI59D9
	 ZrPAJpKpZp0808LmmYXfAv/KttwYh+PiL97FvXzo=
Date: Mon, 3 Aug 2026 14:47:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 1/3] mm: kmemleak: default min_unref_scans to 2 for
 verbose auto-scan
Message-ID: <anCb8tz8KTwe9f6u@arm.com>
References: <20260731-kmemleak_hardened-v2-0-7b9689ac77cb@debian.org>
 <20260731-kmemleak_hardened-v2-1-7b9689ac77cb@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-kmemleak_hardened-v2-1-7b9689ac77cb@debian.org>

On Fri, Jul 31, 2026 at 03:13:04AM -0700, Breno Leitao wrote:
> min_unref_scans defers reporting an object as leaked until it has stayed
> unreferenced for that many consecutive scans, filtering out objects that
> are only transiently unreferenced during a scan.
> 
> It defaults to 1, which reports on the first unreferenced scan.
> 
> CONFIG_DEBUG_KMEMLEAK_VERBOSE depends on CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN,
> so a kernel built with it runs the scan thread periodically and the user
> has opted into detailed leak reporting. A second confirming scan then
> happens on its own.
> 
> Default min_unref_scans to 2 there to suppress transient false positives,
> and keep it at 1 otherwise, where a manually triggered scan is expected to
> report immediately. The value stays writable through the module parameter.
> 
> CONFIG_DEBUG_KMEMLEAK_VERBOSE defaults to n, so this does not change the
> default for kernels that do not opt in.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
