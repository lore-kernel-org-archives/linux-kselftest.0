Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF91A40B6E2
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824056; cv=none; b=WQQBvWhl0fLbQFonTphH81iFRUPJQNjPHp2VQh0AGXrVceKC2lXEgvCjvP8ebdivTAgQWmXQDbpD939Y1G908bCG81z1rjIuU2U00eeqDW/6lcT4K8UTLWK6BOc/G3zyTYxfJUdLcmX09BAa2CclYWw8vKRdYLrynZqZXelO7aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824056; c=relaxed/simple;
	bh=A56OfPZZVFGIDpDQ9XCz9cgezTjnSLv3WNc7P02MjjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jx5OApOFU30+QqGWnbsGNL+udE7FWxXSDLvkJz+BNacihJx1fzjasjSBeBVcZXCKtSpUTSPJe3HhxK+x0vke89A472fCVf72jLWOyhQxizbWx30KuO/sR2MGVNh4/A/FtAskf+cn3qE/IR50L/EP1E7F8+woLg+aLKcIPlVRH2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jUlJiwTo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jUlJiwTo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so83005ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 09:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791824054; x=1792428854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a0L3N3ZtqaociPWUQTHB7mjZkgiRjSPFirVt2JXOStg=;
        b=jUlJiwToZneaFf/XGv1R2b7NkTk1TgB+tXTehhHw307Qv2oKSmrHNZet9etW+rUfny
         I2CMVT85kM5moXip9hbDWl3gXnWNZatvQqcbpcvXksr1k8QhPIXdzO0K7+YsHS6+Y0H3
         DnkcoK5jzq6ZOVXv6tHPEzo4ictXebQXXxNtRXcoBYkMt4ontokiL6JSZw5Fp2rZ9dws
         tDcLd05pSJFRxH0/kKxcQZXOeVJ1kGtRlSd9tuREy0KmoslOoccfWJ4GTYHesX6N3H5P
         jrQIThL6I4gWvyjwwq1oYyLS2oHF2MfUxabg4rPS5x6tTxJqb/rfLH9mzayGn4ZH/3g1
         jdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824054; x=1792428854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0L3N3ZtqaociPWUQTHB7mjZkgiRjSPFirVt2JXOStg=;
        b=eJTgPAr1ei9dH6R2P9MshvDK0Q/+VL/VdbUZOnif8TgAAx0NzmM+ob0yppCau7gCSK
         B9owoI0v0Z9IKizcqQjU+HdTLXWSG4vYwQqdGYESjnIEfJvK5A6pA0Yv+MR56V0Uv4mJ
         PZfCN6XyAz22h5HakpHGtEOhxgmuKkq4nNEJ5OFWoYoIrTB2kfjqodovZgiD+SaVKtvz
         Ma/CK/gX2TL5zdzAJE7UJgWliFIeaKhgXE8hPeR/60rakRS4J8CO7xH151ZJJBJ41KCU
         50Tx9TvpjyL/bNkb4LiAHsDCRX3Tyd6PLBCXwQKwMWtZF0P7MLb3+w5h1a8UVTR0G5hH
         D2eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzukULscjMhZk38QIl4VGR7Qy1sRZARN5S1qlSdIa9JKY5+r9fr7Qsu+zGo2qCkX6fK43k51rwqmdFT9aDMIc8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLreHzDYaERvh/47NkQz5QsW2apykBHRnbEsZ+JoNGR/GbRsPQA
	keNhNQvGKCLwyVPsj+NpN2uKNj7m7gRG/27XuPJiB+7/ZsFK4zBIVcMOUtfLSXD4MQ==
X-Gm-Gg: AYBFou1zDhrhq6XBkzM/P5MGU4mAqQLlD+IGt17hzLMlGdgdTmLTWynhhJGAeDNvh15
	k42RxKR/6ZjxU3K+9E5m/JastXOIzPqpbXX0B7Bx3uEbMvuOkU06SHLyUF2wSG6M/scLRFnENG9
	SuPP+BiVWVQXtr1W3n0Gapz0YQZTZwBEnTJmFEHj6XAmc9zgkdLS3MIoeg6h552SAwhjw5vmp92
	YqgBqcCAhxwBUOF9+LTSd/XdCPu0LXwDIcLhdq09iLYJuzmUSWgnSoCxwd4/rWB2R+IQNJDkynE
	TJLvJvzeLx5tDp/OJWydvSaH09uev5M7n3pyZU8v6n10VKuniiilCUdeg1nYSLLT9RbQzslo3bL
	O5J2uRywNtaeUPDYEskLrRY2B1m4ISHmkBQnXIDUfUQS8TgDcgcGkkgcJ05HposGttBLGm4/jzI
	4ZL+QivaxZzUiCd8m3OBq5aV4M0MU7di2YbpT27qESxcmrihwoYM5tS+6Br4/jyLLNuzyYiecUB
	f11OdJgI3YMEiOAFec/YG/IdlhRSKO4
X-Received: by 2002:a17:903:390b:b0:2e6:1917:fa with SMTP id d9443c01a7336-2e87e2f872bmr6833435ad.7.1791824053720;
        Mon, 12 Oct 2026 09:54:13 -0700 (PDT)
Received: from google.com (75.57.168.34.bc.googleusercontent.com. [34.168.57.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab393efd88sm10301280a91.3.2026.10.12.09.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:54:13 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:54:09 +0000
From: Lisa Wang <wyihan@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
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
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v15 11/23] KVM: selftests: Set shared attributes for
 ucall guest_memfd pages
Message-ID: <as0QsZtRAEEq5Tpw@google.com>
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-11-7c62a5d8a992@google.com>
 <7ca516ea-a931-4497-b3c8-b62110ae006a@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ca516ea-a931-4497-b3c8-b62110ae006a@intel.com>

On Fri, Oct 09, 2026 at 11:44:55PM +0800, Xiaoyao Li wrote:
> On 10/2/2026 3:37 AM, Lisa Wang wrote:
> > The default attributes for guest_memfd pages without in-place conversion
> > is private. 
> 
> This is wrong. The default memory attribute is of a @gfn is shared without
> in-place conversion, i.e., with per-vm memory attribute.
> 
> We don't need this patch actually. And I have tested with reverting this patch,
> with both out of place conversion and in-place conversion. Both worked.
>

oh yes, I misunderstood the default memory attribute without in-place
conversion. I will drop this patch in the next series. Thanks!

Lisa
