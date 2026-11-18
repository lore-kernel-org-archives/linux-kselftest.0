Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962177;
	b=xc/dbOCh/S/IY5u0ANhL5S5hZ02a8FzfOS5to82Uoc1l6xI+JcbmEVJ8ACORFR34YaVa
	 csnCDPy1WzeV3Dery2UEH+wsQOiGRvOQ+6qMiqCtX8+5IiTaIv3PTVxi5d/VktsJE7zJY
	 Y/HDGNE3NbUE36wLCLwlxGDe7/QJTaDdAPlMxG7wT6GWMkTuOOi1IIAvQMWSZJQvPP47y
	 IgaPdwV1qyVnIu+oyh+Kkze472yhk9nWuPA3uBnacztdgWPDuz+qCckg7MzlSEmhb2W+D
	 60ShTbMSerM1/BvLeoTxTLmAfK0XzkUj8cvBd5hTSYlTyXNsFA47eJhXrCBMijEeBrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962177;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=r+p9CWsvki4gFWoEf4phi7R1PRk80mGP3t1GcsR85fk=;
	b=ov3jCsgPJrOp2LbaETi8MJD8w2q2AMgPIta1I3CYG7S292EF+kXkf67n6c17I19YRUkh
	 BBNge8DTyyvAAW44o1VjOgF9/Bsh/QzD0QyXQjXxoUOkiWuYHnCwahnW5BpglPkB08bvD
	 OqQbziDCwauvOZWlCl1yG6dueHuvfkFVet6fB2ppeE9w634bmQNAUqEqyt11Rkn4f5Jcs
	 lTosszjv1I3RYda6RRv/qWqhn6D2TmMdLc45Sd9jFKZSVvgqbXVTjHx4tv6bv5yhzST6Z
	 7LNhu4USTuURAf4d8RC3nWWBNp9DZLvmFSCvteaxiZ8CsZPwyOsiRUWzbN6/hEMBg7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WHXDdl/0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4AB606A882;
	Wed, 18 Nov 2026 00:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WHXDdl/0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C80A1F000C9;
	Wed, 18 Nov 2026 00:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794962177;
	bh=r+p9CWsvki4gFWoEf4phi7R1PRk80mGP3t1GcsR85fk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=WHXDdl/0EiLouLi+MGg08FvcqvqZP4js9AonYgqIzmzUe3K/XuplULWC+xJEwPygQ
	 QvifdtnAJEtyI6bcM9i72IshrE2dTnaDjFtXILMkioUxqh+f45QAshi8Z3DjjBsS3o
	 /pgvgpWi03BU4s0zfUOfHdvD0jWrMamvbKv7JcqCWcyu6vSEijFi+GZqVomEz78pDf
	 AwqF33in7XSuZ3WuM3378SNDogiZPh/C5JYmA5NqvB01j+9o/WBuWB0AXyidZTYGOc
	 8cx6E9Gnz+1UJyi2z6K1EMYCF+yHZX5pPbCDgzuZIGnN6blT2SXTSoq+KdCmVRYWu2
	 34ueIPw6CLNFA==
Date: Tue, 17 Nov 2026 17:36:15 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>, rppt@kernel.org
cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, 
    pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
    shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
    linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH v3 1/4] riscv: Call early_ioremap_setup() before parsing
 the DTB
In-Reply-To: <20261106071459.2003-2-cp0613@linux.alibaba.com>
Message-ID: <68812baf-206e-4916-faa6-78f8e7fa4433@kernel.org>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com> <20261106071459.2003-2-cp0613@linux.alibaba.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Mike and Chen Pei,

On Fri, 6 Nov 2026, Chen Pei wrote:

> parse_dtb() can reach early_memremap(), whose return value is composed
> from the slot table that early_ioremap_setup() fills in - and on RISC-V
> that setup ran after the scan, so the mapping came back NULL. The DT
> based kexec handover parsing is the first caller to hit this:
> kho_populate() cannot map the handover FDT and the handover is dropped.

This makes sense, but ...

> Run early_ioremap_setup() before parse_dtb(), as arm64 and x86 already
> do.

... this statement isn't right, since neither ARM64 nor x86 have a 
parse_dtb() function.  Better just to say that early_ioremap_setup() needs 
to run before DT parsing.

With that fixed, then 

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paul
