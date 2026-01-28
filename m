Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A83218D8
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620029; cv=pass; b=ZrVxOKKRgKhZ94zV4rzKZJGgVhex/CrRDV6oqxF8MH6zLMd4huWqoK/di1yvK4N7gjF130hyzIkXBtKquI1fVy8xsRWJg4miOJ14M3DsKRpoRaC1yEeRjUCHngpBUTrP4XUVGGQKW4039+wBP6PK8+R2GZzuwwX3WhW+7H+TVDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620029; c=relaxed/simple;
	bh=gWij/TH8QPr+IwLvH0/2/fUh1RCAU2KJ3dVcD1USFIU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uY7gw4oGKQQhScaSIqvcHTJnkbRLE8mDiy9DEOZMJVAGN2fyjjeMsMnB46Lgglu0rlgeVSyhNtg/12IHeqsVTqt14gLVdWoXkuqjkjeVFZkgJUZBa+BHv6CkbKv+BHtlAmg4rtg0zktXeC7NDoFi9+TGHA1Yp7LeBAf6D1aYGB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JS6heE0f; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JS6heE0f"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5663601fe8bso27270e0c.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 09:07:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769620026; cv=none;
        d=google.com; s=arc-20240605;
        b=F8Sd4tR4CvJZFAcvVtg9FcFmIckcDjyW418WI196mMHo0dotUPab5wm/ECNmAwo9UQ
         tMzouNnW3yrjBC4R8IDhBBfAoHksqpNvQprapyyujrFHhb2BbpC3bD3+MDUTBwjf4JY+
         LvHE4gnMaVujEbQQzyPLlKJUvqTCI623WIrvacslBal/qndP4JFARmhh/IueDbzTeJlg
         6OAW/UOw/wMLQ+7p+L+ydvPQcJ9Zev89VTxNn2yvfwPR4EkOzlMAvBuvE3qJGpZrGXKn
         O1nPtqAQip4RdNX8C3iCYVkSTImYEwWN1eoExl8GJOztfFK5B0T0BAZjf4DUM1LA2VGA
         ilKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=hQ2ByvmYGALpHjwu0udZOzYr4BMUegwRg7Tc5bSaMn8=;
        fh=uGjHsqVjH+m2O/y+o67DNxo8pGe0Qm6QrzbOil199aA=;
        b=eJL03PNKIt8grYl+SF1qB+5c5usqrbjvq8u0MahwS6INpH7uLWJ28XRH452gLrWgI+
         0Y7akUFj1uQWNkHHS6/DGfaCR798zVjNkBtmNxxPK/J7li+zC7CYfWodpjF+g31v6dM6
         6F+J4O8rtiIH1mnXm+xJYk7t6BxVZpd8fUUxyis8GbJlLzTgcYct5Ve4eGvxnhTgvrHb
         FCy03YDet/hmqRFGe0Tc3Z3VbId88Ts4nnTOjkhCpVKHk+LEjhSUP5v6DXZL5ogKJyOe
         5v7RlscdWV1L6nIGOXtZlr6MJVkdpKGxQoNymK2JfFIvCoakegzh5TkvCbFhNZIXrZfq
         5vxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769620026; x=1770224826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ2ByvmYGALpHjwu0udZOzYr4BMUegwRg7Tc5bSaMn8=;
        b=JS6heE0f4DJMjmBufL78cbbgFc3tXStJhNFZSB7w4D9RdPaRft+59kETp8NXqy5eUt
         yyFGbrPcnCIu3T8hdoXRzuOcfjZkVPjeFrWbcvcFDog9qna8n7ZOYof0xtFYSrPFoTXn
         E57qAMjQVF/kXr6sC18641QtVgsvERg7ITeS7cJEoCvRUbyfuyONLK5OEtiU/w5Z4/ji
         q5HHLFaqIXmT7ti9vqgri4WtDeIor8DY1O1Vb2NJ8rLb8RYbfhTAo1n4Y3g8gDMxQ1m3
         BU/xtpMdz0FfsuubtAJHCoPo+wFYo5VJ/FUR8l0E+RAot+qNqZKUOUEZni16PEhrbaYS
         EcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769620026; x=1770224826;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQ2ByvmYGALpHjwu0udZOzYr4BMUegwRg7Tc5bSaMn8=;
        b=BnEqNrDSpw8AEApAZrQRmw4bsH1u3FKohwZIo41oOMeU2HMAGkyziKUymmX52/p5/X
         LHk7USs2GJoFt09rBkWAGOwCs26g3EhFAatXRrjfa3qxQ2R19ZQy5hlsr/CruOsiK7ip
         OZ0vTz/05Rftq481fAYTD/ZyTiqiuy9Q9+FIS2sWRemR0BGTuAEC1YubV/cQO1PrmkDz
         XRoOsFe/toNDAP+8f4L3oWaWH+cKEXem5bTvsP7r4jAF3CQZ/5iYyH9z5g9Dw8f50Tux
         EIGrkcoOJag+sfSWDSeCxiIJxpJZw6c4tAO6VBKskP9aAHqANi3BBq2QM/0Ji1ZAWoQ7
         ZpbA==
X-Forwarded-Encrypted: i=1; AJvYcCXUp2eya5CDaMrf4kNaWcQtlJw2WvTUGuM5NicY3nHwAfVwwyUkzjz6Vg45xJnKb2n8Q+dB+u1BZacvO9/0wHM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx80C3l3aL8kZEDgpXsqbQz4ugSiCp9nZHuTNF+Uq1i3cTgLZpu
	oEzrvLR3VVKnT5tzuw8mSLvrU7hel9zR30r3xKWueTJlGjxL3pj7aZlWj2HEg0xTGSEoomRl6U+
	1vSCg4RTC03fJtmM1zB/uy21G4d/j8kgaQPKOxqF1
X-Gm-Gg: AZuq6aLHQh30ku6s1Mlky7lzH2+jfQzb+209JCl9mYmNQEdSc90xtO0r5IlanW7k2Te
	PTbOxf8JcMBf9F0PpYd4sC0u/peONwkjQ3iR+29znz3UKqwG4NcJbxhX/eHkJFV3N2QPg/dAoE1
	f7Qzn05R/ELhSC3LQhUiTgWjrFnNYSs6ZnisngKh/Fksy8o+SDoK85PMXCpctfdP9zWKD0QApRM
	imCmAagWQozonWbgA7SUwaiuPpQnpxOuLD5RX5XPe/Yht4ri++v+dJfaZ44tsqdLch+XHShO6fw
	sq0vwZ3JlqOqpIm9rN1EK5M1428HOn575CJR
X-Received: by 2002:a05:6122:ca5:b0:54a:992c:815e with SMTP id
 71dfb90a1353d-56679502f80mr1751301e0c.8.1769620025275; Wed, 28 Jan 2026
 09:07:05 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 09:07:04 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 09:07:04 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ab3f297e-44d5-4f42-aa17-f2e7c135580e@linux.intel.com>
References: <cover.1760731772.git.ackerleytng@google.com> <638600e19c6e23959bad60cf61582f387dff6445.1760731772.git.ackerleytng@google.com>
 <ab3f297e-44d5-4f42-aa17-f2e7c135580e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Jan 2026 09:07:04 -0800
X-Gm-Features: AZwV_QhaOE_wJlLL_hX7tpT0otF_GVqIj23tN-vGGdhqYGAPjKuSGPxvod54AXo
Message-ID: <CAEvNRgEo2UZ63uv0F7Pv8VfeJipyu82b=Rgiz2gnttdRu9aEPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/37] KVM: guest_memfd: Introduce per-gmem
 attributes, use to guard user mappings
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: cgroups@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org, akpm@linux-foundation.org, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chenhuacai@kernel.org, corbet@lwn.net, dave.hansen@intel.com, 
	dave.hansen@linux.intel.com, david@redhat.com, dmatlack@google.com, 
	erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, haibo1.xu@intel.com, 
	hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com, hughd@google.com, 
	ira.weiny@intel.com, isaku.yamahata@intel.com, jack@suse.cz, 
	james.morse@arm.com, jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, 
	jhubbard@nvidia.com, jroedel@suse.de, jthoughton@google.com, 
	jun.miao@intel.com, kai.huang@intel.com, keirf@google.com, 
	kent.overstreet@linux.dev, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com, 
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com, 
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz, qperret@google.com, 
	richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, roypat@amazon.co.uk, rppt@kernel.org, seanjc@google.com, 
	shakeel.butt@linux.dev, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, wyihan@google.com, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Binbin Wu <binbin.wu@linux.intel.com> writes:

> On 10/18/2025 4:11 AM, Ackerley Tng wrote:
> [...]
>>
>> +static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 fl=
ags)
>> +{
>> +	struct gmem_inode *gi =3D GMEM_I(inode);
>> +	MA_STATE(mas, &gi->attributes, 0, (size >> PAGE_SHIFT) - 1);
>> +	u64 attrs;
>> +	int r;
>> +
>> +	inode->i_op =3D &kvm_gmem_iops;
>> +	inode->i_mapping->a_ops =3D &kvm_gmem_aops;
>> +	inode->i_mode |=3D S_IFREG;
>> +	inode->i_size =3D size;
>> +	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
>> +	mapping_set_inaccessible(inode->i_mapping);
>> +	/* Unmovable mappings are supposed to be marked unevictable as well. *=
/
> AS_UNMOVABLE has been removed and got merged into AS_INACCESSIBLE, not su=
re if
> it's better to use "Inaccessible" instead of "Unmovable"
>

Thanks, will update comment as follows:

	/*
	 * guest_memfd memory is not migratable or swappable - set
         * inaccessible to gate off both.
	 */
	mapping_set_inaccessible(inode->i_mapping);
	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));

>> +	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>> +
>> +	gi->flags =3D flags;
>> +
>> +	mt_set_external_lock(&gi->attributes,
>> +			     &inode->i_mapping->invalidate_lock);
>> +
>> +	/*
>> +	 * Store default attributes for the entire gmem instance. Ensuring eve=
ry
>> +	 * index is represented in the maple tree at all times simplifies the
>> +	 * conversion and merging logic.
>> +	 */
>> +	attrs =3D gi->flags & GUEST_MEMFD_FLAG_INIT_SHARED ? 0 : KVM_MEMORY_AT=
TRIBUTE_PRIVATE;
>> +
>> +	/*
>> +	 * Acquire the invalidation lock purely to make lockdep happy. There
>> +	 * should be no races at this time since the inode hasn't yet been ful=
ly
>> +	 * created.
>> +	 */
>> +	filemap_invalidate_lock(inode->i_mapping);
>> +	r =3D mas_store_gfp(&mas, xa_mk_value(attrs), GFP_KERNEL);
>> +	filemap_invalidate_unlock(inode->i_mapping);
>> +
>> +	return r;
>> +}
>> +
> [...]
>> @@ -925,13 +986,39 @@ static struct inode *kvm_gmem_alloc_inode(struct s=
uper_block *sb)
>>
>>   	mpol_shared_policy_init(&gi->policy, NULL);
>>
>> +	/*
>> +	 * Memory attributes are protected the filemap invalidation lock, but
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 protected by

Thanks!

>> +	 * the lock structure isn't available at this time.  Immediately mark
>> +	 * maple tree as using external locking so that accessing the tree
>> +	 * before its fully initialized results in NULL pointer dereferences
>> +	 * and not more subtle bugs.
>> +	 */
>> +	mt_init_flags(&gi->attributes, MT_FLAGS_LOCK_EXTERN);
>> +
>>   	gi->flags =3D 0;
>>   	return &gi->vfs_inode;
>>   }
>>
>>   static void kvm_gmem_destroy_inode(struct inode *inode)
>>   {
>> -	mpol_free_shared_policy(&GMEM_I(inode)->policy);
>> +	struct gmem_inode *gi =3D GMEM_I(inode);
>> +
>> +	mpol_free_shared_policy(&gi->policy);
>> +
>> +	/*
>> +	 * Note!  Checking for an empty tree is functionally necessary to avoi=
d
>> +	 * explosions if the tree hasn't been initialized, i.e. if the inode i=
s
>
> It makes sense to skip __mt_destroy() when mtree is empty.
> But what explosions it could trigger if mtree is empty?
> It seems __mt_destroy() can handle the case if the external lock is not s=
et.
>
>

Hope this updated comment clarify the explosion:

	/*
	 * Note!  Checking for an empty tree is functionally necessary
	 * to avoid explosions if the tree hasn't been fully
	 * initialized, i.e. if the inode is being destroyed before
	 * guest_memfd can set the external lock, lockdep would find
	 * that the tree's internal ma_lock was not held.
	 */

>> +	 * being destroyed before guest_memfd can set the external lock.
>> +	 */
>> +	if (!mtree_empty(&gi->attributes)) {
>> +		/*
>> +		 * Acquire the invalidation lock purely to make lockdep happy,
>> +		 * the inode is unreachable at this point.
>> +		 */
>> +		filemap_invalidate_lock(inode->i_mapping);
>> +		__mt_destroy(&gi->attributes);
>> +		filemap_invalidate_unlock(inode->i_mapping);
>> +	}
>>   }
>>
>>   static void kvm_gmem_free_inode(struct inode *inode)
>> --
>> 2.51.0.858.gf9c4a03a3a-goog
