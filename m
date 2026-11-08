Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136587;
	b=rhgkn5QX58fkZYJwswgilsvCT9rSIkT3SCRvX73/moTwIlceL1UeUuuUBcYyEfv4qlL2
	 dnZfNawNq+VEJTu95sFbPdgAbn9Nh0rBcWHfLvs//tbNKkiRcG/ZR//xkdyr6bEZ9+Wo4
	 kMHT+Ds2Cc0C74xVX9FrJkPhSCgQNrht4HQDj7uRKoLCt9YRf5egMsZP6T02xRSx2vqrM
	 HyLFAKY5CbxY3JdejYGccPWS/cp1QD3nIEJqOKGTBF7z4WChNqXMstZwRYh9mHfFsWrPQ
	 on3f8G7ijfhaU3V4+B1Uol6zAroBpNhOrq4uuYhH+Gxc82Mp42V/2WCod300dEFmA/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136587;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pTL3W/tdk+66hSBUiF9xLt8oJSgQZMOfyjWHi+MQBy8=;
	b=MIcjQY0q+o2hZSiTMeYyXCDGg/5/V/kh3XEQVRwbEbMaQDxCbV/6Trw4GTLErf9fIsfx
	 /vTU05kxd96ho5vBi7IdQxIPu1/omm+JNQkFbKxGvmnP+l43oEQfD8oCS9C/ujWiO9ROx
	 k5Xb2tFfd8lTPb6DtaL5Nl/B/kVDd/CvODmQ8ZwaYCram3zQVPmp8uMAmwfi2ObzFHBN7
	 5C3C9P5YVKpGm+2jtAdqCSdfHUZlsNW1q20GxIvSPddBBxooLhCiZ3WQXYJI8xNW1IKUr
	 6VAksGtBPw/Hym/C0A2gLnXprxHiFoWGJqtJe8owq0GUKqJAww++mC3X+BBZIi9z5zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqAxEVHu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A1606A31C;
	Sun,  8 Nov 2026 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqAxEVHu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8193A1F008A3;
	Sun,  8 Nov 2026 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794136586;
	bh=pTL3W/tdk+66hSBUiF9xLt8oJSgQZMOfyjWHi+MQBy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VqAxEVHuEhhuWlEGb3a6IcRZyzsBZId1gDwYYjwHpernz6+NWTAP7jGbs/6QQjRHm
	 VfC+qplsRTxDZ/vccuWSCdOmu1rpryCd9j8oOPlmOAONo+jZ0pP7qlx51TcZJVCM3O
	 4iJMzChAwjEJhqUqmKqLx4CGsRVFnzhWHguhQIzj5oB6MCGhqckA4UW6rASoF+fTX5
	 JpdLvciQEhY8AEWfhVNGoET/Cln25UEVVxOHtpsexdZf6n15F83LJFciV71ax1+y+A
	 DKcjPsbQQfbr1Te5VsGEHvxAzx4IY2Y7yOmNtDkYNW+9j0GfjPNR2zXAXG/bxyrs6U
	 /OZh+sg//YuIQ==
Date: Sun, 8 Nov 2026 13:16:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
	pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	shuah@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v3 3/4] selftests: kho: Add riscv support
Message-ID: <avBaAz0_ZvN-3m4D@kernel.org>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-4-cp0613@linux.alibaba.com>
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
In-Reply-To: <20261106071459.2003-4-cp0613@linux.alibaba.com>

On Fri, Nov 06, 2026 at 03:14:58PM +0800, Chen Pei wrote:
> Describe the machine the KHO vmtest runner needs to boot riscv64, so the
> test stops being skipped on this architecture.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  tools/testing/selftests/kho/riscv.conf | 9 +++++++++
>  tools/testing/selftests/kho/vmtest.sh  | 3 ++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/kho/riscv.conf

-- 
Sincerely yours,
Mike.
