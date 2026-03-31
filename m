Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4622F39CE
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953125; cv=none; b=dv9UMc89oC6mQ5b85znlLfi737bmezmo97jEKniqYFRQHCtsaiXdo4ofPn65h557yNtHGA/KBDzr0jhRi8aiRFdDvviGqBBVxsipcPDWzV26dhbLxcWCsiXcQz8JNIYabEU17UykDt9T5u1dMorheSb9tgK7wuLxVLIL1377XCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953125; c=relaxed/simple;
	bh=8drQZrQCucp0eODNeaRhN129LTACSJoTJ1fojl4P/zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEKi5nw20PhJnXqklRCewkEvQUgUsiLNBpLu/KDHDKR+H21PTsBsBZ0nEX63/ZySfa8oOFiSiBLv80zayD2u8O15s4NFed+q0AYMpKQJks9b77aB85weAbGAkN9+NxVydFU6fP5+pR6Z9t4FMAFwXgCkC12AP5s6OVvTcQORr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KRppocxj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KRppocxj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774953123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JTf6t+shlozTTQQAsguxmrn4VBcayi2Dg3j1XGQX/Rk=;
	b=KRppocxjRi2jDTaTM1qiyxxMvBs+GnL1UVTluSDpd1B6zi3vUt0e/LbmnZe/oBJkqh0wI6
	GW+e6BGcD9zt4sBc1MPfbxaO6AczROgpaPy4FOzSMOdyuWb3TOktIr2W73Or16F1VX2Th+
	qedVDNcp6rRMOM8Hohd54oLM78bj9Ho=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-478-mbOYWH3SM9SW50Io4JD4HQ-1; Tue,
 31 Mar 2026 06:31:59 -0400
X-MC-Unique: mbOYWH3SM9SW50Io4JD4HQ-1
X-Mimecast-MFC-AGG-ID: mbOYWH3SM9SW50Io4JD4HQ_1774953117
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9CF541954AC2;
	Tue, 31 Mar 2026 10:31:56 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.187])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5977B1954102;
	Tue, 31 Mar 2026 10:31:46 +0000 (UTC)
Date: Tue, 31 Mar 2026 18:31:42 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH v7 4/7] selftests: ksft_exit_fail_perror: support printf
 style arguments
Message-ID: <acuijiUs81Z7qYSL@gmail.com>
References: <20260330151503.670415-1-chuhu@redhat.com>
 <20260330151503.670415-5-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330151503.670415-5-chuhu@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Mon, Mar 30, 2026 at 11:15:00PM +0800, Chunyu Hu wrote:
> The ksft_exit_fail_perror function previously only accepted a single string
> argument, which limited its flexibility for providing specific context to
> failure messages.
> 
> This change updates ksft_exit_fail_perror to support variable arguments,
> similar to ksft_exit_fail_msg.  Adding the __printf(1, 2) attribute enables
> compile-time checking for format string correctness.
> 
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> ---
> Changes in v7:
>   - new patch to convert ksft_exit_fail_perror support variable arguments
> ---
>  tools/testing/selftests/kselftest.h | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> index afbcf8412ae5..11cabdabb3f6 100644
> --- a/tools/testing/selftests/kselftest.h
> +++ b/tools/testing/selftests/kselftest.h
> @@ -43,7 +43,7 @@
>   * the program is aborting before finishing all tests):
>   *
>   *    ksft_exit_fail_msg(fmt, ...);
> - *    ksft_exit_fail_perror(msg);
> + *    ksft_exit_fail_perror(fmt, ...);
>   *
>   */
>  #ifndef __KSELFTEST_H
> @@ -417,9 +417,24 @@ static inline __noreturn __printf(1, 2) void ksft_exit_fail_msg(const char *msg,
>  	exit(KSFT_FAIL);
>  }
>  
> -static inline __noreturn void ksft_exit_fail_perror(const char *msg)
> +static inline __noreturn __printf(1, 2) void ksft_exit_fail_perror(const char *msg, ...)
>  {
> -	ksft_exit_fail_msg("%s: %s (%d)\n", msg, strerror(errno), errno);
> +	va_list args;
> +	char *buf = NULL;
> +	int saved_errno = errno;
> +
> +	va_start(args, msg);
> +	if (vasprintf(&buf, msg, args) == -1) {

kernel test robot reported compile error on this, as the vasprintf
required _GNU_SOURCE. Looks like it's not appropriate to be used
in the common header. Looks like it can be replaced with a buf and
vsnprintf instead.

    char buf[512];
	va_start(args, msg);
	vsnprintf(buf, sizeof(buf), msg, args);

```
   In file included from za-fork.c:12:
   ../../kselftest.h: In function 'ksft_exit_fail_perror':
>> ../../kselftest.h:427:13: error: implicit declaration of function 'vasprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
     427 |         if (vasprintf(&buf, msg, args) == -1) {
         |             ^~~~~~~~~
         |             vsprintf
--
   In file included from basic-gcs.c:16:
   tools/testing/selftests/kselftest.h: In function 'ksft_exit_fail_perror':
>> tools/testing/selftests/kselftest.h:427:13: error: implicit declaration of function 'vasprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
     427 |         if (vasprintf(&buf, msg, args) == -1) {
         |             ^~~~~~~~~
         |             vsprintf
```



> +		va_end(args);
> +		ksft_exit_fail_msg("vasprintf failed: %s (%d)\n", strerror(saved_errno),
> +				saved_errno);
> +	}
> +	va_end(args);
> +
> +	errno = saved_errno;
> +	ksft_exit_fail_msg("%s: %s (%d)\n", buf, strerror(errno), errno);
> +
> +	free(buf);
>  }
>  
>  static inline __noreturn void ksft_exit_xfail(void)
> -- 
> 2.53.0
> 

