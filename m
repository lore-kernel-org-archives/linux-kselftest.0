Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362278;
	b=kLTAH0YcBglQP0MnBY3bctPrtQ3ynJLL6X35i0GB/XAn4qzGqiC4PYREvbMMrjyJyZFI
	 Riv4FOgozPfceGU17PZWUbNRf1FFFF2EFpqP2GaVDBhkQX0UZPtzs51kChdkwyMRL9jUk
	 qvv0eIxgW+mQn25FArNSL+HzHUgw+/d3j/m7+mTGjxQw7dVf1bDSaWLahNrEN9Memarzr
	 bSZUWOKdpnswjkHQ8Kd0elA90/1U36FAwKr6F2AxiHRl0spSIePU/vN68S5xxtPwjOytn
	 0RizFGZrcXLiqntk/FuSJKG9yOQw6Tk8VQUPDkTfiFSqRlvYtoZ8Jx0FE5rokhgaEWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=G/h51dJLYeoxkjlU1HlBvF+u6DEcazEkF7G3j/5sadA=;
	b=dGpQLcs78Qah9zbtsVv3chfWMcV1/PXBknfBNesmUe4MoBJJJpff1wZIhmlbGrap3ExW
	 EfG8L8gw5YCMUXglII98+rAotapMGYhpfVg89CfunGmAIDCQKnhoVysZtBTtfMBrhtsNO
	 lbPAFe1TGwA8A47wrzzJ+WJMS2lWEhSjBuVvRW8BTERlzfYqVIGwglUd5EmEssb11hFBW
	 akfs+b3xu3smIxSrxb79TVMEsfSAMhPqIUAR+AOj6tb4w68H7LjX7fJDq1lyOwLPxgMtd
	 dzBs5HVSPiGZJk5wd3h9TMqSoOX+TIgFkZ27/3qKYwCE9CGYLbxSXgA95T5Hi/ctktg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74561606A31C
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 12:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74561606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91b55859245so10482216d6.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793362277; x=1793967077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G/h51dJLYeoxkjlU1HlBvF+u6DEcazEkF7G3j/5sadA=;
        b=oA0v8sINgPPBKIONlsdYbjsJ87rAJ5i6eE5Q3YCIsLvFbiQJhGexz0GbyEDNCCZD6a
         p0MV5c3Uczdjv1XhsiIbQTtQi5Vp2z9yQeVX4ao9fyJVBycBF5kXx6/mTl70TjzMnCok
         G05SbrF0c9k6ZAJLXKzphYMVEDDK1GKw8OzgWBjmFyaaEHgwUvrNLYQr0skqHxH3T6Yc
         OVQx4BFegmIqmLOk6yQ05bXf4dIWwIB1X0cX+CWl48PDaxZ4x/cigd0Ch6rsN8lEPgGi
         dYcgWMLfovRlIlaP8ltfoaB26Jl6NCQ4kppLz5tTRxjKHm2+76osmnaM0MUb41a3+Q82
         f1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362277; x=1793967077;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/h51dJLYeoxkjlU1HlBvF+u6DEcazEkF7G3j/5sadA=;
        b=qnMCLcm8Ggqqjrx3tUqbSpSKToDnc2kO8OAnV8RKk+VlXNFwgwnhma1Cg/gxnDbxty
         BL2UhGuUPLXOyPGROYSKcZ1QaGuwbNt+DbC+PGV1q/nAWS/Oa6Y+PSWO8PvjAX7jtQos
         vDUPeZxbK2ZUetTZsOez9hQ7fiI3ZcrPBQRxKcxpyZPNr2sJlDGDrNb6OJTHFZk4AzpG
         HFzlD2ckEKMKQrvwbq/sb1GcFA7BhSSllBujLATZFmOF3MGSwhUXerVwSZY7Bl9jumJ6
         gZuIWyj+WjWmjpF82t92p4vhmlGNUXORgzGePfEloqaI46ovpxjXFGOvBmrs4NDdWyrN
         vy9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHmQF3KpRa/8QZzD3IWOMMxApzAVeHL/XbeB8hbi+UXpVVWEm52aqjYqpr83dE3LD7XHohicje1IhzI804V7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLmEAtL6FVcd8Tg3BJNPWKihlUBx/jIczQYtXUztEtrz0sZWri
	mpMMsw7y2mjxJ9DA1BM01raT0BKBel1yMw5PHSg/w2Pp7Qza+3Hq72cT9NqNlX33c/M=
X-Gm-Gg: AYBFou3WbKb5Y9PuIANNEKBXvjds9s01b2uGXy2+er6OKUf1fAgeFsTrMXuXMvyb8Ny
	amoU5GCjN/DkvG+p7Un7vhW9OiZDjijFFrO7xQEH98MaQcxmkciVCJR7C0bSihHEUMP6WTZyQTX
	Im1l4cD925Q57N4NV3ZHpqfUfVFyL16e17zbsaW9KxaaHX/WvykoQAt3Mk8CRV0a9MIhCbBqow5
	rJB346781YkEXICYBcJ/FeBm1trarwaIfJKx7TNnYsA5pLxgoAfsrWZwcRNtaprAOWbs99Dxmjo
	NsXLNC5CR+JOoTM9/cmyBcyU6CKVbmwLV6iUlNG5wS7Jg4hUlZ8mVcPVOMCouIYtlRfydRMdemF
	9fluBFkEWzx97AnkBnPv1HMtPFKXoZ+O7PM4wsnhmnSIP7/4xatSp74zJ0vtPCW26Edn+aURbYQ
	y8vYeZP6U/XRhlAiGycEScMhRgxneVV5rKH22d2KUU65SnCf0RATCl2e9m7Wgn3TTguxVV0YR99
	6xyJzeWcq6n0tewA3NvtRRmgTdHmVsWo6vcEygYZtwAxmBNAa1K67SxTrCRhaDpl2+ep7zvMvhR
	gzuPMOgp6oOT4hepUr02F9wdHc9q5dEePcwZSkY1nHPuegL7IGeg9E3n7hqrJPAG2wlWjpBCwZc
	XWYYUB0bZrRg4EMfhMOHM2slsIVp7o7xW
X-Received: by 2002:ad4:5aa5:0:b0:917:848a:43de with SMTP id 6a1803df08f44-91ca49e9300mr29477496d6.8.1793362277155;
        Fri, 30 Oct 2026 05:11:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca804ee76sm14028506d6.26.2026.10.30.05.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:11:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMlRx-00000000ZRR-0Qze;
	Fri, 30 Oct 2026 09:11:13 -0300
Date: Fri, 30 Oct 2026 09:11:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Samiullah Khawaja <skhawaja@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>,
	Alexander Aring <alex.aring@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>,
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org,
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <20261030121113.GB3889730@ziepe.ca>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
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
In-Reply-To: <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>

On Fri, Oct 30, 2026 at 11:20:30AM +0100, David Hildenbrand (Arm) wrote:
> On 10/26/26 23:05, Samiullah Khawaja wrote:
> > This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that prevents
> > holes from being punched into a shmem or hugetlbfs memfd while leaving
> > the file fully writable.
> > 
> > Background
> > ==========
> > 
> > Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
> > memfd_pin_folios() to pin the folios backing a memfd and hand them to a
> > device for DMA. Pinning keeps those folios allocated, but it does not
> > keep them in the file. If userspace later calls
> > fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range,
> > the folios are dropped from the page cache while the device continues
> > to use them. The pin holder is never notified, and from that point on
> > the device and the file silently diverge.
> 
> We have the exact same situation when userspace maps anonymous folios into vfio
> and then desides to MADV_DONTNEED the pages. Or any other memory backend that is
> used for such purposes.
> 
> User space must not zap/punch things that might be pinned elsewhere.
> 
> That's not specific to memfd, udmabuf, iommufd or anything else.
> 
> I don't see a reason to make userspace (that should not shoot itself into the
> foot) a kernel feature it must activate itself to not shoot itself into the foot.

The issue is live update doesn't preserve those background punched
folios and now we have created an UAF attack on the kernel across
kexec if you don't do something about it.

There was some notion here that with the right sealing flags we could
tell if everything was 'live update compatible' and then know that
these attacks are impossible.

Jason
