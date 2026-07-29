Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BBB43A7EF
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311428; cv=none; b=ItbIB80erSFjzUxuiI9o8weXGre804nVDQ48deGx911g662GEw23NivFsFQ5tvCz1yMhEcucRDKUZfexLIhTUbb5tfEhD1CpruApTyaF7MFejqz6lVNFPQftl64AaSPLenmjfn9inzj+pyI3qXUsLWb9fcbsUxiRcAJfwL6LJ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311428; c=relaxed/simple;
	bh=pB/iasdouCgv5+/m46LVzlmorsCQMcNvBL6R5iWICCg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=P/Pd+BMeKM8Km+tKm4Pp4NK+BMt6j6lEw/lMw8xBPOcC65t8YfMnNhVFngViAV/X3l4GaF7k/5HF3ofDZr6bw9H61l6TyRWKaEptYaZS89ubMqR4aDoPOEVUNhtrwrBKcDEeieJTAsfMVrFYWGjTm05XD5TD8H2AMrsbEQpi/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUeHXoaj; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUeHXoaj"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-80e24970f1dso5609277b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785311417; x=1785916217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ArooMk/BeNv3RVej5k9pLl6zc7N9gWRgmh4NCVP0KIM=;
        b=PUeHXoajv0ct1qLAAzu+knf15p8Ny4pI9PwnQNJBe75B+q6jMpheETqFLaw9io5kZM
         wubnwK2qQqu1U7BFTjFj43/4mBb30wbYhUaf7y/q+LYdXde2wzlJnBUxSb+xzrSYlJhy
         vZCd89Gx1u65IgFLONAJZxlSXRQOECh7T0C2b8HF6AO7SRK7IuUAQK83j18mRsTlWMsS
         LnD7YSYuY7LxA5k9oxCEWQK4Zije13LXx99iP7MRDKyf60/buaKcx8KneTQsTO/OlHgz
         RwbIRJ1QySdCAYvaxozc0dfAklR8pJSPGa5/Bj46PQpG/zAFkK8r6fmisTidbgWO/h4D
         2Tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785311417; x=1785916217;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArooMk/BeNv3RVej5k9pLl6zc7N9gWRgmh4NCVP0KIM=;
        b=SWSKbV0oc6OOo241pXSo1eCtKwDGaxYBaQluBix9+3Omzu2BRA/oAPozb/GL+xgQyj
         lyZemkYN6l7+sYkxL/j01yfbxuMbYespWk7t3pWuDq95h2gomfp4Kk2wAiccXC4mRFa9
         2pfZoXBButoC1RdbOCeAQ2uwhwZszQNgNPHIpC4RhZ55jpKBaKYB9whjQezbbqKXuXFo
         0znPFw8xvTQmd0qGRT8L+/iOK1bV+YNk74V8FuxrkKqVH9YD9C7kv8BcdV4Tg4hZZ/2D
         k+qIS0VlPLBWAXmzWxIT/7S6+I9xycbWv9zAWEaqGA5ekvksFHhfVDbUKZmj4w9vvnOU
         KYag==
X-Forwarded-Encrypted: i=1; AHgh+RoiG5mVP4C0QFIzzXFjiyJDl7sM+bTrL1tVOKY5YnWOpGqSIR9VtwWohUUmrZef2VP6KyCgKhd4z9UUGgSjNkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+9Od+yaPLGZ2eEicunCDZJQTLznuGxwpMZaLVAIbMBB6tMpg
	N/lWGr9J4IOl8SvvWzVk3yi+g86N9Av81xOKV4r5ktGjLGs44u3JaLUx
X-Gm-Gg: AR+sD12Yufr72X6I3SrNRL1AQyzcjCCFZ0uPtyJIg8yMGlI9j20xwBj/+jSUhczGVcy
	HcXVX+JKmW3qHSSj63d+yrUj5R65aSleJzCLIDMZpkoLumFc610kkJgp222VaGi4uVbgtAP9DG4
	t+mbWbcCW8hsVSsYdQm9imKueG6alJnXwZVdR/UhauzK7Gyo3ZTTf+rC6SQepF3+6VIfXudTnqA
	PNq0ynucmyUxHx9EJkl6/m+CcUbM/i5n8sXa/Fq+9Q4iUGuPYNDqLmWNf1jbLWnZhDcl3faRJh6
	nBV/xmQrtaeJNOXIz2f8RyZRLOW/a6DmW7unKyqiMxHRDWVREqoQHpDvc/slLc17zmy5MiVEJvu
	udDm3q/0mvbtGR/+sUc6qODuW1wUg3gMXhoI0HXyNneoiUX6Ae/q4CxFRRzJDeRrlsW+flrrBDV
	S7QmzPlJmIJVgM6ew0FvCYBRMq3TpHu22PrxXHs827jj6/pihIPKWkAzE1aokAqmjnmlAYcSvTv
	YN4yFFRKA+hYMkZuqFwHNkaI6351lB9NpQ9Ro90WOBIko8=
X-Received: by 2002:a05:690c:2782:b0:81e:d081:d78 with SMTP id 00721157ae682-81f9941120amr25198687b3.69.1785311417493;
        Wed, 29 Jul 2026 00:50:17 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa2981260sm13507387b3.42.2026.07.29.00.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:50:17 -0700 (PDT)
Date: Wed, 29 Jul 2026 03:50:16 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, 
 netdev@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org, 
 Joe Damato <joe@dama.to>, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.3190df0497e38@gmail.com>
In-Reply-To: <20260728160935.4128982-5-joe@dama.to>
References: <20260728160935.4128982-1-joe@dama.to>
 <20260728160935.4128982-5-joe@dama.to>
Subject: Re: [PATCH net-next 4/5] selftests/net: psock_snd: Verify sll_pkttype
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Joe Damato wrote:
> Extend do_rx() to take an expected packet type. Existing callers pass -1
> to skip the check.
> 
> Signed-off-by: Joe Damato <joe@dama.to>

Reviewed-by: Willem de Bruijn <willemb@google.com>
