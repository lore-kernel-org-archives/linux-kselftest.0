Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE3C511181
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797097; cv=none; b=sobPiYhCMPHpuU7s2l2nUIJ+gB54qNAV2TRzdClTn8jOl7F9iTmvJQqFVntdkACBsl63aVE5Lff2tDS+4Fvas/T7jSys+ZmwHTFqllTvXFi67lYKDy0zAdr823WN3COKlmwCcCyib4LQxzBSQQf+hu+dHNMWpWavT39+EYV05cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797097; c=relaxed/simple;
	bh=7oIcXSH1gZ5pYqSF0p9nTlhpOlZssCHFCItFtSVIiEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9IsH/57MChweH450PBnNlVWZ5RMdHVht8ksWaWoIukOPg8UPfjU33FDerI4H8NNsKS3m4iN9ppxfDoyiBu+e44R86E0joFfThP5yAbIjeUWjeUUhYzhWuDt1v9QjgbX+yy28/U5mXyR1frCGsmVgS3rZrZHg/2YrUTWBjsmU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mOUSZR5a; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mOUSZR5a"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90ce08834feso55007636d6.0
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 09:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788797093; x=1789401893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNnTBID4g9aytHQLyfm+JMBPPEsDRdj9xryUeJJj4sA=;
        b=mOUSZR5a+jKgEMol0Hs8T8xctZFoniizjw9yko8/lHt97hsjjdfh8H7JdITzhH6RcU
         5OvNOf0yAFXzE7AuVTc9G7P6IvObGFJwBL6dex1xECb7ayQfii1sudbg/Uun3yNd36oL
         sIFj/I8mpNtpWcxQzh9C3hu1H5R5P6lRSZfaHzqCopL+6JqQh36zGC80U4GzPsB4D1cw
         FL56uRQUPbCvEVLlOibqAAV2R8gtzVn7Sesoep7Iq3/ncQeP6LnZr3EMAoGbFwRlUATS
         llI5GxdxOcd0lGXTrjb7r4/4oIpXZTkGE3yB5B3dWUWjuPpyd2V3cIxRi39qqHL+eJ0V
         HWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797093; x=1789401893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNnTBID4g9aytHQLyfm+JMBPPEsDRdj9xryUeJJj4sA=;
        b=gpEXU/Zz6sYFZ0eHem9S4hAFoxfy2Pu8QGVOELdfzUmt9cC3Hc4Gz59R+5Wvnehxyr
         zU+yYveDk3l1sL2Fz51GRxLMhtJWOLkudYAvGv6+MCvCITyrWZq+YEXV8STBhFXMIiaF
         izYv+tu4qbnJ0ZYHkc0/WTBFVJGATdASVGn0sLdfk3HEfBxRaT0bZSHTQqfAahvXWX0k
         Dz/zjdXI4lN1LbsE6t6WqEovJ3IZbrbrXGG9q6DVDUs0IPND3adoiU7ERyJ6+FqNBxZC
         68iTXXciHCLxrbOKJW0cByeOJolbvglBRLPbS9hGPtLUPi0V/Rh4jEZgwVYp3PdSRjVv
         jlqg==
X-Forwarded-Encrypted: i=1; AKwUvBztg/Ygzl2SFT8rEaP8Ccf8v6AA3JcHmuSaHyAKF+jjGk0Skn+aCO50gOxDno6IPoKUrvIPjUX+VCpvxVFbvh4=@vger.kernel.org
X-Gm-Message-State: AFuF++mYRuKAe04e26h8yvCDCvNHIHFM1BvddsOIh+DQmXFHBtKNdjZV
	CzmvGKLvn7wHCbk+AyVhHgfzcolOHVhM7Tp4QnHgcqdu/mm/Tl3HRJTz5KToxDhdaww=
X-Gm-Gg: AYBFou0I2n4AKGQlt9N1eZQu0pv5Y8hdh1jUjsF9XwED3fiwhB6cCLHBnK9p+1Wcdqv
	7Fhd/O5RgEI5jJO600BHrANGZOUhX3jWupB0FcUClynuXScdS3pQWVEKjvGcilP79x5bvLu+Dnd
	likYm97/VST1XWDX3SVzm2vyg7AEuNyTvZx5yk6tQbWNPC+DX5mD0cFNJ9T9CU4v2STN2Xjc2sN
	gWBTEn5NQQ9AKW0km/agfBDL4Qp4QO7pwdvSn+HVh0h1GAT+MuK2NhkSKubZPbJzVq7lnS7wRqk
	9jmff9hd2Qg1CQnfNkRscEoMdh8pq6QUscOvQXDc/7PaWlmZGmshuBz3zMH8mvFZUliZyA+f3cl
	j1E6WkhK1FKtI744S9FKaIrmR+Q7Z3jXX9j3yOfeeIxfRA9Ny6Tm62oJWSGRVpZARWmzwbH8Pwf
	pOorczJZSU7fno26P7dNpNIi6VLYU/tIBUYXYbBL+aXoKkWNiG1EUT3yl6cURrott9tjEFvtKUo
	d75fo0H8H05SiNRqPCTRVXWvFBQ2VZtxDQczr14sWfk
X-Received: by 2002:a05:620a:a38a:b0:939:f89:3688 with SMTP id af79cd13be357-9398048b90emr1959600685a.42.1788797092662;
        Mon, 07 Sep 2026 09:04:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fbb70f1sm932389885a.40.2026.09.07.09.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:04:52 -0700 (PDT)
Date: Mon, 7 Sep 2026 12:04:50 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/6] mm/vma: only permit MAP_PRIVATE /dev/zero to be
 mapped anonymous
Message-ID: <ap7fOu5DHkKtqlkg@gourry-fedora-PF4VCD3F>
References: <20260902-map-private-dev-zero-v1-0-a578c730cec7@kernel.org>
 <20260902-map-private-dev-zero-v1-3-a578c730cec7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-map-private-dev-zero-v1-3-a578c730cec7@kernel.org>

On Wed, Sep 02, 2026 at 07:00:20PM +0100, Lorenzo Stoakes (ARM) wrote:
> In order to use mmap_prepare() with MAP_PRIVATE mappings of /dev/zero
> without the success_hook hack we explicitly permitted mmap_prepare handlers
> to set NULL vm_ops.
> 
> However this is dangerous and we really only want to allow this for
> MAP_PRIVATE-mapped /dev/zero.
> 

"this is dangerous" -> can you expand on this?

I had been experimenting with mmap'ing kmem dax devices as a way to test
generating a driver-defined efault mempolicy on an anonymous region, and
this exact pattern came up for me during mmap_prepare trying to get rid
of the "fileness" of the VMA.

Basically looked exactly like the /dev/zero vma.

I understand this is a hack, i'm just trying to better understand why
"this is dangerous" and it shouldn't be a supported pattern.

for clarity:

   fd = open("/dev/dax0.0",...);
   buf = mmap(fd, ...);
   /* 
    * mmap(_prepare) callback marks the vma anonymous so it takes anon
    * fault routes and sets an mbind mempolicy installed on the vma to
    * prefer the node the dax device is registered to.
    */
   buf[0] = 0xDEADBEEF; /* faults an anon page from the node */
