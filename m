Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884121;
	b=5kmHIRFfIj+e5fbDeNU6FkRewDE/Zv+8lhK3LXDjupSrQvOV4dZWPY3KTFUG32UCJgA7
	 XxiJi+iYmteVnR4YNd9YUnxTWlZZkEzbtSbRaMjPbNXc3lUpC4f5DcGmBzMCBkTS6ElB4
	 F4lL0XTq6CZuFdt0Aje4Fwr+rghVI8PUPzYSuf/ZI6WkiNMicspHSPqq2RU+e1Z6hiQgt
	 FB1VSsnty61EB3pwkoWRmuMvN9YD6algOe5A+4rMopQCTjQzH4kbU0/f6umylGPZE8Mrz
	 ldCXLGEiU7Uj/2T49fVctCGwHscTB3N7lyaFI/T1A2COF48aKPOKlLB/9cq6wjG1P9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884121;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IUFbDY3pG95AdUR3ZaQpG0DNzZe45Lp61GslC9VgxTQ=;
	b=qstC7X4OwgblFWWyqqsE2s7AppfVpy15S7UVAti9fSu4JQkPMrUUV0Yz5cLhfqJDnfTE
	 k0iGfPnDj9wproOh35pfdv7mAurHhJ4ePnUil3W1OQNwT77mQDVIc3KewqdyV8NJ6kVxC
	 Q7wHOuIr1GCb96yDhRsDNGAYX13pNm3yPnho8n6dz39qDhz+KPrK40DvyKwlZlgARkZ2X
	 b5oTxAPhjwl/Sekc/1hSlN+leRGfNX8TT4nfsSyyW+m4SMQryAx2r4x7dYhBCb9dq+70b
	 z/jMNtN/63k9nzTcNXpe/Pq4RimcQay/ml9GIgNuB6YpCBHswGUi4CI/+1uGfYA2ffw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z3imFrBR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6FF606A338;
	Thu,  5 Nov 2026 13:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z3imFrBR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD87E1F000C1;
	Thu,  5 Nov 2026 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884121;
	bh=IUFbDY3pG95AdUR3ZaQpG0DNzZe45Lp61GslC9VgxTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z3imFrBRIo9t9Yz/Ltm7Ff8+nHDcN7NYtOjGSxZGcWd897KE8A/Sq4V/CqIvLv871
	 H/suoek4i9utHo9fCiOZgX5jaG/9bkM/yZutRwIroOlp2K38ZKl+oGX6EH9lJE5rb2
	 qyaG6ck7YoNqmzqlqBJJ2EB3YtU1lXrPG6aLcUGtmaBTvTkgZuM4WZuNdNu7GNXoCq
	 lIsMQMLpqj7ajlDCYv9m00MsHmhetq3I0LQH4pQ/fE27QcvxpOU9zJ8JKezGyYKO9t
	 793Cmut5YeoKWxEEZNvI/v6a9jEhC/D5rTokAWBTazmFQuTVVjvv0idbbMPJXJwj1j
	 pUOqQiynQ7iIA==
Date: Thu, 5 Nov 2026 15:08:33 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
	pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	shuah@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v2 4/5] selftests: kho: Add riscv support
Message-ID: <aux_0Ye5Ny2GjPB5@kernel.org>
References: <20261103080926.2079-1-cp0613@linux.alibaba.com>
 <20261103080926.2079-5-cp0613@linux.alibaba.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103080926.2079-5-cp0613@linux.alibaba.com>

Hi Chen,

On Tue, Nov 03, 2026 at 04:09:25PM +0800, Chen Pei wrote:
> Teach the KHO vmtest runner about riscv64: map the target to ARCH
> riscv and describe the QEMU virt machine, the kernel image and its
> console -- a 16550A port probed from the device tree on virt, hence
> the SERIAL_8250{,_CONSOLE} and SERIAL_OF_PLATFORM symbols.  Also
> select CONFIG_SPARSEMEM_MANUAL: the runner requires
> CONFIG_DEFERRED_STRUCT_PAGE_INIT, which depends on SPARSEMEM, while
> riscv falls back to FLATMEM (no ARCH_SPARSEMEM_DEFAULT), so without
> it the test would just be skipped.

We can read the patch, no need to list everything here.
The changelog should focus on "why" rather than "how".
 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
> 
> Test: qemu-system-riscv64 (virt, -cpu max, TCG), in-tree runner
> "tools/testing/selftests/kho/vmtest.sh -t riscv64" (boots the Image
> and kexec'es into the same Image).
> 
>   KHO: found kexec handover data.
>   KHO: exec from: 7.4.0-rc1-next-20261102-00005-gfca49e548231 (count 1)
>   test_kho: KHO restore succeeded
>   ok 1 KHO succeeded
>   # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
>  tools/testing/selftests/kho/riscv.conf | 9 +++++++++
>  tools/testing/selftests/kho/vmtest.sh  | 3 ++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/kho/riscv.conf

-- 
Sincerely yours,
Mike.
