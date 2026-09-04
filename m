Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048EF383982;
	Fri,  4 Sep 2026 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544095; cv=none; b=Bl2Ik2JtU28Br1vFSQSEjsz6YALUK74zTLAq7Qp6txacuhyOf1q7siHLhp4ETnpiwZMxfsvFOlaJXM3ANsVit+CJmAbgGAFXUyz+GqED3rPGk85SIj2OvXpAamuXr16pkCQH1uOTavDgubKznjKyhuVYoNFnZ+QREMOk/DIwnsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544095; c=relaxed/simple;
	bh=pXTWDZUZsrxrSiv0ahxOYwm9UTJfwdO3Icb1ba7lPhs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bdAZLYKS9eUCBf4aT5rfc7etJB9AgZbT9hmWRAcIPOYaASMbu6oHKbCqIeNGVPVCDhbQAdji3cQ/Rh1VYK9dLadfJqqIAETOdPWe0HsPBCQgEO1SMXBsy79zo2wd2vWZ3G9gO5mjgccKKJDsYSMzCCJhn9uLfC3/jEbuygbJG2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1DVOpPPx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1DVOpPPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2E81F00A3D;
	Fri,  4 Sep 2026 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788544093;
	bh=wwuIT48nl2wnt5VCrAZDGkue4mn1dh7YR6PN+cV+12I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=1DVOpPPxzkSLbFtjle+PtOznHhABGSJhkv2DgxnFnj6LT1TXj0jUKktiUdcbjy8Hb
	 uvic4tyS4/Wf9J33bxg0VuiBff8dLJ5QNKI6/QimDLiyJMUnD++BkSUfEB7oSN62kW
	 aFboO5zqWvsHgrsoCyppOOCvF99cYS2skJUyOuJI=
Date: Fri, 4 Sep 2026 10:48:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Song Hu <husong@kylinos.cn>, linux-mm@kvack.org, muchun.song@linux.dev,
 osalvador@suse.de, david@kernel.org, ljs@kernel.org, liam@infradead.org,
 vbabka@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Mina Almasry
 <almasrymina@google.com>
Subject: Re: [PATCH 2/2] selftests/mm: restore hidden hugetlb reservation
 scenarios
Message-Id: <20260904104812.7ee79803a10ab355ad2cdf81@linux-foundation.org>
In-Reply-To: <apqBn7tWDHQeMrzB@kernel.org>
References: <20260714021630.1063823-1-husong@kylinos.cn>
	<20260901173748.fb7a442941102894a0c42baa@linux-foundation.org>
	<apqBn7tWDHQeMrzB@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Sep 2026 11:30:23 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> On Tue, Sep 01, 2026 at 05:37:48PM -0700, Andrew Morton wrote:
> > On Tue, 14 Jul 2026 10:16:30 +0800 Song Hu <husong@kylinos.cn> wrote:
> > 
> > > A stray 'continue' in the main loop of charge_reserved_hugetlb.sh made
> > > the "more than reservation", "more than cgroup limit", and "multiple
> > > cgroups" scenarios unreachable, so they never ran.
> > > 
> > > Remove it so the first two run again.
> > 
> > OK.
> > 
> > > The third,
> > > run_multiple_cgroup_test(), is separately broken -- a backslash
> > > line-continuation breaks its local declarations and its hugetlb
> > > reservation accounting does not charge as expected -- and has never run
> > > in CI; skip it explicitly with a comment until fixed.
> > 
> > That's reasonable.  This code was added by Mina six years ago.  But
> > he's still around so let's bug him with a cc ;)
> 
> And this code breaks our CI e.g:
> 
> https://github.com/linux-mm/linux-mm/actions/runs/33040981840/job/98414290236

What do we need to do to view the error output there?
