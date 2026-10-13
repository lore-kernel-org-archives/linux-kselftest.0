Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936B44825B1
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912829; cv=none; b=UONF1s/3Z4S8dP7ceRCnIAYn+5VBoIUjPvP+iGTEs3QyJWzOaYjWh8oZpwKnE34jsfdDCuPHL90d2NJ49j+LdJrXytzox4fNYJx45g3YEBMNRB84Ozb5EC93O5X4oggfLM/s+kYOX1KkJWyFFtM3pylHgeRV/rT5NYR49p/zUzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912829; c=relaxed/simple;
	bh=m+i5mTlUxTCnrCi8WzAtmzzFXQV0rJfs+5MtNGiKS8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7msHMnpsrjgMNrpztv0PdjPZivxVoHKt9KIpjChrmLaR/c93rVTqtlail472Ln4AZkCf3cdbT6zSS9NUx/oNdm+oeq2Xy/EzbEwhZ3JBCF9E8Dce51LfRpNfYje7TG2/CX+8r3HVpYAQTL1N1/LcDTfawwhJBNyGKSuSOO9q64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L5Vy0NpU; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L5Vy0NpU"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so164675ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791912828; x=1792517628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsfJHJAdVQ83GKISdOFSgeXuIu/91TZW8ltTQ/2oo/k=;
        b=L5Vy0NpUII7ewM/cx4UM0kPWRO2ApbVBxPubGhJKJoRK8E4G23eV28CZ5n2zGZgqCT
         kWH6aZcup0sUVpj7m+mtINUa9yqzqOfc0Vtdrd5Bsxq0iDa1tJ5a0YvV1bJO+QGxcWF6
         DWSlHUYrim965MKghcbksimcpWRqKQQG0o6DYAw6BUkoidplq7AQbUdXs4AhDtLzTVeh
         9zQFu7w+bEvc6/vthrZHX0tCPIK/2anhyYgtUN2ySiCFOHQjHNw4xJBYMuI9aBL6UvkX
         srwM0xJqVYQq7P7jFtgFh5BM8Kt1PMSJdybasoucH8Rayt8/qW2BviKwHa0ZWQP0sJoO
         cyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912828; x=1792517628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsfJHJAdVQ83GKISdOFSgeXuIu/91TZW8ltTQ/2oo/k=;
        b=LPjzyLRZpIjoJjyIIjDmP1cTOHx5u3zMI3z3u2pResGA/CwI66rX3yKZIY4VAtmnKf
         WHIJjusEppcX7Pn/JsZATEK5FLe5fRF2DHxdxE+7hof2zFy8xJfne1uEA1nmbyWTXDom
         eb/8vLCCTOnaKeHgbkqBuLvMA08Zvwpy2qKraDZe/kFTTYyKRzlGdHJBH6TEvE9FwYJH
         ywjCpAm0TZiGqB9oqBZtqZYxYmsRBbZD58NAyOyLN9JyrU0/ZwnlGahv2by2U6+dK/Ew
         mFSlD+shDz/vaMWqbdPxYHh6Q1tBJKOs9WVp2tJKD2igXY25iiECO2Gq7nsj72jE25+5
         E3bA==
X-Forwarded-Encrypted: i=1; AKwUvBxSi8IWkRcUnxnuBdgF3qtPMDmLFhMqEidlcQMBRNM7G5Zs0OZ9wnHDj4xo3Hw63pmgzfB0NW2JvqvhRjXX3FU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeaHL/vybx1PgN00JviHgH02wybqClWkCAUfAm3qVSL0V9+R3A
	7Ww0zPytQeOpnSTVFN1URfhFl3oOypicrjFCUP4BeWfDbA/G4Kmjv10dIzH2Bw+yIQ==
X-Gm-Gg: AYBFou15o97R8zPm4arS++eNti9TSwqhRvm+nbELr+Hpq9z0Of22dDz+e8TBGTQEgIm
	1ctmgecMucovcDdv9BsMlWXVjCTVHhtmJ2MSPw9NMgCwmS3LOaxjGIt1eJM3cWKGp1N+PAlfuYv
	V+N0+W6TOOcQEvwDb9gcDFECHSZqm32kzN4PCg0fFDbCaiLl2FD2Pgb6GrThFQQZUHyMkVOq+Ar
	XPbKQ1CaX/Dp+n9P1g+uhE2rcdwKcJYnCDhhsoAIky61Ty5/xbz/wf1Axh6bVNigzgQs6/RQFb/
	qp+ZWa+rlbuZmkfcNXwbNIfb7ZXD8NuYJHGFneQMseLa3azrF6eH5ql/JIuB2nKAWsUqenNLj3J
	XrDSqVLYwgcXOsg8+e9BgleSOI3SXZkhkdRLXhaZcndAlGUsqRJVRrRpaVJPCVyTc4lxE0jzC+1
	d1Uprrsy6FP4vT9r0BgNCJV3knQdz4x7WejCbGH6/c8JKxrjMBU4deYM81g/FEkiFkntjymfQEg
	tbsTkJWAQ9yZsEVlOCTlptA57pJ+k9i
X-Received: by 2002:a17:902:ebc6:b0:2e2:d665:6ad8 with SMTP id d9443c01a7336-2e87bc2190fmr12955725ad.4.1791912827258;
        Tue, 13 Oct 2026 10:33:47 -0700 (PDT)
Received: from google.com (75.57.168.34.bc.googleusercontent.com. [34.168.57.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm637262a91.7.2026.10.13.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:33:46 -0700 (PDT)
Date: Tue, 13 Oct 2026 17:33:43 +0000
From: Lisa Wang <wyihan@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v15 14/23] KVM: selftests: Expose function to allocate
 vCPU stack
Message-ID: <as5rd8F3pLmimtGe@google.com>
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-14-7c62a5d8a992@google.com>
 <b2143700-da36-418c-af63-0b50b33f080e@intel.com>
 <932ec219-5951-489b-bda9-1f6e9a605a9b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <932ec219-5951-489b-bda9-1f6e9a605a9b@linux.intel.com>

On Sat, Oct 10, 2026 at 11:54:42AM +0800, Binbin Wu wrote:
> >>  
> >> -struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
> >> +gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
> > 
> > Besides what Sashiko pointed out[1], this patch was just messed up during the
> > rebase and it even doesn't compile.
> 
> 
> Yes.
> 
> And since the upstream code already has vm_alloc_stack(), which basically does
> the same thing.
> 
> I think this patch can be dropped. 
> 
> > 
> > [1] https://lore.kernel.org/all/20261002091331.BA23F1F00893@smtp.kernel.org/

Yes.

vm_alloc_stack() can replace kvm_allocate_vcpu_stack(). I will drop this
patch in the next version.

Thanks!
