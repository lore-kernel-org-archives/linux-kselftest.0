Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A38415F34;
	Mon,  3 Aug 2026 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764974; cv=none; b=U6WsOnKD2z/Uo6ZJcXyo3N9Kb8cNBj2zoQ4dzdgVh3sNBf+cDocwk9Ke5anfu/8GHLEbe8vZkOD85Ipdab6vXvHu8bLK1lrMqwbR2nerQwLEDt/sQUclUfYqFLI7vZBYGSuNzhdG5UlLcf+qCI4LsYA/cxH/BwApKS1BcHv7ePU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764974; c=relaxed/simple;
	bh=RDdpyCKc15NK9uw2pBkfSrDD+en2rKAJPfOEa+//Elg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmmE47EO2bEVZqAnb6Svf9gqZ+rbRP8Td/xqrwiP37BnpgAhVeFDY/LC8Imz/Knol55goD/Z5x631sf3dhAZ84CDgnY2p26KrRDljwmZ+9yoxEVMvltF3dD9mE87Fl/n5ToZ7sbXuYTgf00ZajG7YqNgGjm8Qa7O8eoeRWqqTN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pyBDnvjD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pyBDnvjD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55DE81476;
	Mon,  3 Aug 2026 06:49:27 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C81693F66F;
	Mon,  3 Aug 2026 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764971; bh=RDdpyCKc15NK9uw2pBkfSrDD+en2rKAJPfOEa+//Elg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyBDnvjDoyaRYk+MG4Ev641S05Hf5gyE3GRP2/eECObJNpWEoJpix+UF3tgrxPLeW
	 shzjjcdLwOqIitUYsR5c5s1MO29/Z20LMTALuHB+BQG2Wb2zqndYK40IL0XKqr6Unn
	 Ux4+f+2YDpu/9ILumuY2Ivo7LwrFHp7wxItKeMbc=
Date: Mon, 3 Aug 2026 14:49:25 +0100
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
Subject: Re: [PATCH v2 3/3] selftests/mm: kmemleak: drop stale
 min_unref_scans default from comments
Message-ID: <anCcZUynHWBDoLLr@arm.com>
References: <20260731-kmemleak_hardened-v2-0-7b9689ac77cb@debian.org>
 <20260731-kmemleak_hardened-v2-3-7b9689ac77cb@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-kmemleak_hardened-v2-3-7b9689ac77cb@debian.org>

On Fri, Jul 31, 2026 at 03:13:06AM -0700, Breno Leitao wrote:
> The test writes min_unref_scans explicitly for every case, so its comments
> describing 1 as the default are both unnecessary and, since the default is
> now conditional, wrong. Refer to the threshold values directly.
> 
> No functional change.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
