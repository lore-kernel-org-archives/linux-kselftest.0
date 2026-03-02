Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C383358B6
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450942; cv=none; b=SXcgV9Qil16omr0w1NXTi+ROcS+7o3ENqdH6AYaDTSbJgmRj/BeqBQ9PlxjDnBs2k+06+F4OxS7Yo9H/LQ7ge1tPyfKidj/fwg3tw2sgDbdE15GAZFqKBcYHRn6SQYD7yA+SMakjmYyuBWL9yjWdHe3ltKr+oScxRn43H6KCG/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450942; c=relaxed/simple;
	bh=K5ULHdjkJWFTrPH0dXx05JrTB8YMHL8lkvPnUG9C6K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9Y3R/Zt6FVCyItWB+kPyOl7J1gc3QvFOeB2JJH2+eJvsTvunsVRIAn+Nsm7idE7flgex1xiBHmFknHp7dpiS1suChjeenEq3ZSOZMyvtZcQhdoEhmAd0SYjGEzVZRlxjK2oeBESv68tDyQRf3F0YJYXSA+1w67BYfbk3ZnrX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WPkbthSN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WPkbthSN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837991d1e1so5343415e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 03:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772450939; x=1773055739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1aYNafgGLMp2zV21P8+oK10uFDyPLpaq2eVinuia9OY=;
        b=WPkbthSNzjYrkGU2OaP3MGRaE9A5AuVqltBR4seCVfRAZXAhlC2TmDaxdGFWEk7/FL
         +Ozwiv1gLw5N71yFaR9/B/GpXOPMZk3ECkeWegS0Ge9zjts8Brb4zpbLMhBLOJP+E20V
         Hs4PcY2KtdCjAuGG7dKrzJGniGx+rzz35WjCQUkni89jmc2Q20+6Dl8WLZrwiBm5rPCp
         SfYa99XbWEjSffA4H7rVRo5lYkAAXl6e/v1BIDONDbAJHKl8/1Py2xtyICM4Er+bgT17
         rbpFg9Wp+FpJ0JgiVdfqJX/KzMX6DXLZHg37CTAI3ZkB/Qa7KYzAu+5JhO3A5r53N0MK
         z4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450939; x=1773055739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aYNafgGLMp2zV21P8+oK10uFDyPLpaq2eVinuia9OY=;
        b=JpN1tOT5mBOsnqRQQtgaPaQOQejSH66UI3mG9ucXFmMLI/3LZqo5GK7LNKzg2GbcpE
         ZPofgW2/otOYMgiShvOQcaFCNh69a/uGRDoPy18m32sGUNiFUzys793np8AgRBg7HNDg
         5vfzRYOAn6HlBhi87vIchaPEFxCvB6po/xHoHE+T5m4laNFn3z41u0TOeOcCkeQCK0eK
         6ZhUmDmnhpePlN3u1GNxLU/ZotxajBedUQ446lELFXZM5IFik1G+Tayny+kQwaoPmjLy
         H80yFkbcxziingTpRqCWx0SlHljECXfu/NqcGkJGa3x0lwqSiGMf3Ilx0WipEEskgPSq
         kGfw==
X-Forwarded-Encrypted: i=1; AJvYcCWMokcb4eORm6B1qaxfRT/bIobMzpUA4o5k62KcTv1/twSXSh5wT0A+8cDJuZDuCoqxWvEqAmT/SNAL0wpj5ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTbmfrK66038Fbhtfx0xzwNrleHNxXNS9GmklNPIoTz7RoAEkj
	Tkc2gKjUceS1R7uRr6FpMyV17Lqk6vQZjSKBWzhO7KUc6XwXz2gNmO67J0KV2KkDMgA=
X-Gm-Gg: ATEYQzxOF2uvEjbat7egx8gOfStm+yqPpjrUnjAX2ORQESjBCWn8uw6doEpx3ntq4Ng
	IyJqi2rPdvQs5iZUSjO65SFP1V6373WFrb84/TfVp3cFj67t8t1fBbe7e+EZE3YwaHmICStrvYM
	gKEu7MqCpIDDcSSkLmyC1mbzfwIcuR6GrNU6tbEhw97yApXokmZO6o7lT/O6/Oxd6fXNvqThreM
	konDWpPUusJtf1xr2fBtm6PJ1fJFKTqnvpMd7w+1xBQyXAoDhheLyrRURlPZIoEp2te7KoNKD4Q
	Jz4U+66ObEoFqYAaNsbQn+htgg5paKZ/9sCGf69MlclVew314+Btypk5wl6zexm0EOxqCw+LQy3
	r+xmTwLYVraoscblBY8Fje4+iA8CqmyfYh52773pv/qJpmwezUawQ7TZIgdOA0jBjw7eEGEP8Oo
	DHW16LRw5k5iFg48ZeJQ9UE93gSZCASBwc7WlYNZyeHZKZ8IFeyXDqOJDcDw==
X-Received: by 2002:a05:600c:1989:b0:46e:43f0:6181 with SMTP id 5b1f17b1804b1-483c9bfbdd5mr117360665e9.7.1772450939437;
        Mon, 02 Mar 2026 03:28:59 -0800 (PST)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb789efsm210891065e9.2.2026.03.02.03.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:28:59 -0800 (PST)
Message-ID: <5097ff66-b727-4eac-b845-3bd08d1a0ead@suse.com>
Date: Mon, 2 Mar 2026 12:28:57 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/6] KVM: guest_memfd: Directly allocate folios
 with filemap_alloc_folio()
Content-Language: en-US
To: Ackerley Tng <ackerleytng@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 seanjc@google.com, rientjes@google.com, rick.p.edgecombe@intel.com,
 yan.y.zhao@intel.com, fvdl@google.com, jthoughton@google.com,
 vannapurve@google.com, shivankg@amd.com, michael.roth@amd.com,
 pratyush@kernel.org, pasha.tatashin@soleen.com, kalyazin@amazon.com,
 tabba@google.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260225-gmem-st-blocks-v2-0-87d7098119a9@google.com>
 <20260225-gmem-st-blocks-v2-2-87d7098119a9@google.com>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260225-gmem-st-blocks-v2-2-87d7098119a9@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/26 08:20, Ackerley Tng wrote:
> __filemap_get_folio_mpol() is parametrized by a bunch of GFP flags, which

                                                           FGP?

> adds complexity for the reader. Since guest_memfd doesn't meaningfully use
> any of the other FGP flags, undo that complexity by directly calling
> filemap_alloc_folio().
> 
> Directly calling filemap_alloc_folio() also allows the order of 0 to be
> explicitly specified, which is the only order guest_memfd supports. This is
> easier to understand, and removes the chance of anything else being able to
> unintentionally influence allocated folio size.

Isn't it determined by FGF_GET_ORDER() so when you pass FGP_LOCK | FGP_CREAT
and no order, it's straigtforward the order will be 0?

But if this helps with patch 4, ok.

> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  virt/kvm/guest_memfd.c | 51 +++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 2df27b6443115..2488d7b8f2b0d 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -107,6 +107,39 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>  	return __kvm_gmem_prepare_folio(kvm, slot, index, folio);
>  }
>  
> +static struct folio *__kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
> +{
> +	/* TODO: Support huge pages. */
> +	struct mempolicy *policy;
> +	struct folio *folio;
> +	gfp_t gfp;
> +	int ret;
> +
> +	/*
> +	 * Fast-path: See if folio is already present in mapping to avoid
> +	 * policy_lookup.
> +	 */
> +	folio = filemap_lock_folio(inode->i_mapping, index);
> +	if (!IS_ERR(folio))
> +		return folio;
> +
> +	gfp = mapping_gfp_mask(inode->i_mapping);
> +
> +	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
> +	folio = filemap_alloc_folio(gfp, 0, policy);
> +	mpol_cond_put(policy);
> +	if (!folio)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = filemap_add_folio(inode->i_mapping, folio, index, gfp);
> +	if (ret) {
> +		folio_put(folio);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return folio;
> +}
> +
>  /*
>   * Returns a locked folio on success.  The caller is responsible for
>   * setting the up-to-date flag before the memory is mapped into the guest.
> @@ -118,23 +151,11 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>   */
>  static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>  {
> -	/* TODO: Support huge pages. */
> -	struct mempolicy *policy;
>  	struct folio *folio;
>  
> -	/*
> -	 * Fast-path: See if folio is already present in mapping to avoid
> -	 * policy_lookup.
> -	 */
> -	folio = filemap_lock_folio(inode->i_mapping, index);
> -	if (!IS_ERR(folio))
> -		return folio;
> -
> -	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
> -	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
> -					 FGP_LOCK | FGP_CREAT,
> -					 mapping_gfp_mask(inode->i_mapping), policy);
> -	mpol_cond_put(policy);
> +	do {
> +		folio = __kvm_gmem_get_folio(inode, index);
> +	} while (PTR_ERR(folio) == -EEXIST);
>  
>  	/*
>  	 * External interfaces like kvm_gmem_get_pfn() support dealing
> 

