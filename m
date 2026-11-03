Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699467;
	b=vdVwUj8m+4iEoW+dpEEGctLhhbzXxVy6HHZNrKmtTFMV1+TyJHf5kqMYiTIkx8Dx9tib
	 Vnj7ilOV+sYwUhTT38+tFVKYC9hCPYNVCs+8hF7jZoqyN+X6bCL2lp/Vyde+fXAAGxO/k
	 A2dg2lqlw5r8PpGkzfBxjlKzXHCmmyqnyjCWMkO79iUXp7tIWxmdyGzty9k+smjcN7rFY
	 /2taCFnLZlRnheudDnJbYdE7HcAEPku9aNGCx1lfeH7fECb41I5TctG8gzEDZmIPRQPM5
	 Ymv/a3YYwdaGBgmLp3Kq21y9lxYzYyvSOWldYJDlPXUdOV1zLJ8N3hzGRaVWMQO2+XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699467;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=egFZ+CUkcSsEU6Plv0bPxdEnwjHAJmOsofwONArJtfE=;
	b=oR95ZouEBmJIaNuQmKiDyzM9SIgy1MFazjuCxlSYqlbUdpHM9A7oHg+RmaRu2KF/R4SS
	 Z1Yd6bXdvDc+uHsf2Id1jF3EaphlFjVynLXNE+jEodTXhcAmZ+zwuq2KUz+ZHO8hi3aeM
	 eLmacl08zA66aKEHp/UxYUMUTLhBpxsQ/fhEVYiaInBKM02T79IJwI9ld+L3hjSuWJcSB
	 3t4NuwBLdzsIgk4aWwd4bwDEHZb3b0KmEwAbJnsGBEcDS1w5Q2FCx7un/Zf2kdPcbJF+t
	 bJempRttnS20jj9+z/sMC2Kr69zapwMfSRiqeBWAqZvurmMn0ijcS0OBq4VRVAjNgBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMBHJpc5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A478A606EE8E
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMBHJpc5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A191F00A2B
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699467;
	bh=egFZ+CUkcSsEU6Plv0bPxdEnwjHAJmOsofwONArJtfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZMBHJpc5LnVjVqMmky/1Z98hT6vvYftg4A2uaHSbanSa9m0ZPl8r1yYSOD0LDhO7S
	 x9eyo9iCxd1UrEIfH9GWrkpR2i0fGYq9QkF9AGJIO7X1DGGYVOwzw/eBzkAQ2B0gQo
	 TGAcyF/5FIa+zza+heBC1wmnytrxl3MGMXw569pZSUfLodwCVkqtjqiaEale3b3pKA
	 OaRwtst7itnDduWXrHxMhTDvJ3xIacZZPkLIe/VGMID9wnrXLBojpijPr3S3IiBUsr
	 E/S9MLKZa42KqAWItRHIZ9AU5NPUoSN2UZQOm/s4Jx1idQaKw4MiC4upH32BvChUU1
	 tIooJ8CeIsKDw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id B4B621980052;
	Tue,  3 Nov 2026 04:51:03 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 03 Nov 2026 04:51:05 -0500
X-ME-Sender: <xms:h67pal9ZnLbWHExwOAy9SGfyqSpwEUA3NMoQdTM_tJujWsv3OVjV0w>
    <xme:h67paicDmptRKFXkjwKv0nICnqf6UGXUOBoNs43PdN6dDU75HqZ_sRU53pb4eCnHZ
    NyYG72C9VWjHhnBKO_6yXDQ_XgwcuqbqayOrtgsPfmHuMB18PoKS6SVzw>
X-ME-Received: <xmr:h67pahuB-6My-vFtxfkBuHVD9wBj-SrVnKtNnHHVEzPKySakCJ2-hDMjBUM>
X-ME-Proxy-Cause: dmFkZTEafPFpDsB+iCHvxJAO8+/K3z3CdRdJQPrpIxEVD39bmGj4/U/LJCZAd51olEmH1k
    6qE564jpNX+1TdKbvOIB6IQqoEWMe6lmfsHXz/7H5av9n07ycVm9KaqNAIFuxM/2yQ6ZQf
    2WwWRfyTOBvsJefTEHwTSIlMEprKmlBMCaMQEiOCHNx9GlqItvdGfsqrXvTSv4YwWhfjog
    Hisq+Pm0kPe9yLdILX1nzJHxDiI4HZI/f/WiRyVg1IU5TnSyC+qdCi/OaPKH/o52uYw5Pg
    NWBfdHzJ6Nj9gleMoUsWymwlxC4s3Xd8EfbSP1s94cT1TvBMvX9Px0+DW0sTMVcz6ljQEA
    bNAqnrXT9kSnldOc7GBnoXknTZI4CrGQbGLxz5gcYZTcqrYDenzWioW72YDipsFCgRr9Nc
    uHBP0n3wHEHm0xd1bC4PM449f0K6KLv76IEdnFJtRBmsT/86yFTF/k+YNA7ynRtyx7gRna
    Kdv04/M7HAJayP6d0M6sfwsmt2NxrALe4AgmeDI6puNDmrhfuTxLwDKsNAcQvOKadj7BTj
    haYfLIDqjkraFwT0ww55Xb+vCFS+FGgc4wHxE4eUt8EVIgb2JTv4LQ1XW3ZWMb1d2KhaT2
    PU8/KLA1icWuLdOTL6ghs2iL36LEgDAWlkXyHmhA1D22rcIIoeNo1PaFssdA
X-ME-Proxy: <xmx:h67par3REpkKj-iFbIx6OpMTiClv6JggmrTZ2vnL95mTjoV1WnqWTw>
    <xmx:h67pauDaZfE9CaGgf87_XUEHj4UdQQBG6yShD9rbXk1nBnYJmINEwQ>
    <xmx:h67pagcoelXpPMERwyrq_euIeL4P3SsGx8hAa2itEDWuoAW_H3ASQA>
    <xmx:h67paoxeEzN5MwZep7_7iT4Ux1UqJY_4UkUcxyapsgxs5qXS9IeIBw>
    <xmx:h67pajNnJMxSw7lfAbohqfwd3JfPbixn6e8WbpqRLjWogVqlRQ-CqeHQ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Nov 2026 04:51:02 -0500 (EST)
Date: Tue, 3 Nov 2026 09:51:01 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	yeoreum.yun@arm.com, ziy@nvidia.com
Subject: Re: [PATCH v2] selftests/mm: handle child status safely in khugepaged
Message-ID: <aumtBg9KOgrY9MIe@thinkstation>
References: <auhvkuDO8cP9Pip4@thinkstation>
 <20261102185130.30504-1-ampr.mhd@gmail.com>
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
In-Reply-To: <20261102185130.30504-1-ampr.mhd@gmail.com>

On Mon, Nov 02, 2026 at 10:21:30PM +0330, Muhammad Mahdi Amirpour wrote:
> collapse_fork(), collapse_fork_compound() and
> collapse_max_ptes_shared() take the child result from
> WEXITSTATUS() without checking WIFEXITED(). For a child
> killed by a signal WEXITSTATUS() is 0, which is KSFT_PASS:
> the parent runs its own checks and the test reports ok even
> though the child crashed.
> 
> Fail the test when the child did not exit normally, and print
> the signal that killed it. Also fail when fork() fails,
> instead of reading an uninitialised status.
> 
> Use get_child_status() in all four fork tests, and use
> wait_for_child() to handle fork() and waitpid() in the
> three blocking-wait tests.
> 
> Fixes: bd212a7dbdb1 ("kselftest: mm: return fail when child test result is fail in khugepaged")
> Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
