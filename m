Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA05740DFC5
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 19:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686883; cv=none; b=o01nlpt3nfCvvd0jGRQdqcuaQS8dWIS8vlFF0yNxgftE0NC3wuYv4hytxEwN7lXLqHDSt99/uT189CiWUj2YhRGZyR41bFHgTCARPr2l477lYCVabCJYRrdAtFq0hlBRF/uw1v41CVyAxv5oMb3RvI8Kdyq7h/7qV1nWZObzDRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686883; c=relaxed/simple;
	bh=SeTByExYRFfTpVB6BiCkyrlkaNwyt/jcJ6zsNOGUWlY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H879M6oNJV6AUuFFryAYKS3v3UMwhD6fVBmm3KVieFdLbsHZS3spBgol2iEzDK5JFKKPRMIAcy/p2hJeT7B3J14hrTWo4c0cC307cxUy2KmKEzLeudxD+rL1Su1CBras6NTvI+8AbVw4Zjd4syRaTwv3ZFUOcJk/NpYhVRE17nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dvltr0oX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dvltr0oX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780686876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K/K60G3XVbGz8V6gyUES7fGaaPuKY5uG+eQu7HxjAkE=;
	b=dvltr0oXmIuX5AdnZjiOtCCAeARAwmbwuNG1teo/rYa1NGOOgT9QBrmkPoSav87+EcGEMU
	pXX+8LysEOLbO3jMstFWLJJuanZXNed4KkqzAjhj7qXgmT1NngIbE4sskmkplDzKgg4uEB
	ipCPmjb79CVw6mWIIKqpjmVWl4XLJGg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-193-aa0WDFnwMRGxttmHyVcZiA-1; Fri,
 05 Jun 2026 15:14:31 -0400
X-MC-Unique: aa0WDFnwMRGxttmHyVcZiA-1
X-Mimecast-MFC-AGG-ID: aa0WDFnwMRGxttmHyVcZiA_1780686869
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7891D18004D2;
	Fri,  5 Jun 2026 19:14:27 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.48.51])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A8C90195608E;
	Fri,  5 Jun 2026 19:14:22 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Richard Patel <ripatel@wii.dev>
Cc: x86@kernel.org,  "H. Peter Anvin" <hpa@zytor.com>,  Peter Zijlstra
 <peterz@infradead.org>,  Rick Edgecombe <rick.p.edgecombe@intel.com>,
  Yu-cheng Yu <yu-cheng.yu@intel.com>,  Dave Hansen
 <dave.hansen@linux.intel.com>,  Thomas Gleixner <tglx@kernel.org>,  Ingo
 Molnar <mingo@redhat.com>,  Borislav Petkov <bp@alien8.de>,  David Laight
 <david.laight.linux@gmail.com>,  Andy Lutomirski <luto@kernel.org>,  Kees
 Cook <kees@kernel.org>,  Shuah Khan <shuah@kernel.org>,
  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] x86/entry/vdso: build with IBT support
In-Reply-To: <20260605184715.3383415-6-ripatel@wii.dev> (Richard Patel's
	message of "Fri, 5 Jun 2026 18:47:15 +0000")
References: <20260605184715.3383415-2-ripatel@wii.dev>
	<20260605184715.3383415-6-ripatel@wii.dev>
Date: Fri, 05 Jun 2026 21:14:19 +0200
Message-ID: <lhu5x3w4x6c.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

* Richard Patel:

> VDSO should expose ENDBR instructions now that usermode IBT is
> available.
>
> Signed-off-by: Richard Patel <ripatel@wii.dev>
> ---
>  arch/x86/entry/vdso/common/Makefile.include | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/x86/entry/vdso/common/Makefile.include b/arch/x86/entry/vdso/common/Makefile.include
> index 687b3d89b40d..a0dc69b7a330 100644
> --- a/arch/x86/entry/vdso/common/Makefile.include
> +++ b/arch/x86/entry/vdso/common/Makefile.include
> @@ -46,8 +46,7 @@ flags-y += -fasynchronous-unwind-tables
>  # Reset cf protections enabled by compiler default
>  flags-y += $(call cc-option, -fcf-protection=none)
>  flags-$(X86_USER_SHADOW_STACK) += $(call cc-option, -fcf-protection=return)
> -# When user space IBT is supported, enable this.
> -# flags-$(CONFIG_USER_IBT) += $(call cc-option, -fcf-protection=branch)
> +flags-$(CONFIG_X86_USER_IBT) += $(call cc-option, -fcf-protection=branch)
>  
>  flags-$(CONFIG_MITIGATION_RETPOLINE) += $(RETPOLINE_VDSO_CFLAGS)

Surprisingly, the option is cumulative in GCC.  I didn't expect that.
So this in fact works with GCC.

However, it's not cumulative in Clang, and -fcf-protection=branch
overrides the earlier -fcf-protection=return.

Thanks,
Florian

