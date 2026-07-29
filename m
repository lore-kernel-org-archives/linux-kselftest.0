Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54723EA97;
	Wed, 29 Jul 2026 00:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284836; cv=none; b=dqUDb5yoMpxSJj2fpgE0RLNSgCEzzKuOB0zKITDP4ToSqozrsCJ5Q03t6p5WWtvahEo/XfOMbY3pOX1yRaVpp00EDfGZ7UFhoL1JZBeWrBwKGTv6udxcWxWBNI1eOB89CXl+cQSs/ALMyppN4D2IRyRweGSkUxCMBR7FiZcJKCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284836; c=relaxed/simple;
	bh=3JcQaPM6+jG6GacafVY3DlCKSUBsEsmwTaj0d27hsds=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SRsWpljbMwkwQcamA37xtkI+ME1JJ8Ena8gTGZ1aVdwiDoFngk/C523omk3uxxVy+LEv60Nrobq8RHspWhcDEqBeSsl0pUMRNnv/QxfQ8ToJyQjC/cR4zqz2qnWCpkFMccf1twqa3jaArMH0YsEWa75WZCV/4rCFntDgRY50thQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IWBER/3H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IWBER/3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0AC1F000E9;
	Wed, 29 Jul 2026 00:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785284832;
	bh=dyB0Yu4EVdbHNSEPMIzknM0zizNklp7o5QWt0/JKJQs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IWBER/3HP0xqx+38UtSkIWzxm/kne84BqJKMbyljhzV2s7FqK/UQ7QXBgxLdeiNVu
	 VCK6mSRGkNicgzCMPTGIguGMbHYYZBCSkUNG0Zmf8Kf00+a2mXkGeyR72GpvqPAlMj
	 I+q3PXFp33vOGg3AiIrOPrlo1FDsevMt5y8P5S4c=
Date: Tue, 28 Jul 2026 17:27:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Chris Gellermann <christian.gellermann@codasip.com>, brauner@kernel.org,
 liam@infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org
Subject: Re: [PATCH v2 0/2] selftests: Add missing initalization of pointer
 passed to getline
Message-Id: <20260728172712.c21b2959d36f3e2d42cb73a3@linux-foundation.org>
In-Reply-To: <580fc92f-f146-4d76-85ce-6555cc3bc47c@kernel.org>
References: <20260526113848.530105-1-christian.gellermann@codasip.com>
	<20260722130246.2135563-1-christian.gellermann@codasip.com>
	<580fc92f-f146-4d76-85ce-6555cc3bc47c@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Jul 2026 21:31:39 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> On 7/22/26 15:02, Chris Gellermann wrote:
> > Hi there,
> > 
> > just a gentle ping on these patches. It has received an acked-by from David
> > Hildenbrand (arm) and a reviewed-by from Lorenzo Stoakes.
> > 
> > I'm resending the patches as reply to this cover letter to clean up the previous situation.
> > 
> > Let me know if it needs any further change.
> 
> Have these been picked up in the meantime?

Yup, I added the v2 series to mm-hotfixes-unstable on Jul 22.
