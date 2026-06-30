Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B28374735;
	Tue, 30 Jun 2026 20:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782850758; cv=none; b=d/Ws4NoU3owU1HNekyCzKi7fXSVaifN7qjSxt94rlhmRE+AgNqzGVWc8TcxTtMQDbu8om3Fr5RQEqhoTjBzzCPX0mrmxvP7iGSbeFxwkrGMXkTx4W9wG1oeC9KlcmTHfHzorAU61jYlGaD1UQiGRD6A1vg/RKrEsyAgzYzkmaLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782850758; c=relaxed/simple;
	bh=oxlRFg/iwbLML2nhonhDZJT/atpothAmrVWct/HQOlI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ex9Rvd3v7eAYMJQ5Inf2UQYCBWOWQ8Zl0fK6H0nIYZ6v/9efBJBgQ5fiGoWCMXF8rFVWoNV0V7X8bCrDKofLGo7Xh23coxuV0xTcOyl56DzYMNoy27a1AW7cwr7LNB7vOE+P8euKSRPNCJVYZRGWveDCLpalCHH2zTV7q+blI5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=w4MuhO2i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="w4MuhO2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DE81F000E9;
	Tue, 30 Jun 2026 20:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782850756;
	bh=xR+cURGiHZxqoJ7+yfUVxfoUewWAkloviweDWsdCuZ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=w4MuhO2iOCaOocWpVxUmI8FaSMXluXZ0p5jAAmsPH+pKjLCjTS8U6D2Zk48wmarIG
	 SMxVOeOraTWWq22L9/BZVYjMcqyySzEvQRko+1KrqvhYdk42pZw45Kk17tf5KO7Lwl
	 vgcwTbk/tyNvqy/70gP+BdsvCmoCfAMzcxTgIo5s=
Date: Tue, 30 Jun 2026 13:19:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: Liam.Howlett@oracle.com, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260630131915.a7a479fc92ad0b86bfc68173@linux-foundation.org>
In-Reply-To: <178283277041.183052.6873574850714079228.stgit@skinsburskii>
References: <178283277041.183052.6873574850714079228.stgit@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Jun 2026 08:21:21 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> This series extends the HMM framework to support userfaultfd-backed memory
> by allowing the mmap read lock to be dropped during hmm_range_fault().

Cool.

AI review might have found some issues:

	https://sashiko.dev/#/patchset/178283277041.183052.6873574850714079228.stgit@skinsburskii

One of these is pre-existing so please take a look, see if there's
something you feel should be done about it.

As the series is presently unreviewed, I'll await that review feedback
and/or v5, thanks.

