Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0072E21D3D2
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 03:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784778339; cv=none; b=hqPaWtW2YJP1Qpp35xmPkdmbz8GBedDBe7vYKJkZu2JxW10xdarYgSxnxfScSXFAWSaHlSfkuznG5HBNhEzb1UIqpurfoCZBxtovZpNQ8uty/9Y3ag7sjwUNCsJoJxE6JY6IpCYgnhkJXD6OeKu6H3CM6GRqfMfnr3M3t7iC3JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784778339; c=relaxed/simple;
	bh=arSEEFXFQVdqCW0J+7+aF8D80655DPiP8sYSGDClKlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXggAlJVUfNFwb9gnRu9cbcTOagbgDQymlq2enhOIX13IliGdAAXIxb4awEdb3bQgRZhS1WmEA2DvnZvRkP8ZskfzEtLGjEbCDMirDPKJBgVndan8E4iLA66rVaNusy69rxicNbltaxrz3AIwse1rFJ6QXHkhgPtpzJC11FtiUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R7f9nAVH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R7f9nAVH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1740c36c5cso26621566b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 20:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784778336; x=1785383136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wvdorMdSMyG6e2Iuu6rHoLJQpWLzhl4z4BJUQ5L+CIQ=;
        b=R7f9nAVHEwEFeqioTDDmoiCzfkWMAvom077ptXSVAUU+efxrvr3DvCDtQmJi+/FS0Z
         TculmU6Uuhz7whB41K8DgGnX3tJ8IIUo9NPP4taDLGNXUhfjeHZCj7AucmFOsDBUUC44
         uzPdfqlCqcOShS7jCe4l/nhS+0xO9oIi1qRp+/n+ZIqLC629075PzlxidtSn8cOgd31O
         bwdD42C2g4DRkK6lwvOscrBDPnOm0I7CUvuih/Xa7TTeOy8ffJ3AS0NCoCX+l/08uynX
         mE9PqefLtFnPHjJ5M+1vozmdIsI6Yqq+qnujCcTNfCOE3s3P7igtgrRZvqMTTu/qUwY9
         dk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784778336; x=1785383136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvdorMdSMyG6e2Iuu6rHoLJQpWLzhl4z4BJUQ5L+CIQ=;
        b=cXKiL78XsMC+ZvZlTSLk2xZBpDwabtoajrH41bQoNaI64Y1/ENZSYBAyhDLLfMrJrP
         w3KjJ2caOX7q+1jERjY5xuOClKSuTU+x3c5t4gyGDNFwWiOb3EvjPETzyyzWSH6IP0lu
         SovaR6EUSfb8fNW3qBqdJK/wLaiVWzc2kAhDzbken3NLaJm1joaB464dFOEgVKXIdd20
         gRXmOO/qFp9IR36xApUOZnkckMGnmbxKCJrVoeUxHmw0lNqpyZ97CcwpstTNxL/u/c8I
         QKK5a7ODNgCJ0H1sW8YOq6J7AqZjpjx1wtgnCl3C03zQIYf5PvD52Lip4jlEPp6bSxFf
         jwJA==
X-Forwarded-Encrypted: i=1; AHgh+RqO4tIk1+5bebS6YK7qNvGLy/8/dy/gv87z22rNAsMEmtLYZLLBg7dleuiVTxtfYvrwbznOQBKeOUl5e9rG5w0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6gA/pRuOHOMBXB9VbK8T86OaAeff4popOBYb1qscLflKKtVTd
	6ptu4jdJjbTw/U44RWGG1CT4Du+GD8X+WUQap5sbGvIoMozA4UnRhDLblfbmny0ytoY=
X-Gm-Gg: AR+sD10I0D9IePzPeVQB2vFbBpc/8mEQbcWgHANAU4dVvtMh2qyiweWRgFpK19GJ0Fh
	Z8J1BVjEj6lLMJCeZLAhf4wPRLP03piJUgE51J0oC1NaHXbh/5HI/VRTYMUnqMcPm3gf76zQdbp
	lkw/fTzI5SgWiCD7f7TBxcUC49jgHkcGzeQIicpTvZGxfg1xRhYyceiI4MHBbS81oDOV0vBPx23
	ZKR1bgv6cVPAP8kRtfmSrH3ACvZQOKQFjPNjaMkIFZFzZ0cHQ+U9U680iQHszm0313aiS4pdbOV
	LrCxuQ9TiBIud2x91VmNK4/xcPdWs1eewv2z4AasH2zXBz5f1Z3u5d7LZ8f7wxIzZ/5/98LSPEq
	Ie9xIC2/A+B1TJ0WrHH3qreA12AvC0g7nPLtSx7DCbtcrQdJL+qxRjKI9srcRukgKhtraOhDEi1
	2w6Yc8zvId+EpDVOz7Sq0=
X-Received: by 2002:a17:907:8dcf:b0:c16:9ca5:e551 with SMTP id a640c23a62f3a-c1c50783c3emr55161966b.14.1784778335399;
        Wed, 22 Jul 2026 20:45:35 -0700 (PDT)
Received: from u94a (27-53-97-40.adsl.fetnet.net. [27.53.97.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd88f7sm24726105ad.22.2026.07.22.20.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:45:34 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:45:26 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 1/3] bpf: Preserve pointer state for commuted
 arithmetic
Message-ID: <amGN9sUvWFi3xfle@u94a>
References: <cover.1784696371.git.chenyy23@mails.tsinghua.edu.cn>
 <004a83de52a36e9f3acd6c3fa2d0dfd0a013460d.1784696372.git.chenyy23@mails.tsinghua.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004a83de52a36e9f3acd6c3fa2d0dfd0a013460d.1784696372.git.chenyy23@mails.tsinghua.edu.cn>

Oops, missed there was already v3 yesterday. Reposting comments here.

On Wed, Jul 22, 2026 at 05:27:31AM +0000, Yiyang Chen wrote:
> When scalar += pointer is handled in adjust_ptr_min_max_vals(), the
> destination register inherits the pointer state from the source pointer.
> Copying only selected fields is fragile because pointer provenance is
> tracked by several bpf_reg_state fields.
> 
> Use verifier-env scratch storage to preserve the scalar operand while
> replacing the destination with the full pointer state. This preserves the
> frame number for PTR_TO_STACK registers and keeps parent identity fields
> consistent.
> 
> Fixes: f1174f77b50c ("bpf/verifier: rework value tracking")

Nit: This doesn't look right. Without bpf2bpf there is just one frame,
hence there isn't a bug at this point. I think the commit f4d7e40a5b71
("bpf: introduce function calls (verification)") the you mentioned in v1
should be used here instead.

[...]
