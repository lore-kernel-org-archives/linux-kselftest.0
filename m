Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2EF388392
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258506; cv=none; b=c1PaOcbfW4zF5FUKfaxDf6QvkDcB+K91rtzTfvBG5TlHKuz5NpDKmvjrPvtyX667aySDJ73w7WQ009J5LltTyO3rL/YKXpnfdw/kupKYwE7bv4D8BDByxFZcdOLrbdoCP9rcbpjZN9glQI34HaEboNB/IJtQ/2S3n+XtU+QjCXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258506; c=relaxed/simple;
	bh=E9JLwgOzTTYUp//gOVT2Yw38SwLKuhS7cNx4LwO6IoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Injbx/73r/ZQ8VC0kRSqcMqDrJikIGRYzVaezS/SkI/VvPjZJvXvdwc4uMp1+aZFH77GwOwBEzprPOPGSdA+ijtHb1H/8IAxlTl8dRIDB8NFGebt9eMuXUzyP4tZG2QcqerMR1IMq8wfaOjAjN2SlYYKZcfUPoBDvJrtswkha8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Vd1I4utP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Vd1I4utP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so10529315e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790258502; x=1790863302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVHqdIp5mN/SlCXCBlhMf/YG37Cfm8kONNXB9WYe688=;
        b=Vd1I4utPRpO5MQoYJd3BImbAbRTCvbofJtrjc4WaGK+9FanDKYNU3Ioi+4GgF0D6W2
         Wphfxr0MdpNjLvoJfKs6P7eLeLt3pUh6UUDEFkhePlIQgI0r6dEnuNdXWTila0ss56ys
         GNYppMAhsKa9oxQih0hAf62lPXxUbOzqpxjXvckFUMn5uOjbpxCt+GbsrXR+DrK1857M
         ZX4IkqmRGgWeJcZbquD8b9qVG6rqHn4KQhBALdVwWSgCuIzu9D1QkPcgUcIuGGi+4zHg
         FKs4on01N97sWB3Lffah38b9kvRGHGg10rIYtslH4mQntdasFEISpVdVwiYc41c4LYmL
         E3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258502; x=1790863302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVHqdIp5mN/SlCXCBlhMf/YG37Cfm8kONNXB9WYe688=;
        b=ZQgWv3Eg6P5IzLWNGoXfrODlLhj6BD/zJGjikBv9ijnC9rHUqQK0pstpsGhPfWsGd6
         YFuT1+T4nxkrTE9qPFC4YYjqIA+jUHTwn7QALunBMj/6XLQoZa4anNofjEKIaR+VuJtt
         ksq/K7iZ5ICzUp/jZv1mKgWrsnKASh/eSSZ05riCRknSDFUxpZ/K6tSAUfraVEt8dd5x
         ALBhjfYP0NqiuHzoUeeNgnyjUYnO2VwaqOSdqVXYNO8/humWHyKO5++neEYdggvuU2FV
         tP65TiwU3AUI+WOcvD7QhyLOecuUKyJ3bqxHQs8iuix0xNmG7bMCnyFk7S+h/q0+rLkQ
         SREg==
X-Forwarded-Encrypted: i=1; AKwUvBwcMyPrOojulKyFiqJAotaVpItBL0aePeXf4/kV6SlL+MF1IWPaS9XSAzMLCaBOh2/XWVDoJ8y98IrIQFzPgpw=@vger.kernel.org
X-Gm-Message-State: AFuF++k3oYqbAnnEicmQ4ysXl0ixe5cvHthHFKpClE7sAu4LYwXIbHH/
	/xH8Er3H3+X+jOnkyIH+n73hPHG/BxWK/bBsQKzK4Cb+Lmb6sP1iP552IIDvQ/nDhSg=
X-Gm-Gg: AYBFou2ol16AZn6DdvpGIV5KX1qOImKpuGzypGMxqTY5YfnfhNdcqt6LbDPws7mffv5
	R/lC4tD+D3AbTQrqzeYNfOL9eUzhjjxFIkqwPPZDSzWEe3AMeGUyHn5wyAb5loED+7aYp5spo5M
	f0knonrJBosB4xLriYIuILZn1qBxFEJqYb2QFjWm5miB7RcQfWLJM9sNJf0AGKu4AiMI8p1ILwA
	azJSxjDinA0ucbb/binA03mgDEusc9A51e3B0PfccON9lpRDdV0zazksyn4g8v2w8Sz3ctJAaTC
	FOxH1U12om7zz69hQNIbVeNTMY5adb4VnWtmEaYzlW89C/AQC8dc9jjmkQKd89fDv+nuDGx19sD
	vpasIcnFkhFFC2R6EuAjIhDq4Bnklkp5SrzC8/SNaNJlChqB8+qF/lLQrantO6FxKM+8hItwo8Z
	+PG+OaOq7svyk9CgmmvGb78js6pixYV0ZpSlWLJwa+uPuORPLe5OitVHqinevKyjSKD3u/klv9D
	RrLToLtJMOQimZ6Ml3ykQ0+vHHNEy1tCgRDRaI/napHI2aSRt8gn5cfI8bDkocwg6XZv3Q1lAdK
X-Received: by 2002:a05:600c:4e8f:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49fe66d062bmr44815485e9.7.1790258501429;
        Thu, 24 Sep 2026 07:01:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49febb20146sm2518575e9.2.2026.09.24.07.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:01:40 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:01:35 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 01/10] selftests/mm: exercise MADV_COLD and MADV_PAGEOUT
Message-ID: <arUsvfwbYjdcUp3Y@gourry-fedora-PF4VCD3F>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-2-gourry@gourry.net>
 <arPgwegm8XgbEUrO@gremlin>
 <arPjwPwVxdvdR5S0@gourry-fedora-PF4VCD3F>
 <arPl6UhNDbwds4uR@gremlin>
 <e459d3c9-ad60-47bb-8b02-bed3819e8067@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e459d3c9-ad60-47bb-8b02-bed3819e8067@kernel.org>

On Thu, Sep 24, 2026 at 01:32:25PM +0200, David Hildenbrand (Arm) wrote:
> On 9/23/26 16:46, Lorenzo Stoakes (ARM) wrote:
> >>
> >> I'm working on a solution.  Need better hosting.
> > 
> > Thanks! But yeah damn indeed you do! :)
> > 
> > Though larger series can scare people off so maybe better to send the tests
> > separately?
> 
> In any case, we have to break this down into reviewable pieces. We neglected
> selftests for too long.
> 
> ... and there are some schlopped tests in there that we really shouldn't have as
> they are way too special and hard to maintain.
> 
> Like this monstrosity:
> 
> +/*
> + * A folio faulted on another CPU can remain in that CPU's pending LRU batch.
> + * MADV_COLD drains only the calling CPU and must safely skip the non-LRU
> + * folio without changing the mapping.
> + */
> +static void test_madvise_cold_remote_lru_batch(void)
> +{
>

Yeah the intent of these particular tests was to ensure I capture ever
weird branch in the code before i went refactoring it so I ensured there
was no loss of fidelity.

I think we can reasonably delete ~15-20 of these tests.  That said, the
code itself is not schlopp, but I believe in showing the work.

~Gregory
