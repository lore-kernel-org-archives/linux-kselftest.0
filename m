Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007BE40DFB5;
	Wed,  1 Apr 2026 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075244; cv=none; b=rOiaRRD6CZT+9ovDCZsr8a4pILPaf+qa0gM+3nKuNigvXjytA4jqckWmF/seda8L8cquOfUo0sP9ALgaTOj8/IV5Awxaw9zt71GCp9xCkaZRAFIYgKJj0nS5qwwqmL11Qhi97Ar3KP2Lsb6BIDlo4jGHM+Sfg27RprWhq96rlLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075244; c=relaxed/simple;
	bh=OWtKm95laT3U6i3fhcBOR5W+DKz0FEB3jZZILO5nH8A=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XpyZ3u1hGwVNXNi5NsWl4Hgpdx3HZWTxsm19jGC7fVqM6++p1VWO8Y48d7tgYjA6ax/Cc5ZG47Gu8wMOM9+dlxo+PFChWIXNIwXHZG9GyoVN89nJBQDdCsEAfWuveDJgyorry0I/aA6YQ2UQiofK+nGgMikFxWWjR9BIUUJxjBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Uws9wjJE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Uws9wjJE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C92C4CEF7;
	Wed,  1 Apr 2026 20:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775075243;
	bh=OWtKm95laT3U6i3fhcBOR5W+DKz0FEB3jZZILO5nH8A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Uws9wjJE8a6LUlC1K75cOrahSIa88MlVL/cOcGuUfmc1fIrG9KUDszDZkHNbCl0c5
	 7fg+sHAYKj2SjgOTbgnX0K9/5vfXssNMrRMlEuipz5giV8UMy0BiZsnKd9TrQ7yX2U
	 0FS7eKqnC8rVi0MtpnmgZSNg+gx/mfFft9Y/l++c=
Date: Wed, 1 Apr 2026 13:27:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 jannh@google.com, pfalcato@suse.de, Jason@zx2c4.com, shuah@kernel.org
Subject: Re: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot
 be locked
Message-Id: <20260401132721.ef6c976eeb5e50b0cf6bb635@linux-foundation.org>
In-Reply-To: <d20a7a98-2bc7-48fc-b467-21eba8df89a4@sirena.org.uk>
References: <20260310155821.17869-1-anthony.yznaga@oracle.com>
	<20260310155821.17869-2-anthony.yznaga@oracle.com>
	<52bec9ea-5627-4ea2-8f27-f1729957fa47@sirena.org.uk>
	<20260331141714.b2f4e41b494060e55610a5f3@linux-foundation.org>
	<d20a7a98-2bc7-48fc-b467-21eba8df89a4@sirena.org.uk>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 1 Apr 2026 12:17:30 +0100 Mark Brown <broonie@kernel.org> wrote:

> On Tue, Mar 31, 2026 at 02:17:14PM -0700, Andrew Morton wrote:
> > On Tue, 31 Mar 2026 14:17:50 +0100 Mark Brown <broonie@kernel.org> wrote:
> 
> > > All these failures which cause the entire test program to immediately
> > > die seem exceessively strong...
> 
> > Well, is the test code incorrect, or is the patch which it's testing
> > incorrect?  That's 5435ba164b0d ("mm: prevent droppable mappings from
> > being locked")?
> 
> I've done no investigation on the actual failure, sorry - the comment
> above is a stylistic/usability one about the test program.

Thanks.

Anthony believes this is a problem in the test code, not in the kernel
code which is being tested.  He's working on the test code so I shall
drop the current test code from mm.git't mm-stable tree. 

That's 6235dbcce97f ("selftests/mm: verify droppable mappings cannot be
locked")
