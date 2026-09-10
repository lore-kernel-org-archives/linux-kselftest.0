Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6741327C08
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 13:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047571; cv=none; b=ieFVnYwnwb9toTlwJSVg9Ux6bbk0QRkJVMt6MW60tsVTFtvzHaY0NfnpEEMlsIpr+X4sKjtfGtcKNhr75ZSbQxMceM+8YKlFHlPYIKAGY7ivufFIFMZYpedT2Wft1CaYN5A5zgyuKoR5UJDPQ41ESX0xOaLyvm0Z/f9NPSo1V9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047571; c=relaxed/simple;
	bh=iuYJQN+7OivI7asb1I66AZzjOo5e5JuKaR6mrGoH5Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRrzCadd5lZEZYjGZaGN3XTyDgJ/YaBUIG6TChF0NgPUmJAzpYttm9Z5rOggOAZn7hNrqpzUbjHgKDua/kzrYzRgoDdQ5FBVUjQ1cwfSARcTZPER47mRv1lh4Pv2gZGXbAWI8H0mdWi85iOMlfRurGHnUvngk1nIFppQB5aT4Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HIeyF7HX; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HIeyF7HX"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92edb12cdf2so516726985a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789047567; x=1789652367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=caoLgz2fIW5G5su0j630YA7b4AyUWzilscsWWfTlsu8=;
        b=HIeyF7HXEvNiXiV8F4Or7fEWmTpQW/zpSkO5J7hRR7UYzbPZIBw/N8dtKz58oFD8r+
         H8MeqaC5wEaJhOPIxcr0bg02Gl3ZVf9mXr1I17/h/uaQCcKcyGCZDn7KCKZwApydZTu8
         hA/p3bZPsN7PbW+TBJFZgjxAqtJGlze1rZ+Fz63ooJ2FFKSzyJLP1AEvnaH0p4hJrQVc
         mvAZRlbT7IfZlkIzIUuow5Q3sM8tqaR+trNkx+p0KrNlkPp9HQMI47En1aMP8vCNfihQ
         IIYkMAnXz+jpYo8QL/5e5qIRrmEpgkEIrMnKtJ91O68s1Zidammzba+nJ/C11fn3QZV5
         /aMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047567; x=1789652367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=caoLgz2fIW5G5su0j630YA7b4AyUWzilscsWWfTlsu8=;
        b=NnPVgyugTO2dWXsTSy3TjnEyWsx5gXIlV7rwfoYCS6ZvrSDoRKulTm3sPLCGsyPXPj
         dag0B45/egN7FTXZVsr8bKlMXmoRVbHGg2KfD1W+MEchQUI9U/Jh8AdZ0orEq6CMc9U6
         /79PoHdG5pnxv1bNjOuEZhYbThp64ankKoWKu89GV0VeBdHHHHFYMujn1oyYiK4kk0qw
         ZuLc437kkLojgud/XEcQTcJEHSEuc93fyyvhrV2VSBKo9dQHUAlXbPRImzS3Sje6REcx
         HNs2SiC4rbO1SRB90cffo3x8+jxFI7/1ioewNCzx+a26QA09GQbMzUUNW+3D5g30Ac2w
         MsEA==
X-Forwarded-Encrypted: i=1; AKwUvBzj5epQZYj8PbXPgY+wEKuxl+TXE1C0bRECM2zO37zj+x+pEsNZRtqeqeCdxeL1PqrV1ouFNwQBo8zX10hi5tM=@vger.kernel.org
X-Gm-Message-State: AFuF++n5r7o/zHnZk3wLfZFKEzCyPd7QC3yPgyntLvOccbk0OmhRRkAb
	vN7etQ9o3XE/MKR2Ir0hQZD2O+Xsr186+nnGxVwbqL/SLZStDnIW9pre4apGRXFLaZU=
X-Gm-Gg: AYBFou1qAi/mP5xveBMr1v6infBFPd6bC4mVSnpQHsZfwEt0Ooxt3hwEofJlyahMK0r
	Rtv1YnblVWOqkJuJ9rpMavcdKiwY4zO4YCTkLCFJyOJpzXOVt+jcIWxlBzPG7MIf6qpEDnbJQvu
	1SD4rwL0AfIZof7EpLfMdZBL4ZCZYLRvdEUX0V1XpLj4KUzvcDf0JMWX6nkhVCL2c4NPBJzxgdO
	IwvnowRl/339r3SP9g93rDMSvn3qLk1D4gILIqnf/vtctEZe+EceJ6QEa6U5ZZkbs1LOcmocbwi
	OpRee9MLlLsLygx2ysnz3qtT1Rdd2Sx4qPCygwMtkhzHVqAS3UpSC+OSYBTx0+Yms6Nc0wBQwF6
	YVQrbp9PYFQcpMDzq+a/kMrnpW1hdBVJKBNA9bU2AhTYMmOSBxrc27P4i0hOYGg0verCJIFIjKF
	Sk7vVNs/jPh1M0rVp2DwZ55w24ZrnA+ikrxu12jzSV5lMn7mspI7dcdSPQsu7NeYAHFpQV14/f7
	Of/+TzidNnaTldk1p0DK0XUcQCAusJDIQYDyL8BltWWR4eAD8Fxn3MDnnLHOyidzA==
X-Received: by 2002:a05:620a:2988:b0:939:85e4:44dd with SMTP id af79cd13be357-93985e447b5mr4423830385a.36.1789047566997;
        Thu, 10 Sep 2026 06:39:26 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e190f8c3sm78248785a.17.2026.09.10.06.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:39:26 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:39:24 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Ackerley Tng <ackerleytng@google.com>, linux-mm@kvack.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, pbonzini@redhat.com, seanjc@google.com, 
	akpm@linux-foundation.org, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, shuah@kernel.org
Subject: Re: [PATCH 0/5] KVM: guest_memfd: bind backing memory to a NUMA node
Message-ID: <aqKxk2Marnz1HU4G@gourry-fedora-PF4VCD3F>
References: <20260902194657.79075-1-gourry@gourry.net>
 <CAEvNRgHWyBaBpZ4Bem1Eu86b-cuEA7NkyjxTJ4D3FnpGe1B2Yg@mail.gmail.com>
 <aqHkVKvons1tBs1O@gourry-fedora-PF4VCD3F>
 <0386eb30-0e0c-4d8c-abfe-86161b9e3d1f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0386eb30-0e0c-4d8c-abfe-86161b9e3d1f@kernel.org>

On Thu, Sep 10, 2026 at 01:32:08PM +0200, David Hildenbrand (Arm) wrote:
> >> 3. Why not request the guest_memfd to be mmap-able just to be able to
> >>    set a memory policy?
> > 
> > the eventual intent is to enable this for fully confidential,
> > host-unmapped guest, isolated to a particular memory device.
> > 
> > Requiring a mapping to get node-placement is quite defeating the point.
> 
> You only need a VMA, not actually mapped/faulted pages. So I don't immediately
> see the problem?
> 

There is no VMA here - only an inode (GMEM_I), which is where the
shared policy hangs off of.

So yeah, if there was a vma, that's i suppose the missing component
needed to hook up userland mempolicy to all of this - but I would have
thought creating a VMA for guest_memfd is hacky and confusing (since its
intent is to basically not have a VMA).

Is there a series I missed that was proposing this?

~Gregory
