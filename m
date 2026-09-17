Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB9A4ACC8C
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637868; cv=none; b=RWOI+fIt6r+N6yA4SLhRtGwXmzdOa3+ZCUbFSJANzyDr+XzlolTmJKjvCMmFhr0lavbqX8Yme2RYSr+5/rp5n1gGlM+92tV/5EnqY8emKMIiATWRER9CchnzdvYgsO4ZIa5BVDINs0g0+07cZdKWn6FwX6k8pLZm0jkxFxHXJ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637868; c=relaxed/simple;
	bh=GUFd8mGjHKrlTe3TFpZTr9P7tWYu1BKoDQiHRjrkKTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zyxxj+IxZhqOLZbmpjil9JWorHgKSvE0Ka+fo6cVQXtGejYwqqvpbyT1WhavkidxRIDjqzWVmv2ejxSnBAOh+ttSckKOX9oUvHzg0B7No6MVk6i5RoV3ysamgmGflphmiRUnpV/n1bvgkZnCX3/NmDNKf/efSPllgC1kbU+HaAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TJbYlup+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P78G9pEz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJbYlup+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P78G9pEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789637855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVCheqid0ES8NnRGCm+C5LSsK/p6EQs4FpaE1+hHhGY=;
	b=TJbYlup+nnEQ6ewNNgOCAt94D1JTdkRSCxZRL7T6qdfZ3d4tGWUCpY02UjBpkFjlF1Kv32
	ts3rO2IbpFKSJQaabU5qfzdigiM+VVTcOOLHDA8luHEko6glALWrgHWK/2j6zLoZkUanr3
	TxlRr2q/C/QMwr+ElbqdW94gxsvdgCY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-UeaePbt3PRWJDaw3k-DWxQ-1; Thu, 17 Sep 2026 05:37:34 -0400
X-MC-Unique: UeaePbt3PRWJDaw3k-DWxQ-1
X-Mimecast-MFC-AGG-ID: UeaePbt3PRWJDaw3k-DWxQ_1789637853
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so5071485e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 02:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789637853; x=1790242653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVCheqid0ES8NnRGCm+C5LSsK/p6EQs4FpaE1+hHhGY=;
        b=P78G9pEzKdWua/AsuxGaQUji76/dWLic18q3+xkAzaiioouwjizYgwQLidIUxw4Q2N
         ux0CjBFODgaPPQOUl99frwhH311PaiEiGnHR5sU/Is5QKvKRWU4eCux4Z8wQw8WoCsIb
         rFwEpG3SHg0+g4hn/sB4G4eo6rv7uZu8p13hNGrbc7M/jFmIoXNv+ibhvrUgeTvuNxuK
         dWIBIXvQcR57CC0FFWixfpnSPrJz5ZjkFCAflrltLz+R7ozGEE8QZQm+pQvfiLKzYOs5
         TdaX3CRi67ghOUFT9aLitg4MSdKqnY1uVPL9tv8aSz5wOepBrFq2Ak7yf5Lc4PRSxZOK
         fCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637853; x=1790242653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVCheqid0ES8NnRGCm+C5LSsK/p6EQs4FpaE1+hHhGY=;
        b=pmczADwrTYHRTU8+MVNdDWHFSSn56ZWb3N+IiW7qvCGqFxZ9ZvicTar6apM9FF6kPh
         fE2h3D1Jx7JEn7BwVvb9gSr9IE0BO7BhEcHXFeD7zaA2yKRzYIwwXaHw9rJxaOdmZCxx
         k1yxBHNNBjyHgbZSJzFFe79MW39qwZ7NHYMQWfSXfrh6C1h16vJ5tj8dp+aGBXzBqEjR
         RLNAxfFUp1Nf34LntZqO6CYZPa3nzeHkoNkR5YrmgOHS6B1n3PuZMqebvnkCC7I6f+D8
         MElx6n6iabeh6GmKXgmCjsIkqKvWQiLAbtzs4tmZ7ZHsMadSOOJAYHrZVFIZkTVbh8WE
         Y3AQ==
X-Gm-Message-State: AFuF++l0ogoe1u8baIJxtVnJKXDFYYtevPsHxhMfcm5TSfX/IcVNNMOl
	I6U5mO86pICK+pw/HNP7OTDUMGC3NtCkDD7aRH2BFoSMU4XjXf5BkpE6Z6DyhPArRXpvuOPJR2y
	cYCwYu2G24xpA5a/q5ishocbQzVyyV7dQvvTIO9ur2oG+zETlC1td2zqw4bEpWzbC35vOAw==
X-Gm-Gg: AYBFou3Qgx3SjmZenuzk0T5Gaw4nuG/k2eQfGpIHG+h5zbY5FFVzPxkDpAB9Nek1wdu
	PRy+77C7YZu63r0BqrsALUqizlCbonX+6MTvy8DEmN0Jnju447BpuirOeN2Ou4uNqgXvPMCnqat
	dtEpz2DnXrPoktY7DFMc1TGVL7wf+Bd3XKokavgLcp8/lLupi0riZGn7ZGkFgyNspPaMfK1Guhh
	kTuSIsd8mWqwFB1CPjCS/Efkb17h+KZ8J0nDh2id4gybXtur1igXGNxIsE5jNc65W5Hyz0cfqHU
	3fMJKnGdTsY6it3MiZrMpET5bH+wjXwrU0ld7+iNXgTk0R0WkDAdUWPHxeve4dxSCtVMchTH6Lx
	56czShY0F2LN3cdqrY++FAFP6fsUAvvB7MpSX5oXnWUD+4bn3SeoguVQmc4TgXA53pZhzGAsntQ
	==
X-Received: by 2002:a05:600c:1986:b0:49e:7cd8:b269 with SMTP id 5b1f17b1804b1-49eb732d3f4mr63786815e9.21.1789637852991;
        Thu, 17 Sep 2026 02:37:32 -0700 (PDT)
X-Received: by 2002:a05:600c:1986:b0:49e:7cd8:b269 with SMTP id 5b1f17b1804b1-49eb732d3f4mr63786545e9.21.1789637852626;
        Thu, 17 Sep 2026 02:37:32 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm62963925e9.6.2026.09.17.02.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:37:31 -0700 (PDT)
Message-ID: <f2444878-9676-40fd-878a-c69472229d16@redhat.com>
Date: Thu, 17 Sep 2026 11:37:30 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/2] selftests: net: Exercise TCP payload
 verification
To: shuo huang <f64116045@gs.ncku.edu.tw>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 shuah@kernel.org, jiayuan.chen@linux.dev
References: <20260914004525.46597-1-f64116045@gs.ncku.edu.tw>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260914004525.46597-1-f64116045@gs.ncku.edu.tw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 02:45, shuo huang wrote:
> This series adds TCP payload verification to udpgso_bench_rx and
> exercises it from udpgso_bench.sh for both IPv4 and IPv6. The test
> checks the receiver's exit status so that verification errors are
> reported as test failures.
> 
> Changes since v2:
> - Wrap the receiver command in patch 2 to stay within 80 columns.
> 
> v2: https://lore.kernel.org/r/20260911160649.51863-1-f64116045@gs.ncku.edu.tw
> 
> Changes since v1:
> - Add patch 2 to exercise the TCP verifier from udpgso_bench.sh,
>    addressing Jakub's feedback.

I think you did not answer the more fundamental question there: why is 
this useful? I don't see much value on top of the existing GRO (h/w) 
tests, while this add a bunch of testscase/runtime/resource usage on the 
CI from now on.

In the current format it's IMHO not worth merging.
/P

