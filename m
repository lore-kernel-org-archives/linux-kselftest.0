Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10489369236;
	Tue, 19 May 2026 18:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216265; cv=none; b=QBA+Y5+9WITQIAY6DQf4MR7phrkUuWEANuovpEF6LBgEfyizASsNgUA23GlnsVCS/DC9Fh3qnvG6efrVLATpl2/MpAAo1GSmxSF0jRvaONu5rCsBtInrTN8sMRrS3C7HG0QEZ314jgn3DXpY4DfKxqtW54CL3GhYIrYZTJSv1zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216265; c=relaxed/simple;
	bh=HK7OYVU9TauJhgu8vXQYjgfa7h9xtWGXH0z3It907G0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jfwOm1R1kA6whYdvxog2R7cHX1fbMUdtvFjsgHWe1tOdDPgT6KDemwPN7nzt3uoj+MJ4Z48MgeTD8tTXztZwxPe9Xdtqa/4p57vW/OqRwWPLs967yYEJb9G+OnHKtbZzm5iA/FoI9XOXUSIyvLuGcTUi/a/xkCGAlPEChZdQ2is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=w18nVIDV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="w18nVIDV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65779C2BCB3;
	Tue, 19 May 2026 18:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779216264;
	bh=HK7OYVU9TauJhgu8vXQYjgfa7h9xtWGXH0z3It907G0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=w18nVIDVydNXS/nY2UaxqYRxpkxdmjQOisHNaec+lmQKf+SjhTHSvI+DR7UTC0fBB
	 eZ0p6//YRQnhl9r4FvIvpP+lBAtNP3DHocQyfJph8UR/zmtLTvgeRuQLeL2x94Lk8Y
	 iczE/DV3BmQ80aFZjLSUCjHYaOt/+/Rxa5fQI+us=
Date: Tue, 19 May 2026 11:44:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Sayali Patil <sayalip@linux.ibm.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] selftests/mm: assorted fixes for hmm-tests
Message-Id: <20260519114423.cf0ff77b970b92e8377cf5cc@linux-foundation.org>
In-Reply-To: <cover.1779090293.git.aboorvad@linux.ibm.com>
References: <cover.1779090293.git.aboorvad@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 May 2026 09:36:21 +0530 Aboorva Devarajan <aboorvad@linux.ibm.com> wrote:

> This series fixes a few issues in hmm-tests that show up when
> page-size and huge-page configuration differ from the hardcoded
> assumptions the tests were written for (PMD/THP sizing, default
> hugepage size, and related cases).
> 
> It also includes a fix to exclusive_cow: the test ignored the return
> value of fork(), so both parent and child ran the same teardown path.

Thanks.

A lot of people weren't cc'ed.  get_maintainer tells me

Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Shuah Khan <shuah@kernel.org>

Jason and Leon, particularly.

Also, get_maintainer isn't super precise.  A scan of the `git blame'
output indicates that Ralph, Balbir, Alex, Matthew and Alistair might
appreciate a cc.

AI review asked one question:
	https://sashiko.dev/#/patchset/cover.1779090293.git.aboorvad@linux.ibm.com


