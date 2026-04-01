Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9489401A3A
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057576; cv=pass; b=BTqcGgxEYgMhtEZWrvafbUY5HTrukcB3t+LxKhgBz9l37fKLmU1QA7y3rJ1z/bF46rsgQRUvURa/YykYQk8JL7+LaX5DN1TuAL7LFJeVxYeLfH/xaKFzSHd55SjFIFEV2EHrxYqMzQw7f/elplcF/AkiyCiknLeI4CZC21EkzIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057576; c=relaxed/simple;
	bh=WpZkwFPK4saKVkaEUfteVuf/s+gOKFi990nBEr23mvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TD5xG3y1iy+XS3b46ki+WCcbZc9ciRSUCeCsPJJWfwFJShipUizztZ7o/VR0pXaxKxWyfFdmJUTLs/EcnSMvU/in+YTppWbujpfMxgZNOmWpBn7P+BRtJ7ZQBuebW3qVqm1M158TWvFrukFoo9tSEmrREwjEvqvmJ72amjNIcfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dACMqkU1; arc=pass smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dACMqkU1"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-486507134e4so79573295e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 08:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775057572; cv=none;
        d=google.com; s=arc-20240605;
        b=O3FCc4NHEKjtJFRZj0+8CyYnQuI2NtppOpTAWOSRl0RkaFCfWlXN9Z1zIgzlH90ytE
         0dVxWVuJsKkHlYZKSNOiEctDc8tb4ARZY6AodzpFS1iUnqQ8gSewkEpk9cXDwfEL6f/t
         6e5Yr6WJ/pad1FvpKteOdJlmIpzrZfOSuMBDQuDyZSQQxPz+phPI3WCdUcoAdFsCJLC7
         k37mmktxwICcdtYkRROs+NhaUNOl/XiAHZf3BCmxrZSHLsfA9s4p4/JCrFlb+3eHx4sg
         UrVuTIQJ3XpEhJj/DJjifqjjdsr45uF3D6quVGZO7FE6h9P0wB9q/4k8+MQKzjAGh1YQ
         Os1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WpZkwFPK4saKVkaEUfteVuf/s+gOKFi990nBEr23mvY=;
        fh=sWLK6eENehdLnmgTAScAOOQhVgLTGa+ooheMAdFYrHg=;
        b=FuKsr26AbTxuPoTVE4GzOjLgViePvoieD/M4izDGU4f8xVUkzHt2MhO1NzPB65er4c
         uKCFE3nRo1Pv0bE2eJCcGxqAmUqKbUXbKzhR0q+KSn8G2yXWT5dGyDlHHIe4oCHpKcDN
         dUlbX+AINlw467NaHlueQFy/W/7C/0ZxSlVSScbePt/yrcckztPXu7QejI/IsITtgPcy
         F55EebHOFny/OlJC97UXPFab7ts0I61Ti30iLrBqXIIEFEpWpfY0R1jg6+2Z7p8p6g8/
         0vuZenMEc9hi/kam5ejzCUMT/atVQtxfJmkiIoWywr4Kq+gwuUW5igLsOaISGf9zFezr
         an3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775057572; x=1775662372; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WpZkwFPK4saKVkaEUfteVuf/s+gOKFi990nBEr23mvY=;
        b=dACMqkU1tHFqG98ZcmhYhb6L90l2Qs6DMFf0WgB6FEShNC4kKLjYGCNFByKHe2I80R
         teM+0VCIAHDNXnT7sOlvAbo4Nl5YxzaEE8Uo8wlXRvwxOep2cRhjgNHZDCOSPsf2g8IT
         FiJEX2l+Pdwe/N1IyWsw+uNgUkhx6KMCrSCVSdQLOLo+4dkBpc0Q0j2dS8TCXLFhalWG
         uhnVG7g+NbNfmgsY2a5O+7g7QZBkDXHtmQ8vuwIRlKzNh1qGneqE+y6X+Q9Z8ukMCBEn
         //PO9b2aCCRBl65XQclaOt/+lzxvIKqIXEWpy1znZKbEUFf0tZ29bNWjsMHFfV5mdMEj
         dLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775057572; x=1775662372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpZkwFPK4saKVkaEUfteVuf/s+gOKFi990nBEr23mvY=;
        b=CqCsy/r78vn83Hx/dW2gY3HntuEl4buXQVxL02tWigWGPqkN2uJYWhPTQbokw/JG8V
         K0NauLVcm2s+60gBWBr0AB3cUz5JHdSpHlSyhqSBNGi6BKBgiJgG5gxeb7ZTOD/fo6I0
         7ZuySzx9wyMPYBxTGs7lRX2jgBAnZbAQf6S3vDPX3MUuNltn8xCzUhnOoDN+OECtx61+
         2YNMigI1ObNmizM4P3xZ35yOUG+MYqDoFrzFNwwJp7+4TndQEfJ3IEFTNSivzEpgXSj0
         mQz3N154UwFbZ0SSwHELyRiYqd0debVkQknSRzrLIxUMWL2HGbadydhyYk/VgdcgIUck
         eAMA==
X-Forwarded-Encrypted: i=1; AJvYcCUKTXCkvg31E2g8wFCvo3bQkDjTc/Bt/9BdnSrYBqJfGvjznMSHrOI2TUkE27Kf8rU5Ywi4Q+RFT1NeVQuRwfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlCECFyne0VFs52kJ+/niF53SX79zH1CB0+bxZlfadEIpWiaXU
	pIzk23gNFOnTVKNYJMw5pPA/Qy42LK/NlIIHLhJ5EjGBAsCPSZE+MQiOUJSTi7Uxd401Bya7H+M
	dQi58c+k27IZtONo+R1Iy15Hb/sbWKUE=
X-Gm-Gg: ATEYQzzzBxJ97wEUObWfLU7ZvBX2gobd5eDBmKa8KBNL7OdpA+111nwXPM8kJ7WNVpi
	+BCruzdcjXT+CtcsAboTtTxq+qgaJx1j4Voxl3H05DhCZBCu1oPrYaIFqUn+QFOt3RlI7zQAlXo
	wK2uqrBwyviT5O45FjusAdUWcwwekLhvP/TBReYJ2bKu1Qp+YCGfPtZmRpJam76XeGG4Na2FzmS
	DHG9/FXXWWS39BEVen7C8SSmu0MDNYAxt+wiTteWiSaoQfeo78h5j1k83r8ksvYv5XeVeN86NGf
	lCsz4FOldZGFvc3bS6/w7yeiArqTfToDJTuU+Yp6Q8YhNkaO5BSucpiVMDY=
X-Received: by 2002:a05:600c:848d:b0:488:8185:e672 with SMTP id
 5b1f17b1804b1-488835cceaamr76731335e9.30.1775057572216; Wed, 01 Apr 2026
 08:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331145353.87606-1-leon.hwang@linux.dev>
In-Reply-To: <20260331145353.87606-1-leon.hwang@linux.dev>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 1 Apr 2026 17:32:15 +0200
X-Gm-Features: AQROBzC6WUTGQAIQiz90MC8if1nS4J3sjsF-SZP_U8DhDtTW8ITNnwzplLstXW0
Message-ID: <CAP01T74Ncg0Q9Fx=vbgLK0zuUitBQOE0jtJqzKGpu3Pn-fTQKQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/2] bpf: Fix abuse of kprobe_write_ctx via freplace
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 16:54, Leon Hwang <leon.hwang@linux.dev> wrote:
>
> The potential issue of kprobe_write_ctx+freplace was mentioned in
> "bpf: Disallow !kprobe_write_ctx progs tail-calling kprobe_write_ctx progs" [1].
>
> It is true issue, that the test in patch #2 verifies that kprobe_write_ctx=false
> kprobe progs can be abused to modify struct pt_regs via kprobe_write_ctx=true
> freplace progs.
>
> When struct pt_regs is modified, bpf_prog_test_run_opts() gets -EFAULT instead
> of 0.
>
> test_freplace_kprobe_write_ctx:FAIL:bpf_prog_test_run_opts unexpected error: -14 (errno 14)
>
> We will disallow attaching freplace programs on kprobe programs with different
> kprobe_write_ctx values.
>
> Links:
> [1] https://lore.kernel.org/bpf/CAP01T74w4KVMn9bEwpQXrk+bqcUxzb6VW1SQ_QvNy0A4EY-9Jg@mail.gmail.com/
>

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

Discussed offline with Leon to follow up on other cases and
incorporate his fixes for tail calls.

> [...]
