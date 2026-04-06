Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F144391515;
	Mon,  6 Apr 2026 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505095; cv=none; b=CJeXIPybBIBoZtaBB7UYQsaElaNqHACPCnIO05acueNb/SxYe1RAIKi1rKmTjye2AQ0hdfHj+fSo1AfiImhZlWZK3aKJ3gT2eYwrdH61JX3+G4/vkGi1iiCxXo0XJk3mZOrUYtjX6Tc4AHGHH0ERpJz+ZjhjCPSLzLM0nm0P0ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505095; c=relaxed/simple;
	bh=GMwjYkUhm6drJVHlYbtmPfNPSlWMffmCjzdHMomgceA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sKF5m3LtxtDpDlck6ggu9sAE6OPuYEg7wDif+cE71xndentOEd0OKcuppVzM9eUL+1j0QxOseM4SzojTSWICDi3M/xWd/2hPTdHml4M2uFQXo8bBgtqkGNipeWATMNJr/mC9roR7oJeScVKInGkg8X4DIoVaKri4oP8BonIpxl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vWKRGODw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vWKRGODw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADBBC4CEF7;
	Mon,  6 Apr 2026 19:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775505094;
	bh=GMwjYkUhm6drJVHlYbtmPfNPSlWMffmCjzdHMomgceA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vWKRGODweREmOy5SZDLzFpguFGXXFlLktCpHdyvBoKeVvjP6hiSj4AA/TcNQnQbMd
	 Q2KYUjztPIKF2q4yWnUcDbp9nC6nXARbFRsMcCoiAdqSerLKUJwFtAX7F9zBqEIS9K
	 2bRU/gVmq5lkdhk4f/L9pkJ7lWrJnC2mn9GNmHyg=
Date: Mon, 6 Apr 2026 12:51:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Li Wang <liwang@redhat.com>, nsc@kernel.org, david@kernel.org,
 ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] selftests/mm: clean up build output and
 verbosity
Message-Id: <20260406125133.eeb8efed993ae1faa2a9ad73@linux-foundation.org>
In-Reply-To: <20260406193216.GA1319599@ax162>
References: <20260331094402.144131-1-liwang@redhat.com>
	<20260406193216.GA1319599@ax162>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 6 Apr 2026 12:32:16 -0700 Nathan Chancellor <nathan@kernel.org> wrote:

> > Second, the specific 32-bit and 64-bit compilation targets ignore the
> > standard kbuild verbosity settings, always printing their full compiler
> > commands even during a default quiet build.
> > 
> > Notes:
> >   Andrew mentioned he hopes this patch merge into kbuild tree, so I resend
> >   to linux-kbuild@vger.kernel.org.
> 
> Kbuild does not maintain anything in tools/, so this should go through
> either the mm tree or the kselftests tree.

No probs.  Li, please send it along after -rc1?
