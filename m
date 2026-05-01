Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87A92D5925;
	Fri,  1 May 2026 17:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655753; cv=none; b=rq7Gd8hZle/DGnAF4oRXrQC3tHmbS/jw30Ty/TiqbU/I+lKuFffVYmBEq+5fD+KJ9DM8aFebbAxcfIUhjYdOmKXtmzSd70rHscXHiRuOaqQ/UiP8TcZGCLOTMPbQK/ZtNTOqawCkK/kcvhd2ECzJCy8sZ8TFJ4S+icn01sDRxc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655753; c=relaxed/simple;
	bh=VBfKfjpFRXFpsSPUWpVwQYKEyfMMNYFVVz7ZUushS/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bp2iMYwt7l5FKuqKyQpVLQ1cUx53dJo9HH3UR3y/pSy/aGy4w2pP0AmBScA6yC6lnuHKhaK0oQ8u1eT0o9j/SiExmlHhEOo6+TmS4f8gFGL/BJH3J86Tye3yzAUYMUbzt+G3WP4Ao828LQ34bjMPJMnbgoPNXsZd0MGTM1UdkJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=gqO6BQJ9; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="gqO6BQJ9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lmaggGKXjL+hs9vD7vyc+xo8l4bXJig4rJbrMoWWQLU=; b=gqO6BQJ9uH6K1zXtg5ggnRVHvu
	oiIcgkEcsxv/g4xDbCbSN4qwY3e/FBYUF4i0kAmaYisTW5GM9X0ubuwhLN1Ff8W/I2pr3Uf+ADGgH
	EpXZ9aG/WQXvDtORp7mVmvLL38EHjp3tIDtmZukdkNe7s9yiLl19WjAzhXABprcPVAIaKHptvaSjq
	svSin3Oh4H2Ph2++hbuIM8dOo9yVQ4+glNejcwDs/ZxzvPAoaduomrP7L0apMEsuzpfj2Tnc0me7q
	nmjr3HdAThIJGFw3x4dPmqsuocwe+SEFe4nptQVm+XkX/iifH8pMrADqdfDXhxtNUgpuA/+icz5pK
	wnJIOIsw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wIrSm-008jKB-2S;
	Fri, 01 May 2026 17:15:41 +0000
Date: Fri, 1 May 2026 10:15:35 -0700
From: Breno Leitao <leitao@debian.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 0/2] mm/kmemleak: dedupe verbose scan output
Message-ID: <afTfg_FOcj3J2kgv@gmail.com>
References: <20260424-kmemleak_dedup-v2-0-8bea649b2a92@debian.org>
 <20260424103016.4ad3219ae815e45de62cfaf7@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424103016.4ad3219ae815e45de62cfaf7@linux-foundation.org>
X-Debian-User: leitao

On Fri, Apr 24, 2026 at 10:30:16AM -0700, Andrew Morton wrote:
> On Fri, 24 Apr 2026 08:03:35 -0700 Breno Leitao <leitao@debian.org> wrote:
>
> AI review likes the kernel patch but worries about the selftest:
> 	https://sashiko.dev/#/patchset/20260424-kmemleak_dedup-v2-0-8bea649b2a92@debian.org

Ack! I will address then and respin, thanks for raising it.
--breno
