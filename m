Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792615347;
	b=AznPhT/3ssTZIZBQ2jqmmfRSM7msGdnZ/P4TRoP6sx9zpKn1Hjta7ILJQQQTFcWpxxt5
	 79voILXLq5AI6aO5g+PqnJiazmIT/O2GlATmQrFy8bPWvgAlzv/vdI8lELOXjALUEMibj
	 K6IkU/ZiiJQzripvpXCC4eT01GaUpEu/REMdiBU390vppId33/e5LHeYwEghIfPEbDw3f
	 Nr8jKcMrRp5OptmTlzprsAm4QQHLDz2oEZidG2ZNuAyxa4DwqXvWMJZALzXQ84sxZ9JpN
	 dJJrfn3AKDLmjm0VyfV/5pA+SMY7020eUfqKjayKdlcl+IJzdqpoBWTW/9ULxXsUCOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8xOtYw2UQzjfVaNRpu7KDUVa/s7vr4AwHD7vVplnNCY=;
	b=23OyqCvCZNhkiNuTlTXHcNZ1Nl7cfONjTnfm/4yPKA8jFbu3Jq+VfmKk0r5RPnHW4hGT
	 r/iEPlJqYYBZlp2nGiGXix4UoHlJrfEh70ZA/GbcP6oB0u720YGdmMCjPcA24ICs3b7aD
	 X3oac+VaRAwJiTUwVZmi9Gse7mVN7hvAS1ClFXqrG51StNB4X/vgWYGUapUSVAVy2yOtu
	 F4d50ROgOTT+c2fQsLEVp5ZYJ673cIA1JRyefAa9IWxsLcC35IRon2ipfRaZQeYwzhaLw
	 YZAx66ylRvQue75mpI2KBSgEbg/TXTRR9TvxwH34zM3MzizOBE1TOqeHpB2Q92U9Mqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=VO3YUyFd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C2606A31B
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 20:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E5C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=VO3YUyFd
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1166835d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 13:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792615346; cv=none;
        d=google.com; s=arc-20260327;
        b=JPFs/mfja7+D79z2hjbRg4F47DmGBNIab37VShBL4E5JNyyg0eyoldm/+aLVONLnKi
         Fw+gYWcuuH+mdRSxOpkzlTaEz2TawRo+9+Cl2xr7/lA0YUD1Q8p0vrfYQe4bOXTsXel2
         vvod3ps2HQ2f2ZRUFGB4t+TY1SkMmrPrt8LKh75ZWel2Udz/c/ts/7G7NeoS1rmiLdse
         GwFR08wloPv6hQk3fPQVDnmm4pdjT5i5M2MP+F6lGX50tFYlxrUiN2nXNZ0aIXxapT7x
         Pgrm8Csb/rdpcCxzRqmJ7sMOvg5PjHimchF3aQqSkqBxreayHEPHK857xQzPs8Sh6zB+
         ljKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8xOtYw2UQzjfVaNRpu7KDUVa/s7vr4AwHD7vVplnNCY=;
        fh=DDsYj78N3Gm/rUJwm6U/3n4+fVQ8RGughDoAo2vQAO8=;
        b=YHW0pD8/gK9s16cFou0p3D843Hcr+nd0ZYgDuYt0I2c86wchUfBpymyRje9bMrnf/X
         eA4Ttx/1zyvrye83Je2/pzOWjKFjhFUz3zBEnEJy735e8tqiRv1PyuA/tX61sARQCTJ4
         Ww2Va7mh838CCPiLzdPdb4sY+zJQeSkNUHrGvoUWhQvdQa7u0bEiR001QIR0henMaRfd
         wpQYbmjN/Xm3Cpi4U3BvAOlltBezJIultPFGCnEBYrqLrH1ArSB/DW5mrnq09DoSdPOA
         tO3rf0M74Vy5IgyPlPLhu+J9TkAY9713w5TZV7d61CztuB/Um4QnAdKHVXXmlIv4Pcoy
         iRVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792615346; x=1793220146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8xOtYw2UQzjfVaNRpu7KDUVa/s7vr4AwHD7vVplnNCY=;
        b=VO3YUyFd3pmmCIftZq+xF2ZkQZoIHU9JIzi2JIJ+1ESR/1LcjJdDVnlViAkkfXi36z
         KI+f3J0R4BZKChF+LZNb+KRrbY81eb4kL8JRiYuIdZ6QbY4V6+IWGHtIHClBHazi44OL
         XyRuKI9pxH4Pp/IuDAbTbYY1MLG2AjDZpVcpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615346; x=1793220146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xOtYw2UQzjfVaNRpu7KDUVa/s7vr4AwHD7vVplnNCY=;
        b=ihP7LT3oWi0s+4WPrYHVDisnPGVq41dCZZOZWldBCIBxLoAesUQ0xGBEKiPKFb88We
         ZYCFu4OoRj+3qG6uHVRTYcxBQ/mNI3s4FhZhpEfT9gYadergPz6FzntBkHrQLgctqm6D
         /4XmblxSz3SmeCV1HRmCwHkYQERDGhvGvpRWvExfj35MPJS4oWDbAT6eE6OBqxl852OD
         9pYL8YmcU+eqKAHYFTJX8+V90grrqOnKKUNNabHV2pHaMEJSeSQsyPugkm+jCNtH0lwK
         lIiBlrzfQwT7h1WvQlRc6m3UZT0mc4bRaL+ppwGX/+2xRuNUrcBgp/HGzrTBgR2pIRVD
         JV1A==
X-Forwarded-Encrypted: i=1; AKwUvByxOJHVCX9q8vduOM05U+s/Nzgb6r6PHo82OB+ZtDxIuqBHPnozRE8YT9Jq2bDfCltaIjPQzqR96CNaFuNyvx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX8y+Cl/hezQUKNXifwhE+juxm1snXghOItxUmnxwprObVV3L5
	tktuB7vtG6pkSSKdtQTBaITYYHwrpBvJlayHc6pxKKv74vLFjWPeE5/6r4me/g3c++94oz50US7
	j4q7qq0RmhcniDaMSsIL2XrmLW/ZmyBs4M6nuqvKerFlm/KO7a2g=
X-Gm-Gg: AYBFou2U3jz4YBwJ0LvwnEJSaC2/ATugQ+vEEXjPE06usG+RIef4Lf0oJVmfiqbxWGD
	BzZHT3hczpRxaKRA1xvvzvpMoC72T1qELmL+K6KPcKpYkWsfKhiLo0ruXXp0uXZAGXIbupXesGX
	Pz9VYVap/p87dfoTpfz3Ysp0aJl+B+l6tdDA5KuO2LdrKAj9vL4JmaKIRo8s9FIrqTugq87h67d
	EdI4a1824QnL+k3aAeEL7MQSSIxJ3c5EKIy1YxMJBp7lEzW8r17ZCJ95JhXYZPwzCv1T8u2jwdJ
	ptNAaEyzizX8Hy/3E5vV4xm//3WiIWCSc1t/jURq7PnyJyDSMkt2e5qf5RkY4iMADVUVPu+zYt2
	XU+bWdSiyx9lFkToGmZ1618mENaCos4OktrCHHH/WMDAC+wlxSTY=
X-Received: by 2002:a05:690e:1512:b0:679:b810:6e02 with SMTP id
 956f58d0204a3-67a0e45c3f7mr1012582d50.26.1792615345995; Wed, 21 Oct 2026
 13:42:25 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-TIAE.v2.r0.20261015163454-1@mojatatu.com>
 <179244597608.3135.14866688728455017187@kernel.org> <3ab59725-e34c-4243-bc72-d93f837bcad1@redhat.com>
In-Reply-To: <3ab59725-e34c-4243-bc72-d93f837bcad1@redhat.com>
From: Victor Nogueira <victor@mojatatu.com>
Date: Wed, 21 Oct 2026 17:42:13 -0300
X-Gm-Features: AclHuK8LdBftHZw4Zb8WFN_X048TWKstFrjtX5FLtVeFmM9dmX8keSM3eYtswtE
Message-ID: <CA+NMeC_kwd5yihR3SSqb+Z8wX+NuobntbvpKtAyOwjZ1Xa4mVg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] net/sched: drr, ets, sfq: skip empty
 rounds in the deficit-refill dequeue loop
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us, netdev@vger.kernel.org, 
	horms@kernel.org, sashiko-bot@kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:22=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 10/19/26 23:39, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 0 (1) =C2=B7 Medium: 2 =C2=B7 Low: 1
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [Medium] drr_dequeue() and ets_qdisc_dequeue() allow only one bulk
> >    refill per dequeue: `scanned =3D true` is set at sch_drr.c:414 /=E2=
=80=A6
>
> This looks legit.
>
> Also is would be great if you could somehow deduplicate the code a bit,
> (but I have no good idea on how to achieve that)

Fair enough, I'll respin this set once net-next reopens.

cheers,
Victor
