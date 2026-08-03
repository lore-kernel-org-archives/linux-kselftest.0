Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FBD4156C5;
	Mon,  3 Aug 2026 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764951; cv=none; b=u2rhQFB4UHo+lt3gAWEm2o6pojuaTlV/95PrF4oNcKrsYQr0jqx80Nb90knHdSS5F99MJpw9mE/2svZA/fnsdaaLcDEGHSqlVbtVMMRBiKMClERTwZYz8iC70uMPd/pTKtqQ/oU/ZdIQNJQ7Sqy9dThENLYlhSk6DsizuyHZ7rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764951; c=relaxed/simple;
	bh=juW1OU3jkHQCumb5fbsLvS42OPNvrGm8Yt7XMEkLCtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bh0A44e0SdBDKA3nzPFvJ0heqwesKt5u0Jn2DspxJLSeQWQ2A3bR9FYH3eirO/a7HVqR+/ZAIczEba7Uf30rKuUoMXb4XED5V0k2pkwr5NfkcCLavQIDepDc8iezUGKomYWqspB4myr7c5Pq1TGbykAV7DkAtpols4vlEFYkAN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jP6M2uYn; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jP6M2uYn"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 896BD1476;
	Mon,  3 Aug 2026 06:49:05 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07E273F66F;
	Mon,  3 Aug 2026 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764949; bh=juW1OU3jkHQCumb5fbsLvS42OPNvrGm8Yt7XMEkLCtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jP6M2uYnNSCailFRCzB1MJKX+alMEwSoixfhNakZq1H8HBFCmDK0obThnTPn94fxQ
	 AYEHO3Jqp90eU1CKlgK4K9bN9MUrXxq+9yQSkRjzhSHgeU4KCTSyPbdFw+jPkMOnko
	 dNLC6NAkXfVXpOriJT0hpzWTc1KqsK5gSchCXb2Y=
Date: Mon, 3 Aug 2026 14:49:03 +0100
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
Subject: Re: [PATCH v2 2/3] Documentation: kmemleak: document the conditional
 min_unref_scans default
Message-ID: <anCcTycVzQcYUjVz@arm.com>
References: <20260731-kmemleak_hardened-v2-0-7b9689ac77cb@debian.org>
 <20260731-kmemleak_hardened-v2-2-7b9689ac77cb@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-kmemleak_hardened-v2-2-7b9689ac77cb@debian.org>

On Fri, Jul 31, 2026 at 03:13:05AM -0700, Breno Leitao wrote:
> min_unref_scans now defaults to 2 when CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN and
> CONFIG_DEBUG_KMEMLEAK_VERBOSE are both enabled, but the documentation still
> states that the default is unconditionally 1.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
