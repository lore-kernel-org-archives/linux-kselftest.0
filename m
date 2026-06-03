Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0FE3932E8;
	Wed,  3 Jun 2026 06:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469380; cv=none; b=nlRTpBewsE+dG+0LtkSZS1mqEKtnrx/zSL2FUQGZ8frKTiy3Fw1rAUGb3essdPj+TJ4oOfSn0C3RsR/Q8ccpjK7QlxrJK/hldoOqNNZrziFxXeZmKKbQk6WJrTm/Ws5nvdYMFoU2zzPpQsmGkwauQBN6e/cIkd6Y5e++Sy2C8EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469380; c=relaxed/simple;
	bh=KUSXHu2dCJkwgvhkJENxSH0o4XrBv3CSgYY1YbayVbc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=VFCQuifzU/Y0VQpKkfRF4ICav69sq6AL2+iWThLkR97kAaGvX/XNydYcaHXjz9tgkC4jDc9AinAxiYHpeV8ZdOsj0MFyssgA63rb/5zNboXui+0m7yZtg0cP0OZLKH/pJI9vcWZltFi/53yHOk/lF7aX9V/gCGtj45xCkG9fsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6Nv8rIK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6Nv8rIK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CC71F00893;
	Wed,  3 Jun 2026 06:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780469379;
	bh=crii+t0f5mzLnKlzu0e4yXBuyqmERcK5UbHB2D3ZF4g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=N6Nv8rIKWJBny+CHLiEfswo8B9CE6GjbB4f082oZIvjQ8x4U2vZ6xI4MHdiYNadWW
	 aRJI/wiJ0z7XfcH80+ROET0WcWq8NGYl4RDxly+Pb1XHHCQiqM5qEaHxFfuRQYnfqV
	 ki/xPPZvgT5zld1kiNumyNIi9YhUw3Lg+LEpb1RvGlu3YCPPXEtyVmtd+a/V0TiD3E
	 Jfh0HQAtBZZMBw6fQsXQfV3NbrknaVB7bySHC9TNM6ZlwDHNQetxeSGTD8D45ewtUr
	 vIZaa3Mb1KveYE3YbiZLbvohTU30lsNDXy2+sBISlTbxMq6UogIcfLWQcCN61tq8HA
	 x2Lfj7vA5Kiog==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 07/13] kho: add support for linked-block
 serialization
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com
In-Reply-To: <20260603032905.344462-8-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-8-pasha.tatashin@soleen.com>
Date: Wed, 03 Jun 2026 09:49:31 +0300
Message-Id: <178046937151.468621.13398573538792303093.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 03 Jun 2026 03:28:58 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
> new file mode 100644
> index 000000000000..8641c20b379b
> --- /dev/null
> +++ b/include/linux/kho/abi/block.h
> @@ -0,0 +1,56 @@
> [ ... skip 25 lines ... ]
> +#define _LINUX_KHO_ABI_BLOCK_H
> +
> +#include <asm/page.h>
> +#include <linux/types.h>
> +
> +#define KHO_BLOCK_ABI_COMPATIBLE	"kho-block-v1"

It's never used by block set and after looking at the following patches I
found that it's appended to LUO compatible string.

While this works for LUO, I think it should be kho_block_set_restore()
responsibility to verify the compatibility.

>
> diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
> new file mode 100644
> index 000000000000..4f147c308e6b
> --- /dev/null
> +++ b/kernel/liveupdate/kho_block.c
> @@ -0,0 +1,411 @@
> [ ... skip 121 lines ... ]
> +/**
> + * kho_block_set_grow - Expand the block set to accommodate the target count.
> + * @bs:    The block set.
> + * @count: The target number of valid entries to accommodate.
> + *
> + * Acts as a runtime notifier when new resources (such as files or sessions)

Not sure I understand what "runtime notifier" means in this context.

> [ ... skip 11 lines ... ]
> +
> +	while (count > bs->nblocks * bs->count_per_block) {
> +		int err = kho_block_set_grow_one(bs);
> +
> +		if (err)
> +			return err;

This leaks memory if more than one block is added.

> [ ... skip 31 lines ... ]
> + * unregistered, allowing the block set to release and unallocate redundant
> + * preserved memory blocks. Checks if the last block in the set can be removed
> + * because the remaining entry count is fully accommodated by the preceding blocks.
> + *
> + * Note: It is the caller's responsibility to ensure that entries are removed
> + * in LIFO (last-in, first-out) order (the reverse order of their insertion).

I think "in LIFO order" is sufficient :)

> [ ... skip 173 lines ... ]
> +		it->i = 0;
> +	}
> +
> +	entry = kho_block_entry(it, it->i++);
> +	it->block->ser->count = it->i;
> +	return entry;

This looks way better than the previous version :)
Thanks!

-- 
Sincerely yours,
Mike.

