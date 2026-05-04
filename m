Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1478D361DBE
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 22:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934039; cv=pass; b=kwgSeXVcE2+S5K5GccqrTA8oCDWJkXCV+01bVQBgKXp1GgmhesDya6BY75pkinotJS0QXPDkATF0ZnkNVyMFl6HprnIKnunh5UhMD3Kvsg9S8AADEQpUIOt0ZbfPoMDXKEce666gOcoZjktZ/Wpx3L16iJntV8y6OcgIX96W2u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934039; c=relaxed/simple;
	bh=SRyzc0UaWv+n7V9qD3GfiNb+SIIGW8GsbwmzjOQHX18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMtD9z8g7ldAxJe4C0x6h0i5BrLcCSTDJH4pYU/VFcAf2KLcvDhkXFDTAjlqXOWTXQu80TgOVtH2sPf8xNONOECEONt45bD/2vRcXSbFMUo+eL0VReVpokZVRs5MZ5CMfv51G1lC3kl5nL/KE2SduORQCikXmaE9BGeyHBH6h/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=b474DNHm; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="b474DNHm"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35fb0bb27e7so2965523a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 15:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777934037; cv=none;
        d=google.com; s=arc-20240605;
        b=EitY0Whau/VfCvHYfQYl3Zd4N24OhIH8xR5iqpU3mk4uAusl/xCVeL4qch/DS04f/W
         eNHV7Uq5/l4+tOMoT5u73VwlNIUl+CyOpsesXa7tJYd0H/dxR/mv2DFkI10jhsvjqtvM
         MJZ579ND2fxqAvdZiwkUGrMxZ7RigUE+AUSob8COZ4QZ9KtCOdtbLL1TrF7Z8HDLRpeU
         5qxkFYnrXxcK/WXERfOwRyiJF2oBY0CGI3ZaFL1tSJJEATIfsnkPikESuZJa9FvnSF+o
         3i0fIZnlu+wubWBR91y3FONQ4jTgEcTF7uxiPWRF5l/yGu1riH7uJ8WTKZZCCcr6i+em
         g1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7hnYb5QDpibHPGWq61YUR3Nlj5MGB0V4/cWv+6o2s9s=;
        fh=9HstcbgW0KZ2q0pJlpatbfqRzhN183jMJvkuLWy0CgY=;
        b=cU/bNU2s7cTe/PgOG6/CkR75AirSyZ+IKRhW/BpSuoX5sBeZKjpS/e6Pi3OOmFm2Jy
         ly3G8Iz1UHChOLlxZoFCS5Iotkr/0srECJxp3H4opeCoySOkVa9TiNMId/AbBZTuq/TX
         eQQvUXezaxMPPzGh5KidI9plhS8L3ODDZL27agOSM7uDFftdTii+YbjamIg9X+wLYRxq
         Gtrx0xYmsCn/ywsqjWsfxP8cTcQ/c499wABgRW5p7/Tkyrdu36rLPSY+9c5CKsTitlP4
         BPDOjiLX97S3br0IEATTyDQ6AXpZKGY2uhq8uGDAVNO2D3vJ4RbQnaD1a2Ss26tNwWYI
         Sfyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777934037; x=1778538837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hnYb5QDpibHPGWq61YUR3Nlj5MGB0V4/cWv+6o2s9s=;
        b=b474DNHmLbyPnOY4UtiXM5GN+X9I+S0u72RdwKdxeGJHFbyi8dy3N/skGTD8aswwJT
         mQh/fHxQh2XMu0/wXWmILNqAoHVz64tnsQj3uwYrG/nMHnMiR3+62Bg5+hYVAMqGGZa3
         Yhzv530XbxJbU0D0vwHq2/YSke9JUBH34F8cjupFBBSgKFVJDHqdHlHLgKPIsy++DjBg
         CSXKH02/rcKaE2K2wh+4yhWhycJgwprwu1F5I1VKpVbKdHi6Ab35lJlWSVF3M/jPkfFU
         QubU5hVrrXJSyul/eUU6NZH9S3lF2JCWM8rscrobVAwd5+udUgedARCiFdjuMMWnSxUC
         /4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934037; x=1778538837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hnYb5QDpibHPGWq61YUR3Nlj5MGB0V4/cWv+6o2s9s=;
        b=Zs4Z9l+vkuQ4y0dc8IZOsRdaLXDAC1aFaZF+bg+GFbNPTnwRxbjgVFbpE95HrmEtDD
         Ob2h2bkAr9iIQOvh5Sd0PNpBvetMOX5ChlTewLKYovWd+B/NmwdTYWGPAfBJ0BRqkA+Z
         E+gtuo3wBmmy1Gf/TdjdGmjl2s5QM7gaVawVACByj2893ROi5g3I1YcXIC/xwAtKFnl1
         uVI4/jMPRnw4g0DJsBy2azO8wu+LpYRWwkWQ3nIAUmo1t4vnngVJouPGXkEJJNu0lYQ9
         vucEbSN5ayZplCsn1Rq1moQ59NZiRU5beYwJDqBtlQdbmkNE+trTJHGI9oAB9jKajQXa
         yXoA==
X-Forwarded-Encrypted: i=1; AFNElJ+wtvIhfwPH00/Tobg4prZmYfpTLU/w+jzX2rsjT4FfMtLLUwLd4pzsG4isXMCDJTqH4jowshY6QXqnkpxTIFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSM8RFXRdg6L2+GPdveioXlCZCGIVi6c4oqu9Pv8sCIMJgBJho
	9eHutIObO168n5+telYHiUiWFfYDFERpod9do5FWm1bFhLX3UJznM4BPJefRo1j6aAdAi9iWh5Q
	rdDsjFU5JtDYIJQFSEMOU3k6zWnbI7EEARQuIahzE
X-Gm-Gg: AeBDievU3eBp0Z/lgb4++6WdkSaKdsdiPQOJ0o9FK3Nem5H96bhL7KXkXpyKT00c5Wy
	Q+85WY8IekXkH9bXijyF3vqX03vz6iBBqgZaDrGxktUvOYys9WThdoGgqcg2RhkrSsx2CRvi9Yl
	0qy6QLmjwn1TQaClRS0MeMbNOepuy2q2KqnsJVZY16vL/m/607pfLUBog579WMDlmPZi5Z9fs82
	or7wAVtJL1TAOzh0Z9wduhZpPV3+jU7gh4POop4kJj4JtmOb7aMqmZqlRssbtBT8N1cTq4AVxpf
	KI3+bsxyMXA5xZCY0g==
X-Received: by 2002:a17:90b:1343:b0:35f:bb33:d721 with SMTP id
 98e67ed59e1d1-3650cd08160mr11400198a91.5.1777934037438; Mon, 04 May 2026
 15:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413164220.GP3694781@ziepe.ca> <CAHC9VhR1Uke9P==CELKavBcogHoNCtMZFfNWUbgm5HYUfomhtw@mail.gmail.com>
 <20260413231920.GS3694781@ziepe.ca> <CAHC9VhTLamfe4C81ZNRVT=H32x+KLxSqH3o0eBfrHsWAgAqxCA@mail.gmail.com>
 <20260415134705.GG2577880@ziepe.ca> <CAHC9VhSECYihup=tURo_Qk__xUdYYPkHgnz5CWA0BrRAkvwbog@mail.gmail.com>
 <20260417191749.GK2577880@ziepe.ca> <CAHC9VhQbpS9XpO6dWu7gOiX=ppjtAxnNBOFe6s5wjEZNpMRjgw@mail.gmail.com>
 <20260424143603.GB3611611@ziepe.ca> <CAHC9VhR++21SD+v4Bb16SQmYHgJYZ0ytQ+BecGPNK+fEOe4G7g@mail.gmail.com>
 <20260424221310.GA804026@ziepe.ca>
In-Reply-To: <20260424221310.GA804026@ziepe.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 4 May 2026 18:33:45 -0400
X-Gm-Features: AVHnY4L0o11c1AyvQPCh6gK_ec0IV1Rogd7iCBcWBXwoMyFuE6qppAiDKI-2lpU
Message-ID: <CAHC9VhTsx6cpKMP8nVgK4F=drXTFJtK3_D9k9pmKr56+ZFUu9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Firmware LSM hook
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	KP Singh <kpsingh@kernel.org>, Matt Bobrowski <mattbobrowski@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Itay Avraham <itayavr@nvidia.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Chiara Meiohas <cmeiohas@nvidia.com>, 
	Maher Sanalla <msanalla@nvidia.com>, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 6:13=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> ... I wonder if we are even speaking the same language.

Let's reset the conversation.

As I understand it, based on our discussion in this thread and Leon's
previous patchsets, the basic idea is to enable LSMs to enforce access
control over fwctl requests/commands sent from userspace.  I'm going
to start with that as a basis.

Using the kernel's docs on fwctl, the userspace API appears to consist
mostly of ioctls with some basic sysfs interfaces.  It looks like we
can mostly ignore the sysfs interface and focus on the ioctl side of
the API, do you agree?

https://docs.kernel.org/userspace-api/fwctl/fwctl.html

While normally I would suggest simply using the existing
security_file_ioctl() hook, Leon previously mentioned that the hook is
too early for fwctl as the userspace copy happens much later.  Looking
at the code, it appears that the copy happens in fwctl_fops_ioctl()
for all fwctl ioctls regardless of the device or ioctl, is that
correct?

Assuming the above is correct, how about the following LSM hook,
called after the copy_struct_from_user() in fwctl_fops_ioctl()?

 union fwctl_data {
   struct fwctl_info info;
   struct fwctl_rpc rpc;
 }

 int security_fwctl_ioctl(struct file *filep, unsigned int cmd, union
fwctl_data *arg)

Where @filep is the file/device being sent the ioctl, @cmd is the
ioctl command number (e.g. FWCTL_RPC), and @arg is the copied ioctl
data (e.g. ucmd.cmd in fwctl_fops_ioctl).  In addition to applying
access controls based on the ioctl command number, a capability that
already exists via the security_file_ioctl() hook, LSMs could also
apply access controls based on the RPC scope as well as any other well
defined data in the ioctl payload.

I expect most of the existing LSMs would implement callbacks for this
new hook with the subject being the process submitting the ioctl, the
object being the file/device that is being operated on with the
ioctl() call, and the access/privilege/verb/etc. being something along
the lines of INFO, RPC_CONFIG, RPC_DEBUG_READ, RPC_DEBUG_WRITE, or
RPC_DEBUG_WRITE_FULL.  Of course these are just quick examples to
demonstrate a point, please don't take those names as hard
requirements.  Each LSM is free to characterize the access request
however they like, in a way that best aligns with their security
model.

--=20
paul-moore.com
