Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFA23A3E7E
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222971; cv=none; b=RVeuRxsGJxgb9sD1QPYmtGUGYZ3g701vId6g86zfIFsFbnhTpyt2/GUHo9BkhtmO49+97Wiv424LBkWO8k+d2GpVKgoDZitfi9BoJ4XUv7j0Wqo1gcsM+lTJWHmA7NHv9dq3ceImQQQ69XYIN/CX17d6o6NgtEJe+LuEEdhuElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222971; c=relaxed/simple;
	bh=VzkOBTwrh/ZAEWyDq0wTwhOjuMcVM8ZBOhLAgmbLYV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SX2b8GrAnrNNbg/zvvSRJJgagBWmOaI0eEQ4KKlUU60qgG9f9Wg4MQ0iHHAIk+feEvhQaUk3h0Xxt03M2C7oOVMfKd/uvTW+oXxfAugF4PCzNmnK5Ds+7wlvzkKk0mjxUaxzZFYDAEmz715ExN4hIVWNw47/DFeMJ5NRd/r5XP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gYGc7p/s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gYGc7p/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775222968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h9sVOoQGR6YJrdcFmzq+w7FOO7nBGhJW86+Qq1iVEJA=;
	b=gYGc7p/s7Vf/x6X5J+Lnp2nfNs+VjJhvn3zGSrluxzluNAeiQx5NGYn3HZspWt34DbgFL5
	HPBr1Mfw+yF6nOKpqSwgbrEx+q8f1AuzQmVkhER/9jrilZWg1zj0+psEAULj+wvhS4QZ9n
	yvj2Gcqz6scymSPb7t1lzObEoLyUHLw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-OR-chHBkNC-YsXLcLcBt4w-1; Fri,
 03 Apr 2026 09:29:24 -0400
X-MC-Unique: OR-chHBkNC-YsXLcLcBt4w-1
X-Mimecast-MFC-AGG-ID: OR-chHBkNC-YsXLcLcBt4w_1775222963
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 860B01956089;
	Fri,  3 Apr 2026 13:29:23 +0000 (UTC)
Received: from fedora (unknown [10.44.36.60])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 437F519560A6;
	Fri,  3 Apr 2026 13:29:20 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  3 Apr 2026 15:29:23 +0200 (CEST)
Date: Fri, 3 Apr 2026 15:29:19 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/seccomp: Add hard-coded __NR_uretprobe for
 x86_64
Message-ID: <ac_Ar-3u6mSwjl0Z@redhat.com>
References: <ac-7vdQNYdSGqcp-@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac-7vdQNYdSGqcp-@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 04/03, Oleg Nesterov wrote:
>
> This complements the commit 18f7686a1ce6 ("selftests/seccomp:
> Add hard-coded __NR_uretprobe for x86_64").

Yes, and I forgot to change the subject line ;)

Please ignore, will resend in reply to this email.

Oleg.

> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 32e2d4df397b..358b6c65e120 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -170,6 +170,12 @@ struct seccomp_data {
>  # endif
>  #endif
>  
> +#ifndef __NR_uprobe
> +# if defined(__x86_64__)
> +#  define __NR_uprobe 336
> +# endif
> +#endif
> +
>  #ifndef SECCOMP_SET_MODE_STRICT
>  #define SECCOMP_SET_MODE_STRICT 0
>  #endif
> -- 
> 2.52.0
> 

