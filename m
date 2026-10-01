Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5FB501F29;
	Thu,  1 Oct 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852817; cv=none; b=ROm7v0zlzuZuvJd5dtB3i3aAZ9D0tYez5A1xL9oiKuy9EKAhAosGqDLCBCvFRXrePY8dWi9g1//mGSsUmlzAp84yMIqX9u68nZxmwRklwhSWoesANYAETxGrHZ2vrr4YboF4dA9uSm+CZr26iKKhfF07JZk/Tu4aQC0VKhmQMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852817; c=relaxed/simple;
	bh=tAQqtrJBE7Ko4/xRfW80wygky66q8H6fLYYYsojsIOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AO5pIjQxrtILGFyRMXwIoUgt8+Ohck7dsIvcn0KOzyquTzRIcLVEXnnnqMkRtMPY6/Uq11KE7jKTjwv51HCwicSv3wDv3WS7bCBpUYdCZ9UWPKU2YHuyY4YmGIOL7JIY+vIHXnkXWZSIHyAC8d6IZWUR0WbNSMA+ejdntC+egD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqZk2SZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqZk2SZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116C31F000FF;
	Thu,  1 Oct 2026 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790852815;
	bh=CkXuyHSbtVf4eYHlPuWTnVc0hAJ85ieRSImmWIYe7/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TqZk2SZ/8pigdRKHqYx0leDaHTQMicntgZgVWLIj/8lyUDWVcCxo2ayEdd+gg0geh
	 lU92zvlhLMZNr3NNjlFOp/Oekg9VzaUVc3T0L6z3VNWI0xNRwTgcA1XHJdYf/4FP+j
	 7ZDv8Fzf3ygiXZ9aGAbEFkeX5PJuDdWLg5lYgOXH1+wx8UafefVWrpEOz5hACzdv8E
	 flzBLVvshzqJrHgxgKEIraQdDlNSHpSoOjt2A11kbg9N9AHbZqeczL+5T5R63LW/F9
	 wB5J7nZOK0RILQNXUNmgE9wq89o/fLLdXB2MrB1Fgw/Fk+5CaPXSlE7ZVoS49ySMVc
	 LJh7EGRfSfvcw==
Date: Thu, 1 Oct 2026 12:06:49 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Aveline Noir <jm5905938@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Christian Brauner <brauner@kernel.org>, Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: mrelease_test: fix retry limit
Message-ID: <ar4-wT278zc2Fmh8@gremlin>
References: <CANOyQmFzsssM_BXHUDrV+UuVD5SZMBmSkg3UQnmw9Ns1PV7GCQ@mail.gmail.com>
 <9a6a1c15-89aa-4504-8585-0f7861c3377b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a6a1c15-89aa-4504-8585-0f7861c3377b@kernel.org>

On Thu, Oct 01, 2026 at 11:47:01AM +0200, David Hildenbrand (Arm) wrote:
> On 10/1/26 08:00, Aveline Noir wrote:
> > mrelease_test doubles the child allocation when process_mrelease()
> > returns ESRCH.
> >
> > When size is already MAX_SIZE_MB, the current <= check still allows
> > another retry, causing the allocation to grow from 1024 MB to 2048 MB.
> >
> > Use < instead of <= so the largest allocation attempted remains
> > MAX_SIZE_MB.
> >
> > LLM used in discovering bug. Changes were made and reviewed manually.
> >
> > Fixes: 33776141b812 ("selftests: vm: add process_mrelease tests")
> > Assisted-by: LLM
> > Signed-off-by: Aveline Noir <jm5905938@gmail.com>
> > ---
> >  tools/testing/selftests/mm/mrelease_test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/mm/mrelease_test.c
> > b/tools/testing/selftests/mm/mrelease_test.c
> > index 64e8d00ae944..a5124c9e9f43 100644
> > --- a/tools/testing/selftests/mm/mrelease_test.c
> > +++ b/tools/testing/selftests/mm/mrelease_test.c
> > @@ -157,7 +157,7 @@ int main(void)
> >  		 * Retry until we succeed or reach MAX_SIZE_MB.
> >  		 */
> >  		if (errno == ESRCH) {
> > -			retry = (size <= MAX_SIZE_MB);
> > +			retry = (size < MAX_SIZE_MB);
> >  		} else {
> >  			waitpid(pid, NULL, 0);
> >  			ksft_exit_fail_msg("process_mrelease: %s\n", strerror(errno));
>
> Makes sense
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
