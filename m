Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F061CEAA3;
	Fri,  3 Apr 2026 19:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244681; cv=none; b=r7O1cK71egPNgw5cejSa+7MhJa0Ql/mi7wOPOa0voLxRTV7SMT70rXYMb/V5s23XfUux8jFp/93bmG7lvL9Ae/jEesA8D5xggHP16R8HH4/eO7FJzkC2WdmkulqUHwFnZcq+7yYpXEykxaCpza2nd+n73NsW9JbamRbfxcJlj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244681; c=relaxed/simple;
	bh=SHFHqC8w2kUQwRe6EmPocABGOxkTrKhHh+l6fkBMYbY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DbNij39YFycIl9LQFkNsIws3uPiPvcbQto5WD6cb+acNNL08/4+diiDJEqo8rflDoVBrzgbNjyFrW9vIrLhgqShoLj2dELK911NhVLmlEKHDbk/jt5bES85+JoVP4yoS4hyYG0hOuwXqBLwQaHhPoGLiZhcT/ces6+zlJo+n7xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EGIz2L4c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EGIz2L4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5C1C4CEF7;
	Fri,  3 Apr 2026 19:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775244681;
	bh=SHFHqC8w2kUQwRe6EmPocABGOxkTrKhHh+l6fkBMYbY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EGIz2L4cevKoCrFnVhvj8ZfWMeuWaRcR8OymVhhZlE8vpRocla36JkC8xjsx8VMfr
	 8REMVw2/Ie79jv89WKQ6WJGmUTs7V2HHK24HZ/0p592YfA5nscObDDbCMVB4lzVUyW
	 Y8aBIRMPqursfMdncdS49L5OSsbJzfkBBXFY1nIM=
Date: Fri, 3 Apr 2026 12:31:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, david@kernel.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
 Jason@zx2c4.com, shuah@kernel.org
Subject: Re: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot
 be locked
Message-Id: <20260403123120.82cb5becb19e1b572d474394@linux-foundation.org>
In-Reply-To: <20260402235933.10588-3-anthony.yznaga@oracle.com>
References: <20260402235933.10588-1-anthony.yznaga@oracle.com>
	<20260402235933.10588-3-anthony.yznaga@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  2 Apr 2026 16:59:33 -0700 Anthony Yznaga <anthony.yznaga@oracle.com> wrote:

> For configs that support MAP_DROPPABLE verify that a mapping created
> with MAP_DROPPABLE cannot be locked via mlock(), and that it will not
> be locked if it's created after mlockall(MCL_FUTURE).

There are a few queries from the AI reviewbot;
	https://sashiko.dev/#/patchset/20260402235933.10588-1-anthony.yznaga@oracle.com
