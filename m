Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A033148D4
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864824; cv=none; b=GzBtUx/tWkeWc1gS2Ksl/W2OBkc2ayIgG9o23aYlTTbk6qIN1VqwJ7wrCILxP0VVRGanp28Qz59pSUzbxq9LeYzJ0qN7QJtKdscjEXxNhFBqcCHNqItSltS5jWHv0NCMbCVHrM41SQuS6ZtdHaLCkkdLLrTW9wBvr0M2V+UG6oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864824; c=relaxed/simple;
	bh=IXJhAAH1/nmIyhl+YBK57kQ2alnGFS9TAjMkhdnb+3s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dqtEvN2RKqLxqpQzGClMyMbQCiSKnDM4kSrf1BPN/faCBSzzAT5vyEdlg6BaEduc6QVvWxQBabVSb2mwZY+CqWK8NEwIUvDlli8FN38pHDpIYWgyZxq5onmunm0IQbjbOePRKVuwPO9i5QHeD32SBYdzb1RXD+eBsRaiS0+O+wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qpD9R9Tp; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qpD9R9Tp"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b630753cc38so28051560a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 08:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771864821; x=1772469621; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRtHqCOflJjuPuiCBSIsHs0ADNxbSUOiJ4HAHkLUWyE=;
        b=qpD9R9Tp0iRXgJB9LWTSr1kD7uwTsK4NNVck1Eum3lHKA6pJaOD5xYYfWAlGNu3T1a
         0m6abhsLoxTsW1mHX/LMpzwkscBTp0aJ7bxgJTFmiSRoIJoJg2qOBIfU5hBgR/XLf5ZI
         a44dXN+u3G9hFhcVwAuln5rAsO3+1gxZIuZtIDrI3dhDxfuXtg7vvZWuL7LST3paZh8z
         Q32NxfedTW9UUiSp7eO3+dryeAI8xA51u8q3JaX1pW66iU0P9oNNw+UbIuouuZMcRFTw
         RXF/erVmIGugrqdsc2cwGWqVYgXFpdJs/d/L/mg0Lr4GmH+/9eLLMxD1hG0H0nmnOSiT
         yGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864821; x=1772469621;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRtHqCOflJjuPuiCBSIsHs0ADNxbSUOiJ4HAHkLUWyE=;
        b=b29+hL9WEb9flM4heVs6PNtLtjU54qAW0b7tjLA8qPS9s1qVbWuNnkqo1bCWbTk9mT
         G8xo3MOt84NhBcPQ2VPDxdjCBiXL7jdwqtqRrVBA4HfLQPEHEDlgbH9D8zQ7QEYo9k7l
         KLyfOxHJJA2ZnSxvvr6DlbDwJ52Zdz8JcPQVm/mLkqeiIdyhXgn7h4qVvaVOXdPRedJn
         x8U5G972D85hPD8vgUU9K14g1bv1EwPtaft0zUTdS9NbomOJU0W0KmFlN2Q6o18TuvCL
         psI+gwEteCR66rt1J84G7IOuzCr8O7d0FWw2ytKTn2RNP6yXLBjM8CC7CivXy6TVRCk6
         qb8w==
X-Forwarded-Encrypted: i=1; AJvYcCUzkvJ2nnGcpsrOea+qAdRSryXCuNCDQ6v5O4xpgg41VN8S1m0wnUwNEZFUyhlVGkl/G6Qo8PNpiDqDHsxgtyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFEk2bjgieM0o2oc5Pt8YzQVRT5ki1J/0CWFtukEks7kEwwHy
	bF3mIQL1yiTlVAx+a3cSl6lqvMFH/7bJe74/Yyr6FIi/bHCQuIhtdUX2cbr+hTLeHXovPzJamIP
	qMjgTFA==
X-Received: from pgbcp13.prod.google.com ([2002:a05:6a02:400d:b0:c48:d03e:cc20])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9987:b0:366:19e9:f43
 with SMTP id adf61e73a8af0-39545e527a0mr8858315637.6.1771864820987; Mon, 23
 Feb 2026 08:40:20 -0800 (PST)
Date: Mon, 23 Feb 2026 08:40:19 -0800
In-Reply-To: <20260223162900.772669-4-tycho@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260223162900.772669-1-tycho@kernel.org> <20260223162900.772669-4-tycho@kernel.org>
Message-ID: <aZyC89v9JAVEPeLt@google.com>
Subject: Re: [PATCH 3/4] crypto/ccp: support setting RAPL_DIS in SNP_INIT_EX
From: Sean Christopherson <seanjc@google.com>
To: Tycho Andersen <tycho@kernel.org>
Cc: Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 23, 2026, Tycho Andersen wrote:
> From: "Tycho Andersen (AMD)" <tycho@kernel.org>
> 
> The kernel allows setting the RAPL_DIS policy bit, but had no way to set

Please actually say what RAPL_DIS is and does, and explain why this is the
correct approach.  I genuinely have no idea what the impact of this patch is,
(beyond disabling something, obviously).

> the RAPL_DIS bit during SNP_INIT_EX. Setting the policy bit would always
> result in:
> 
>     [  898.840286] ccp 0000:a9:00.5: sev command 0xa0 failed (0x00000007)
> 
> Allow setting the RAPL_DIS bit during SNP_INIT_EX via a module parameter.
> If the hardware does not support RAPL_DIS, log and disable the module
> parameter.
> 
> Signed-off-by: Tycho Andersen (AMD) <tycho@kernel.org>
> ---
>  drivers/crypto/ccp/sev-dev.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
> index 096f993974d1..362126453ef0 100644
> --- a/drivers/crypto/ccp/sev-dev.c
> +++ b/drivers/crypto/ccp/sev-dev.c
> @@ -75,6 +75,10 @@ static bool psp_init_on_probe = true;
>  module_param(psp_init_on_probe, bool, 0444);
>  MODULE_PARM_DESC(psp_init_on_probe, "  if true, the PSP will be initialized on module init. Else the PSP will be initialized on the first command requiring it");
>  
> +static bool rapl_disable;
> +module_param(rapl_disable, bool, 0444);
> +MODULE_PARM_DESC(rapl_disable, "  if true, the RAPL_DIS bit will be set during INIT_EX if supported");
> +
>  #if IS_ENABLED(CONFIG_PCI_TSM)
>  static bool sev_tio_enabled = true;
>  module_param_named(tio, sev_tio_enabled, bool, 0444);
> @@ -1428,6 +1432,16 @@ static int __sev_snp_init_locked(int *error, unsigned int max_snp_asid)
>  			data.max_snp_asid = max_snp_asid;
>  		}
>  
> +		if (rapl_disable) {
> +			if (sev->snp_feat_info_0.ecx & SNP_RAPL_DISABLE_SUPPORTED) {
> +				data.rapl_dis = 1;
> +			} else {
> +				dev_info(sev->dev,
> +					"SEV: RAPL_DIS requested, but not supported");
> +				rapl_disable = false;
> +			}
> +		}
> +
>  		data.init_rmp = 1;
>  		data.list_paddr_en = 1;
>  		data.list_paddr = __psp_pa(snp_range_list);
> -- 
> 2.53.0
> 
