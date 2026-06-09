Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1B3905EE
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017116; cv=none; b=bbAJnLYmz4df9NRFudXiNbjizJnzpcgele1o2ZFwdUDxmdza54wt9q9+N/co4jsnImHBMSglDaeXgz1NpdpC9iw0n9gtd41w6Oa2Re0JOwrJ6VOH/5x9yrNz366YvliukCqlEWqqQXNhN5mFav0F8cZNtGA71cr5+t8MGhz+edk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017116; c=relaxed/simple;
	bh=89JGksdThCij5+VjGUOcb5O/ZGVRmOdgNkQwA8TGZlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvrhJ0nLuaGElptuj7dJZyAEpMzozscm5968H8mXMIThAOmzd29x7UaPNzEXISfyxzIlIoD98XigGYOv0a0/I28n7BehUnQObff+fG3hmxlhZaTOndauNsntcSMwS5m9peNe51yJ7eV2oy+IpbY1k5eeA1O5buuotJjI5IvQmzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tdo4Gkb7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tdo4Gkb7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso54657075ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 07:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017112; x=1781621912; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eFoSbz/qa2j2QRMMIew+HXblnpoKHM6VjME/GNmQDGg=;
        b=Tdo4Gkb70sz1WZpRhmXsMMAbsW5c5IptasOp/N1KcmZvLYbw+P0Tf21pdZb6BjM/rm
         Cpl886tq8iW0aVwtWQz7V1l8l42mami4zZCtQzu0NO6YLf+BW6k4XgXFk8Q+sY1tk9xP
         3My6QwJlLb95bjiFQds12dOvrT9NQRdBxym6IAreSNwKTVv4mrJ/XSY/0yPoc1WSExq0
         ZGTQS66UR4kOUBUjSpMtEL+CA5mDrTw/Gj8I1q+9v6EFOB81Qrpg3rTpUgX33aDdScDi
         8HySQQf8W9Fz2QJqzOUMd9kLnQRXH8ULJSuuSvFxMDVPQKF9GsqCyvubMJ8rthiFjoal
         YpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017112; x=1781621912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eFoSbz/qa2j2QRMMIew+HXblnpoKHM6VjME/GNmQDGg=;
        b=emZzNIpBy2Fl7m0xkD7YUGQdYnsTEFzGMHOxmulEP4TX/bdTHA65MEjBI3EGJIVCip
         g8wRcplLKN8C/0E4rYdIwL6+wfeGPdKSolc5JiqH5b53DxtB1qD66VxKvbYw1hHKTKY1
         c1WcWiaTAdKVa9Q9YYE8niMyJURHmdVQ7Mw1Ff+jxe5b+PDF956E2PKHjK8Kk5xkEad2
         UzF2hKT/O2c0CjT02LZwt9dygROGDi/cRuz/J1EDpGQGqPw3hLK7eCecirYs6ikZ9/QY
         4+Q5NFR4jZiU3NESXOETPi87cR+5rqj/xtH/bAy4aWbQguX+82Oi2ZzjJ5F5bJvBXo7e
         V3ag==
X-Forwarded-Encrypted: i=1; AFNElJ/pzvA3HKaRsaE1z9aYuuW9pvuX/J9MMTISEP/boiKnispbRMrlYHmyzmv5FzES7uWal0p4vZOC257j2SVoDp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySSQ/14uQOhblXUEFXWD6p9jxbv6epNsRnnIman/s6SW0jcfwQ
	/AFlejvNWTL6ItqJUh9LUhIZjeftCi6NhjCSQDgqqxBzFGUbfNulJIUE
X-Gm-Gg: Acq92OGVSSsApoPuSvDAtuW8m///h3eIA0RjkuH31cHLgFWgDKc80oi49tQxxJK1zGG
	8RimjtOJPKazwA9esI2F0pvskko+iin0Ff7iHPikgOr0SbcTWx1QR3+9gJLbqPfXNc2CoPDmTmm
	K+5qN38MxWZc9eHibKpUcdbE4X5VOMIwx0FC2rFHcvh15VwvegkPEA6B7iijHpOX6XF3hpFMQC3
	/qtNJ9U6ZqCSHPbgcrV1ccres9LOGBPj8wr9mgDgOSorQTP+6QTgcMk/gO1sH3b6X6BrJmjyNDd
	LbwAFu4jX3hN8mUBKebRDKIJojmoDs6VA2jyyfIuaIdHqgCar/dmfhlaC1CDIOehw5CPHnsLl4Y
	wiBxgLA/JBM5CT/Mk5ja1NphrQya3knhYTEQMMO9LNK9/xxZ0ES2ZNPjg8AoUIOC8guON4fAhcH
	igVFB5VQa5uOnbzXKgdoMe2uX8iLCwoUtnGSWCAPrlNhUB54aMkPMgKw==
X-Received: by 2002:a17:903:3885:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c227be3b30mr199425095ad.9.1781017111918;
        Tue, 09 Jun 2026 07:58:31 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:3::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f87920sm219844645ad.24.2026.06.09.07.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:58:31 -0700 (PDT)
Date: Tue, 9 Jun 2026 07:58:29 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 2/4] udmabuf: emit one sg entry per pinned folio
Message-ID: <aigqFQWzPkiSh3ie@devvm29614.prn0.facebook.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
 <bdce2488-fe77-4f36-9ed6-dd2c785fa7c1@amd.com>
 <aiMY8CpckM8Jav0g@devvm29614.prn0.facebook.com>
 <0c86f5d3-b5e9-4cac-aa9d-30c5c8ecca66@amd.com>
 <CAKB00G3opAoAYswsq2uz0Q6jgku8u4NthKOzCbSumZ0qK7QxcQ@mail.gmail.com>
 <a51e97bd-39dc-492f-bd7d-f137423277df@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a51e97bd-39dc-492f-bd7d-f137423277df@amd.com>

On Mon, Jun 08, 2026 at 03:59:04PM +0200, Christian König wrote:
> On 6/8/26 15:55, Bobby Eshleman wrote:
> > 
> > On Sun, Jun 7, 2026 at 11:42 PM Christian König <christian.koenig@amd.com <mailto:christian.koenig@amd.com>> wrote:
> > 
> >     On 6/5/26 20:44, Bobby Eshleman wrote:
> >     > On Fri, Jun 05, 2026 at 11:30:07AM +0200, Christian König wrote:
> >     >> On 6/4/26 02:42, Bobby Eshleman wrote:
> >     >>> From: Bobby Eshleman <bobbyeshleman@meta.com <mailto:bobbyeshleman@meta.com>>
> >     >>>
> >     >>> get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
> >     >>> underlying folio was larger.
> >     >>>
> >     >>> Instead, walk folios[] and emit one sg entry per folio. When folios
> >     >>> represent large pages (as is for MFD_HUGETLB), each sg entry is a large
> >     >>> page. Normal PAGE_SIZE sg tables are unchanged.
> >     >>>
> >     >>> Required by net/core/devmem to support rx-buf-size > PAGE_SIZE with
> >     >>> udmabuf.
> >     >>
> >     >> That doesn't explain why this is required.
> >     >
> >     > Sure, can definitely add. Devmem currently requires dmabuf sg entries to
> >     > be length and size aligned when it allocates niovs for NIC page pools.
> >     > Though udmabuf is not violating any dmabuf contract by emitting
> >     > PAGE_SIZE entries and the above restriction is probably more a
> >     > shortfalling of devmem, by emitting a single entry per folio this patch
> >     > allows udmabuf to be used by devmem for large pages.
> >     >
> >     >>
> >     >> Please note that accessing the pages/folio of an sg-table returned by DMA-buf is illegal and strictly forbidden!
> >     >>
> >     >> Regards,
> >     >> Christian.
> >     >
> >     > It seems both devmem and io_uring zcrx at least introspect through to
> >     > the sg-table to build NIC page pools (not accessing the memory itself,
> >     > however). Is there a better way?
> > 
> >     That's an absolute NO-GO! We need to stop that immediately.
> > 
> >     Touching the underlying struct page of an DMA-buf exported sg-table is strictly forbidden.
> > 
> >     We even have code to wrap the sg_table and hide the struct pages on debug builds to catch those issues, see function dma_buf_wrap_sg_table().
> > 
> >     My last status is that the NIC page pools are build directly from the DMA addresses exposed by the sg_table.
> > 
> >     Was there any change I'm not aware of?
> > 
> >     Regards,
> >     Christian.
> > 
> > 
> > Oh no change, your mental model is still current.
> > They just go through each sg and use sg_dma_address() on each.
> 
> Ah, thanks! That was a near heart attack :D
> 
> Yeah that is perfectly correct, question is do you then still really need this udmabuf change? I mean the DMA API usually merges together contiguous DMA addresses.
> 
> Regards,
> Christian.
> 

Hey Christian, sorry for the delay I justed want to double check what
I'm seeing...

I reverted the udmabuf patch and confirmed devmem still runs into 4K
pages even for hugepage udmabuf. I see that the dma_map_direct() path is
being taken, which if I am reading the code correctly results in the
sg_dma_len(sg) inheriting sg->length directly (set by udmabuf's
sg_set_folio(..., PAGE_SIZE) call), compared to the iommu_dma_map_phys()
path which looks like it does merge when possible.

Best,
Bobby
