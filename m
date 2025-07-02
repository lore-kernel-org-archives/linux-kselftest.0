Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41B2E92A9
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Jul 2025 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467427; cv=none; b=c1ZDGDuDbxkx0FIiSbXlkPWzHF4PQbkHY4RER7s5xr2NV5+bzbtmBcMuv8DGp4nmE9UrHOGNb9pPAZwet21FoKlPqQ57u4avNKcAhepxaKjgh5lMlpfSUlcE/rfPyUvyVhQV7uebm7tYopxeyoxtcYTbwEwdRSFsWvvtdxEp2ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467427; c=relaxed/simple;
	bh=43pDMyNOCKa79U0Do3mjd5FGHY7ZmX47Ylj4IJlRccU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMhFGCEiOvySCqi4V8gBk4jmBoEu6kpeol3QVbMd0WHnhYSlFXA5LvPfJnZ86kcNrJCip3MRpaSX15fch3fP3I8iWFkD8kqHoVnrwJl7FbY0WZj9l1fjGGHh9wiNXiABgyNVONAmwg+UxWSyn2nGl6jt7pQRP+sV8XzSE0LlB2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tMB35wON; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tMB35wON"
Date: Wed, 2 Jul 2025 16:43:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751467413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hLpYSU2x8Yb+ms57gtIv5GTWsp2J7egzMbr/41MK58A=;
	b=tMB35wONgUnX/RY8EVbuddM+tRjah0aNJvRs+zfhzT1twzs8JGQJGtXLMmTRAO1CotFCXJ
	4VcTz0f1nBwFkYeTYEyrB10GABY5bd6THfn9xaZt8C1zEMT8JfEn9VnBUvNC1O5elFTtEm
	nYNAfSccXsd3E3EdauPmjNKdkCN5K+Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v8] riscv: sbi: Add SBI Debug Triggers
 Extension tests
Message-ID: <20250702-398267de396e3a03f6d3982d@orel>
References: <20250701200047.1367077-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701200047.1367077-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 01, 2025 at 01:00:47PM -0700, Jesse Taube wrote:
> Add tests for the DBTR SBI extension.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>

Merged. Thanks
