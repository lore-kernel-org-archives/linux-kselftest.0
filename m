Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E2217BED0;
	Fri, 28 Aug 2026 03:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888376; cv=none; b=dMwQ6yRYmbCADy3Vxo0ru6I3ERQ9ujpencWG6v+r4zw1UUCSZ661c+Y6GrisMxDGrntxlMXhXtDeoWv8RJmE3a/yQ9THib9SDwi0Ckb23j47aQSgRvIpiNcZQpejVQMAz2JYJ8lOTx6m4nLE1OyXxWtmOpYDu8QZeiFVCDbafOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888376; c=relaxed/simple;
	bh=c4Ho204mhHGsGshYfEOgpKF98Vr/hSg0tJfExWGGxuA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ag0oSGntiTTZG6NL9yTmg0il6QE86VuR7BmSv2wE2HPcw3/YGcTedlHq0xCe1gEmQV6Rv2FSR8A3ycToUXmVL8qfVV4fsxGyN6qqCwcj0bOjbEdVSAwZinHynaCNOjxNcbJyqvq7rpBNWgBz3oHlCYowfYWYYThGBBfNQgD3D2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PvQw82+O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PvQw82+O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD901F000E9;
	Fri, 28 Aug 2026 03:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787888375;
	bh=LokbKn+HPvryjA38Tje4FFTFV5zrorBT2XYFitZE/Jk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PvQw82+OL+CQYCze51/kOr471rHrEYlao1jBGs9P09QYEYYL20rD/AM2KkeJJmfvo
	 ghRSLOWa2ApRvfS+QhQonCbcLhZ9AdNXMt48kmocdjpIrCK7GHR679p8dG/I7kZfFD
	 AjJSOuq+UHQrxi435/F8FogFf6sxK+vSMno3lyHs=
Date: Thu, 27 Aug 2026 20:39:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev
 Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan
 <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
Message-Id: <20260827203934.329206587a04c9849e64c649@linux-foundation.org>
In-Reply-To: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
References: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 13:20:59 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just clean it up by working on
> argv[0] directly and avoiding the str_dup().
> 
> Nobody after us needs these parts of the argv[0] string anyway.
> 
> This patch is inspired by previous work from Anshuman Tewari [1].

This might be the most-reviewed patch I've every seen.

>  1 file changed, 1 insertion(+), 1 deletion(-)

Oh.

Reviewed-by: Andrew Morton <akpm@linux-foundation.org>

