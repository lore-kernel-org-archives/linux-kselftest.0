Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776231;
	b=2VEuoO+lVnOYWSnxW3BOxgD34vwVOIkXDiFiRvPMpRIiRHUd4Ei27DQfLLJchqPvCa67
	 L30/78bcyFU2l477Ryy4P34dZNTIe3focZDINdjAGlScQoMWZioZ87NYJUWg7tUQyrzoD
	 kPD29xvip4Wujzx3H1sAUmKFhtwkMM5Hmah0HQ/aj3mseWMPamx30iz7wPxA+0zNydKUn
	 nLiYINk6IK3RItCtyOGn1fb0LhPU04AbiPKV13a9fBuv7pCOR7ZsKQQopVGbO3EWDmCgY
	 zQZsh2j5FML2IbQeQtNDXvTzt8SENvbIru2RaCxVMvjjC0h8OLPFC7bMxbKeJfMvReg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
	b=xStOPoCOdA6bb0kzgGx/FVQX6obkdthrF75ZpRXJ0gj7tSANjcHY8/CixUtBSoebDhIm
	 J7qEE+jIeJ1YNxD+97kY4rPoH2f2aw3bW2JuewiWZ+GOlp2y14KytntCLY2Iaa0Tu59bb
	 /UX/5D0bxNT+AB/wQvcYsygc5eSsdxUZNLsxMWSVp5lBbpVUPwrIt2C8YqmDLY9n4Gnzs
	 q/6oMrb+sM4bQNeSuHLbLyqjuvlxd/igEK+hTtGsNSbP/750dvAav3iLmiwLprL97vOJw
	 WSVdIut5hW6Fa141I9HQg1lBAZzTkiALoe2LtnlzpoDngTs8t57ijjeeYg6SgXCAulA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMFbak2L;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2071E606A31B
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 17:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2071E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMFbak2L
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so8907885e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776229; x=1793381029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
        b=FMFbak2Lv2lhOGCjKEw71ctCzxUX3t9FkWqUHf/sC4QitZrRCuemkodjqFDbh1yQ8w
         4z15z4rWbF3wPybQwis3PyyUxs2U8Iyw+mFJ4+9V64wFam2di8sCwgyIRMyi5dRZiVzy
         vspiC+CWDlUBn+exNtdA0wkxcrcYfzf5UE1V8TcNtfqEa7dUGw8ZHKu8DeljBe4vWgMW
         +Yi8SZW6EliRrb3z2ZE1pUDFuOorhmb/AfhW0VsZ18YtOh148nPEd4UBXGky9OlizkBF
         mAkIIK1cG5XIXYwFhwBT/ez0PEpG2OC1Ci5yvpsIFoWKf6uYIj0x89qSftEX2s/X/iaR
         NMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776229; x=1793381029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
        b=Y9h8iV+kJvaZyMNiW9goDrir3LT2znsBSYpf0naNHbIjqIrONz95B6Ro7iGOxfA1eY
         Oj5PYizLmYQOuorpn8rL/zGbfaC6o+szcE9dMLfWC2U4Vznzn8Xkd4jk3FVEW6FUpTJm
         CzR8Vm9pxU/6ekyi7QLzz+pEm6Ok/iMaJvkoG5BENWJw+IourvtkzD/oXaNgJWqPfXQZ
         WEwyVCtB5cf1uYlKqDiCbAFvC06LfqV8Z6K4JMb1n0eWU8YAXVfkYdl2qXQLvit1EkwJ
         j/Xc4LQaHtfXoTtXkeeQ9nBIo96ppP2LNkDWNXkvr3mQh4CBAU4pgn8v5ypOokR1wznB
         /CAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIGGCfBIiaiqlvOgV9hNy0Re1V9kiuyhh6TgkgojwxHct4EUFskFqLb3IZbDy5cccK2urw8tw1Vsmw81dT/wI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3la/cH4XKFwjX1035W1iZGi33qIbC5+LkKArF5C1U8Gw+6BXx
	k6cB9U7n9qgJQWTWCO9iyFXzvRGg1oKfBDJroUKNqaZBEbfIOF+Rp/VX
X-Gm-Gg: AYBFou1PnQY6PUPxDiAUVVCvzsLSszr/mBMJvf/G08ZFpaN4+qXdHIiOojSgd9IZKwd
	V3b5oX+ACQxC5Pql9Wp5fyB43XGfoIhz1trtOiatz3DX7PwCKuLNh/ZMADhTIfQ42Q3OEQ+Mw7e
	TJO/ie8gtESxVEWGGlSntGS3rOt8YG6qkiHrxpAATKAy8BpX3Si+c+atDyUt1pIVtqI0ftiLhLq
	5Z4QsMcozTCjSZw/HNGhDwTNxUJDr6s945GGyScgoUxxqdgumEExY7ninAmWeCLLbSSRnM1B6MW
	XMcDHyeUrsPdWODn21riDu6r5sO5P5LlRp8H8GgClCa2l4VYEDOAydLyeJksT64DN8zS9fdl2iU
	QwNHKnyinQ8QWC60rMdGyrlqa0ysp5/npn28yGVL9JHXuvHrZsrASdQ17gkkvsgdjgYERs2l7xy
	9Y6hcvGemOFA+zijEo6WpelyeIKAGvXoqmzaZ3xuxXHggNqGRGl6EfMtLBdMdH7sV+dbc4DiQkI
	NuTokMppOpj+qMY4gpMpegObtNbrctdMbmlGbYqMbETfrV0UrvXK1xQ+2bwZpzc63rKwU73cZIb
	3avRtEPD40x/p4PQOEoDAzYd/b8+WkJCZkw5lI44BMJpeYY35PjXrUP0LO/4bVWyuWpRJ5kb2gG
	EYKx3cUuijpLIeORO
X-Received: by 2002:a05:600c:354c:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4a211cb23f3mr50233895e9.19.1792776229374;
        Fri, 23 Oct 2026 10:23:49 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a30764e9e7sm17932475e9.2.2026.10.23.10.23.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:23:48 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH RFC v2 31/50] KVM: guest_memfd: Support getting PFNs for stage 2 from providers
Date: Fri, 23 Oct 2026 17:23:47 +0000
Message-ID: <20261023172347.88443-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com> <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +	int (*get_pfn)(void *provider, pgoff_t index, unsigned long *pfn,
> +		       int *max_order);

Should get_pfn() also return attributes of the frame? Only the provider
knows them, and every mapping of the frame has to follow them. Two
examples:

- Read only. A provider may lend a page that the guest can read but not
  write. I know you dropped this from the sample to keep things simple,
  but without it guest_memfd maps every frame writable, and there is no
  other way to make a guest_memfd page read only.

- Aliased. The frame is also reachable somewhere else, e.g. a ring
  shared with a device. Such a frame must not become private; see my
  reply to 34/50.

A u32 of flags, with 0 for today's behaviour, would cover both and
leave room for more later.

Fred
