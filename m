Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49E23D4105
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 22:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785450671; cv=pass; b=QdnADBnHS+O/myXzj8y/COw/i3A4v7ZxFcSIQkTE+YXJBtqaet4CE9fREG3/4WJopK2M602tu9pJUqKgS6GlmY0DTKqyvCnJgZOcFAK28KhBOu2A2awhIDM0p2AMGjeCO1ICzQdwdkIFqWOO4z5BheeALnQQDBf5GFk2jB8sra0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785450671; c=relaxed/simple;
	bh=RFb9jxFt+SB050uUN4iOEqSU+hhGaZfWAlwTqxcdY2s=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdiuhupdRhAmxVjcQy39wuXTJzrQ5h88m0HZcRbMjqFUdVgQBIEUOZs4mq3+VccwelIKNftz3BfPeVXEBaY+SO+/cVx1eWOhD4sGeHghEaaFhG+ywmrSXRfKgMSmBmirMKtVJFdCv9M3zISOl6a2e3LX1OVhfABEW/KEgLPQ/S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iyX8ta1o; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iyX8ta1o"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e347638adso527060a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 15:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785450669; cv=none;
        d=google.com; s=arc-20260327;
        b=HJ6zPMn0VYnqzb4S3Av0I+z0YqlRlUTNjqvosxL5U7KpE2N0Mvcdi+n5VOj8bPe3PD
         GDzF62J97Y0z1YaXL296nQQQvUrX9ufmUjfu+OSG8MNePG0WUkT2N521GlOBgtR4DulR
         EBJvyW4BYA0WixVCBBJiyPUcRBabysGaf6jVj2emBpoX1ux5XZvMO5dtGpfvSF95GADC
         mC4+gHF165omxhOy7pT67tGyCIJek57UjgKB+6mR3UKpYJsw3puBz/zVE68nSoEiYxLQ
         AQuITTmpiriZHW9BTJMtrinibqWUBfM2R6q2sIbHFqrgLnwg/R7T16FzfloyxXxRTi3Y
         dXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=NT7QpFfx9ePxD+EfhDliJc1nWKGrZODd+FSZ20/4RHU=;
        fh=hpEOoW04mDcVYuwhgs1v8Q3WeY5iZP6IakHDL3ODcrM=;
        b=oftOwfI8atFrYe1HWKpOFaH2RQwnu2szNBaZ7SU5sH2AJTvuHAMB3CD4gnfTYWhXpP
         GR/fYihE98Y3Ey0Zyka4OxwjbVALhVeMJov1cMRs/y5I3RaDSvJwRZnU9ykd1m6il7h0
         uJNqd4eImUHXUkyYg/o9hvRKCFgljItusOi4Z4tsDr6tfcDpAV7YlsOJDl7t3ZoUMUW7
         BLWevGld/EsjmRMeP7rSw5EHfpgUmoocQXt5VefKtXfCG1cgN7Kmq2fncnLaWkMwT3V1
         k855+YQs0y41hYLVFQRShBoLYW/Zvwz+uxLrfMY30LVq7FIHWrn/0RIBooU10hC6/rIS
         kfCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785450669; x=1786055469; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NT7QpFfx9ePxD+EfhDliJc1nWKGrZODd+FSZ20/4RHU=;
        b=iyX8ta1oIXwTHeAbpQ9turwrD41nAuMnhWMV4eirv2p0xKFz/MQSM4n3C5TQm/1mow
         rImFsx2dMqgyRj8q9VpXQUyMoSiEDCDojWmqvMlzzO/na9zMRvemi8prn/dxivQ1QVMk
         LVZuPVBpUTYtxvVP7piuI1cQBARqDGrZHQgYQ0cLjjZKR6mnZ61yWzYHTD81C8u/GSUw
         rJOWb20U4q4G9HbgX+Y0kCM2ziLBG7EyssUbKsY2xyqR7wKLA7yxhVtLZc5VIeg/lPT1
         31OSNEjnMoCwIPxCeGs5DfrvnTqagmDPi02jt7IlsXbcgyyDp75AYtDjbE9k+L4M94c4
         f7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785450669; x=1786055469;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NT7QpFfx9ePxD+EfhDliJc1nWKGrZODd+FSZ20/4RHU=;
        b=cOk/lyZpvDrRwOyhSzMTHZCtYifSuFEFtv/Yn4oUq3iEZhsS0TZnY1+QO9RWuDS3ED
         KARPG4vP9m9K6nFzSqnYXJgkaSmjpSXE58cfBSMVPt+Z73aZNfDTSgwLdAoXvoquklX4
         D1lpYqZu4dIYxDt7sIaNS61ZcfVavyfqmB/P8EV1VIUeMbr1QwQk9UCZnX9xkGwtcjpL
         iU4LbCy5QasXuhHiF2L07cB1jXEgpfIdL/Sqe1eTh0GdQx60QUOpN5Ar0MSRZNPYFTf/
         03VjPonqOvtSfd19NuNwfmm0xwyPp02QRncgK2P3DGhrA57g/YfPfHyQ7Hg7vKlxW/Xi
         +Nxw==
X-Forwarded-Encrypted: i=1; AHgh+RqynGIe/R3ico42m1x6DLPoikgTxSZpo5EQqJDoB6pjqKEGAbKQsys4wWW1ifYFZm13M/TBc1UR9LFX46KjyUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7XMGg2X2kaNy3ghU63ZpP/nIocbnApoBAeH30xoQErSAtnyuD
	813N3w8IVddCyeJkx/T1jNDrjFH/fxs0lYb6QPT+d6R+4QzKKzOlk2wHGlYedAIHuSfem2cd52V
	/vNbtR0yUW7HA/PK9ct2+lkasrh0I/S7bXj7M1663
X-Gm-Gg: AR+sD1382CA1s68ZqV4ZHcrwO+V8X/Vb8DKvg09apaCueF3nsw8YWC2YqVhi8SQwHNA
	aXbjH6XR7EP+Px3rRywjRYyJAapbs8pCRiKNKLRGnNxWoLmf4ZjRLet7s57LjwVKMboY9l3Y0PR
	sVI1Sz1AqQlHr21N+SYPPriLg9728K94+uPRvp6L/oCbQ7DRDsuC9lwreY5NFL2e7Dcfzg6u08y
	kgm0225TDDi1QECFp8KsAR9G6M1B2ng3mMoL+oYVxi3wOzTMQnZNt39yuYjuMJqSvAO8BauqHbk
	jesmIEB8o06IfPMR4e6lnodJb2YVbkiHv9znNtMwznVVL9vQEsBhl9nogdDkQ1MExoEeCto44rR
	9jKrbHTkNwmR6JGeWsVA9aNVa9Pms50o87PTsCxCTK3gMJes=
X-Received: by 2002:a17:90b:3c88:b0:38e:3fdc:62e5 with SMTP id
 98e67ed59e1d1-38f9bdb3885mr3385917a91.19.1785450668084; Thu, 30 Jul 2026
 15:31:08 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:31:07 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:31:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728-gmem-inplace-conversion-v9-13-35f9aec2aed2@google.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com> <20260728-gmem-inplace-conversion-v9-13-35f9aec2aed2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 15:31:06 -0700
X-Gm-Features: AUfX_mwSrnPTxdnd5yQR4dz6uVJVHdsuk5_VpYazXm1_NpOUC6lIlEZN5j_ISHs
Message-ID: <CAEvNRgEscmPoW2f4UWHnPub_ycDg_QHRR-cCU5yL9HXu=G-OFQ@mail.gmail.com>
Subject: Re: [PATCH v9 13/41] KVM: guest_memfd: Return early if range already
 has requested attributes
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> From: Ackerley Tng <ackerleytng@google.com>
>
> Extract a helper out of kvm_gmem_range_is_private() that checks that a
> range has given attributes.
>

This should have been

  Extract out a helper that checks that a range has given attributes.

kvm_gmem_range_is_private() was renamed to kvm_range_is_private() in
some earlier patch. Thanks Fuad!

> Optimize setting memory attributes by returning early if all pages in the
> requested range already has the requested attributes.
>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Shivank Garg <shivankg@amd.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>
> [...snip...]
>
