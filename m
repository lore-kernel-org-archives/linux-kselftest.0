Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C79439F77;
	Thu, 27 Aug 2026 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830366; cv=none; b=hRhA5mrUbwHWRke5qzaHwxUHF8/TzHwIDgQWz1A7eMqRfY079ZR5F1qNY8yud7RZ9il9FKNzxLXUGpyp/uUxDXBUbbbc1YWqT1jsUREqqSjqJwaqZNxXLFScEp4084XXt6wFrvrNv+AxSGJJGGVGUYak7tzze7hA2tUH1cy8zCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830366; c=relaxed/simple;
	bh=4Do58929PPd5JKLIOXUaMADe1o+gB6hP93zK/UUpV1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gb55VwB5mhCeNq/OjVQIpqal7m4/MstFmFRRUpSE/JLfoxWhB6VYc5ys/JCLkCXVY/1CaV23440CNhhccxiRJyYjnhpTwiYj9L/fuDRSsKlHyfVnK0L60VCQBK+dHkpBKosMLhUsm9YdPxFBUSDAQjn4BBB2Fae5PPcUCfmeUfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCitKwHd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCitKwHd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0F01F000E9;
	Thu, 27 Aug 2026 11:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787830362;
	bh=6AAqqY4OkNSdQHM1gwmpJ5lzM2oTtRJv4IBEa3HgW1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCitKwHdBmmXQATMfnf96emOBD0bNGuTQZCIGvu0mBP5yiU9dwKhEi7E5dIgZLcHH
	 X1avs/xMwSZysmmH0oRRdopxhqfq2dOk4RJ+9AJXuoKQr2EqIy8AmdX1z5HoO44WyW
	 K7hlAi6SMU+M7ZQN+RKm5BJCPeWL9QuDyF8tKg7WTPSjvTVzg/ydhecanXaRsHHNu9
	 +16jjMxfS6oKmZWvHz3diEiPMxOmv7LpcWhg9bsaekG079iYr0x8HSs8S6uoE5Cizg
	 D4FriUW44WmRsndIj5Z2ZGPEI36T5HvQ/OKTQSCa6fsV5xiWP1N/ghqXAx+mRdhEug
	 CETbX5v1Hinrw==
Date: Thu, 27 Aug 2026 12:32:35 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: david@kernel.org, linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, 
	akpm@linux-foundation.org, luto@amacapital.net, brendan.jackman@linux.dev, 
	liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, broonie@kernel.org, 
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, geert@linux-m68k.org, 
	daniel@thingy.jp
Subject: Re: [PATCH v2 0/2] support kselftest on nommu platform
Message-ID: <apAgQJ5p8LEDj1c5@gremlin>
References: <20260825015945.141739-1-thehajime@gmail.com>
 <f2ac9432-4fea-4007-aab0-ad80597b284c@kernel.org>
 <ao2Tl9CLL7WjHYun@gremlin>
 <bb9a3add-4849-4928-8b6a-0afc0c73b112@kernel.org>
 <ao2l9Ao7BQI6uRKC@gremlin>
 <m2y0dsuf1d.wl-thehajime@gmail.com>
 <ao_541nBaa3SJS9F@gremlin>
 <m2v78wueir.wl-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2v78wueir.wl-thehajime@gmail.com>

On Thu, Aug 27, 2026 at 05:57:32PM +0900, Hajime Tazaki wrote:
>
> On Thu, 27 Aug 2026 17:49:58 +0900,
> Lorenzo Stoakes (ARM) wrote:
>
> > BTW did
> > https://lore.kernel.org/all/20260723093633.140989-12-johannes@sipsolutions.net/
> > go upstream? Or another UML nommu mode? I've not been keeping track of all
> > that.
>
> The current consensus (IIUC) is above Johannes's patches are in
> progress.  Another mode which I was originally proposed is postponed
> in order to minimize the impact to UM tree.

Ah ok cool, thanks! Is that headed to 7.3 or more like 7.4?

>
> -- Hajime
>

--
Cheers, Lorenzo
