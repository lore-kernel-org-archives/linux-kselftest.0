Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A913930C17C;
	Sun,  7 Jun 2026 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780833501; cv=none; b=OjOaKJvKQMiXRDL90MVFsWTdpf3y94+LBEntPg3+kzlyAazMCV6js1kp9RDB0H3rFuizmfq4/hb1RFLfV9vc+ZdldmU9EmVCHLfiAkJ+SC9dDqIDCDH8sGq21xdQwbsCXTA+M2OyB7ZSnNVYBVy/QWdx5BjrKLriBUE4/PsdboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780833501; c=relaxed/simple;
	bh=GkAapea2r6iMuQ9bRretKpT53hPyS2YuHdH+ULS5Nus=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KFTwjjivvwBWWp94uX/G2lKI2Tv+bD1czy/ueSRmldwRb28DR5Qc6X8k8ReMm09dSwAFg3iL0YCuas2nunkAKcNAgHIATT8Q/yecI26Ta3D96HSQYL8wbY+0N44CBogMM819czsXaCZgKT6ae+OT04hfmWbn681YTej/QUSYPYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItsDMWph; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItsDMWph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0487A1F00898;
	Sun,  7 Jun 2026 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780833500;
	bh=H2pnv615PWqSZrpd2NRH79qwtsELWXhl5rrCYlTNZXo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ItsDMWphVvFP4D8ih+9sFpqdbEllQp8JuNzqgQys3nbl3JRqSpd7m82izly/lFRXA
	 23SWdwR6HYtp7hRPXyHAUcOCpSsHOvTegPo0+c0Zoc/8HpZOVaNaXYTu391jg8RAcT
	 lNuiTww4Je5vPyjUu6tupBsWXuI6+1WkwqXMcZ1uZzFer2zFa65oT4pvSbc/lPzohm
	 FThaHBR5t10QV7mIFRzbIdC1X3dBWriV7aLfUCAclVbONkt1fiCgXNJgD7wc7Oz4wc
	 9U8zF9tNMbgUZWnuUB23hxabixRlJ3jbIren5pQKdSCeKQcujQXRc3S61MiWKHXSmM
	 xJSxwo9xyAzYw==
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
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, jasonmiu@google.com, 
 linux-kernel@vger.kernel.org, corbet@lwn.net, ran.xiaokai@zte.com.cn, 
 kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
In-Reply-To: <20260605033235.717351-2-pasha.tatashin@soleen.com>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <20260605033235.717351-2-pasha.tatashin@soleen.com>
Date: Sun, 07 Jun 2026 14:58:08 +0300
Message-Id: <178083348873.1648214.11020626647820932506.b4-review@b4>
X-Mailer: b4 0.15.2

On Fri, 05 Jun 2026 03:32:27 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> Move the radix tree tracker implementation from the core KHO code

It's radix tree data structure implementation, kho memory tracker is it's
user. Please rephrase to keep the semantics clear.

>
>
> diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
> index eec9d3ae07eb..a3ee8a5c27a2 100644
> --- a/kernel/liveupdate/Makefile
> +++ b/kernel/liveupdate/Makefile
> @@ -7,7 +7,11 @@ luo-y :=								\
>  		luo_flb.o						\
>  		luo_session.o
>  
> -obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
> +kho-y :=								\
> +		kexec_handover.o					\

I don't see much value in moving kexec_handover.o to a separate line,
btw, the same is true for luo_core.o, but it's not important enough to
change.

-- 
Sincerely yours,
Mike.

