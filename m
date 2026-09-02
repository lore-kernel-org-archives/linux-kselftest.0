Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3022F23D7C2
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308409; cv=none; b=Xj9DSsJ/yHSZZLvpto7Od2SMWA53vcGUBfQ/VauGzSNWsB7RGzo+NFxBHGt9loNa5jW+p7+VDFebiUT7TG+EZTkSPJmV69ZeqWGv9Y1g5D6Y0sMDhW+sNK+dMIlHsvvIInoz1Q8zEM1cCDc4NYc+2N/hW1DMho0AnxM+DJVM7gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308409; c=relaxed/simple;
	bh=BXRcOixdMzXQLW85aUU4Wf/qtNPkoLSWJYkLfRBdgIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O4bu3aGwKTvQP3ORqqmmnY0Fh5F3c2sPRtI9PQHncevQ+41RzLplR+6HM2RangY9xTN/Zc/MKtNTHqKfxLPbSzUIAncewBXvgdne/wfp+126UsnIB0cKEfS6Bs9Ug6UrPHoucs/zPyp/EFKQKA6QTiMKjd13PrUOk1U3U+WPzmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z4bugYjb; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z4bugYjb"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7151120d6so6181875ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 17:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788308408; x=1788913208; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSeD0zkw5d62oYTgpl5Wd4yc4wNF2jb8Exvm2SVVImE=;
        b=Z4bugYjbTT0wJqYa6c5Hcbrh1KiXRXJ9PREPFEip4CUHEV2l9qw73Zv9FX1gXBH5C2
         dHLlJQeLvK4wuiMsYt02jbh/qw2WTWhccJcUcozeBWN8wuwMs9DFb7VqgEwRTfRs5Don
         Wq6JCjGNzulpBj5v5xUDOUagzJKm0RHitkm5IrEqSQuGehkUK8O0D9XI4+JeVgE19nvw
         jVXWgu0Q352gP7undqLgb9uSU8EAubdpLFBD5Ul1jhrkDWa2uoeegWSssHSiL0yU6hNR
         Mo2CGKl9lc9iRjOEv6w582BykMbgButl4cJ9k/ERfuqj7UtE/YVJXfsI3nlb9F1q6Jqw
         jieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788308408; x=1788913208;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSeD0zkw5d62oYTgpl5Wd4yc4wNF2jb8Exvm2SVVImE=;
        b=sWFlqLmyUEpqnEiB8jX8cjBFQKzuYevQZR0UzCq2t5EuomNNmJRNSIsjHUHvG7tv6q
         folMib0R1X1ggmIou+3SldR4rCUB6fhwMIRHnQ89gPZ1KrBX+Vv/FGXacEZBnEdWlVl9
         2H/hEMFHPrCi7uEmt1T1aNkng1LpF/o1mDKvkUJiCQanLn7f3p0eCPWWIFXDcCOcY17A
         pay7mnjPkgv5e9ND32AvnP5NApYhF9lXVcZxldYjEu/7RvsfNgAdy6fTgT7tmubYXg5q
         iLFHxhL1VTxqCV3dcBCwL2wPxb1suVmvFtm3Xw2NJH4f8WYr3yAQ/Gg1vcJ/CFpRYnKW
         SOUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFcQ2kui4t5XAKOpYGwIK+F32qBg7lgcXeYBj8dAv6nm4qeahxTrNOVw4yV1s/OyZwlrGPdhzKzWmUbzMlzIU=@vger.kernel.org
X-Gm-Message-State: AFuF++mk+zXtCdrx5HBmzCC/DSWYkCDTSNi0qGLl0tOSolwwoH2hrHix
	CLfvHxnxzV5od9rYT7csntdLeuPXv/5jUlv/UHn4rD3gnIUWOljZ7y0F0nj1GykgmLQwDwKiih3
	MOn7qug==
X-Received: from pgco28.prod.google.com ([2002:a63:731c:0:b0:cbe:dc75:c58e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e787:b0:2d9:4358:73ab
 with SMTP id d9443c01a7336-2daec775fd0mr16568335ad.19.1788308407429; Tue, 01
 Sep 2026 17:20:07 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:20:06 -0700
In-Reply-To: <20260730110524.2539316-8-ewanhai-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260730110524.2539316-1-ewanhai-oc@zhaoxin.com> <20260730110524.2539316-8-ewanhai-oc@zhaoxin.com>
Message-ID: <apdrtnMGJN7K0wRa@google.com>
Subject: Re: [PATCH 7/8] KVM: selftests: nested_exceptions_test: Add Zhaoxin
 CPU support
From: Sean Christopherson <seanjc@google.com>
To: Ewan Hai-oc <ewanhai-oc@zhaoxin.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Frank Zhu <frankzhu@zhaoxin.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 30, 2026, Ewan Hai-oc wrote:
> From: Frank Zhu <frankzhu@zhaoxin.com>
> 
> In the test, the ERROR_CODE_EXT_FLAG bit should not be set in the #GP
> error code on Zhaoxin CPUs.

Why not?

> Add GP_ERROR_CODE_ZX and use it when > running on Zhaoxin hardware.
> 
> Signed-off-by: Frank Zhu <frankzhu@zhaoxin.com>
> Signed-off-by: Ewan Hai <ewanhai-oc@zhaoxin.com>
> ---
>  tools/testing/selftests/kvm/x86/nested_exceptions_test.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> index aeec3121c8e8..bacbbdc5dc69 100644
> --- a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> +++ b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> @@ -38,6 +38,7 @@
>   */
>  #define GP_ERROR_CODE_AMD ((SS_VECTOR * 8) | ERROR_CODE_IDT_FLAG)
>  #define GP_ERROR_CODE_INTEL ((SS_VECTOR * 8) | ERROR_CODE_IDT_FLAG | ERROR_CODE_EXT_FLAG)
> +#define GP_ERROR_CODE_ZX ((SS_VECTOR * 8) | ERROR_CODE_IDT_FLAG)
>  
>  /*
>   * Intel and AMD both shove '0' into the error code on #DF, regardless of what
> @@ -139,7 +140,8 @@ static void l1_vmx_code(struct vmx_pages *vmx)
>  	 */
>  	GUEST_ASSERT_EQ(vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS_GP_DF), 0);
>  	vmx_run_l2(l2_ss_pending_test, SS_VECTOR, (u16)SS_ERROR_CODE);
> -	vmx_run_l2(l2_ss_injected_gp_test, GP_VECTOR, GP_ERROR_CODE_INTEL);
> +	vmx_run_l2(l2_ss_injected_gp_test, GP_VECTOR,
> +		   host_cpu_is_zx ? GP_ERROR_CODE_ZX : GP_ERROR_CODE_INTEL);
>  
>  	GUEST_ASSERT_EQ(vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS_DF), 0);
>  	vmx_run_l2(l2_ss_injected_df_test, DF_VECTOR, DF_ERROR_CODE);
> -- 
> 2.34.1
> 
> 
