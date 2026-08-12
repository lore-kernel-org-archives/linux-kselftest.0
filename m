Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570483644B3;
	Wed, 12 Aug 2026 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552474; cv=none; b=LQSqGL1QvLXyjCK91TTuaI8h4eb4jgmoxqLDdf8vaUWvYW7RnqXsXvOIpOHlzUPe4X+GZQY/2oWQ78P0MBVUcjJKlUQqkkinStGasWy070AkNi149xh+xNbMyNUG5Kin4KRookzeYHVP2HfJylOXldBx1Oea88xhHzc1/7B5Jqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552474; c=relaxed/simple;
	bh=Pcts3ohXHhUKv3SoyF/2t8XFyb2uk55rf44kDb6EUoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrDmsU/hepV/Xf3sIYd7Vj68CIO6GFCVeCzWyYnScj8RNeIyr6FwuSsYcHln4/ZvQcuAfJ+CVChvUl4z4wkl396Qj7Ll2xMfTgypboVDqMuo27d3oomQ1jcvKrRS28XjVgSTgkbRuN+e//1uwCRoDTVyXjx3vsdUDjt2ei6DlEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=uI0GhfJH; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="uI0GhfJH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/CFyIx9mpxXeWIAIMoJaCt75DGlqZhikdj+q2raJ6pY=; b=uI0GhfJHxfn4UH3T2iCDPOSYCl
	YR8rZmHQG6eEuAbbwvFElbXkjxYBl3B+oL/pSB1fhi8BpxttSzoUgxfZp/W8YXFjvHULd5qYaxPyp
	QDKMlQGl9Yf8CBkaRhLxeCtty7C0lvyE2X2v1Lr+0sOlolSSIKyW/hkoERsiGZX8bqdF5d0dBJHZc
	0DidMk5vrDTxGDmhwmenmE9o5k7Z/gOkIuhMb0galEHlqKHobTgPuhCD68VZ3A1pD9d4Yhrzm+Qwt
	gVfyQcqImVjxBgNEj2RXHd/2MV/JNI3InomwG0bZ89xxs+1C4Eb1Vb6tsbybRZeBzA5p0FUKOS98x
	9OUjsDJA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wuBuA-004TS4-2m;
	Wed, 12 Aug 2026 16:34:15 +0000
Date: Wed, 12 Aug 2026 09:34:10 -0700
From: Breno Leitao <leitao@debian.org>
To: Song Hu <husong@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, shuah@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: emit KTAP output from ksft_kmemleak_dedup
Message-ID: <anygdcwTAr1MOfkU@gmail.com>
References: <20260812132142.582390-1-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812132142.582390-1-husong@kylinos.cn>
X-Debian-User: leitao

On Wed, Aug 12, 2026 at 09:21:41PM +0800, Song Hu wrote:
> ksft_kmemleak_dedup.sh reports its result with raw "SKIP:"/"FAIL":"PASS:"
> echoes and bare exit codes instead of KTAP, so parse_kselftest.py cannot
> read it.  Convert it to the ktap_helpers.sh API, like its sibling
> ksft_kmemleak_confirm.sh.
> 
> Signed-off-by: Song Hu <husong@kylinos.cn>

Reviewed-by: Breno Leitao <leitao@debian.org>

Thanks for the patch!
--breno

