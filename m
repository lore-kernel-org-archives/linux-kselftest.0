Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648BA3B2D00;
	Tue, 21 Jul 2026 20:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667399; cv=none; b=EviRWk+leeRRGHRv3VdrEYuk2fKK+Nu0i3XIu+Yt3akf9rBwvCN/7Gq9DQwqXGzU2DCixkJmj6gkKmcM9hgCpvyYw0p4ZfCO6rpXALqPjW0YLCsyxrJnuIvUUx68lFHBwjM4bRQ9kNV4RrsZmhdAOcM8rnbtd9n8OjzXhzFUZ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667399; c=relaxed/simple;
	bh=bB1VNYj1QNBVBmm58qAK2nccQGkRvTkpFlGuEahedZM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sefav2CPW08PF+nK4iIXEmvp/kHMPd3RAhn5mxAkY0QYr/ffIkTRDHFlRGWkWbnURZ+dc9SirpgHfNEsvJyUIVSgmpqiLEiFkeN9lNi8U5IO2a07lFvYMpfMi1jFYa8qVee+bGGlU1bHQrnQekVvxlBn9T62UnYMIpIkWkfAqlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bARC/Yc3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bARC/Yc3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE3F1F00A3A;
	Tue, 21 Jul 2026 20:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784667398;
	bh=g5Fd2jM7aw+xFpo1T7JTnOjdu1gtY4/RonM2YJpRPuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bARC/Yc3m++5QBBMaTRPnJaoIq1a7rHMdIzf3K52MSvRPD+rjkwsJbjhjetRepYRP
	 AsyC42i2YxRW3TW/MuuHv0QtnI7tnN7btSTG4IWRBQ9pViO5eY1sxc9Al4JfxIImOv
	 0RGruqg9ROduBQGN2MmDSoWXr00h4wNWUvswJi7Zd/Da1D/TSJzQxKWaEWopPHQPPY
	 kQQ1Ea96LBFOTi4qzCkpymcu9zXPoVLHpzxK6AmhuAVaXfiUjjtdx7cnnl16Up/KYP
	 bzJzHtw+HcEKLgWBRAoZs8yut9MSkKzAWSKTFEFNKJb6uPOpXz3HqfJw4CZHA23wH0
	 XiTbGY7okS8Sg==
Date: Tue, 21 Jul 2026 13:56:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thomas Huth <thuth@redhat.com>, oe-linux-nfc@lists.linux.dev
Cc: Bongsu Jeon <bongsu.jeon@samsung.com>, netdev@vger.kernel.org, Shuah
 Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: nci: Fix wrong size of status variables in
 nci_dev test
Message-ID: <20260721135637.56b47743@kernel.org>
In-Reply-To: <20260710112300.512433-1-thuth@redhat.com>
References: <20260710112300.512433-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Jul 2026 13:23:00 +0200 Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> pthread_join() stores the thread's return value (a "void *", i.e.
> 8 bytes on 64 bit computers) into the address of "status", but the
> "status" variable is declared as "int" with only 4 bytes. The extra
> four bytes clobber whatever is adjacent on the stack, which could
> silently corrupt other local variables. Use "intptr_t" to declare
> the "status" variables with the correct size.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

This should go via nfc, I just sent a patch to update MAINTAINERS.
