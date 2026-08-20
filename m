Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585BC3DD84A;
	Thu, 20 Aug 2026 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215280; cv=none; b=hZFHwChjZb8IEd9T8oAm9r7Puc3O+RfcUeveoU0mgXQY37w8TsMM4u5+cI6VIo6W8xHxh+58jftiUY3EKU5ShXQhhlElxeMBMCpmSU56l9ralVFFb3kHsXMbll72ngJPqLO24bgVXs4pNXViT1gXHJjJwwUxqZ0V7ADee+feRXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215280; c=relaxed/simple;
	bh=amgcJVyBUGwGFNKSS32Fdcs/GPxDhnfIHKHS4FloFxA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=TLyo9EKks86YDXBfqa0irkEN/snHZIEfzl3yoQuDOPWTNVilAa/E+lXLELFFwJLOSi15WGflXa3c6TSqk2N0kZLHEUrXPjn1ej1W3L7NLjIM/tkJJVf3/rc/VpGuAVqHGbrs2rOAEAe49chfLkP7vgbVBMYYYK0tEYp30RuhF88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQr0lUO6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQr0lUO6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0F61F00A3A;
	Thu, 20 Aug 2026 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215279;
	bh=rmLT+lbLlZGhVRGS5nzuJP8BWMHxLCoiEFWXXq+9RLo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZQr0lUO6N442CdC9SKRk+GDcbzgI7G5ymhvUKwkNE9eDkoUeGhGVZ3ozk593Qc5JZ
	 tbMOAtksSDe/6wYNPCyexqwdL4rXNpxTerRSP00esMoKObjnMgdypwpeAkty0ZYPXA
	 c5h/WynHG64CDgPQ9BIlVJyB4t6OvXL9Je/MzI/ygbbVkFauK8ucvwNv2ghMBCjiNL
	 0RUle4n2Dx6uJn5fIBZzPFZjmfbvD3Ql5ToLKsOLC02UHPR8d/AAbsDjZMiDw4RkOZ
	 oaszqYVVBAGB+NQjbqw08BnYcsLzQ0BeIUxQND+U4xxlodBdGZzpTGhzvXQyqevqIe
	 2ESke7FepeemA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 10/19] selftests/mm: add khugepaged completion
 barrier helper
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
 dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, 
 liam@infradead.org, mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, 
 shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
 vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
 agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kas@kernel.org
In-Reply-To: <20260815015901.1236937-11-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-11-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523517.2799959.9631834855392157058.b4-review@b4>
X-Mailer: b4 0.17-dev

> Race and functional tests need to drive khugepaged in step: set up a
> layout, let one full scan pass over it, check the result.  The khugepaged
> selftest already waits for full_scans to advance by two, but only makes

"advance by two"?

> progress if scan_sleep_millisecs happens to be short.
> 
> Lift it into khugepaged_full_pass() and drive it through sysfs: any store

Lift what?

> to scan_sleep_millisecs wakes the daemon, so the barrier completes whatever
> the scan cadence.  A store can be lost when the daemon is between scans, so
> it keeps storing until the pass lands; a store to an awake daemon costs
> nothing and queues no extra pass.
> 
> One wake completes one pass only if the whole mm list fits in a scan batch,
> so callers need a large pages_to_scan.
> 
> Settings pushes must not start passes either.  A store to either sleep knob
> wakes the daemon, so thp_write_settings() now writes a khugepaged knob only
> when its value changes.  The other knobs do not wake, but writing them
> uniformly costs nothing.  thp_update_num() is exported for tests that want
> the same restraint.

This very much elaborates on "what" and "how" and very little on "why".
I'd change the balance.

> Assisted-by: Claude-Code:claude-opus-5
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index d7917dce3aba..992efee17b71 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -183,6 +183,19 @@ void thp_read_settings(struct thp_settings *settings)
>  	}
>  }
>  
> +/*
> + * Write only on change: a store to either sleep knob wakes khugepaged --
> + * __sleep_millisecs_store() clears khugepaged_sleep_expire and wakes the
> + * queue -- and settings pushes/pops must not start scan passes nobody
> + * asked for; khugepaged_full_pass() is the only sanctioned wake.  The
> + * other knobs do not wake, but writing them the same way costs nothing.
> + */

Hmm, the function name already tells that it only writes on change.
Do we need this long text along with it?

Surely "khugepaged_full_pass() is ithe only sanctioned mode" is out of
line for infrastrucure helper description.

-- 
Sincerely yours,
Mike.

