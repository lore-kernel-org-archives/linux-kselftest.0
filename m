Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A737BE96;
	Sun,  3 May 2026 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777827054; cv=none; b=KBbw64CVMR8b84k9CnTb2okjDhI3tTdmHAFmZet82HnKKLF4BiHGyfO4LT6wnzrgGrdw8+vAY1SB76iH8xOGI4dhKEo2Sd3w7LJbQgo+Z4ClW8Q7Fyc2DeNRx6Z4XJLNBnIJb3331LsZ6hLuUI+9ko7KS0s+2MuaOXhfK7byhMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777827054; c=relaxed/simple;
	bh=EPRQ0sFL/SE3E0eBlsxQttfyPlmnVNf1y/IfVs8UtKY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qcc2tgex7Z3Hv9a6xFzBV5BdcRZ2jZ9JJ5AIgvgzzlmGBauwU7rDjLPWf7Nn6WY4BfECpTgb5n2LHSlva6dkvkSdWXaEDn6jzhnOANYpwXsvfyRjk9Ys3zp5MlfqjK3L9Sk0J6bkPB4NfIJfaRFvrdzr+rTNrQqB2Jwu/jAYfgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=md/ZoUqo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="md/ZoUqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88791C4AF09;
	Sun,  3 May 2026 16:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777827054;
	bh=EPRQ0sFL/SE3E0eBlsxQttfyPlmnVNf1y/IfVs8UtKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=md/ZoUqoMuej1otNTGLYmdLdumoERQF8bZmktgIKPr0kNELfPrntIvfJ5CFXXO+Ql
	 6OX3z3vBLZfFcxLfo3UUroNo9ByGRnUfst5ej1suJPhH9IDOAyZMEb4ap3wpzmtfM0
	 1wAL2wKk6oCKVGCjgl+KVviSnIWQSNIfVGy2rlQI=
Date: Sun, 3 May 2026 09:50:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Fujunjie <fujunjie1@qq.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sj@kernel.org
Subject: Re: [PATCH v2] mm/madvise: reject invalid process_madvise() advice
 for zero-length vectors
Message-Id: <20260503095050.93736c201548e71d7d0f4210@linux-foundation.org>
In-Reply-To: <tencent_C18B14AEB4E720C5E2F9500FB9118E1B5607@qq.com>
References: <tencent_98F3571EF9236437E5165F5C08CF258A9E08@qq.com>
	<tencent_BB588C2CDED859A873093DAF28B2CC1F7B0A@qq.com>
	<afBNyNJiWEAUSf1i@lucifer>
	<tencent_C18B14AEB4E720C5E2F9500FB9118E1B5607@qq.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 4 May 2026 00:45:16 +0800 Fujunjie <fujunjie1@qq.com> wrote:

> >  		/*
> >  		 * An madvise operation is attempting to restart the syscall,
> >  		 * but we cannot proceed as it would not be correct to repeat
> > --
> > 2.54.0
> 
> Thanks, Lorenzo. That looks clearer to me too.
> 
> Since this is already in mm-unstable,

That's OK - it's called "unstable" for a reason!  Things come in,
things get removed, things get changed.  All the time.

> I'll wait for Andrew's preference.
> If a respin is needed, I'll fold this in together with SJ's comments.

Please prepare a v3 in the usual fashion.
