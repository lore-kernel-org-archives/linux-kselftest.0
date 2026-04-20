Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE2B386C3F
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 20:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776717839; cv=none; b=MplnXQDCU1MlSZU2OkocJhXOHAMHkum4R5kPf63IS1Wq4IcVF5v9uZjU0RtsNxjGODU2TbHmgQsHMNS5Eq2WnqupEAvYNhSWDmqFiVvhUC01Ey3OehFVlQuSAGCj7xAcV2DWkF5dVuivR14gCN6VhNbUOvBrQXOKLWL9AUhMvR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776717839; c=relaxed/simple;
	bh=Bhe7pfgl/AFu6WLydL6w9J5N3ApXPzLXHG9nFzZ4fmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTsuYhjQFnEm/uxsLkGWFuL8IzrHLjz8+tXLypzpA+7XnZGM5MWH3LeaZ81knUFCweqERH4lOONo+s/h4Joh/Te9NymdfLdjil198TJhX3j5PJNyze9RA6pjSxs+UJHhgxzyS1fVO+VA6a3zWlrukLjtOc00bO5v6eh8u0HFZVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X+xowDQe; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X+xowDQe"
Date: Mon, 20 Apr 2026 13:43:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776717826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ihWIIczfSlnxjYYCRII7UJ70yxUYqdVRkPZC4QRKtXo=;
	b=X+xowDQe7i2RsriG3BR8r3i1s1dXQVN7OeBZeqF4YpX9aziNxjkGZv2I0i5dX/z7sLVTRY
	qbiNjbmWozQoFwhw82fHiRn/vZsm4CcckBZ1ilyB5jGUg+IXoFxkoMW7rkDyutUtUWnpIa
	/3WCpfYXqzkVUA7tfwfEtojl47bbgjA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
To: Werner Kasselman <werner@verivus.ai>
Cc: "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "andrii@kernel.org" <andrii@kernel.org>, 
	"ast@kernel.org" <ast@kernel.org>, "brakmo@fb.com" <brakmo@fb.com>, 
	"daniel@iogearbox.net" <daniel@iogearbox.net>, "davem@davemloft.net" <davem@davemloft.net>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "edumazet@google.com" <edumazet@google.com>, 
	"haoluo@google.com" <haoluo@google.com>, "horms@kernel.org" <horms@kernel.org>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"kpsingh@kernel.org" <kpsingh@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "shuah@kernel.org" <shuah@kernel.org>, 
	"song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"jiayuan.chen@linux.dev" <jiayuan.chen@linux.dev>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 2/2] bpf: guard sock_ops rtt_min against non-locked
 tcp_sock
Message-ID: <202642020410.q7GJ.martin.lau@linux.dev>
References: <20260417023119.3830723-1-werner@verivus.com>
 <20260417023119.3830723-3-werner@verivus.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417023119.3830723-3-werner@verivus.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Apr 17, 2026 at 02:31:26AM +0000, Werner Kasselman wrote:
> diff --git a/net/core/filter.c b/net/core/filter.c
> index e8ad062f63bc..9c43193a5c39 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -10827,14 +10827,12 @@ static u32 sock_ops_convert_ctx_access(enum bpf_access_type type,
>  			     sizeof(struct minmax));
>  		BUILD_BUG_ON(sizeof(struct minmax) <
>  			     sizeof(struct minmax_sample));
> +		BUILD_BUG_ON(offsetof(struct tcp_sock, rtt_min) +
> +			     offsetof(struct minmax_sample, v) > S16_MAX);

This doesn't look like a test that is added by human.
Will sizeof(tcp_sock) ever reach S16_MAX? It is unnecessarily defensive and
inconsistent with other tcp_sock field loads.

> diff --git a/tools/testing/selftests/bpf/prog_tests/sock_ops_get_sk.c b/tools/testing/selftests/bpf/prog_tests/sock_ops_get_sk.c
> index 343d92c4df30..1aea4c97d5d3 100644
> --- a/tools/testing/selftests/bpf/prog_tests/sock_ops_get_sk.c
> +++ b/tools/testing/selftests/bpf/prog_tests/sock_ops_get_sk.c

Separate the test in its own patch.

Also tag and add revision to subject, "[PATCH v3 bpf...]".
Take a look at how other patches are posted in the bpf mailing list.

pw-bot: cr
