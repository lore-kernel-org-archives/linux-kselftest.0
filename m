Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793228957;
	b=rAaRmfOWyML8smbQcaBLZx+YnGGf4BUQ5Y734mpPWFMrda3+Xty3817LjkTN9H5L7dzF
	 GB8jqFbRFt2xXa6p+Il/z5Cs+szEa2jTy9doPOOMpUo2BESsP4gO2KKhpgbLNw7gaGKJj
	 nXixrip6PO/kxQ9fpacxIPDYPj9WAKcUbNW1QUQGfc25CI7Q7MDsZmRNNRQ0RSYq2tzH5
	 ejapjHnEUES6LbhijR22aoJPSXhcNcF0XFQJT7sfGFRX2Ao+C57jhGmTZJsjTyN60P77w
	 ONLaY5ZCSIcpq17Yxc2h3WE0KCMby+677rvlH8GoxVSVpFpNtDiHRX0ZHZ4YNEsdqxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793228957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Q5xA2wRJBQ07Qo768sQziuchQxKB2Cjd+x4z5GHdG10=;
	b=EYvrYLTgMfSODrW3joR4zeEn7KREai+EudLPPXEMsHee9RNKZcyxUU8B8REJkCPS4f9I
	 hpBElcsIACClwVcaptW16eqJMAMHKqRyqxTQiMLVaSxG5AwBjLE+hGZUXl1UCBJcmlfBo
	 r4Lr0s9UAPRq6TDDI7fLG+2qKkn+2un88S/tgGhRdPOA0EMd206N0Huh3IaYsId575JQp
	 16PbwuoMZk5sf5wCghlwbSf2x10Xx8OMshrwQAzUSVWu2s9egQHVZLXt9wtPZ8BfUgDCM
	 U4ruPDKgL/CcFuheUPVSliLVUtgUUEjPfgmlQmMMogRG72dvPzaugCWwprlSBfG+gHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LD13kIoF;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74415606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 23:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74415606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LD13kIoF
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1290975a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793228957; x=1793833757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5xA2wRJBQ07Qo768sQziuchQxKB2Cjd+x4z5GHdG10=;
        b=LD13kIoF39wTxqw9o3IXuiCEF3PlE80ON1nRPtW981M0eQIQFG7esf/HPU0iVX9Bcl
         sfUAYs7fiMaAg2JtLNApz33JHHP+72/FcckuQobdxG60ySGLr+8q/wfUaM25AcV0VApQ
         QszL7Lhg5JUn6mrCU1nvRJ1kqQpb6rVbMDSjpIo7nFQ/MN27abrFiQ5HTW6RkWUNAve6
         MDaEvFgv2Eki0M/G7Al3k13DPPm+ArFUNczeX+KKl8m+i35Iukf2orv4xMQt6sn/QShU
         eOqXh9YcndUD4/vMIUHCoHBfCdyInOCrPBID84xAj3nSBIGUJpE9eKdVWjcP0zU/hkDX
         P33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228957; x=1793833757;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5xA2wRJBQ07Qo768sQziuchQxKB2Cjd+x4z5GHdG10=;
        b=Cb4I2xo243uHUWIcuEV6vn0xcrToTprg4drxJtDCwbMmm3TENArb8CtGW8KEDIKGdv
         N5kqRjOOUazZUEDv0m0o2NGSGzMYN/Pfuvl8la79y7FBoXyTIg1gPoxH4Tb4XYURPWeZ
         sD9+hD67YyP5t6tqADNT3sgtw8JhfNSvdDuqvzZLVy+SJBMZC5/TUcl7OFqwJxWa3Wm7
         v6s/ta1El6F1TcbAu8i6i3CS20a/sFLxUBw03q0rW7mraEhsKsm/HH5NWUQi+6qztDYo
         At42ZnkE06jWZ0zDAtT269GMxsIGIN2xD6A6KaphjWgi++qZU4IW33LU60QAEmLqIGMk
         7tSg==
X-Forwarded-Encrypted: i=1; AKwUvByeVbTEg6ePLcQkKagMIOdpE+qkYTxmPuaAl6WuUv9bAxSXZXvsO9MpwROXR9YUzbLpjWz4J1WoO6MimNyQv7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWRuqY909osib0EtfoXhMdhk3JW1KcXONybslN3/YAiaV5y9sG
	u8HUD+8JeD68KjBV/v8RoYIT5I1F3BuStwSofRRbBtZgqhyAQh+7ftu8KPJt+4sdSw==
X-Gm-Gg: AYBFou0bhaSZuCINwlKGcp/vb1dxX1//GZw50xbSBxXHuGYqmyf9hP6qKbY3PC4iUis
	fCj2VRG1xk5wlrs9GSWe04NqWWs8mewVBzRkSa7fpM6gekB4h12zOI070WfvHpeo7JmlJtt3Psj
	X85GPs3MCeieRjw5BlfpRKDh7APdO4Ptf+ihW8KJFh+ohF9P920fTqfaoxIaa2QbTBMCRPpbDo/
	v0Q6ZSz6sdW2P/BXQRiK6Zz2I7wXSEW2Ac9zynsW9zO7GwdGOp5tTMZ02KFhLT5YSQXn+meJknm
	YN2WQt/SosrnbSrUq9S5FWKn93jRfgYiW2iiCzvrxJGNIyaBSzx9suM5iLDporcaQ/LkSfs2tvU
	yYnNFAe9pjBoViVGN/PNlq80ixtd0c1n320ZTsen8vI/cGjXZhC3qk7c0TMJkGBwunA2wftxqsF
	XQjghvOsMU4MjYh6wieiPjmrjxXy+BAHWW4mGhSO8pnWiv/BmVWpYM1d7VETfhRMNDuTPp02Urr
	x4vHRM5pYF2uoyvmb8agclYs3zFFpOm81GZtQJ66vDRm+OVBNZaY3W1+96vqXDMrZmKc2uaIjgw
	WEFQPdSwKdOpr7V7XVkZqWQaHA2bzhSGhWUFApcDYHiheB9wNnuiExFbr8d6eY6wiQ==
X-Received: by 2002:a17:90a:ec8e:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3ae58319f5amr2770048a91.57.1793228956133;
        Wed, 28 Oct 2026 16:09:16 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm1327770a91.11.2026.10.28.16.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:09:13 -0700 (PDT)
Date: Wed, 28 Oct 2026 23:09:09 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs
 mount chosen by userspace
Message-ID: <auKAlcPN0Lt6Y3Wm@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-8-dmatlack@google.com>
 <179322496574.1894369.544573858973645958.b4-review@b4>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179322496574.1894369.544573858973645958.b4-review@b4>

On 2026-10-28 06:02 PM, Pasha Tatashin wrote:

> > +/*
> > + * Whether @inode is on the internal shmem mount, which is used by
> > + * shmem_file_setup() and thus by memfd_create().
> > + */
> > +bool shmem_inode_on_internal_mount(const struct inode *inode)
> > +{
> > +	return inode->i_sb == shm_mnt->mnt_sb;
> > +}
> 
> Please fix the warning reported by kernel test robot.

Will do.

The prototype for shmem_inode_on_internal_mount() is in mm/internal.h,
which mm/shmem.c only includes if CONFIG_SHMEM=y, but the robot was
building without CONFIG_SHMEM. I've moved the definition of this
function into CONFIG_SHMEM in v3 to fix this.

> Looking at this together with Pratyush's mapping-freeze series ([PATCH
> 0/3] mm: allow freezing mappings), I think we should extend the mapping
> freeze lifecycle from preserve() -> retrieve() to preserve() ->
> finish().
>
> When retrieve() returns an fd, its mapping should still come out frozen
> and only become fully user-owned/mutable once a successful session
> finish() happens. That keeps the index -> folio mapping invariant across
> the entire live update until every fd in the session (e.g. vmfd,
> iommufd, vfiofd that depend on the memfd) has been retrieved, passed
> can_finish(), and been finalized together in finish().
>
> (Doesn't have to block this series, we can do it on top or as part of
> Pratyush's AS_FROZEN series.), but I think we must fix it either here or
> there.)

Ok that sounds reasonable. Should we do that as part of Pratyush's
series then?

Pratyuh's series replaces shmem_freeze() with mapping_set_frozen(), so
retrieve() would freeze the new file and finish() would unfreeze it.
That should work the same for memfds and tmpfs files..

BTW, this tmpfs series does a lot of renames and code motion so it
conflicts with Pratyush's series. How should we order these?
