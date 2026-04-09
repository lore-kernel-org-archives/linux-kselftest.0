Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB2A3876AB;
	Thu,  9 Apr 2026 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738337; cv=none; b=u0Z0AUSzbyM5tVVP+C7aRnxDrWvVrPR2K88I7yEsBjxaw6YLkyQY4GKoNdPXy9yw2Vee9lzJtFm8i3CuPhexcCIDMO5Kil4uQyMAZ82+b52z2RN3Gn4N8U5ywxT7wydbh3+v2czeQ2A818PqAjCA8C57TpzzfY2qc1BP1FBPGNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738337; c=relaxed/simple;
	bh=S1UzqxaXEc/yIE0ufFwghwwUVw6xvXwfGs8iCXCKSJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzxEKM+AcChx8/W3wbPYVw3jCiTjC5GPin4ESNfGCZjNgytH3Djiw4F+xSoWgdw8HsNQRE5VQdQns35/1Vxb48mg3I81tWxzazsNVfdnw/ERn5jIRon08gC5w9y4GGmlEQ+uRYToaJYSnHCNACfEeWltqEUJ3026CQ/t0esTIsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4fn9Q4X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4fn9Q4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADE4C19424;
	Thu,  9 Apr 2026 12:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775738336;
	bh=S1UzqxaXEc/yIE0ufFwghwwUVw6xvXwfGs8iCXCKSJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t4fn9Q4XJQe3p+oZ+kJtet9UBjhDHwzuk/79owhpBPBCfJmayqSA4WmNiOQrrKNAw
	 LIDvKeWxhcy5QdHGIdxGNjS+NnUByasX+OJUdfsk0/0FGmDNVO3IkZATnwWOShPh1I
	 gOltWksTcRi75T6wBungyq4UQSuDb0YFpAkKg5A9QhQ4IHrOteT0H1mvZW0FcUu8Z+
	 YjjaYd1eEqwMt6neauUxdhD7OJzbfFO4xEBnVTz6OGYKq8HJ/IIRYUGOcRTR/litSJ
	 +4foUNO3RJFXQvZjQSqpYecg/G0lJEFL6ZuMiUDjuIPS/1T5mi9sm9SwaN5SWuLBVU
	 wl7xbxf7MjKyA==
Date: Thu, 9 Apr 2026 14:38:50 +0200
From: Christian Brauner <brauner@kernel.org>
To: Alban Crequy <alban.crequy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alban Crequy <albancrequy@microsoft.com>, Peter Xu <peterx@redhat.com>, Willy Tarreau <w@1wt.eu>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH v2 0/2] mm/process_vm_access: pidfd and nowait support
 for process_vm_readv/writev
Message-ID: <20260409-behoben-gehen-baeb1486fb03@brauner>
References: <20260408145436.843538-1-alban.crequy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408145436.843538-1-alban.crequy@gmail.com>

On Wed, Apr 08, 2026 at 04:54:34PM +0200, Alban Crequy wrote:
> This adds two flags to process_vm_readv/writev:
> 
> - PROCESS_VM_PIDFD: refer to the remote process via PID file descriptor
>   instead of PID.
> - PROCESS_VM_NOWAIT: do not block on IO if the memory access causes a
>   page fault.
> 
> v1: https://lore.kernel.org/lkml/20251118132348.2415603-1-alban.crequy@gmail.com/

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
