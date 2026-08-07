Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61144A3F1
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093644; cv=none; b=CKBIN7+aPFVBNncPJDFb8Nl8hLlg+jV+NQjFk9r+4EPiw15NYzYi1IUao514Vjmyb+wzu7RPzLYFNAUXuu0tzdI95cGoaiLXNv5MatTU/p2CtUK5l8fYM5Pia3M5XRqWEpv0pFHHdV38ndKaWCXCGnRbUtPYnaVo7PZpNsI1j0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093644; c=relaxed/simple;
	bh=1TrKSTZ+bpBOKYMAcQwbLCx2isLKoZGtybgMbRG9jCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFwaZEKConrdX8Ijskw68lD3IiIASGiHywGYmEIn+PgsSfhKPSubcrCx+iwH8uQlyCnuOuBhshy4U6B7ESHaXMjpKlwDt5XZGlb6vkT8SVpeE2zsmCS9uidyx2WFmZBzF4mkpHHX3yz7Qf3lRSdJ+4DX/zU6GrLSMs5t+70HzbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KagHAN3k; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KagHAN3k"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so39532665ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093642; x=1786698442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w30NsI+1RUdi2X/WAHFrnMemITJZqC+5MhrMfUj8hcw=;
        b=KagHAN3k19O/MSUi6OaaV6ozWDEfhCmXHE8A8hXTl/rAdeLbV5zlugY/EpP1GS7GEM
         hrFna3HHz8YCFn8nZVGcUepzd93kE07dieK77HqVcekZR+KKJVkhaP/qqH9+PEUN75Qq
         kQfZEQR7RUjikXUscgaaw0gxmlGWO6xa2RHL5sq1jXeOSd8O57Y+vbxc8zUQOS/wolXw
         faPgoghzyAFA1H8xu+FuSdVGAMy4tnSBmeOjIsq7c1faoHthQD26AMX0Tg6IctZeg/hC
         Ig789AMVtjBwB33NvuOlmrgFr6Mtko4CN+NUOBYGI+kl6cYqLGT820vsUb0T7dqelAHv
         C6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093642; x=1786698442;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w30NsI+1RUdi2X/WAHFrnMemITJZqC+5MhrMfUj8hcw=;
        b=HQWsLOwW9wusaeUg1o/lgHvkHFy5Cg0j7lQaJwO+f+1Kieb5fGXB+sePrzrpB7W5Vu
         84huMbWMyvps66qnR9WyjnkBaMNjZwBsIghBXzRRKbiH3+whJCdnWivGm+T0Q3fhLrrn
         LluWtNHCwSWWykSi6BOVp05oAsRe45jrTDqSFujUhL0epXUBI2E9cYEDM1Udx8gEUVFk
         Znmhtt3N6Eo2ItVm4e6ZIbqIlLGKXaoNy7rRQZG5Bei/CxhDWBh7PnIuYlvALwghUE5Y
         KuBwWfNPyDS4uf1g9uKzzHJMuS7fu372aV4GHu3TUtR4I7A0wyItVo6CJBEQgcZPb/VV
         kWGg==
X-Forwarded-Encrypted: i=1; AHgh+RoY6arV3aQTo8ddUQ5ofxYfvNadWAEkHU1o5Rf9XUi1TV2aCK4Khu7jUKIfQysKREeLeFS5rFYOVqyTsHNb0Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2h2yXy06IpZVC2xPySx7eF6Wv38hrx8s2FDlV3qrLcE1bpf/Z
	X5ZxxfTADT0VAGGBdsjVD2RCqHFf4B7Tuj8rG3nXTmZyyp9KbKXX+MnzrNQUsA==
X-Gm-Gg: AR+sD117s9ZZhB/NbA66TUTP7KVyQlFdjBqLNPqQuljoFTQs1YashVnv2MdOIjsouAm
	VjkwGXLBUID/P3nW7GvuRPpd7HEGLGOwNbeIYsOimXchJf/KxSf8jBvkahCTCinyjz5NgJ3lHse
	N5ldwKj3AleH+d/28LSkmQgPrNAmfSS6/YRqx9/qeB516xRLRV9t2yl8l3/uhgLJuyEMMqIJQBn
	9IwTBxK7rkjXepzlCLjqXfE/MwQRtvTWumjNleBqQyEfHB7JAnBJ8f/9obM9dnYX3SLDsA0vnEK
	KGjo5raA54MtvuZ8ZP7S/MCFVJTTKWCjwoBtVieIBJgy5J7AWP2AvxdHTZlII0dwUKaoQiQdME/
	87azZ5kYEk0Jrrm2S8aRUlhzHSi3PIIbnf43KZ+Pf1gwqIZF6asvCIxTk+Qwd7QmQxlCD+7LdXo
	h3lAma5waBPG7VFrIHCvPrn98yu4F3/XoibRLYTIIRMUFEIRaMKw84lyI=
X-Received: by 2002:a17:902:e885:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d0ca7f8a67mr219600325ad.10.1786093641504;
        Fri, 07 Aug 2026 02:07:21 -0700 (PDT)
Received: from fedora ([203.175.12.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4a7733sm5724695ad.67.2026.08.07.02.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:07:21 -0700 (PDT)
Date: Fri, 7 Aug 2026 17:07:13 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Qingshuang Fu <fffsqian@163.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Fernando Fernandez Mancera <fmancera@suse.de>
Subject: Re: [PATCH net v2] selftests: netfilter: conntrack_dump_flush:
 remove unused variables and fix typo
Message-ID: <anWgQSbZWK6D2ONg@fedora>
References: <20260807075928.64326-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807075928.64326-1-fffsqian@163.com>

On Fri, Aug 07, 2026 at 03:59:28PM +0800, Qingshuang Fu wrote:
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
> 
> Remove unused 'rplnlh' in conntrack_data_insert(), and remove unused
> 'rplnlh' and 'nest' variables in conntrack_count_zone() and
> conntrack_flush_zone(). These variables were declared but never used
> since their introduction.
> 
> Also fix typo: rename misspelled conntracK_count_zone() to
> conntrack_count_zone().
> 
> Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>

> ---
> v2:
>   - Drop Fixes tag as this is a cleanup, not a bug fix

If not a bug fix, you should target to net-next.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
