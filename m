Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48F9442FC1
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565958; cv=pass; b=pEG8ntsvviNbcrvHZuLI+3QERXznITTUWh4TYjVSfFw2uIoRppzgs2Eh7v/Ca2ikZeo5ZD1hNsLPXMxcAvgz5h/MVIRl+5Apom8i64JPtb+x1NGn+xxz4BjYH5KDwQRdBETc67UlJqFJp8O9Y3Vwz4SDsUWHhBQFFJKYCDMMI6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565958; c=relaxed/simple;
	bh=cLC8ot5pIh8dTgfPfSXv0InXlRDbr7JPQ3f53NKUd7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCbRE/AUlJ6VRwaYLxlgE8IpsLG7lidWl6KTfq14+afX9tyT61PJG6gu6NY6LnQm5zhIyGzrR8uYYc1Ynhn4GGL4ktqkovxd5NDN1KxlWh6Esk8BDZpAexl2P/Q+NLNC0PfVc0L6CpzLDzxO4lJ/sZQXAKkszNPOSK13KfrrbUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ef3RavDi; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ef3RavDi"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e54f8c051so783811585a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 09:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784565954; cv=none;
        d=google.com; s=arc-20260327;
        b=XLwgiPmsadIaLb01qAeW36ID4CjiQZGlFErvcEeiXEMn54JpwLFyBEuBRSl7bteRNp
         30m6XuZ8pg8ukbdNpAj7YET+we8+sZVelxXJX6NyLI+TRQXXzmekvCGS6SjRRFiHI7XR
         Xqiu98zFf1ZS+0k8GiNHE+L7RaO5PZX5H9E+yixHdfbndDAvdlTzT8PcLuA58Td1Xf8D
         nuJumIv/vpmLo/DrqPcdCOoTkcyEgSK4cZFHNOuUH9saFN4wHQ/CMXGEOct+66MV0dzJ
         Ydz3jjxrH4dHyuyXoFqckdb1cl9eGJMaRdLSSN6Ei0syevpeFZSIKQ4S1Fdy36u6TXdy
         lO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GdwLLcl2D8Tg+THUNONwAYfn4D48wOZssB4/wTdyRPc=;
        fh=UKoiInXIAO9s7Qe0IWAteAkO02TiH/VA4sO2p808ZFs=;
        b=fdry0YCmeObiolvMw+xZ6tRhK19n8Qm2sFQUM/pACjDvOdx2Zt0PHjx6DP0X76bZxG
         XuEdCtlVv9jiOQFwb6SGoRC1LZtX02gIze99rbOVXsdsPl3lb3sNzKP2x4O/wa0GYhIR
         H+fDog0Z52LCiPqRkYi8RI7q/wXPW9dAvwNzshS9Rr5Cp83aspQqgs/7ji+KV5OW8ehl
         0Hx8gwCzbNke8tM4sg6HX42uqUEyyDu9fBjIBVMK8rgfFMNatn7VV9ZkJeH50dUNiA1Z
         bCqiyDgZhZajsYNuGa7LEdYUfbuAvvuDmyEh2g0z2hbQmPUqqRmp+9BPhKIcCuUzppb+
         9beA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784565954; x=1785170754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GdwLLcl2D8Tg+THUNONwAYfn4D48wOZssB4/wTdyRPc=;
        b=ef3RavDi6HFd+z+zH3QM6jISvan9h8Cr2f6izcVbqNYfbAnOetyu0v5IroONtZSkFb
         6Dm1YbNLisFXUgR2i3tq6YdUpZE/oAUJUqApejLJD4uwHlEhbXSvaEJs6GXqSgYxhnsp
         PeKUQv/SVRwLZ1IKFIyRz6O8YMTtF70CjWZvEfo9nNC2dbNw4Mnpn72zXcc8XvL4ZyYM
         R5Mbmt34oYBt5MhCiH2uRbIzP8jE4DqtoPnNZJAnlW72gs/9SoceHOZsSa3YmWTx6oV0
         uxhxZk3q34YEK8JdrcVF9E8RIhGdD1uZ8GH4CDYFRuLy6DrW6FK/Uu23NZ2vSzDAx2TA
         114g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565954; x=1785170754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdwLLcl2D8Tg+THUNONwAYfn4D48wOZssB4/wTdyRPc=;
        b=GoEmpE2e4ZbLjNC88RCHGnUmiOqnV9KjSo2rmUE5g4+LY5hO6EtlZDWJZrnOc3hL0m
         FBWBOYOfTmGKFj5wea8w0OEKhIjz1q77QtJKowpFSol5L3aSLMNwxXE67mb3TeKb8tR3
         E334e5D8iFhu69eLEyeGUx44WmC1QZJa371DMqssrt9Asy7yM97VPVJIciTvKoUaC4xP
         P9PsLuD+gdl3Mjk6+q+8NRmRxhoVJg+RjGi9vub8dvXR0/SE6ye7FBqnaE8nAWyxSWYJ
         hLbgRR6CAbwiGCJVXZd1Anp1d8o4IGGQCwP4UxW5KtXziQF4dmnsE6YWkuckqz74qpUY
         kH0A==
X-Forwarded-Encrypted: i=1; AHgh+RpISDknw0EwmD6VX9686AftZkuTXofj+Y6MwDttv0lpvn443RTm/IGlVjn+rChj8cZDKF0BmXFeWXTEQ0h3if4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd1H4TRdbzyHRvXbq3C8LtaifWRnpHj4oTtzsGw7hGquDDhNXt
	9K6BAnZuWEHaFmOJPNKXg4pISKfEInXSi0E8ILdW6A8hCoiSHGUvMyn7zvm4Wytr5gVq+pMDlPy
	rnTbexra2N5Tuu9rlmIURYzB28J8KLHmCqAqq850l
X-Gm-Gg: AfdE7cneFZoPIoojuo7woqULZndUbnRyaCWfjFSY51BK/owzR/G+z/S57Bqt9PupUFn
	zBZjO0jZCMEb3zx56/uMPA/VGz/+edUR4pHGP4eNGsdJWJ/XgiDYn3XqnNqgXnK7yAZ0HibWbKo
	PzLrLJ2LrQC7X4HEFI+aFjUEmRgOCOH5lrk1ePhfERLVvTojRW2kghb+IjeoGZqP2tTU1+e2aCO
	M1NnAkSo7Tzq0N63Q93lXVqi3ZiZDe0qtK6+52C5q85Ti8Wz65kxri2LHdrgVocB51HCuDR+Fbb
	p5PBiVCa1HwDJZriMO8yTUX20plFt/pQrANda53c3z/7mTnSP7FfCLk8O9JOzXs1hyjOuahYnA=
	=
X-Received: by 2002:a05:620a:1a01:b0:92e:fe10:3ef4 with SMTP id
 af79cd13be357-930b416cd6cmr1462059285a.45.1784565953237; Mon, 20 Jul 2026
 09:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717081443.809393-1-yangyx22@mails.tsinghua.edu.cn> <20260717081443.809393-2-yangyx22@mails.tsinghua.edu.cn>
In-Reply-To: <20260717081443.809393-2-yangyx22@mails.tsinghua.edu.cn>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 20 Jul 2026 18:45:41 +0200
X-Gm-Features: AUfX_mx_QTBHnNcHo-EzNtIineQrXil4DzAF5RnVr3HpqgIh9UQ6m863CpRTp-A
Message-ID: <CANn89i+TBXezN9MMoUZbig3F8DK+J+-MN+P3F74V=v04CXMMMA@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: challenge ACK for non-exact RST in SYN-RECEIVED
To: Yuxiang Yang <yangyx22@mails.tsinghua.edu.cn>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Yizhou Zhao <zhaoyz24@mails.tsinghua.edu.cn>, 
	Ao Wang <wangao@seu.edu.cn>, Xuewei Feng <fengxw06@126.com>, Qi Li <qli01@tsinghua.edu.cn>, 
	Ke Xu <xuke@tsinghua.edu.cn>, stable@vger.kernel.org, yyxroy22@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 10:15=E2=80=AFAM Yuxiang Yang
<yangyx22@mails.tsinghua.edu.cn> wrote:
>
> The SYN-RECEIVED request-socket path in tcp_check_req() accepts an
> in-window RST without requiring SEG.SEQ to exactly match RCV.NXT.  A
> non-exact RST therefore removes the request instead of eliciting a
> challenge ACK.
>
> RFC 9293 section 3.10.7.4 applies the RFC 5961 reset check in
> SYN-RECEIVED: an exact RST resets the connection, while a non-exact
> in-window RST must trigger a challenge ACK and be dropped.
>
> Apply that check before the ACK-field validation, following the RFC
> sequence-number, RST, then ACK processing order.  Factor the per-netns
> challenge ACK quota out of tcp_send_challenge_ack() so request sockets
> can share it.  Use the request socket's send_ack() callback and its own
> out-of-window ACK timestamp to send and rate-limit the response.
>
> Reported-by: Yuxiang Yang <yangyx22@mails.tsinghua.edu.cn>
> Reported-by: Yizhou Zhao <zhaoyz24@mails.tsinghua.edu.cn>
> Reported-by: Ao Wang <wangao@seu.edu.cn>
> Reported-by: Xuewei Feng <fengxw06@126.com>
> Reported-by: Qi Li <qli01@tsinghua.edu.cn>
> Reported-by: Ke Xu <xuke@tsinghua.edu.cn>
> Fixes: 282f23c6ee34 ("tcp: implement RFC 5961 3.2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuxiang Yang <yangyx22@mails.tsinghua.edu.cn>

Note : Please do not add a Reported-by: Yuxiang Yang
<yangyx22@mails.tsinghua.edu.cn> if you are the patch author.

The amount of noise in this patch footer is quite annoying.

Reviewed-by: Eric Dumazet <edumazet@google.com>
