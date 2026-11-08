Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136620;
	b=eh5ALWwhTjnuSmWpp4IJj7VDzppZUBkTYYJa9SFcEURiUZi55vHTbAtYjl3C6tDzgQid
	 EbdL5+cJue6oQI+r/nD7b4uMjG9YDftLTe136SFUxObX2GIS2lltv4hi6DjDmpi2ye0Fz
	 oYff0KpRO7a3puUNE23UnPVBdcH0yEqWVTX65jz1Nmo7BHje4+uutCXyKUIoIIn2rQZy4
	 a7kIA5AppWYWwRrOtPhqkb4ygHkHKBwCKspRBu/rCGqG607ChmUd9rzryX8pfoW0Hrp3D
	 578PXHKYGin/pnlNmdj+bYR/OIRDolKvc+3iYNldmZwVShlARJRquJY1GAJAHHpijvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136620;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=18sr8SyzOZMx8xWY4iklgq0foK8c2ImoU5MT3WMNKwA=;
	b=iInvaGKMdGyOrPhEOoUiWzLJYC7OYkgrHHRmXjf4aMb9y0ay5Anm+HbIzLMLAECiYDJJ
	 eT8LgfQDbUnQNSh5li8fkfMf+FlTYG4vjZpANins/9jjSbFIbF5Jibn4tSfXDdma7IiFw
	 nW+pW+tXi2Snqt6DW4SJ61CD7ENbBO9PLIhlhFB34Agj27lAHNidFAPxsX5xce+uxUJdM
	 LxVENR4viMdhwI567FaStEtcy/QKNlwWp6ha7DcJhzNLDbdtQtzbx1r8Ko6rkyW7RBegC
	 dQRW0vUyRhoKKoTamE+ThHH4HLeME/hjKkOeTX0pF2PV8pMbCBSksv8AtERg6jmSMWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjXUB23F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20D606A336;
	Sun,  8 Nov 2026 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjXUB23F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141BB1F008A6;
	Sun,  8 Nov 2026 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794136619;
	bh=18sr8SyzOZMx8xWY4iklgq0foK8c2ImoU5MT3WMNKwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NjXUB23FMioSLJAxJrR1OG2vEEyBmNcETTcQBhxP86pvaRAPQDlQDACTFYDEOBfsJ
	 11lBYuNqO0IOkffu33mynJ/20vIUM0KoS156ybm1OCXxUIyBygpaUshG9fObmvaWE/
	 wyJNv1Mps2MREvOQ1QmOLIux7m+ArsojvdXmRKJnNdYHlw4K//V+Fj5lxboeHhvgjM
	 zS9SVK7FyN5UhOatl2m4+UXL/SB+vlhzFwy8x0/0rceaAje+z3fjL0pdGYWIFRBpZC
	 jGDyUr1gkDM0g7LYgkHi0GhRNUg5vboazwgz7BnATIjKfYdop0i/A8Y8SrTd9wtAqf
	 JO8PYjAJ+8QUg==
Date: Sun, 8 Nov 2026 13:16:51 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
	pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	shuah@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v3 4/4] selftests: liveupdate: Add riscv support
Message-ID: <avBaI9bFdoOnZzGp@kernel.org>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-5-cp0613@linux.alibaba.com>
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
In-Reply-To: <20261106071459.2003-5-cp0613@linux.alibaba.com>

On Fri, Nov 06, 2026 at 03:14:59PM +0800, Chen Pei wrote:
> Teach the live update vmtest runners about riscv64, so the LUO tests can
> be run on this architecture.
> 
> LIVEUPDATE depends only on KEXEC_HANDOVER, enabled for riscv64 by the
> previous commit, so nothing in the tests stood in the way.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  tools/testing/selftests/liveupdate/config.riscv64 | 3 +++
>  tools/testing/selftests/liveupdate/run-vmtests.sh | 2 +-
>  tools/testing/selftests/liveupdate/vmtest.sh      | 8 +++++++-
>  3 files changed, 11 insertions(+), 2 deletions(-)
>  create mode 100644 tools/testing/selftests/liveupdate/config.riscv64

-- 
Sincerely yours,
Mike.
