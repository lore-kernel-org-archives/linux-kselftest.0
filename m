Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A732C4AF68E
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999665; cv=none; b=qOgn3mQ4KbMZZLp9aHgp9xYzId5XTm3eAJD/tjo2GUF/tO20FSEFK2dD+a1SqC5k7St3VzGHAR+jUTRzk0bQ/1MhQgiZee5J++7pBXD9mLrKpXF1r/pLA2NRHO0c3qt91JPppm1Ff/qDU86CEQ3l6PhdAtDPJr0wMBTDQkLwFOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999665; c=relaxed/simple;
	bh=SNKPV6UrKCfJ529hmf4OShP47j/0dvs3b3pSPkZc4CM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i63DF+evPLZRk13Juwj6lbRLc6JToufoiYWzHeqJ88/APZyLrtrCWRKVe9TH5+oTqSmkIfrPJ2M2I+NpJV/STohVjkkmZXopTmsfjNlmcAXPISB/XtcRYawHjT9xqNaAQ7VelqhRsXsIUq5QCsbhjY8Tv3XTkeY+yot1oquGHnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FfvVcHSr; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FfvVcHSr"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7443e0f0bso57421635ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999663; x=1790604463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLvavujDz2n2dXeBxbSsPOw7vcv9z3d5aQqffb1F4Pc=;
        b=FfvVcHSrFI7iAf47U2uG1Wn0V/Nn1yPMB7AawEHAUhbCbJGvTca9yy4mAjRmoOzotw
         UDv1CTNPgF5NWZpVpxlWhz43uaVJf/4+32seqt+dlQJX+lgKb+VpagjrzgQDnO7Jb6lD
         Rzz4DljIBVJZyvjj2ktOZ+xjKmnTRq7P6rmodYToMSHDc9kY4oI5QMCoA5Edu9y8iApX
         1CY7xmoIAlcHGEAZMsHfVSCi2KDF2MDoMrELSqp27FMT2hS3OWen8lbMwHMsYPxILCdx
         w6PYsgCOK0FKVGtP7ndqmNEJyO+0b4YEkt6cmHitkeYsBEm+82vILK0xzB5Zj6dDpLBy
         o5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999663; x=1790604463;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLvavujDz2n2dXeBxbSsPOw7vcv9z3d5aQqffb1F4Pc=;
        b=YEaUhyz4Jl10/adJZgs/4MDgCtQAPCQKQr7g00Sy3twvy5a3tT87z15e6mn7oJxUSJ
         YCOOr9ZhCR423FKGq1gGDGVoE0BlTDuKRjKeoFl/u53Z9v9GoFTsRUvGlAHuj0wSTRJK
         JHBtph+3OCQKzBZsLdZckQya+r2NoTBvJNMMgxlJNFexnPatRq6JCpsfhgpoTAFoiodI
         NZVUSvJsL2M/pdB63FNRYTkkUdWcCkKl906qdRNHDqQ6tikJ4gOljOmOnbfq1GsJu5sd
         fBJO+ofx2Y1roVyPfGqlBjW77nSCvS/pZOOFmLPtxRvznckBkWeJ+te4D/19snKYdFPm
         7yqw==
X-Forwarded-Encrypted: i=1; AKwUvByblrznN0Q3w0ZNKbBuKGHG5omu8yiyFiZrUJOqvAQOaXx+yIDTTKY7ffRv84J06yT68s+pfk1RmkW+YNybZlo=@vger.kernel.org
X-Gm-Message-State: AFuF++mvjswtSpVxLT+oMN2IH0nqiY4CwlCzu5NnwSCQtyxjB44IA527
	OAABj21B58jNFgn+0OhyxOFfI2CfFBzUB47ZUjiZiRh8sPDL8gOPzjR+8YAsT9ySQqQ+HdAjg6Z
	+HI8g+Q==
X-Received: from plaq20.prod.google.com ([2002:a17:903:2054:b0:2dd:b81a:9893])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c947:b0:2dd:ad73:c93a
 with SMTP id d9443c01a7336-2ddb1bca6e2mr158501825ad.27.1789999662773; Mon, 21
 Sep 2026 07:07:42 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:40 -0700
In-Reply-To: <20260904052033.3648259-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904052033.3648259-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999930104.756417.9813560375893651858.b4-ty@google.com>
Subject: Re: [PATCH] selftests: kvm: Fix transposed calloc() arguments in the
 uffd helper
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: shuah@kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 04 Sep 2026 05:20:33 +0000, Chaithanya Lagisetty wrote:
> uffd_setup_demand_paging() passes the element size as the first argument
> to calloc() and the element count as the second:
> 
> 	uffd_desc->pipefds = calloc(sizeof(int), num_readers);
> 
> calloc() expects the number of elements first and the size of each element
> second. The product, and therefore the allocation size, is the same either
> way, so this is not a functional change, but the arguments are misleading
> and GCC 14 diagnoses them with -Wcalloc-transposed-args, which is enabled
> by -Wextra.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] selftests: kvm: Fix transposed calloc() arguments in the uffd helper
      https://github.com/kvm-x86/linux/commit/202378243192

--
https://github.com/kvm-x86/linux/tree/next
