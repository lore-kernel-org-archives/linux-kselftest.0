Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E8E38425A;
	Wed, 12 Aug 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527611; cv=none; b=Nl8y9QOeibUFn6En5TWfgS9+8Vbmh3ycdWshXT6ptmypkX/NsMi5DIJnjGutQ7IIHYMsDBfjAV6Le43QPxb+3OB6rl1gdkjKHed9N9BKDx+uj0ZeHJUG+mzZNbEQA9N4stdBF9X+OTp/1dFwVRkeYjRsN8cfrihbNIV9eAMpm4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527611; c=relaxed/simple;
	bh=ev4glunJmddrTbzF7PCDcRN30WkcDAddJrAQqh48rWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oc1RDjWeqcCfdZGw5KnhkuIBL/82skTno3PkeVbBuFJctYBkB7wvms/KDATsAIBKa8KHA53ET2DqFMV0XYkRclYwRmr9X78S9eiaEvJTYZkNNqNltis5buSQIXqtlsl56cjjkcpnSk+3HeD7mnBcNGWhpvGxmLFpyygU4+yMYDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=g5NrxuZj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g5NrxuZj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A6351596;
	Wed, 12 Aug 2026 02:40:05 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 006FC3F632;
	Wed, 12 Aug 2026 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786527609; bh=ev4glunJmddrTbzF7PCDcRN30WkcDAddJrAQqh48rWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5NrxuZjQB9klOoODQiv4fCwQUmouyRDYnWJYKgnQvLAZQvGQOHbZuEoc9wMKuLTI
	 fe7n3tELw0qqiEZ5cnlxStDf+6caqQnLspdbRG1hoDuQIzrsgEY2wLf8/h9SPuVGZ+
	 wJLWh0JpvefPu/DqptOFEqpeS6i8LJSjr3L/qwCc=
Date: Wed, 12 Aug 2026 10:40:04 +0100
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
Subject: Re: [PATCH 4/4] selftests: mm: test kmemleak's N-consecutive-scan
 leak confirmation
Message-ID: <anw_dDAEPUMvuVJL@arm.com>
References: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org>
 <20260713-catalin_pto-v1-4-5b93b1131089@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-catalin_pto-v1-4-5b93b1131089@debian.org>

On Mon, Jul 13, 2026 at 04:48:07AM -0700, Breno Leitao wrote:
> Add a functional test for the min_unref_scans kmemleak module parameter.
> Using samples/kmemleak's helper module it checks that min_unref_scans=1
> reports an orphan on the first scan, min_unref_scans=2 reports nothing on
> the first scan but does on the second, and that the parameter reads back
> what was written.
> 
> It counts only the helper module's own orphans (matched by their
> [kmemleak_test] backtrace, with the module kept loaded so the symbols
> resolve) so unrelated leaks already present on the system do not perturb
> the result. The test skips when run as non-root, without
> CONFIG_DEBUG_KMEMLEAK / CONFIG_SAMPLE_KMEMLEAK, on a kernel without the
> parameter, or when the helper yields no detectable orphan.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
