Received: from mta1.migadu.com (out-140.mta1.migadu.com [95.215.58.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFEA3D525B
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 02:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647241; cv=none; b=gfOOau3Ro0pRd1zzvJZ8xsgJbXxUZX8bbX+ykvzcvGOAr+SfxV119leCmO3mct+Irze0cRtHrZGpRBBDLkTiGrN+kHLzc/RSuTthsUlaArO+Q0rrU/gQZtpdjBXziSsi3WAExRI2nOffLAAZG02kfU5tOAm8QjS51lMGC+VKqtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647241; c=relaxed/simple;
	bh=tSichUE0FxlrRbXw+Ud13lhYw7WiqwQtIvhvCTVfiko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMefUEkdgUMBaWAnmWzzU2kdkZ5TjDxR7yfzsWcEb+wtwVtaGhdSDjm5RDGLG0R9wkvwAdsgsH8kbMlZ7cKVMxmyFbmweMBo1kB8jv72v8RApBGrjTSSsh2jGbloOaJhyvQz6y+/lJGD+iKLUCepTTkRn1l4GGS49imlG9bkj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZwHpOc1e; arc=none smtp.client-ip=95.215.58.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZwHpOc1e"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tSichUE0FxlrRbXw+Ud13lhYw7WiqwQtIvhvCTVfiko=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790647237; v=1; x=1791252037;
 b=ZwHpOc1ej8KsrWTAfU1MFkjCeWU+oZL4PWXEW7FGNtlKtcwyeQHVRJf1BhYjd33yhqwtxl8R
 ggKdqwZuI4NYf3tWWE+hxAhqS+8iTR4dGu0jaqpl9GY9mrQMffeN85LuPfeAStqOlJKgg/ojh30
 ZC6SjY5zoKj6TNXYi8DOgE4k=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 3b547281ddb4db6b;
	Tue, 29 Sep 2026 02:00:30 +0000
X-Mizu-Trace-ID: 3b547281ddb4db6b
X-Migadu-Flow: FLOW_OUT
Date: Tue, 29 Sep 2026 10:00:19 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	dsahern@kernel.org, idosch@nvidia.com, andrea.mayer@uniroma2.it,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next v5] selftests: net: move log_test to lib file
 and remove duplicate code
Message-ID: <arsbs6ApIjlqQ0K8@fedora>
References: <20260924-self_log_test-v5-1-1f00bd383146@kylinos.cn>
 <179058182603.3145.7204688879722696786@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179058182603.3145.7204688879722696786@kernel.org>

On Mon, Sep 28, 2026 at 07:50:26AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In the new log_test_expected()
>   (tools/testing/selftests/net/lib.sh), the failure branch calls the…

Fine, I will update with "pause_on_fail || true".

> - [Low] The commit message miscounts one output-format change.

And fix the count change.

Thanks
Hangbin

pw-bot: cr
