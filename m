Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CC93B8922;
	Thu, 20 Aug 2026 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215245; cv=none; b=eA93SxRn5PIbmlJBbZNPlbS5/VwWV8SA/MZ/P7i7BOWgXekakrsKJJK8pXQMSm9nWWdHRwFBmMxYwnVR7fZ9vn2UHk5Q5T61rwNad2atDnHBOjlCq4PtngyEmt2fYWGr2YldyM//jiYyuNp4xOwk+TKxGkMl1DlNxAK4IZVMvaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215245; c=relaxed/simple;
	bh=e0XqC4N2jgOt5AIDCgZZvZhSLbtvfNtx0J8t/8LbD84=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SoDwmNIn/649hd+yG1usgTNffV8EsDzFuKQ+W4kLPanG/TecFcyB+NGgG+bdmNwG/XevD/aOJzOj/JDyoqTxKl33k1NDymnYmKc/DTxW9yF0c3QOeBWFvD0mEdZb+UwRjUrBtWSK+zln7BFRDxw4wrfvuWIIYd6yHk3QWqFEOTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o001WMFQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o001WMFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293471F000E9;
	Thu, 20 Aug 2026 08:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215244;
	bh=ThRyJw++CdeyaPAZ2X9cTT8FFhEZ6Jw+cGR708aO0eI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=o001WMFQBfLGgBMtD907Bv3sgzzEwmkjG+ldB5Uyp6ne0krELB1HfLELHJ4ZJYgKH
	 kCyGodfbkUNIt2v/U9+rZlpB9Vm6dwshS1nLAVU1znEw3dCKwJqVzt+G/oVqJdSonw
	 7mOkI63H3UUsm2HpWlKHyMzYWB6JlJ7u6VF6xZDYe+QA+aaOaoCYjrwcrCT50jk3vV
	 uWKeMECX78WdrRILdpQAG3c8yiBE5Y4yVA7ZxmWHXe6SzzowF+WylaTWnmXWT5lGqg
	 8igMWXaQ2uPNOcEafc26i4jbQltVUKDuD6QjFOT3yKdUlhqALYB58X+cj/ilGK3EFJ
	 YS9Wol9kX4C4g==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 00/19] selftests/mm: improve khugepaged coverage
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
In-Reply-To: <20260815015901.1236937-1-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523515.2799959.13983972214223576467.b4-review@b4>
X-Mailer: b4 0.17-dev

Hi Kiryl,

> 
>  - The changelogs are rewritten throughout (Mike Rapoport).
 
Sorry for being PITA, but I can't say I'm happy with the result.

I commented of several commit messages and some of the comments, but I
despaired at some point.

My ask for the next revision, please, please, read the text as if you
were a reviewer or presuming it's a future you that reads it.

-- 
Sincerely yours,
Mike.

