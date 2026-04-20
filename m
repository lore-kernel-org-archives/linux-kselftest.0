Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AA140DFB6;
	Mon, 20 Apr 2026 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776669209; cv=none; b=Z0kmTPV9WfM3VFw+pjiI3o16quIO81KIgTShJWzzsI1diRl73YiHMlwSlTcpbsL+++hfeCY0jzzwDlJfwZQatPrmvYy/oKeERbRRjAWVoncBdZiZ++q/kBj15T3lr0/Adl7W41zIRRTWoLCUi9FxqQON2ZQlNMsAhX8WEi2RpoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776669209; c=relaxed/simple;
	bh=9eukM2C8gRicLu7CaCXCE0c9KR81w7+tGO0F3PmCFCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmpH3JZxFmkIAo1GTmkyhtME6wmFEYkJ4a+u1BD3UEauCG/2W3GUFwAJWoRer3Cr9paGEJIPeIAthXRQeII0A3kfWtoh4h0oT/QVxLaImNmb20TxsPSBa9V8jtq355EfBlt9cCaky7CnK3zOGtpRJX+wBT4CTsmEt8mx1Bvhm5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5Km2TZe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5Km2TZe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC7FC19425;
	Mon, 20 Apr 2026 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776669208;
	bh=9eukM2C8gRicLu7CaCXCE0c9KR81w7+tGO0F3PmCFCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5Km2TZeIdwP4xKxqDr3zA22JtgWHKuj5SC7f1P8o2qQ/+RpiiJTKY0wBk/oVmbdS
	 UV89bWG569ImZtIfED9Lyi/NcDP1Zd9YBc98hc/TOpngY6F2VbOReUTjjQ7xyCbi1H
	 Wc6s9x+1rpVRUVPfyG4cSZWb6f/RQQ2gFQn37ORUDhj55ckIP0lhN7y5LFL0z/gVOy
	 /QVCpveNacFpeWvBaOy/lIVtv7HOMm7WDd2+yESQAOHw+xPoIJGKbJmTRAVDozLFQj
	 wXBtjEQOT5LuqxXG3IYtez2S/K3Xd6wVpmEP7uuBL3e3c9RsiSCnISfaMu95brIyB/
	 xwusZV7SuUMZQ==
Date: Mon, 20 Apr 2026 10:13:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH 1/5] liveupdate: Remove limit on the number of sessions
Message-ID: <aeXSEe9Bo-vsSkMH@kernel.org>
References: <20260414200237.444170-1-pasha.tatashin@soleen.com>
 <20260414200237.444170-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414200237.444170-2-pasha.tatashin@soleen.com>

On Tue, Apr 14, 2026 at 08:02:33PM +0000, Pasha Tatashin wrote:
> Currently, the number of LUO sessions is limited by a fixed number of
> pre-allocated pages for serialization (16 pages, allowing for ~819
> sessions).
> 
> This limitation is problematic if LUO is used to support things such as
> systemd file descriptor store, and would be used not just as VM memory
> but to save other states on the machine.
> 
> Remove this limit by transitioning to a linked-block approach for
> session metadata serialization. Instead of a single contiguous block,
> session metadata is now stored in a chain of 16-page blocks. Each block
> starts with a header containing the physical address of the next block
> and the number of session entries in the current block.
> 
> - Bump session ABI version to v3.
> - Update struct luo_session_header_ser to include a 'next' pointer.
> - Implement dynamic block allocation in luo_session_insert().
> - Update setup, serialization, and deserialization logic to traverse
>   the block chain.
> - Remove LUO_SESSION_MAX limit.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  include/linux/kho/abi/luo.h      |  19 +--
>  kernel/liveupdate/luo_internal.h |  12 +-
>  kernel/liveupdate/luo_session.c  | 237 +++++++++++++++++++++++--------
>  3 files changed, 197 insertions(+), 71 deletions(-)

...

> +/**
> + * struct luo_session_block - Internal representation of a session serialization block.
> + * @list: List head for linking blocks in memory.
> + * @ser:  Pointer to the serialized header in preserved memory.
> + */
> +struct luo_session_block {
> +	struct list_head list;
> +	struct luo_session_header_ser *ser;
> +};
> +
>  /**
>   * struct luo_session_header - Header struct for managing LUO sessions.
>   * @count:      The number of sessions currently tracked in the @list.
> + * @nblocks:    The number of allocated serialization blocks.
>   * @list:       The head of the linked list of `struct luo_session` instances.
>   * @rwsem:      A read-write semaphore providing synchronized access to the
>   *              session list and other fields in this structure.
> - * @header_ser: The header data of serialization array.
> - * @ser:        The serialized session data (an array of
> - *              `struct luo_session_ser`).
> + * @blocks:     The list of serialization blocks (struct luo_session_block).
>   * @active:     Set to true when first initialized. If previous kernel did not
>   *              send session data, active stays false for incoming.
>   */
>  struct luo_session_header {
>  	long count;
> +	long nblocks;
>  	struct list_head list;
>  	struct rw_semaphore rwsem;
> -	struct luo_session_header_ser *header_ser;
> -	struct luo_session_ser *ser;
> +	struct list_head blocks;

Don't we need some sort of locking for blocks?

>  	bool active;
>  };
  
> @@ -147,15 +222,6 @@ static int luo_session_insert(struct luo_session_header *sh,
>  
>  	guard(rwsem_write)(&sh->rwsem);
>  
> -	/*
> -	 * For outgoing we should make sure there is room in serialization array
> -	 * for new session.
> -	 */
> -	if (sh == &luo_session_global.outgoing) {
> -		if (sh->count == LUO_SESSION_MAX)
> -			return -ENOMEM;
> -	}
> -
>  	/*
>  	 * For small number of sessions this loop won't hurt performance
>  	 * but if we ever start using a lot of sessions, this might

For ~8.1 million sessions this comment does not seem valid anymore ;-)

-- 
Sincerely yours,
Mike.
