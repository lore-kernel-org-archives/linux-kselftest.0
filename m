Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625B4525A9E
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768247; cv=none; b=uDOAepElhYpuWnRBbXI8Fgobb+V4pV7AnQLdBll6hk1n3ZYBPmLLhWT1/Rh1zSBsnhFBXzlLjO0v/5PSOk/BeHUa2eQ0/GYxC/kcyHHsXxR9s6qxnLVUitIwPkV3g26ae8phdnzxgfg/n4p0J2pojVq9SG5RuTJQWxY/TFfRApc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768247; c=relaxed/simple;
	bh=8lFK5oAIN3UPCIPodD7oNRYoewM6xA0f85WZD5FvR4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixNOiZH9lzLdimSUDtFLwbeRZ/0zWJbJIbshqdZSZOXTVYwQRqzmdsQnM1kpeFKetjRXXLuRCpQl0Tw0KUQeVoeNGkyE4hw8xrz8cqJNOtByFthZsZDGOE/Me3QYO0NGIYXz8ouNnMHqUGvInaSELCu+344SXXMLLv2Ly3t9Kh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JznJLopL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JznJLopL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7c6dbc60so884525e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 14:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789768245; x=1790373045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRu9WFQ43wFkJswy5poP93mM4ID1VlyzM9+cjmFxTAM=;
        b=JznJLopLmD1v/ZNdN8N+DlCoAhGbI5VlSDgtdYbUSi/ed3pUnb60RXKH+wbzTKBSp9
         Dh4Y/bYQWa9s20a/p8R1j6ungz14eTurX+GKkzIOQ2VKgcwNCfAijgaZs/dANfhycJs9
         0rvc95ZHQ9mZXfoQmVV9ONx9VaQMphxym0kCg4Ef4qYZP7GCMu0qK/Tu0nzy8wlnYHn9
         Mj+1xFJ4+kdFCd1YWcA34X5VspQ8A7j+PlpVtwwgk0kNeZt0nRF3Ix1ERmORTLRDc30k
         deM8UNHB8R+U+5kIhjqP1lhS5CfwK5AO9OH3fCThNdLBkHfYvnQEoCNjVn+TMZYifKMJ
         +IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768245; x=1790373045;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRu9WFQ43wFkJswy5poP93mM4ID1VlyzM9+cjmFxTAM=;
        b=Yl4zijR1JNyULaqLx8A0wbRoojQwMzqd4rlgvE+CzDQ+SYsMzhOPPbzrarFQtfi6SD
         CDhd9sQ4nJQ/AEV2r1LwVvM3ig8KdmdHazP23gX0toQ9Dd9PrmdFwvjsk5z74pbwFQdT
         i/XQgav0zjmKlX8bmTpoRnEnVrwob968ypwFBO2btZOnfBnz1qX5W27Tc+0KNGgZtcPB
         QCla3SEdHVs3Z31XDK/5vpDBIUd4HrSxbeov4vn97Kq6XOwzk2YT5iAkMEj16jaNddN3
         NrfDxJoKDgXOxmoKTfTqbJCV8CqmwLlGEiCC6MoCCauV1UxOnRlFcHa5JfiCcyb/YkR7
         nI/w==
X-Forwarded-Encrypted: i=1; AKwUvBzXI8fWtcJA0uOMBRB6ABxRof3YkWKQOMYPtFfG6rggZiB7RArBV1cefTrccKZeZyI4g0bCfOqsJGdnit2cFbk=@vger.kernel.org
X-Gm-Message-State: AFuF++mOg0D8iD7Ij2ubPQOL9IvOhN3fXHYxvYv/GwYZsMfxIGsMEYal
	3S47nHyYOaSgHPlSYr3YNF/b43aAqO36UB5lu4sNOtp5axeIbq7Brj3w
X-Gm-Gg: AYBFou39T9ahPa9hsnGdjRNrK4xUaAl2yd5jGpZ+Br5Ag2xn4grnbPxq1920kiY0DL8
	x715eLPzLH3LViBznziuBK6lekbclX/drpLnWFsXc5w1Bng9bb2hRguJe8ZFhVcNqx/Yqmtto2R
	eBw3/z5E7c+EroVKXVmyY93KrozyIFp0dTssIr5PhJ6M4xesjCGmRrH89J/wpFYsyUSgokvGSh0
	oj1NHfs38Cmq/zRdwp1pEDI1ZRZXtMjs7TNNRgh2dUB82XCDJh6BPSiCoJOMgXz6InK9JA03eEL
	p+KxntMXFccJAw23LIzKeuURgOomFDIHWR4mJQrNZ9LZmljKHrHkppY2OQIUPY2lgyfoz0IICKi
	aTviADHigFSgvHgUVHD9+Ag8gY4T+TQ545iBvU9K4Bd8hmpPOPz42rvWu/fYaSixgevomgMfrMg
	IUmfdIlnQAxyB4M+3LMYuwSFo/Bpn2v5MQqa1Ws4w/hn3PabsRI+X/TELnviHLZwJZXHfNprsB+
	gOlPZ4sr0JKcRsTroWRSI1kmv8LCilqVTvGFhdr/4Va/fSuYTlbJEsjGTscSg2Y/XSdOIyUtZnT
	KwGTgk/iuN45kqw76H5ILNe8FrZVB2cC6tziiVbXlPWDkw54kItGIvYnYTeYRbIjw0TcDe1tLKr
	ZOtCqw2vHwZJdzssA9Q==
X-Received: by 2002:a05:600c:35c2:b0:49d:1da4:511b with SMTP id 5b1f17b1804b1-49fc7dd94c0mr46884445e9.1.1789768244519;
        Fri, 18 Sep 2026 14:50:44 -0700 (PDT)
Received: from ?IPV6:2a02:3100:59ae:19fc:400:b6b0:efdd:810c? (dynamic-2a02-3100-59ae-19fc-0400-b6b0-efdd-810c.310.pool.telefonica.de. [2a02:3100:59ae:19fc:400:b6b0:efdd:810c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm20470715e9.13.2026.09.18.14.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 14:50:43 -0700 (PDT)
Message-ID: <f36f2ae7-9c48-4663-b3ba-7eb45c0bb977@gmail.com>
Date: Fri, 18 Sep 2026 23:50:42 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/3] net: hsr: return private clones from the
 tagged-frame helpers
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, shuah@kernel.org, lukma@denx.de, m-karicheri2@ti.com,
 fmaurer@redhat.com, luka.gejak@linux.dev, bigeasy@linutronix.de,
 ali@iusegentoo.com, qingfang.deng@linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260808004525.1551-3-xiexinet@gmail.com>
 <20260814012738.2806035-1-kuba@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20260814012738.2806035-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2026 03:27, Jakub Kicinski wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but should the sibling
> get_untagged_frame() callbacks be privatized the same way?
> ... 
> One more consumer of the same bytes: an AF_PACKET listener on the slave
> device gets its clone in packet_rcv() before hsr_handle_frame() runs, so
> does it also observe the rewritten h_source?
Yes. Master delivery can rewrite frame->skb_std through its clone before
the later slave copies it. When the learned A and B addresses differ,
that copy preserves the substituted address rather than the original
source. An earlier packet-socket clone can also be affected.

I'll compare private untagged returns with COW at the writers before
settling the v4 ownership changes.

-- 
Xin
