Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794120460;
	b=l1mZAirrp5urzlSJy31wNSCxdATt152Rrj89ydxXPWcexGFpjFY3u/dR3x+VCgtDx/PR
	 D1w1vS21k6PH0NslOtNoCkoA5Emn9Egr3xvHf4NWZ8QZ5rRdGCasm0yOpQFfxeVujWYAf
	 MkNPZbOGu1Q3SmFMkW6+Y0Ml3jdy5TPE9L2hyO7zb/A8ccynhwqQGKg4mtHqgz7F9Z+eu
	 RDn0CKQQk8MsVXzg5v/yo077aYtEPSsgJByQrzqMmYhQZNvkB0gWlgctPmPHMPwLZepgD
	 sQH1ffgnc/VbFT4M3ZjZds734ZfBsUNFlVB2jo6lhfq1dRZLVqu4jxIz6Ekw3v5Fs6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794120460;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gFzkxofby7EKQV3LcygbguAnEdPbRDZTbIJ7Q075LwY=;
	b=lAPXQk1tlv+uZZjx5pV/PTbxKqg9UI5Em4iGPw2UxZyWRToRWh1sas4OLTtGAd3Ks6M4
	 vGDafD1o1+mSb7rfmR2jQU0d5VLmv0M5knlIaojxRLS+KPB/9+yUOiqstHc2QPBh6g9cT
	 3AKL5tF9LEqf9HXZrPOEnPEx5aspEX/4yeKEeMV+dk71CIkbvrviS9y2HgT/74Xl//1fz
	 +UTbs9SWSz9sieBNBu/7c3AogTXQntkWwAmZlo+KUct2xA9M6t0wYxxo2Q3sU99cHIQq2
	 ZwUbNCfbwYrEYwsrzPQA/XgdxNvKEYHl18prXWG7RWdq1duugB6D4RkAt3OXojY9Asg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xKCgG8R7;
	arc=none smtp.remote-ip=91.218.175.205
Received: from mta0.migadu.com (out-205.mta0.migadu.com [91.218.175.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6067606A31C
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 06:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6067606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xKCgG8R7
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tKpCjzN21BXoeX24UlamatFKebw0e0hK5bdDYDPtIKw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794120456; v=1; x=1794725256;
 b=xKCgG8R7zG3AqyagEXdfIM2v7M+ORQgkJmUWJS5RnlDcDuhyfOp9j194xbMXuDhQsLR52CB/
 ado6q+dKeE/35o423TB1Wro46BxZp33GZ0otHYpgMpGYUrjH0gucmikE/cUfEQtwZoUA9AfH6qd
 TQmhdcliz4bBIIEDzNzLvfDY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 66ec2ed02adbef6d;
	Sun, 08 Nov 2026 06:47:36 +0000
X-Mizu-Trace-ID: 66ec2ed02adbef6d
X-Migadu-Flow: FLOW_OUT
Message-ID: <cc1a7374-f253-4436-90ca-a8d6b178a84d@linux.dev>
Date: Sun, 8 Nov 2026 14:47:27 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: breakpoints: Ignore breakpoint_test_arm64
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, tabba@google.com, will@kernel.org
References: <20261102095003.2940560-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261102095003.2940560-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 5:50 PM, Fuad Tabba wrote:
> The arm64 build target was added without a matching .gitignore entry,
> so a build leaves breakpoint_test_arm64 showing up as untracked.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  tools/testing/selftests/breakpoints/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/breakpoints/.gitignore b/tools/testing/selftests/breakpoints/.gitignore
> index def2e97dab9a9..c5fbc4a48229c 100644
> --- a/tools/testing/selftests/breakpoints/.gitignore
> +++ b/tools/testing/selftests/breakpoints/.gitignore
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  breakpoint_test
> +breakpoint_test_arm64
>  step_after_suspend_test

Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>
