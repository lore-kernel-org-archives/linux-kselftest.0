Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD5738A29A
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 23:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777420563; cv=pass; b=AjSrs5uPp5rf3+DzFjg+EEDI6DFOwe903kNOhYtr+W2/TlGZtiWLAhC6ZS5abpq0ud1eQtZVUkHrdvNN9Jh4WR5dH4rk81rTtChCqKnbuUl2h113KbqQhlA7I8A459Ak7GzMpCAJjDrMIKwLcIKIQ6juKN7haZYTapVL5gss69w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777420563; c=relaxed/simple;
	bh=HbUNG09i5qLUllqNxbXcNA3/jD57LiEGUfV22Nd8aVQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V73CQef/0seUGyaYt++wGhCx1Liw+CXotVV6PYJ0tdmjamIsmsAEU4Hn1QoUl8OQYv4O5wDvrtjnG7a+z8uYW4+3kQGDt6KP6Kcl4YBYOwvuXxXkFIA3t4j1KQMVdNSDNgSZ6ipngllnZWvtXQicx4WCeTaqyRw3dkxWqPWd0ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PNPo7qki; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PNPo7qki"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-605823aec55so7484578137.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 16:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777420559; cv=none;
        d=google.com; s=arc-20240605;
        b=TS/qTHtvmJIbd4tpWMcPQxDC7SdyC4tZc4TMhX6qJCG+7uEJ8+lHt7K7mbtWx+nFfj
         5iGJVFtVNIC57TkSbDnFABWZ5BPT/7l588eW7yU5Ae4j2X+d//4Em9Et8ii7C/E7t2NN
         17HbjJRsmV7Z5hH28jXIJQhHF76kHz7WfN+0Rf2SMlzy2DrCitiFZfnJR1lNJVOyVkH+
         vHbdZXYZk6s/yCFYHBam42zWI8zhAkoPJQQ60mF2HXGhawvFRLwKC/02fwNI2qfDRz3a
         KWI5EVU//hJPU0sy7R6WU3jVrnfouFxPJLWvFb6c8kUXueJIgIz0c3nOSzXEACDswig/
         5Hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ge/rG1b9OBe+4PbHVqQyIr/aQn367ZGUNhS1U8adnfo=;
        fh=wNMcy4J3YZI2mXHFF0cEqnnVaLPdCHD+COEVTPEpVl8=;
        b=j0qjbPXcYuKhYxCL71LZjOHs7jdeWGoZIt6UR/V3UBMko+Osc0UmV2TvKX0P0VaotZ
         Ookkuw1vLrEPoJP390JnuV8Nqi9/LdbJ/gC7orRyZmFhLocwXZ8S1bpTpG/JRoRcmlEM
         lixTbKBXbXv8Yeaj/H5FWn94VKy302hcBTUN6tan5dbIwr8+UzR5O/dDyweiCJEDRk50
         Cv2Skeg2DQT3Rq/Vum9LBQeYDk+P6H6Akfubp+IGIQPk4LBH9uHj48lZk3DVrCCVtikn
         LbGEZBMEmX5fBYRM28g590KzIPMsGJevy5QXTxT5FtINiAyWq+cjWYDabxMedp8wZQ2z
         j3xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777420559; x=1778025359; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ge/rG1b9OBe+4PbHVqQyIr/aQn367ZGUNhS1U8adnfo=;
        b=PNPo7qkiAmabfdkxwh/In+5nnimWub1lgG7yNYz7Q2ylsanyl6nYH6vuwu7gwYRqf5
         py/6I35KD4oWzX//nEjcGt6DukEI/iAcP2MJdbGzlZhwFY8ZkrdEO28NCIUYlEgknAaM
         Wt96bA0calBImoo9jGVphR8Pnf9yvY4trHGkVdXaxkOUsWWHcBQNsJyEDNIGFUe+msM0
         Je7VwrINSSeTSMzkuvH6a/749jJE+abdnHDNuEqphz4VVu514+6vHU57iUW2vCma/TOr
         HT5rnwNTDFFhwaVbLNeWSuR3+lbwwWUV4zELlmrVFYSQIVMJFphw1s8Y2ys7WnE9TuWs
         RyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777420559; x=1778025359;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ge/rG1b9OBe+4PbHVqQyIr/aQn367ZGUNhS1U8adnfo=;
        b=Va3DPUQbgQfIjuBBt7fY3wGTViThCDBA+TjKibK8dZ90sUWnpJMCNULoLlBvvfvC9a
         DQ4bB6xFvIssc8QKvY1bIFaOLtJymd09POVD/9J7sZ0dvl7PDAfokym2tBB1SfggvXIt
         sB04WRukeYE4X27m0+AlUNrP4zvpUdq7Z6ittke7KKxejY0tSY/iqwNhwSURC+r7YG0l
         ZBJ6ac7FqSPp7I6MgDjjc4Q10pYmguQ7MfeWm7XYdEJkobRkGesgOmjfP8EqMGXvrhO8
         tMhezMkSmOr7hb9xdtdQEvMVsIprTDi8XrCiswnWRMuMxTF0x0aLV+3YmxEAkZEyKN7H
         BYUA==
X-Forwarded-Encrypted: i=1; AFNElJ8KuIKf0IeRzWFf3kRyxJ1F89VyIuPhZ28ys0bUooFjQjNUIcvb+nOSRHuACicfC69Wj1ToAtPCiX76eMpJUM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVvW4dHAZLEHT6ui5/HvOGuX5fQCN68/2Q8nCGGrsuRaGVBoMm
	5fJOBezpTuMmW9qIca3gHeF/yklg4B15mSXvZuPzVSe86Edi2M8wUeX7d/RHxEJRsxDhVvjFDye
	J8adtiwDzHzQYexiDfdxun7jGm/pup0b8YLReP/GQ
X-Gm-Gg: AeBDiev8gESp0yiorlddCXlAPfgZuJ9BGzrLnwAtU7RErN2TJlkNQY5cNcPCVs0R2t8
	lEYEwAVJARzCErm0O05zC8cBx2dNWjqDLUvHBj0W6u/83qsZUv1fhjpiPmSSt4w0YWZYsxCNWgr
	IUFDq2nCToun9RP/zcFytJUTJjsvOhB2GBPIVzS/2niI1Dfm6f/VIHgC3O52ykFpTBJTur0pI63
	8HHPyhm383M2tIJQWRskP+Wqggpau/oGl8xZsUGrG2ph97m7BdPMGXN7B82yCHhI8k2OKMQJ0bo
	XRufVSEB63pj9/M3cEj8wSe4UzPyc9BL1InZhLOw174whSWJWKlmUE1DWSCYFkHU/ogh1YPxNWn
	FEzdDuSjG5aU68s8=
X-Received: by 2002:a05:6102:5cc8:b0:607:a215:5b7e with SMTP id
 ada2fe7eead31-6292508be42mr1343754137.7.1777420558644; Tue, 28 Apr 2026
 16:55:58 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 16:55:58 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 16:55:58 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260427204313.50741-1-rick.p.edgecombe@intel.com>
References: <20260427204313.50741-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 16:55:58 -0700
X-Gm-Features: AVHnY4IuJZAp5GnOQnx5fskmUHrzgNx-vv_jZja4hevdBD0S2wZ6bkVyLEjbZIs
Message-ID: <CAEvNRgEapSgtbWaW_fNbDjaKSG-AOSqi0qqzODx2h8UrOb=cjA@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Include linux version of mman.h
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, pbonzini@redhat.com, seanjc@google.com
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Rick Edgecombe <rick.p.edgecombe@intel.com> writes:

> Fix a selftest build error by switching a mman.h header include from the
> "sys" version to the "linux" one.
>
>
> [...snip...]
>
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index ec7644aae999..7c113b8c4f75 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -14,7 +14,7 @@
>  #include <linux/bitmap.h>
>  #include <linux/falloc.h>
>  #include <linux/sizes.h>
> -#include <sys/mman.h>
> +#include <linux/mman.h>

Thanks for reporting this! I'll take note for next time. This works fine
with my compiler too.

Tested-by: Ackerley Tng <ackerleytng@google.com>

>  #include <sys/types.h>
>  #include <sys/stat.h>
>
> --
> 2.54.0
