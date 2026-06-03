Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDD02652AF;
	Wed,  3 Jun 2026 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469534; cv=none; b=nWBLN/kxY1mCHTu/LNmQ0dFNkRLvCdEQAGnCO8Zocz0q71Dle1PAoaI10qPOQlgcC3X4RJEM/PMZsfqziJ2xLm2FLelYo2bpXm6qOSfWOyBDoExlz242ti9HlKoyfUbiWroUOqtFfhqJQozW3FPfOGCxvzmpzwHYtbiXKj+NpAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469534; c=relaxed/simple;
	bh=Y0rcxgxR4xRmw+oXw/pn1fRj6+8vIiBetR+Ax4MkGSs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=DOXmcBF2laOeuC4wj+f5ELQloth7eNrlwue8tLoNjvqKeODx1ICWxTH5aPwbtnjN3gcF+eqBm6otddBMrEIQsCqhIJAS+vGiD+TbT6Ah8mgiNxZ6kQqD867LuTABQJfI0M8LbCTxiCmTpZIKWqH02iB1uZUebGfdZ977M0dfRbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiRBMgVX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiRBMgVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1921F00898;
	Wed,  3 Jun 2026 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780469532;
	bh=QmR72pv0JwZwlXfpmXou2svlXcH18CS10GD95f37blg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GiRBMgVXBSYgeTevLYva+/l8q+IIkbd8tlCWMESYx3M+lpYhlTsV/YFhmgyIeJmBv
	 aSjS2E2FrVsyR7LerMnXedSvoQUQYDpRMuwqXSWxYXeaf1uwfvCkybxOZ3Fgmhi3sR
	 FmtcC9rbPfxKV/XQOad3sLgErg6alckvnSGr4fX8AAnrQBt0dfFYuKCas8Nfq+MKWI
	 2pP3whGsj78x4ObF026jDMh3ewLDz4dDUR9POyKPjSiJrZFW7QpaHianGLth+gpj8P
	 rP+6NRi2pQpwr0trxX0Mzk20NatXXQ3xr6yZ7lGOdcJ3lnhARBb0X2wy2qG8pD0Jwo
	 zqCBoEsbhOKOQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 03/13] liveupdate: centralize state management into
 struct luo_ser
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com
In-Reply-To: <20260603032905.344462-4-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-4-pasha.tatashin@soleen.com>
Date: Wed, 03 Jun 2026 09:52:02 +0300
Message-Id: <178046952228.468621.17532660334285388424.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 03 Jun 2026 03:28:54 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> Transition the LUO to ABI v2, which centralizes state management into a
> single struct luo_ser header.
> 
> Previously, LUO state was spread across multiple FDT properties and
> subnodes. ABI v2 simplifies this by placing all core state, including
> the liveupdate number and physical addresses for sessions and FLB
> headers into a centralized struct luo_ser.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

