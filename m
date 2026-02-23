Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE522ECE91
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861173; cv=none; b=udg6eBJPgsyprhoD9Z3V5xVB7HuDo/LPdS5xr6dTHP6SfQm1aFzp2y7hKDKTSJ/s9mtMVYbCC9oLCrTVqpS0uS7nyrzkB93XDrusScnGbDh9T4E2Re2vlCc80tClrkYan6MSwXuwGSb2SwLbFMSee+qRgl32QaFpwNbeTLSZHuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861173; c=relaxed/simple;
	bh=xHx2QtvuMMl81kLfh/pk5/YvM5YCK9SV6YTcKdH9I+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=do3nO7+GZn0ksq0/oDiaxw+X+wfYZ1evXojPpxWQyLWubdzpU40hMqVFTgSBlOLcHbSgKFiu6WBsBLmvq01ZCqyPRB8IGSyKKN+DkiGj/bYvZi0V/owOGbhq6mG8q7YZ9O9THxMCXuBwFVGgPmDnmzimilmePmnqMaLDIBHrAh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JVfX0B9+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JVfX0B9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771861171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I+qb2ND/P043jlrQlSxeHzqgiER2H6JlqtQO37r8Vuc=;
	b=JVfX0B9+nChIcaIbPyXEo6xRUnUuY5W7ic37oDQgCf60NkHfw+aAHL5LDocqnPVRJh1vxI
	6tdOVleKNoM1kyTDnqcDaa05Rv/fMP+0aBAFX4PAqyQjjpU3XBlhKjr0PV8bdDdvEVe5n5
	vRz2+JqGgWu7lW2Uda2v/K8DSeaLr0o=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-xLAfiAiJM2C0ypSdoTObxg-1; Mon,
 23 Feb 2026 10:39:28 -0500
X-MC-Unique: xLAfiAiJM2C0ypSdoTObxg-1
X-Mimecast-MFC-AGG-ID: xLAfiAiJM2C0ypSdoTObxg_1771861159
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D17E1800451;
	Mon, 23 Feb 2026 15:39:19 +0000 (UTC)
Received: from redhat.com (unknown [10.22.65.108])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B5F119560A2;
	Mon, 23 Feb 2026 15:39:17 +0000 (UTC)
Date: Mon, 23 Feb 2026 10:39:14 -0500
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests: livepatch: test-ftrace: livepatch a
 traced function
Message-ID: <aZx0ouPn_erDrFD4@redhat.com>
References: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
 <20260220-lp-test-trace-v1-1-4b6703cd01a6@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-lp-test-trace-v1-1-4b6703cd01a6@suse.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Fri, Feb 20, 2026 at 11:12:33AM -0300, Marcos Paulo de Souza wrote:
> This is basically the inverse case of commit 474eecc882ae
> ("selftests: livepatch: test if ftrace can trace a livepatched function")
> but ensuring that livepatch would work on a traced function.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  tools/testing/selftests/livepatch/test-ftrace.sh | 36 ++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/tools/testing/selftests/livepatch/test-ftrace.sh b/tools/testing/selftests/livepatch/test-ftrace.sh
> index 094176f1a46a..c6222cc037c5 100755
> --- a/tools/testing/selftests/livepatch/test-ftrace.sh
> +++ b/tools/testing/selftests/livepatch/test-ftrace.sh
> @@ -95,4 +95,40 @@ livepatch: '$MOD_LIVEPATCH': completing unpatching transition
>  livepatch: '$MOD_LIVEPATCH': unpatching complete
>  % rmmod $MOD_LIVEPATCH"
>  
> +
> +# - trace a function
> +# - verify livepatch can load targgeting no the same traced function

nitpick: s/targgeting no/targeting on/ ?

Otherwise LGTM,
Acked-by: Joe Lawrence <joe.lawrence@redhat.com>

--
Joe

