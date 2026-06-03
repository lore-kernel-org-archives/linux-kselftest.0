Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E4643CEFA;
	Wed,  3 Jun 2026 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479188; cv=none; b=EgD2N5hgDFmnODBTvkzIy0fkdKlRAv00KWQxuJRa7MDUq6OvPWIZGVPI37MOkAPH08V10d6K0Jobk1/QVZxm7xngPvbn8EgqU5vsUth2q3HlnRFkgS738Yt72Kw+w5S21CyaLfH5g21s9Ils0jf9HE2R+9YKv9CD0LnTFF8LxAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479188; c=relaxed/simple;
	bh=lt+j2EZwfuCvS9VqopiUtmumkELCLq8z+NMaWo6dPRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMd34LgHQqQYw1o07piaxVuWNnpbu180E95LlyW7wUupPdMvq3O8KoRlMqV4ELxUt5HXA7MxiQFbb/umMr2wXr+unpl4zg3uloL+C8D2CBcT5ROJXz7aZy/LPKtlavvtrhBJZodU122+r/88k90/GaovNN7WvzaRbccPStV3+0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rx1cSpJl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rx1cSpJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FAF1F00893;
	Wed,  3 Jun 2026 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780479182;
	bh=R3CPe9L+Xkc56uXDetG+lvovbz0JWP1jQopKoFbSJqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rx1cSpJlGAM0YKvGloDx4NCqR14Zez0e6wNchackcfyp3UWVdcBZSI9zTWDzbxJ9K
	 0bxYsTiuDHtW/iHnjIsxs7z7YmLa/cvEP67GMnbC5TqLxuuYjSd9o2npCUDV6PIt54
	 kYFUq53Ow4olqnLx+dT8XKv53t10rlH8/YbanQ4smjEdtkzz+MkZIos8WgrWvz8Hgv
	 GdrOWQQWdzDSFzD42zxtkp5aHFnN/hw/tz7d4s5PJ4OE4yrRKkGRclDGlKGRnYIs+2
	 4M9Mq4C9Ui6I3VnVRfzjhRHXZlFvXiHaWX4z0hcmznIOTu5avK9NWnL1AmPAJAPNMh
	 H47PAq9cno9jA==
Date: Wed, 3 Jun 2026 12:32:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v6 04/13] liveupdate: register luo_ser as KHO subtree
Message-ID: <ah_0xsPC_oNPewVk@kernel.org>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-5-pasha.tatashin@soleen.com>
 <178046942429.468621.9591914636403075487.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178046942429.468621.9591914636403075487.b4-review@b4>

On Wed, Jun 03, 2026 at 09:50:24AM +0300, Mike Rapoport wrote:
> # Add your code comments below. There is no need to trim or delete
> # any existing content -- just insert your comments under the relevant
> # lines of code. Lines starting with "> " are quoted diff context and
> # lines starting with "| " are comments from other reviewers.
> # The final email will be reformatted automatically to include only
> # the sections that have your comments.
> #

looks like b4 review bug or misuse from my side :)

-- 
Sincerely yours,
Mike.
