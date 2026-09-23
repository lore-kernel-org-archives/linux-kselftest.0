Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF644503EC
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 19:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192990; cv=pass; b=U4VlV95sXlsRWETR/4dAqzi7hddaa3H/3aYHhf6yjq1di+4B4HfjEh5lnE9BQlLMgvxoF59jgJF2OUiEQhn1xOXnVWQcT1bA0oZLPjcvIwFQjV+bxxxpvmsp8XPyUHDtLB3jhfhgnRvgIqsPA9t5Z0aG+ITuXDlZRJq3bqm+hJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192990; c=relaxed/simple;
	bh=RksxLKnB3yS+nYXEiKhMFhIcCH6JcEIqRI8Y/4IK6Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3AoXhgvOgO/l57di00FCIb1n/ArvjEBey3hK9RNk69/sKGwgGgSfo30GWKoNh+3mvWVsqNMPVuF8cldyG9CoDvy/Gia5Rdm/ShnJMORKK0F7PITA0xn6B77hl+CmL32aBQA049G+83yyPUqi+7YEdKlSNZD0WCTa3lcQlergig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LaEh9T+V; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LaEh9T+V"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a9d74e8292so287a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 12:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790192986; cv=none;
        d=google.com; s=arc-20260327;
        b=ErtdM/EnXQc6MWZOn/Mynozf0ooHS8FWXEV2x63z2xMNkxfTeQUnt9T42/tJbRc4r4
         YtjR9Og4L8wkn6YBaSxk9+zDcUI8Utx9lVa6MPR1dLERGDKIox3KIxQn4FKQ0AJ3dl/L
         qqIvc/5c5CKpAyFEP5iCODvLlPWYHaStnIOlkzxmwGqPxi8rveCk3fE5MYDLNON3knDX
         7f2XxT4Yd/ihtS/EdL4AKIy2pGQtwBIs42YoDfIDChvptYEIuw/sM1AkHAHEamWfOktH
         oHvwsCaq61n+3VB2TBUxMPcK08hhc9dhTFCqn7tPleB2h5jlCPA+e3b4F19ugkOoZqCD
         mJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zg+TRF2hlMBWlKMGW490ituj1VT149iHCF+fbR91AZY=;
        fh=DqhhQ+U64cKefUoX4nVc86vRV8WpkLnMOOLA48/CK0g=;
        b=UH0hBp30Ufym5zuLwcpzteA4F1EeGRojNWa3pgyCAqZg4TtdEB0WZeFsZaCB1reAjZ
         27f5uVoOmrfG577QwUlMxj8rllB+jEVOEkfWDp+UryWkbFHGy4Q8WWeHhNjsOuBzp9IO
         EVPu25cV7701HHHC3OeYRp2JxBDmdkYKIFii+Ixv9ML8xAGQXKiAHT1zA+rIJx0d4qqT
         j6x475HLm2ku7M1EoFyuHRnw6NRJ2UFFnUmlQZvUPd662BemiRJ14JNPilgUDkCUeU5s
         FpT8VtgQMclJuEq01YSYKPsKuay9/uMRTxcGd8xh7M6xg/r00WtJkBtEsRzPW6/0HpX7
         LdHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790192986; x=1790797786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zg+TRF2hlMBWlKMGW490ituj1VT149iHCF+fbR91AZY=;
        b=LaEh9T+VhpbtNX3w/zEMWVHTzQaNgN2gquOOZCGIATw0zL58ufmqhUvrJALMVBT2dI
         5M9C6MHdaknAoJUBO8gJa59Hd7+Gbp321zW9hwkUUZI4DxbdjLsnmdFG94knMYDYzlgi
         UaoEF1dgi1mXvTpU+nfoE/dIsBxjSbA76K8nOxHTXmwauJ7yOB9b2OuONgns9v6NJOL8
         DTWLoO/EIIDhWLzQp7RRj5uP0tl4iLYfR+SBKXYD13HC1iYWVSsQKeN/1cGKADA1W2y/
         LwIWmo7Nf/FqVmEC/MHG43lZIvmiRlyF88vV7h//Pkhx4J8IyBvGFFc729mJjUCNYQ0X
         BqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192986; x=1790797786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zg+TRF2hlMBWlKMGW490ituj1VT149iHCF+fbR91AZY=;
        b=wwZdRIxXT5rFaSRJcNdAdYAFh/BGFa0DX6KJDlL6Ovx/K27R0ivwKdZvp6shdXqPkV
         sPqLOPxfSOdl1Z553O7rTw9UAt3Tz1eiTnvAOqDK+8pfoW66UzMC8FTcBjStESUMSChN
         GugH4Qe/DMYGFq4ZK6eqsgomhLWNP+1sRpUroPxQPebQmR23wogMIMA162Zm1jJL3Ihx
         kU0100G5FCAFAhaEuI+RYKZ6CYHP64rvT1l2K5qshkeHj9wP5GXsTodr6Wd/zY96Bhge
         hUfRGQhan19y++O2EChby2Etf1pQCh9PfUfg+5CNYRF8w8ISf6+29JQCjrM6JdhozQGr
         pXFA==
X-Forwarded-Encrypted: i=1; AKwUvByT1Czj7m5ZJ/+cL4J5iL6ZYdBaffejoibNTVU6MPzY6Ankd0iKUYEBQhoxbsiE5Ez0vAZAzXDr/AQzznSj/Pc=@vger.kernel.org
X-Gm-Message-State: AFuF++ldUV5o/mMG/uc5Y94FpVo15ZMkKebPU7L897wdTGN/XdBpCTTs
	yIC4nh+lcV1XANxq1HAg3LDdjssN0kUSwYJBT2/Q6nlRWJJFNNIQxWm9q0oEe/srkEsCspBIho2
	TOD0Dtc8WPyO7VyV/PIeovvFo5fZOLd9l70vrMaPS
X-Gm-Gg: AYBFou3HP3tL8iG1e9+WkBEg6yt7Fi9uzpO8CaffTZdbU3AmE40McS9exuGXddafpYn
	PJ1UySMeFZGDWwquMz0lKL38rE4JFKMDeOJARbrsxTuHFNDphFj+VtMpjJndj3CtDCMlhTsP+WK
	+wSOEUtPgJFVq0mdmxJZeB89MltIyQcS+zUxNOUAELEnsZPjFdLCfq9NZq9BAWxi03a+yX8l9Wl
	yAm6RU2LzzWEaBf/XXfmZAP9WFo6ZdaBtWWQf0kGpIbSaqrGIX5O2Lf+y/uRphrSmUl58GPqP8t
	/j9njsxScIWIgG/5hGVk3bIXg0Nr9oQ9v9xeiM7NTRT6BNAhzMnSOIg=
X-Received: by 2002:a05:6402:1c0f:b0:69a:f1cf:4849 with SMTP id
 4fb4d7f45d1cf-6aac7c0a102mr17386a12.2.1790192985525; Wed, 23 Sep 2026
 12:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790171702.git.zhang_wei@open-hieco.net> <ece0aca2e99edc2cc626e0a8e61ccace80a28d74.1790171702.git.zhang_wei@open-hieco.net>
In-Reply-To: <ece0aca2e99edc2cc626e0a8e61ccace80a28d74.1790171702.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 23 Sep 2026 12:49:33 -0700
X-Gm-Features: AclHuK9wDS3j_kFU_z29aQCAAxsQCqLzUICOjyr0No49JpSQevHnMBu9QJNROds
Message-ID: <CALMp9eTyC5fhWnhbf1_npF30NuQzoAmuTbJe5mkG5Kv3_P3a=g@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] KVM: x86: Provide INVLPG linear address to
 intercept handlers
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 7:02=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> INVLPG's memory operand is decoded with NoAccess, and thus src_val does
> not contain the operand address.  Intercept handlers therefore cannot
> construct exit state that reports the linear address from the existing
> x86_instruction_info fields.
>
> Add get_invlpg_linear_addr() to compute the address through __linearize()=
,
> using the same flags as em_invlpg(), and pass the result through
> x86_instruction_info.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
Reviewed-by: Jim Mattson <jmattson@google.com>
