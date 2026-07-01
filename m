Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1373128D4
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915525; cv=none; b=iOsc3us9vtV2pr8EeglfjINoQ62dxzopeD77CNy5y/tEskty9jSbXORnItKKxvkMTZxzTEjzzv9422yI8xtFU6yQukuFgx9olsKbkxrXVnWBQ178brIHqV7BhsWz2hipsIMMdNO94oXjdzZ1/kd3vzbLIFUyFNNMzGel/RpBqwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915525; c=relaxed/simple;
	bh=PFFo7h7gOSRJvPMfXM/Utr1i+DFVy9GuaNydkRf4zbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P2nWXKaxVS/sxtZ8W4LtLAlxHgfQPWfFSliXwPDVWqN8vXBDgWDA1xCxdOuYVroz0DazMZjHRLssaMzTpztqtzWdOFrgdlsxx73sV6RP9N/ZNBHWsBT8c3dGE9mPE7PW0sDUbb6sGbXzuihd6uX+KzLNbxS/DPXPlHKKU6ksf/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pwJNcHIa; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pwJNcHIa"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-37d125687b6so769382a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782915523; x=1783520323; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXvjFbiCBj3zMYUwQudq7Nuf6IsDrsbkfKwCQ0KY2cY=;
        b=pwJNcHIaxlfGX9bwIcfWA/+ORGQJTaT2P7CrZ3torgnFDfHYbFV9kG4jDc/wOAF17Y
         4W2uwOguj17F36easz//rRv35tp8rZCKE7fZSw8Fmepo2DO6nGBtNm4ry4l5j0enhTfa
         02o/XKqOOlT4rmxq9bCBTb1++LlQuAV+ntqRSrlj6Yi8t+n56LLBZH34GpPkhwPtOt3p
         6zp2KhRogggfc2rXabEtlvU3mUwfEPY6qoIuApyhCN2Av756SFCKZoHkp3JoVfgszAfr
         dhlPlAKVJjyvRzs6NKqNh3sKEzbvzFa5tbtG03Pu/P3Hjyxjmqb/nYIBKNSEw7Othn0P
         lGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915523; x=1783520323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXvjFbiCBj3zMYUwQudq7Nuf6IsDrsbkfKwCQ0KY2cY=;
        b=bFBPDH+Xvpkl2iYngsgVvCY55l590/yhjxeK6Zv9S2DeZr87jvf1oOec1DX5HyEtse
         4qO+9zR+2WyQDFHtFe6lUDEuhzibku3GYladfDOtkfrr7GcJZwMR3l8nWJMx31K0Vd0s
         RQSxXCcCI1A4CyQEzYRGRkrlv3vcFYaGZpMMJkmEDctnL9Y4swQwRV19kiWNmGwWKs9b
         BGXOG5qoQe3UWynyDcRGzP26IG2rB8Jl49OssRb7nps21traQdl956qAx4Z5sY78aEg+
         b/fSqpsxNcGs2PN6D7NNOoFJQXRjFdB9m5zVNwxQHyWsAWZynPJm7DqvoAbYC7SZMsoZ
         i2hQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBI4CuVdQyST7H8aQ416R4hKj8wxDcUr5q3q+fVDGZt2/Dtqk2hQ0Jbg3p0rt/O6lEbVnLseY/7n7+HXFQHvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ/QzNpx6kCMMxGTJPMoZ36Z+OcI/u4FyJ/tiLrdZDsJzKlZf2
	+eBPs1l+QvxJqRXGCsVGl7QHk+z/1yFGWZms2m4D2zU8jNdvi+d0CMGImUie95o5qS8nGcVr+ed
	mupn5DQ==
X-Received: from pjre10.prod.google.com ([2002:a17:90a:b38a:b0:37d:d531:5f4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5585:b0:37f:b0a9:1a55
 with SMTP id 98e67ed59e1d1-380aa0b5724mr1993828a91.11.1782915522810; Wed, 01
 Jul 2026 07:18:42 -0700 (PDT)
Date: Wed, 1 Jul 2026 07:18:42 -0700
In-Reply-To: <20260701123520.271580-1-wangyan01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260701123520.271580-1-wangyan01@kylinos.cn>
Message-ID: <akUhwrDSCjGLpnSg@google.com>
Subject: Re: [PATCH 0/6] selftests: fix multiple spelling errors across submodules
From: Sean Christopherson <seanjc@google.com>
To: Wang Yan <wangyan01@kylinos.cn>
Cc: Shuah Khan <shuah@kernel.org>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, Wang Yan wrote:
> This series fixes trivial spelling typos in comments across multiple
> selftests subdirectories. All changes are pure comment fixes, no
> functional or logical change to any test logic.
> 
> Changes are split by subsystem for easier review and merging.

In the future, please send individual patches.  Splitting the patches is nice,
but then bundling them in a single series that affects different maintainer
domains reintroduces the friction you're trying to avoid, especially since most
of us only got the one patch.  E.g. I only received patch 4/6, which left me
wondering "what's in the other 5 patches?".

> Wang Yan (6):
>   selftests/arm64: fix spelling errors in comments
>   selftests/filesystems: fix spelling error in statmount test comment
>   selftests/ftrace: fix spelling error in poll test comment
>   selftests/kvm/x86: fix spelling error in xapic_ipi_test comment
>   selftests/landlock: fix spelling error in fs_test comment
>   selftests/powerpc/tm: fix spelling errors in comments
> 
>  tools/testing/selftests/arm64/gcs/libc-gcs.c                   | 2 +-
>  tools/testing/selftests/arm64/pauth/pac.c                      | 2 +-
>  tools/testing/selftests/filesystems/statmount/statmount_test.c | 2 +-
>  tools/testing/selftests/ftrace/poll.c                          | 2 +-
>  tools/testing/selftests/kvm/x86/xapic_ipi_test.c               | 2 +-
>  tools/testing/selftests/landlock/fs_test.c                     | 2 +-
>  tools/testing/selftests/powerpc/tm/tm-signal-msr-resv.c        | 2 +-
>  tools/testing/selftests/powerpc/tm/tm-signal-stack.c           | 2 +-
>  tools/testing/selftests/powerpc/tm/tm-tar.c                    | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> 
> -- 
> 2.25.1
> 
