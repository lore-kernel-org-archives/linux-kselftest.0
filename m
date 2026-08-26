Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B77F3E1CFB
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 22:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781717; cv=none; b=fsjk+8KpE+74vfSmW6bB9wSOAQz2HFDS/qikOEBpWTUY9NQ5U5HQCYkn6g4HAI5yuVdnUsaCRDkYEZ+/71LUYCAXxzNPsc9oDkOiby0LGZoe2T+jdjyL/IBTIGZcvc4V6N3AsOXTfRR0kjzRXF1h6+goUuzKNhZBzB53JMvFqL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781717; c=relaxed/simple;
	bh=1ZaRLjJ/+BY5gxM8qZ0ipOhr+Q1mZ/QdBn2WHK0wf+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMSWl8UkJlE5lQrb77A3JaIBRj6zHgqrHbUgwUGYCKEUv+WKBoeSi3ctcgG7aqgsM3rCxXG1OsTewmMx6OYMpxrMgF2bYtkTXginRnbjmU0rBRcxWeoEH3cVRWU/vXaop/Rj4vVqExBjfALloivlXiZIzANEdoIuRp9hfLvsj+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=hQ6PpJQG; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="hQ6PpJQG"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52f1a320162so375441cf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787781714; x=1788386514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qh7ZIJ3flIkW8UsNA9B9WHVstOgi6/sjKnlY9QHolSI=;
        b=hQ6PpJQGLcaCLtQxiaMLeP3wDzPu1Ti4IxcCM9RJgv+cw1pGWOeC8tAtJ1BdzmI3eX
         ofQ7vlAhmVWEYUC1Gmino9NNCG7DMu5Q/ObJyznSSYLpmCZDr3OT4csm2hOvP/byQMg+
         Jg5VQ+ERHzPriuoxt2ARRLyWFOiTfD2JLGWBVmJjovliROHz9asoYmapiV6iw1QYBl+h
         Ohkr2KSoByv2HRaiaED15OlEfyEveAMUERxCF7pnqEk2QXDi9GEKmXk0Wy8JdxHpwqwp
         N4OZzMh3AOBRaOMIkAXk5T/jQBjAEd1zANi9MKL8xQcv7tziyg0WG0pTKaJQHVWgmyws
         E9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781714; x=1788386514;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qh7ZIJ3flIkW8UsNA9B9WHVstOgi6/sjKnlY9QHolSI=;
        b=kbYSyf9o4HOY6VgJRiCPNBVH04jfwOjOOND12wSfWMp09ASwmEgnLIQjO8zu8RMXkm
         XHJ8Vle5Q+Dk1lfhgsjX4wwo9Ae+vSf+g5jzkNFNTYYAoDTvCXou4QcObBc+jiyFobkw
         hxe/DKsRbhskPwKCXR/TXqc+GiOTam5vaTrhGvTVkraXlKg8SGXuO4dN3UTyAKRCEmnX
         HP8WQX2Lwh/oiZJUaKYOYP1UVdx43r04U33wfoV5pUnUDPRVIsRJV4zal46JeXtNLZZ3
         O00DHV+RiWKuix3E4AqNYXs7ArEsgW3zXPtlaH+S33ItNYEEOPh25oNfnkA9SrTHn0Im
         d2qA==
X-Forwarded-Encrypted: i=1; AHgh+RoXIolfG8aKsZd/uavXM9LHxn3m24uZS75LkikgEcCnHBUUg9rk6PQQYxu5VwaelmSrMcYiIq3LIwmRvPJsZMk=@vger.kernel.org
X-Gm-Message-State: AFuF++n8IU8Z8VmZSuU1J8aytFUQ+Sm0ftzoyKiTkk58OeLobQqi+/SU
	p+Ntyk6ukP+FlFNNV5F6cFb+8YjeqEHoqG1QMCa/4KThqBcnrpsDWk8yexTkcIQV4g0=
X-Gm-Gg: AR+sD11JN05TSokwBfyevAkC3ZbaUqWEn0ns9zaYo217Gwaf24H+xCgMrR1rt1TbbDD
	lInoh8ZhjUcjHi19IrnJsJNPh8y/HPCzdjfAaABoIe8vS4wOaTAo2mu+yl97jMPu4dRIh1J5Gri
	R3KxHlZfvmqZgRTeiuDvgCSS41y5EBho1EHrjOjctfIjBO+H1sufoAiPZGmHfv2cAI5QQZi22Of
	qPhvrLKzgsBs8TO5umtvmqWRtreRio8UUApfKzijMSX4Fno3bVTYtv5ctn4AGApTSXEym5X1c2n
	+T9k+Pxqr/fb+bMSbm3Fr+KNit7IFWHgC3IkjZv8T9G0/f620UTiXFgmBJet+1CKHosYPdUoV/i
	7/a6hZXC5LzgvcgWM9y9f3Up7KHJfou5ANHS5gQMPNiAiFfAhtS2wMoQYovotQsJNzEHdDw7kkV
	I1FAb364pw1P79NDpf92sm7cBOpDYtSljcHP5yK39fjgu8jKN4ROZ0fHDmlCa7NjRy4pAYf0Zra
	yFfpU7dqlAKSUZIUlZHLd6bOgyo3jiFzVk0jx7rYu7L
X-Received: by 2002:ac8:5c85:0:b0:51c:1a17:eba0 with SMTP id d75a77b69052e-52e4223425amr120036291cf.2.1787781709323;
        Wed, 26 Aug 2026 15:01:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e427693c3sm25202981cf.26.2026.08.26.15.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:01:46 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:01:43 -0400
From: Gregory Price <gourry@gourry.net>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Rama Krishna Katta <ramakrishna.katta@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Gregory Price <gourry.memverge@gmail.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] selftests/syscall_user_dispatch: Skip benchmark if
 SUD is unsupported
Message-ID: <ao9iIVH5Zn5FvSMZ@gourry-fedora-PF4VCD3F>
References: <cover.1786965107.git.christian.loehle@arm.com>
 <7f6caf7adeefaac0e57bb06d194b36795f2888bc.1786965107.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f6caf7adeefaac0e57bb06d194b36795f2888bc.1786965107.git.christian.loehle@arm.com>

On Mon, Aug 17, 2026 at 12:16:11PM +0100, Christian Loehle wrote:
> Syscall User Dispatch is unavailable on architectures without generic
> syscall entry. On such architectures, sud_benchmark spends several
> seconds calibrating before its SUD prctl fails with EINVAL.
> 
> Probe SUD with a valid disabled configuration before calibration and skip
> when the kernel returns EINVAL. Treat other probe errors as failures and
> continue to run the benchmark unchanged on supported kernels.
> 
> Fixes: d87ae0fa21c2 ("selftests: Add benchmark for syscall user dispatch")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>


Reviewed-by: Gregory Price (Meta) <gourry@gourry.net> 

