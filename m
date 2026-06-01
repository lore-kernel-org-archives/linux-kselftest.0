Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51564360ECE;
	Mon,  1 Jun 2026 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316119; cv=none; b=eZF6zZgDMi8zZxEYExfb7SJBo04T2ZUSt6qdng9ExK1LyRUAJvD2iP7VrsakDwTWLNkaIA+E7zFDyXJpvULPQmVmcHXV0rm1JAGKRW++7dtvA5Su7ZCh1sxGab4j9UoF9EH0oYWy2xBU7wO0rg43wwBSpOkG23mfG8F5aIF3UFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316119; c=relaxed/simple;
	bh=8aAAxCo0OVmKdImGGzRw7frD/exAFd9BKLDu5RkH29Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UjKRHSzod20+rdtC0eRWH97y50Inatqn6wkvUN051dlOvmR166qhoterUj3HHWp08DfYNiouudSaHBTvEGZ4LUtJrQzrCJdJeqHnoemtqERhzqul2NhbmHhHQm/bIwMDWkH6vNwHNGSzSV4KrpR5BjJSoWv6RZJnO0QJwbI2VdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrLGr0LC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrLGr0LC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7B11F00893;
	Mon,  1 Jun 2026 12:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780316118;
	bh=ltaXiFoo1nairUBpGpJ8j/GAOTH4OfEDT0rk/sDRyic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LrLGr0LC0lZ73GBlsNqoWTij/nowRsxj8FcJtxGy/x3vJbBGSFfxhCHJ3TMxPXTMT
	 0l/fsBT3+ZQ6P1KG7wGVm9h3EuXxXAZp8vIPj5l5pX6Pr+anZGp7Hh3nhmvIp3TTvk
	 DS2+wYZwNDCpfNg4pLx83G4y+Kxtmn5QvYwDxqAAcnhoV3TNbztDhfedUzdD02y3ff
	 3mAMVOGycckc+PHcLi3GJuwhqiygfQDjtvAT2rWr5vEWcJ0GudPJVLdh7MDzWWmAU/
	 YjJi81zfqwBHk7JorK+28N/GZ3am1L1UaaB613UCfuge+P6IY51C0aZlpR1PWWIK3K
	 eucUyEKcXQ5wA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v4 02/13] liveupdate: avoid mixing cleanup guards with
 goto in luo_session_retrieve_fd
In-Reply-To: <20260530221938.115978-3-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Sat, 30 May 2026 22:19:27 +0000")
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
	<20260530221938.115978-3-pasha.tatashin@soleen.com>
Date: Mon, 01 Jun 2026 14:15:14 +0200
Message-ID: <2vxz4ijmh2y5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 30 2026, Pasha Tatashin wrote:

> Refactoring luo_session_retrieve_fd() to avoid mixing automated
> cleanup-style guards with goto-based resource release, which is not
> recommended under the Linux kernel coding style.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Perhaps we would be better off moving to FD_ADD() at some point, which
should make this a little bit simpler?

Anyway, this patch is still an improvement, so

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
