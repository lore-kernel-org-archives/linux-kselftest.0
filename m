Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C18A318139;
	Sun,  7 Jun 2026 17:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780855189; cv=none; b=rsSzPxkY3920P+yoRs00pfqOlEV01wEX1YK+zDuq2QeMdb//UBlsCAW31S3ZWoAYOBo4tAWbMPeSFm5i0fawQVTJum2QN8tdb7FvLdj1sab9snuErnlYZTXPhP70amMDiVW/gmo79viZc6UeDrY/QdrSb1mbn33H+nTQEq0MaSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780855189; c=relaxed/simple;
	bh=XoYLj0Ks5Cbq7GCMZ+I0nLEg0Pf+1xnLk/UL5A3R9EM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=h+eBWHHg/vcF/oP7WHRWjc/ZJWWiZK3RBoI1AVPbh/KUuqIR8BzpCRIjWPqRw1hEQHF2hzTMWq+ZEAxWdFL8/nW29ahCR5kHZSToWom7hQBlqTCfBgjPo0P7iRshCDG7vE7Y3PA63l1NLoby0iyarA3w0XC5yPdevi0wVzBgOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Id3zNGSu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Id3zNGSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78311F00893;
	Sun,  7 Jun 2026 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780855186;
	bh=p13qmOJLATrPkWrp+bXLKA89GU/CFXpglcWbzZhweFA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Id3zNGSuQQrCyIBS1HT+yPq9MzOB1URA4ipc2w9gwWuXsYJn+RSzuj+IRWSYArMz/
	 r2bAdENTeVv0i296ZT9xYlRvUGSy/MYOg6/1g60IR+s+L+Z+6wjl3Wlv27sFTA+ZHa
	 g+ku3trRQZyP9yzZcg0Vuyx4YrhE77Uy3qJ55T6Hv3trt2dCAmenIsRF5fwiIv5biq
	 iRzVn6CToE8JnrsJWUN9g0yy2GhPrzhWdQIknmaM8x+miwJ8IiaZm8ScgYlklx3qpF
	 ysbiSHI8rHT/3stcctQKFTJKJtX9u/iaa+55KrYHvQ9k1KsqRNPGZym/EjN5c38y0t
	 HQeZuTcMbavag==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC v1 1/9] kho: split out radix tree tracker into
 kho_radix.c
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kselftest@vger.kernel.org, 
 shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org, jasonmiu@google.com, 
 linux-kernel@vger.kernel.org, corbet@lwn.net, ran.xiaokai@zte.com.cn, 
 kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
In-Reply-To: <aiWYZhoSOAruIIM3@plex>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <20260605033235.717351-2-pasha.tatashin@soleen.com>
 <178083348873.1648214.11020626647820932506.b4-review@b4>
 <aiWYZhoSOAruIIM3@plex>
Date: Sun, 07 Jun 2026 20:59:40 +0300
Message-Id: <178085518028.1648214.13339471022594901667.b4-reply@b4>
X-Mailer: b4 0.15.2

On 2026-06-07 16:20:50+00:00, Pasha Tatashin wrote:
> On 06-07 14:58, Mike Rapoport wrote:
> 
> > On Fri, 05 Jun 2026 03:32:27 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > 
> > It's radix tree data structure implementation, kho memory tracker is it's
> > user. Please rephrase to keep the semantics clear.
> 
> Yeap, I will update it.
> 
> > I don't see much value in moving kexec_handover.o to a separate line,
> > btw, the same is true for luo_core.o, but it's not important enough to
> > change.
> 
> This is purely for consistency. I wanted to use the exact same style in 
> the Makefile instead of having two different ways of declaring the 
> object lists.
> 
> This:
>     luo-y :=                                \
>             luo_core.o                      \
>             luo_file.o                      \
>             luo_flb.o                       \
>             luo_session.o
> 
>     kho-y :=                                \
>             kexec_handover.o                \
>             kho_radix.o                     \
>             kho_block.o                     \
>             kho_vmalloc.o
 
I mean this:

luo-y := luo_core.o		\
	luo_file.o		\
	luo_flb.o		\
	luo_session.o
 
kho-y := kexec_handover.o	\
	kho_radix.o		\
	kho_block.o		\
	kho_vmalloc.o


