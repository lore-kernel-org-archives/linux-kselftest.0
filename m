Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511421339A4
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 00:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776989846; cv=pass; b=HjL2KeEh9eHtzpAR0oN7EsdwHtMd8jtAHSxoIGxXl8BJUwxjf86cgUQgQ8cAbWUxAk2G5/2EhinamJ2KlhwDBmAmpV8LqeVc039hDETJTMyWFTmRwdUWzIuZQjXg+UsbJ2Ktuv37iKi2BPdhgWN0jEIBldERpjowy07g0JlJtuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776989846; c=relaxed/simple;
	bh=OWKqufAy9WCyNeb7K2f/LYLF5dN1ORSBiLgT0IKLWvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpEpJ5RO5XhCpgXmWZKcmJZufpsrU3/vTcFNNI4MXirTNh3B3MfUV4wi3Z60JvfXoJMygUtqoI6COGzQfQXcxrnrdUc7XBV2zekTjLhrvTpNeNkPwcfFXiU6TEaftBskM7ZVL+1PgSPq3DqVnPAVl6hte3pyhte3/DU/ZKbk3cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIVBi5oG; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIVBi5oG"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50d87610513so79099601cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 17:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776989844; cv=none;
        d=google.com; s=arc-20240605;
        b=Up602B6VsAkxwrnWpY1BJXdP7/OppAtYuTZrW60Q4WuLUwLUqCY6MtUQRDG06Ho80Q
         bQSlasSDbe656j0Z33m3uVNFkI1BlW3nIV9c5i6OFy7cJphFHEEv7KeQ6ttfTpf+on8+
         KuQh1Doo0/1FFGpdePNiCEL3/rgby043z149JoaYa4Sl4sO6rpYFST4ysFDiwcRTxn/C
         8tcRoqoildlOWGXwhBLLfwIh6d96Cuo2YoIzRc7WAfFJVbUVm6+oqQ7c6H1uFMINzSi4
         rBy4jPsTmrqJk+Olsr9/ZbPN20qc4utK1G7XC9ptPWWWHO7blpi6bdm/pTgupIMa2gdw
         VkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FdbcbxpTtTZxFBtMUaFAEYUB7AjxIKSASl4Kxrqo+EI=;
        fh=Pe1pI5NQYM4xr6NF0eUsvNTNwvH5AhyitytZoQQ80rc=;
        b=SlYdEPS6AxUsmcabr19n4NQsFsgPPwNyXqpLY6oiqUHVq3TUHsqJBJ6Qm8BkeFls3U
         K8WXajlP1TbjCHIOLCrlSit03/Yj7iwQ8/ABr/XAZ6Idb+lhnvK/NE12fibIe0jwbqvf
         qvL2HYMTnpQxRF+o1K2DYXZm4yRSK6J83qH9AtNcLUjScHmC+l3bamzhE+tm5j110/49
         6txb0gk/jJ2PwNlLMU4bwrvqCYkjTJWdi9g4r607gDn6XvXBUPOYLlizk4E1mBferEuK
         RADqloDK1FF4SLLj7iYtZ7AUAQIGfOI5a5ZMxsVZEc3ydAtFm1mJXoEWCKKdYtrs+u6E
         /PCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776989844; x=1777594644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FdbcbxpTtTZxFBtMUaFAEYUB7AjxIKSASl4Kxrqo+EI=;
        b=AIVBi5oGlrPPTO6Trsq6i6+uXBUcqnZN8HoUMB7v3FuE3GBh2nwKn3rS68V1nu4mhm
         DQUMlzghNTg1dIsQu6Gd2CtT35FC/M783FvdSBoDf3Pax52ph+dV1akkG09o/iMk4Hww
         9A0hFxNjQZkqQhF4tfYu0OIy1K2Hwf0eGKgWpNFM1S4dk0PfEbr/t6DbF1ym8qEd91cQ
         e0EsSiuR8/2vwvbaZAHjS+gUarH70hWfrvYTPZPZm/FQV2EhSk5AzrE2zsv6ozpfdX/W
         qcaruT7g4Xx6oyG146pRSNtpauCRBxc3SMq4bUNit1lx9LORPh7y6IRkMlO/GPtT9OV/
         ZPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776989844; x=1777594644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdbcbxpTtTZxFBtMUaFAEYUB7AjxIKSASl4Kxrqo+EI=;
        b=N6yP3QjYjg3B/oi3JkZxyM0k9E+FMf0bsmtRiGrOmEVQqN/7geE1gDPpt5J747k8t+
         LPuhSOdv1BiEdnPltLb1Wbab6JenMKyDj3j57p8otsgTre2fmovGttbveX7aQ7GupuTI
         c7y97a6IgVT7g7aWZTB1A2IRy8yVtsYD9Ln7zlZWMbt8NYHbefhjxfMUgrm7EhiBqxby
         FJC+TtM9ekOBV/Ccvcw8wJxhnWIHDcT1ByAPcu7GKuUJdm3xZ6yN5vZrbyHfDUKcOl3M
         mJcZV7Vv2Jo4qE5wSidoGXobfMqE3FJLo6kQ5kxrczwgFSyAkGKCDrGrejpwCWAa0cN/
         aQ2A==
X-Forwarded-Encrypted: i=1; AFNElJ8kW2mVFS8DZxcIjLC1r7iXVg66sBsOH5te5AM1hfQ4IDJ/v8Vry8e3iyM1oZFKj9L/UXDUqT2mt4EaxSVuq1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ3yH6b7BkUox/IuWOOiN8RB1fxlrCkcO0qJY42oNtwudCsQoZ
	0V8V9x1uq4OiDwlsVnBdeWVD2ncsJGdosz1l7zqJbyXHeQJYMA1o0X54FRsP9LLiP0XuTucIfoz
	pvcWYonjh/TDsBt3pKKTf7fim08s3Jw==
X-Gm-Gg: AeBDieu6FibADxodQ4U5vjNabaUKxZlhTXOB7I54Tv1O9666rwtiQibyISdvL+JvYW4
	8saM7vC4iVJRX4bfsoTZbZ+WtQfhhaFq9rpsnq/UFNOY/JHkFzdxey9dD1KGVCcPZamgEh+tPde
	Zxdwa8FDQLf3nmRLhR2pNE3+AtvNAfrkVWdtHIQkMnfRefco716IncurpJTB84aOBBnvW2TzRt6
	mbGuBocy1efBT9pCNNnzFiacjGh+RTuZh2gteNGGni+qc3FNX4hN0PPO6vRqZgifOrUc3ruqY2w
	55BqWURqpVusHoEnVQ==
X-Received: by 2002:a05:622a:1305:b0:50d:8db0:7abb with SMTP id
 d75a77b69052e-50e36ecfca9mr440201351cf.42.1776989844280; Thu, 23 Apr 2026
 17:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422080446.26020-1-wangli.ahau@gmail.com> <7a762959-014c-4727-999f-a5073f9eaf7a@kernel.org>
In-Reply-To: <7a762959-014c-4727-999f-a5073f9eaf7a@kernel.org>
From: Li Wang <wangli.ahau@gmail.com>
Date: Fri, 24 Apr 2026 08:17:13 +0800
X-Gm-Features: AQROBzDVL2tftrpxjKYjdeKYAdmQKtLCLAzF9kdVNZECjlQvHjKJ9i_dwf6nu4k
Message-ID: <CANgNiRw_MVRF3f9JSWsThJGUrq353S5QXoGMWYttav7-7uW2-Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] selftests/mm: clean up build output and verbosity
To: "David Hildenbrand (Arm)" <david@kernel.org>, li.wang@linux.dev
Cc: akpm@linux-foundation.org, ljs@kernel.org, Liam.Howlett@oracle.com, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

David Hildenbrand (Arm) <david@kernel.org> wrote:

> On 4/22/26 10:04, Li Wang wrote:
> > Currently, the build process for the mm selftests is unnecessarily noisy.
> >
> > First, it leaks raw compiler errors during the liburing feature probe if
> > the headers are missing, which is confusing since the build system already
> > handles this gracefully with a clear warning.
> >
> > Second, the specific 32-bit and 64-bit compilation targets ignore the
> > standard kbuild verbosity settings, always printing their full compiler
> > commands even during a default quiet build.
> >
> > Notes:
> >   My email address has changed due to employment change.
> >   Previous Signed-off-by was with <liwang@redhat.com>.
>
> :(
>
> As a former RH'er, I'm deeply sorry for what has happened there, really.
>
> Thank you for continuing to contribute upstream, highly appreciated!

Thank you David, I got a new account from kernel org yesterday:

  li.wang@linux.dev

In the next, I hope to dedicate this email address to Linux and LTP
development work.

-- 
Regards,
Li Wang
