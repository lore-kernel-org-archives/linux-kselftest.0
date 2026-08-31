Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBF1448CF7;
	Mon, 31 Aug 2026 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193957; cv=none; b=S/8sItXoNKBUr/MBammmiEbWbnybxZLCoLP8RQ3yqSkbvBh4s9HNEUrwpXBKdwEq017j3XkXSIg4o1R5zUUHULXBJziHP+y7axgxGUm2OSegsNECTuOATzI6HD/IOZKeIRlLaqb+99H6Q9sZDAbA6PlFVOOiV8mBJW9Weh2DO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193957; c=relaxed/simple;
	bh=wUsBvWnzl+Pj88Y9i6acXf4EDbp3sxiIChdWLSg1gtg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JYctzpHdgKYebuXVEGkvoJMxsUaheBoFE5LhVNBmc3gQIk+EDb12zG0KIymYhhEEwu9O7ROhe782sIhOHPJuAnZ5iTJsAzPdbK4wwHECmUQJZaInYbbd1jxYxW6UWiJfWvh1BRuTJRbHNm2gkXLG0KqK2dnYuq7VzoKiUa465kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gh2CsV8N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gh2CsV8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBEB1F000E9;
	Mon, 31 Aug 2026 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193956;
	bh=BOkGMgfUiKktetMs2wqyvvKDq0ME2ARU2KejbrLlpOg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Gh2CsV8N81h4Y5gq3qzfcDxXUBtM868JkeSq21qq3g5E6mAUYjt6GIjDAPCLHv0Ml
	 LMlL9MNkkvlE+lvpVryUTiLyK6EAua9eRmO1slhu9wTNDt/QcpmrYZahpWrui3EhUH
	 ePYPgTPxoJGWi7rkp/dGJmAqqmaLjtLsFv5kM3ashSRC0I3TaP/94Tu6PgWomPKS/3
	 jGw+yC8iM/funj40NFgK3msndpOC+JAkuIB3KEyV58dF6+NVfltX+4ZITCBLHhduvT
	 Pq7iLiIZjJIxmC5lhBtwG4GhtkGNRCcSVpI55Hs7ms2xr6Zj+KvU/NwPk0Mh3j9ZqU
	 O6DIBBZ9nHFUw==
Date: Mon, 31 Aug 2026 09:32:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Willem de
 Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Yael Chemla
 <ychemla@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [PATCH net] selftests: drv-net: pp_alloc_fail: restore ring
 size after timeout
Message-ID: <20260831093235.4d9ff79c@kernel.org>
In-Reply-To: <114e426d-431a-445e-addd-dc30b2c70f0c@nvidia.com>
References: <20260825090758.308167-1-noren@nvidia.com>
	<20260827093109.5b26bac2@kernel.org>
	<114e426d-431a-445e-addd-dc30b2c70f0c@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Aug 2026 11:05:52 +0300 Nimrod Oren wrote:
> > Regarding the patch - I'm not sure we should be complicating
> > tests for this. How about we make NIPA reboot the machine if
> > it sees subprocess.TimeoutExpired ? Adding defer()s before
> > seems like a bit of a whack-a-mole.  
> 
> Sounds good to me. Rebooting will be cleaner.

Done, currently pending runs should see the new code so we'll know if
it gets handled right soon.
