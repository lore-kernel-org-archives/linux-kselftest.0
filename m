Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6E7400DFC
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143976; cv=none; b=PgYEMqHyEqx5HqlRJL/t5Y5F+w0MCiWALeCdRivxJGQq7iC2HfgCb8spkw9HvE2efQgTVhURS9ujqB5UUQ5iUjzmS2HkJ//mpH86K9NlSJdK/mfhOr8TMMOpVO0TLMBNfHPcwVBZRhglLINNYmbD2fBqQJNelc18RZ3q4VJYQCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143976; c=relaxed/simple;
	bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VaAPH12kN5qsTmWokC2+4BcxlgpTGTP1Yssg3yEACaNFb5bHG3/ii6lJWAgVImvOpXDLXfQxFjeBPIkdr0EarpI9v2Mum6kSrzSyL5B5lNci+PvQtiRYsbgiwBJoG5og8k8bsCWvSR3WDDcLmDxlkpCzlU2QEjjYrnTUOlwluek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEfSOoVj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEfSOoVj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a061a13884so50773105e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143973; x=1792748773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
        b=NEfSOoVj58mfNWYWD0HBk9CT923PjsiXayk+W4diiizADUl5gWFolKCOmfHSVvTCs1
         +h794OQFcnI4VxGBrjRmYKYNPZZlEJeJKxFuLAdlqzITndINEspIxDSTinaJ79MIWPwm
         ON3UuhlS5KVtsmGhygxfRDhW/CTEVozMxOM2/ArIFPRUt6S4N3wHah3YltILTp3EtwHB
         mEv4ODp7kKJgpkji5pYf735jSa+T46G3W6B5bM/c41OsFSvGAOZQHdOOSgCIIyQUbG+z
         z+JuDj0XUZjZdvHkweJHJcGeAznwfFH7zARrpSGzvyeuSzPMKTvumLA8y8i0QK/Nqu8G
         ON8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143973; x=1792748773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
        b=X6hPwWNHWUFG3npYiTzgl9TDX6layLuj/3wJe4ydFRJfH4oXYH7cVOmDkpdXQ9L5XZ
         FAo/f3s+FUSF7zU1tSE1409bHCBZl5ogub2D8MEariDUc9TMIfGt5OSrz0eK0D39t47R
         j1lR4t5Q/iKNQNlGyHykWpsJpSoLqyUQZaxMhiTeUVwFnCMLwY0s2Q9KuRDwM1xWNFEW
         TqnCPlTBH+qz7hCHAlOuec+d6F5scR7XlxnnJrst6K6Xs2UnqEc/myYq6xhGcOe1Xl2b
         q4Q8oee8VPJPRwXddfILokIotm6/NZh4Pul/PpFZX0NQf9dzHMhcnuvQOwgpxvAo8xv3
         Zs0w==
X-Forwarded-Encrypted: i=1; AKwUvBzFVRHMKa/boBBc6eG+wSttXyEz4KVyU32Jyk+VELof/HyvrUlPLFbhzhe9//SeJd1F+GItd5SHS/AQE7NQtrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz4bkrPoJwsYe3BOYbypyEGv0ZScPYJh8TKHn5foH4m0HHQa3G
	mdcpMt6uqTqy3pkBGfv0vlU2GJuNPgU/HUh178BmnqRlBOT1136P+GGB
X-Gm-Gg: AYBFou1x0Mu9teBqsXq2nkdBWRcCMV357T9tj2b3G76/XgI27r4rNDdl/i4ApOM8DUE
	dGK83oqRYWnmT4zK9hFASxPMArYJaAMVo1hXEZlIm2xqHCMCV+H38k5BzUwUkf2/lVkLC6yUgAT
	ug+FTjhm/Wqt9UpW4MsZqde2OW9EQsz9C6QQz8znDDr/Lk+sFZKhEW5Mftx+FVNfH1kBFJA3/jn
	KX0Yciaeowe/+S/FLphEon/erujGFOmP9KMiFJt/9F4NjlovY7tZpp1nNXJaUjlZMVB7YPkKmO6
	i9+CiXYgdgppdViWbVg9HEFYCSHW813ap2Adc3akD1oO+wjM5s9bl5v5ApInoFpvg8PI+tGctqX
	09w889LUBdbzyJzANmaSZ05wunMSlu8Z2eynfB4wwnx3qK5Zsl8YsO/kemBen1psGzfRwl6HCGv
	d48E3bdfeip796OqxIM9N7nxr0dOGEy36L4wF7ASj+pdT2BnjqD69UYWSzolGLZ6aNbdnXqYYuw
	15SQs6RFHCrhcUiMeK9Y0yIzlvEh399ohgJxTQg2c9CQYonWf5Sc4lIZCO5ZNlpExm2XoY/61zU
	JI7c5sVjxuCQk8Du2vYMZViTTweasTCNwpg=
X-Received: by 2002:a05:600c:83c6:b0:4a1:7093:40c7 with SMTP id 5b1f17b1804b1-4a18e493048mr406737735e9.8.1792143972697;
        Fri, 16 Oct 2026 02:46:12 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca43012sm17041055e9.3.2026.10.16.02.46.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:46:12 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 07/11] iommufd: Use large IOMMU pages for provider mappings
Date: Fri, 16 Oct 2026 09:46:10 +0000
Message-ID: <20261016094610.57849-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016001448.GC14213@ziepe.ca>
References: <20261014093733.90312-1-griffoul@gmail.com> <20261014093733.90312-8-griffoul@gmail.com> <20261016001448.GC14213@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Oct 15, 2026 at 09:14:48PM -0300, Jason Gunthorpe wrote:
> You are going to need to go into generic_pt and implement cut and a
> more suitable unmap to make this stuff work properly. We can't over
> unmap on conversions.

Agreed. I'll drop this patch from v3 for now.

Just to check I understand what you have in mind: a cut operation in
generic_pt that splits a large entry in place into smaller ones, so
that the revoke unmaps exactly its range, and iommufd uses large pages
only on domains that support it?

> Also please don't write commit messages with AI. WTF is this even
> trying to say? The subject is "use large pages" and this text says
> "map each page with its own call"

Sorry about that. It goes away with the patch, and I'll check and
rewrite the other commit messages for v3.

Fred
