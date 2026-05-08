Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691343A1DB
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 02:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778208764; cv=none; b=VfiNcV3KBjuJJsXu4djsBn0N+fKMkqOVEB3CcLf3ougLeYjy+/DLTDZMM+LsBLoMbEam/R8JJX/3nEFV8MycIge1QvqKxxfFTFp0ByPcfaM7aw+9FKkU0Y5/+fN2fuEdrYM6YnEwDSOFic1j1epHpowM+nWbE98a64nCmxXGtPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778208764; c=relaxed/simple;
	bh=TxFqk8i+4b6dEi3VGsPCyT6UMh99EcS5+9xa5h8ZEmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxZiRkBu9RrWJ6w0i9/sbnsgwdRWW0tUESUAXRR3mJs/L5Hi4h7ZETQn9DaK1jgN0wsBe8TkGOlsdJaDUwXUDsVSqDUsfoM9vZF7U4jm9nn9Dx4M9c1WV+M0pOhK+3nKK9Toms0FnJlCJiJnQMh6cUpqPdgs/9AeqLttZ2uoimU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd1qlXli; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd1qlXli"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so915635a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 19:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778208762; x=1778813562; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXo8YRKGAQ0gGQsS3CnfFEP5ggHykysOGobJBcjxhWg=;
        b=Qd1qlXliLfZ849CmHV+HjAVyD4ZF5SV6Cmf29ECSofNbg0K8Yu6jMtNHVO3Zxd/AMH
         MuABcvUrioFKZkHOjKAy5eJTKaGKk1F4/u+jOtUvGwdFeJ73NiKhSrEgZVpXe+jGuk6v
         /ikzuFTMRJUnG55XQIp8Vt3E/fnZcBWQCZFqXMv9Dw+FVPD/gStCsr8T5H+3zo31l3AR
         HNDbdoeijQBjpXIIEaWA3tEUbkoUSaqpz7LY5ztn5d/m1Sb3XUJg45vFL+Rx6HXGNHfp
         ENkmpB0oJ/kHEi9Ibl4I4MCbhhgMWGHuaie4h0ZMbtLRNmxk3GRCGyjuDuqFAr4vzts5
         HmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778208762; x=1778813562;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXo8YRKGAQ0gGQsS3CnfFEP5ggHykysOGobJBcjxhWg=;
        b=dCeq9RfXhm1JprcaQh37gLbYXOeux1rCQh7GEOIE4zSPaeCB4DYNQrg2cYHLjs1BK4
         YCUlI2F6YX84rFYH/+PysvhbgS2y4DnLnaeNRpiCuTMKqSxMnr6tuOAdkV1a3bl4FqI5
         AdYhUsiWuXLdgPLwc0q6C52rJ/ZsLw+1ujKgwGr7VPPFiKGYwvCToNa8gOFdDen1coXv
         NFTo1BZjxGrnnZ9k4OGya4244jsI7T6P7UCYfR+zraJCOtu7cxMRDJDi1TkaVEjutApR
         9NdRgc1nnfkkPXanzCTOQQ7anCP91IFkACsIGXVtNAVp6br9yM5R7B9aGQQf2+iM8C82
         YWqA==
X-Forwarded-Encrypted: i=1; AFNElJ+1ifxedNtlGfAA6ICI/iSSrV/DIZlSFdzbozlT6R3Q0A1HwshgYja9f9sOXTQhjV9qVm2muguo8ywHu2B99s8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6IPmw6Y8kHT0VFLOza62A+x3c0cICt+SAv6rCk1aXR0H186yE
	kcBwvBQ6dogtoWzw5LUkd4Sbh4RMkBt878cTXZiPlRq/n+dgCrp4yAPw
X-Gm-Gg: Acq92OF5p5z6tGMeAZwAkA5m7a/8HIfaFaAzM2LPsogd9q/QB4kqMYoF9Ph3wiSqBxd
	tX8ZWASUibwhIAiuvhuELcVHTx1G9mA8WCdWA2jCKp4ggIw5ruAJKguDD8+G9APpGznJeRzNzUd
	Zm3GIDmlNiObRXAcLX4RUQ21tHlSZT1ol5D/w1bajARv8mOnFWEhgaRwFAJbx1MJH8lE+iWYtRN
	UvcHMAj/3/XaCbs36pavJAug0rM16T+5M0AxKJPwu7jdGQnbQcuf45eV3a35XlrrZ25TJ5761eZ
	STD13DPHThuCjBJ4SybS7znsISrTETsfyNi/u5MYKuTvQwVmjok6aVOpakNy+QXM/feH3NEE04r
	NWxd8Tp4WeFj+3NqbiQk5QqAAqO584RQRcHR1PT1qSmRgPcE0uCb1UtKjG3MOiFPLuFGrQRWUJX
	9J6jqHd49Heb17eW3diCCP4d/gyS/HJc0w
X-Received: by 2002:a50:fa8d:0:b0:676:988e:8eb6 with SMTP id 4fb4d7f45d1cf-67d648a9ed2mr3977298a12.26.1778208761525;
        Thu, 07 May 2026 19:52:41 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1a221sm102651a12.24.2026.05.07.19.52.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2026 19:52:40 -0700 (PDT)
Date: Fri, 8 May 2026 02:52:39 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Song Liu <songliubraving@fb.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 05/14] mm: remove READ_ONLY_THP_FOR_FS Kconfig option
Message-ID: <20260508025239.ooz5kc5a3n372ebb@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260429152924.727124-1-ziy@nvidia.com>
 <20260429153538.727855-1-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429153538.727855-1-ziy@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Apr 29, 2026 at 11:35:28AM -0400, Zi Yan wrote:
>After removing READ_ONLY_THP_FOR_FS check in file_thp_enabled(),
>khugepaged and MADV_COLLAPSE can run on FSes with PMD THP pagecache
>support even without READ_ONLY_THP_FOR_FS enabled. Remove the Kconfig first
>so that no one can use READ_ONLY_THP_FOR_FS as upcoming commits remove
>mapping->nr_thps, which its safe guard mechanism relies on.
>
>Signed-off-by: Zi Yan <ziy@nvidia.com>
>Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>---
> mm/Kconfig | 11 -----------
> 1 file changed, 11 deletions(-)
>
>diff --git a/mm/Kconfig b/mm/Kconfig
>index e221fa1dc54d0..27dc5b0139ba6 100644
>--- a/mm/Kconfig
>+++ b/mm/Kconfig
>@@ -936,17 +936,6 @@ config THP_SWAP
> 
> 	  For selection by architectures with reasonable THP sizes.
> 
>-config READ_ONLY_THP_FOR_FS
>-	bool "Read-only THP for filesystems (EXPERIMENTAL)"
>-	depends on TRANSPARENT_HUGEPAGE
>-
>-	help
>-	  Allow khugepaged to put read-only file-backed pages in THP.
>-
>-	  This is marked experimental because it is a new feature. Write
>-	  support of file THPs will be developed in the next few release
>-	  cycles.
>-

Hi,

I see hugepage_enabled() in khugepaged.c still use READ_ONLY_THP_FOR_FS.

> config NO_PAGE_MAPCOUNT
> 	bool "No per-page mapcount (EXPERIMENTAL)"
> 	help
>-- 
>2.53.0
>

-- 
Wei Yang
Help you, Help me
