Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBDA453495;
	Tue, 31 Mar 2026 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991836; cv=none; b=FhN/+yQJNmfvDVG7mjaKwqpNEQ5KtnD56TDktQgwe0WVJ6WQmAHYjfCROjUWDZBszHaWt7bgVZSzDxGzr378+mchpz0kqu5A1irv/ueacGXnHsrhJ9ZI7mREZk+ssBNll0n9+xYwQhuWp7ldyPlhE39ND+Wf4cusxQNEME/Xu00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991836; c=relaxed/simple;
	bh=dXkrTSSnhDWqtHKoSdOUNn0uoqn4H6W1UrZQGBlydUo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cJkTqLkFHQveyPrI/VF6K5L9tmQJMh0KqKiYggN7YmmQw+8C/4cZCeDruIxUZ51PVNUFECtKskyd9oL7+74MSObq8ZvDN40TmDe602qJPDXHyjzbuPNUF6mLdhUtqDollv2MIBh73Ix9gDjdXqlrCgzJ27QrTwjlOSivpwU/+8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gXIXNSNM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gXIXNSNM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7EAC2BCB0;
	Tue, 31 Mar 2026 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774991835;
	bh=dXkrTSSnhDWqtHKoSdOUNn0uoqn4H6W1UrZQGBlydUo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gXIXNSNMmkoVNor9lok/efYhi7AraY/lYzc+w0MPepa2npDYVjVfV8csr2TCIpBNv
	 ThjAsNgNiorsLVCRlHHDsuw8K29CLmiv0sUibMV/QXcEEd0zDdYklj3Ia+z9xrqBa4
	 ebjQqsweArLhapmphHovf+Za9Br/fDeMRTOyH6hw=
Date: Tue, 31 Mar 2026 14:17:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 jannh@google.com, pfalcato@suse.de, Jason@zx2c4.com, shuah@kernel.org
Subject: Re: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot
 be locked
Message-Id: <20260331141714.b2f4e41b494060e55610a5f3@linux-foundation.org>
In-Reply-To: <52bec9ea-5627-4ea2-8f27-f1729957fa47@sirena.org.uk>
References: <20260310155821.17869-1-anthony.yznaga@oracle.com>
	<20260310155821.17869-2-anthony.yznaga@oracle.com>
	<52bec9ea-5627-4ea2-8f27-f1729957fa47@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 31 Mar 2026 14:17:50 +0100 Mark Brown <broonie@kernel.org> wrote:

> On Tue, Mar 10, 2026 at 08:58:21AM -0700, Anthony Yznaga wrote:
> 
> > Verify that a mapping created with MAP_DROPPABLE cannot be locked
> > via mlock(), and that it will not be locked if it's created after
> > mlockall(MCL_FUTURE).
> 
> I'm seeing a regression in -next on 32 bit arm which bisects to this
> patch:

Cool, thanks.

> ...
>
> All these failures which cause the entire test program to immediately
> die seem exceessively strong...

Well, is the test code incorrect, or is the patch which it's testing
incorrect?  That's 5435ba164b0d ("mm: prevent droppable mappings from
being locked")?

5435ba164b0d is presently in mm-stable, cc:stable@vger.kernel.org.

